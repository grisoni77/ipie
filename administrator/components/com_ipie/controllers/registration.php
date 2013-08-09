<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * Company Controller
 */
class IPieControllerRegistration extends IPieControllerForm
{

    public function approve()
    {
        $app = JFactory::getApplication();
        $id = JRequest::getInt('id');
        $post = JRequest::getVar('jform', array(), 'post', 'array');
        print_r($post);
        // Save the data in the session.
        $context = CNL . '.edit.' . $this->_singular;
        $app->setUserState($context . '.data', $post);
        
        // creo l'utente
        try {
            IPieHelper::startTransaction();
                    
            //$user_id = 1;
            $user_id = $this->addJoomlaUser($post['name'], $post['username'], 
                    $post['password'], $post['password'], $post['email']);
        
            // dati da usare per azienda
            $data = array(
                'company_id' => $post['company_id'],
                'user_id' => $user_id,
                'name' => $post['name'],
                'email' => $post['email'],
                'piva' => $post['piva'],
                'city_id' => $post['city_id'],
                'province_id' => $post['province_id'],
            );        
            // salvo azienda e draft
            $model = $this->getModel('Company');
            if (!$model->save($data, true)) {
                $app->redirect('index.php?option=com_ipie&task=registration.edit&id='.$id, $model->getError());
                //JError::raiseError(400, $model->getError());
            }

            // cambia stato a registration
            $rmodel = $this->getModel();
            $post['state'] = 'approved';
            if (!$rmodel->save($post)) {
                $app->redirect('index.php?option=com_ipie&task=registration.edit&id='.$id, $rmodel->getError());
                //JError::raiseError(400, $model->getError());
            }
            
            IPieHelper::commitTransaction();            
            
            // cancella dati da sessione
            $app->setUserState($context . '.data', null);
            
            // send email notification
            $this->sendApprovalNotification($data);

            $this->setRedirect('index.php?option=com_ipie&view=registrations', 'Registrazione approvata correttamente');
        }
        catch (JDatabaseException $e) {
            IPieHelper::rollbackTransaction();
            $app->redirect('index.php?option=com_ipie&view=registration&layout=edit&id='.$id, $e->getMessage());
            //JError::raiseError(400, $e->getMessage());
        }
        catch (Exception $e) {
            IPieHelper::rollbackTransaction();
            $app->redirect('index.php?option=com_ipie&view=registration&layout=edit&id='.$id, $e->getMessage());
            //JError::raiseError(400, $e->getMessage());
        }
    }

    
    function addJoomlaUser($name, $username, $password, $password2, $email)
    {
        jimport('joomla.user.helper');
        $salt = JUserHelper::genRandomPassword(32);
        $crypted = JUserHelper::getCryptedPassword($password, $salt);
        $cpassword = $crypted . ':' . $salt;

        $data = array(
            "name" => $name,
            "username" => $username,
            "password" => $password,
            "password2" => $password2,
            "email" => $email,
            "block" => 0,
            "groups" => array("1", "2")
        );

        $user = new JUser;
        //Write to database
        if (!$user->bind($data)) {
            throw new Exception("Could not bind data. Error: " . $user->getError());
        }
        if (!$user->save()) {
            throw new Exception("Could not save user. Error: " . $user->getError());
        }

        return $user->id;
    }

    public function sendApprovalNotification($data)
    {
        IPieHelperMailer::notifyOnCompanyApproval($data);
    }

}
<?php

use Drupal\Core\Form\FormStateInterface;

include_once __DIR__ . '/src/Form/IITBDistributionOptionalModulesForm.php';

/**
 * @file
 * Enables modules and site configuration for the Demo profile.
 */

// Add any custom code here like hook implementations.
//function iitbacademic_form_install_configure_form_alter(&$form, FormStateInterface $form_state)
function iitbacademic_install_tasks_alter(&$tasks, $install_state) {
  // Replace the entire site configuration form provided by Drupal core
  // with a custom callback function defined by this installation profile.
  //$tasks['install_configure_form']['function'] = 'myprofile_install_configure_form';
	//echo '<pre>';
  //print_r($install_state);
  //$tasks=array();
  $tasks['i_i_t_b_distribution_optional_modules_form'] = [
      'display_name' => t('Install IITB Modules'),
      'type' => 'form',
      'function' => 'Drupal\iitbacademic\Form\IITBDistributionOptionalModulesForm',
    ];
  return $tasks;
}
<?php

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
	// Site Informaton Details
  //$form['site_information']['site_name']['#default_value'] = 'admin';
  //$form['site_information']['site_mail']['#default_value'] = 'iitbacacdemic@example.com';
  // Account information defaults
  //$form['admin_account']['account']['name']['#default_value'] = 'admin';
  //$form['admin_account']['account']['mail']['#default_value'] = 'admin@example.com';

  // Date/time settings
  //$form['regional_settings']['site_default_country']['#default_value'] = 'IN';
  //$form['regional_settings']['date_default_timezone']['#default_value'] = 'Asia/Kolkata';

}
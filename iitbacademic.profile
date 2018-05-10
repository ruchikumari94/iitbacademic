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
  $tasks = iitbacademic_array_move('i_i_t_b_distribution_optional_modules_form',11,$tasks);
  return $tasks;
}

function iitbacademic_array_splice_assoc(&$input, $offset, $length, $replacement) {
        $replacement = (array) $replacement;
        $key_indices = array_flip(array_keys($input));
        if (isset($input[$offset]) && is_string($offset)) {
                $offset = $key_indices[$offset];
        }
        if (isset($input[$length]) && is_string($length)) {
                $length = $key_indices[$length] - $offset;
        }

        $input = array_slice($input, 0, $offset, TRUE)
                + $replacement
                + array_slice($input, $offset + $length, NULL, TRUE);
}

function iitbacademic_array_move($which, $where, $array) {
    $tmpWhich = $which;
    $j=0;
    $keys = array_keys($array);

    for($i=0;$i<count($array);$i++)
    {
        if($keys[$i]==$tmpWhich)
            $tmpWhich = $j;
        else
            $j++;
    }
    $tmp  = array_splice($array, $tmpWhich, 1);
    iitbacademic_array_splice_assoc($array, $where, 0, $tmp);
    return $array;
}
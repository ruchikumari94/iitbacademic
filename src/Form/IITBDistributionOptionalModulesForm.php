<?php

namespace Drupal\iitbacademic\Form;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Class IITBDistributionOptionalModulesForm.
 */
class IITBDistributionOptionalModulesForm extends FormBase {


  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'i_i_t_b_distribution_optional_modules_form';
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    /*$form['test2'] = [
      '#type' => 'checkbox',
      '#title' => $this->t('test2'),
      '#weight' => '0',
    ];*/
    $form['#title']="IITB Features";

    $form['select_modules'] = [
      '#type' => 'checkboxes',
      '#title' => $this->t('Select Features'),
      '#description' => $this->t('Select Optional Features To Install'),
      '#options' => ['iitb_academic_faculty' => $this->t('Faculty'), 'm2' => $this->t('m2')],
      '#default_value' => Array(),
      '#weight' => '0',
    ];
    $form['submit'] = [
      '#type' => 'submit',
      '#value' => $this->t('Submit'),
    ];

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function validateForm(array &$form, FormStateInterface $form_state) {
    parent::validateForm($form, $form_state);
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    // Display result.
    foreach ($form_state->getValues() as $key => $value) {
      if($key=='select_modules') {
        foreach ($value as $key1 => $value1) {
          //drupal_set_message($key1 . ': ' . $value1);
          if($value1!=0) {
            //If checked only then enable module
            \Drupal::service('module_installer')->install($value);
          }
        }
      }
      //drupal_set_message($key . ': ' . print_R($value));
    }

  }

}

<?php //echo "aaa"; print_r($lead_management_data);exit; ?>
<section class="edu_admin_content">
    <div class="edu_admin_right sectionHolder edu_add_users">
        <div class="edu_admin_informationdiv edu_main_wrapper edu_add_student_wrapper">
            <form class="form" id="add_lead_management" method="post" enctype="multipart/form-data" autocomplete="off" data-parsley-validate="" action="lead_management">
                <div class="row">
                   
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_name'));?><sup>*</sup></label>
                            <!--<select class="form-control require edu_selectbox_with_search" name="student_id" data-placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_name'));?>">
                                <option value=""><?php echo html_escape($this->common->languageTranslator('ltr_name'));?> </option>
                                <?php
									/*foreach ($students as $key=>$st) {
										?><option value="<?php echo $st['id'];?>" <?php echo ($st['id'] == $lead_management_data[0]['student_id']) ? 'selected' : '' ?>><?php echo $st['name'];?> </option><?php
									}*/
								?>
                            </select>-->
							<input type="text" class="form-control require alphaField" name="name" maxlength="40" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_name'));?>" value="<?php echo !empty($lead_management_data)?$lead_management_data[0]['name']:'';?>" required>
                        </div>
                    </div>
					
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_contact'));?><sup>*</sup></label>
                            <input type="text" class="form-control require" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_contact'));?>"  name="contact" maxlength="12"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="<?php echo !empty($lead_management_data)?$lead_management_data[0]['contact']:'';?>" data-valid="mobile" data-error="<?php echo html_escape($this->common->languageTranslator('ltr_valid_contact_msg'));?>" required>
                        </div>
                    </div>
					
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_source'));?><sup>*</sup></label>
							<?php //echo  $lead_management_data[0]['source'];exit;?>
                            <select class="form-control require edu_selectbox_with_search" name="source" data-placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_source'));?>" required>
                                <option value=""><?php echo html_escape($this->common->languageTranslator('ltr_source'));?> </option>
                                <option value="Walkin" <?php echo (!empty($lead_management_data) && $lead_management_data[0]['source']=='Walkin')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_walkin'));?></option>
								<option value="Website" <?php echo (!empty($lead_management_data) && $lead_management_data[0]['source']=='Website')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_website'));?></option>
								<option value="Google Ads" <?php echo (!empty($lead_management_data) && $lead_management_data[0]['source']=='Google Ads')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_googleads'));?></option>
								<option value="Facebook Ads" <?php echo (!empty($lead_management_data) && $lead_management_data[0]['source']=='Facebook')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_facebookads'));?></option>
                            </select>
                        </div>
                    </div>
					<!--enquiry date-->
                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_enquiry_date'));?><sup>*</sup></label>
                            <span class="select-date">
                                <input type="text" class="form-control chooseDate require" name="enquiry_date" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_enquiry_date'));?>" value="<?php echo !empty($lead_management_data)?date('d-m-Y',strtotime($lead_management_data[0]['enquiry_date'])):'';?>" required>
                            </span> 
                        </div>
                    </div>
                    
					<!--Last Follow Up Date-->
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_enquiry_lastfollowdate'));?><sup>*</sup></label>
                            <span class="select-date">
                                <input type="text" class="form-control chooseDate require" name="enquiry_fromdate" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_enquiry_lastfollowdate'));?>" value="<?php echo !empty($lead_management_data)?date('d-m-Y',strtotime($lead_management_data[0]['enquiry_fromdate'])):'';?>" required>
                            </span> 
                        </div>
                    </div>
                    
					<!--Next Follow Up Date-->
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_enquiry_nextfollowtodate'));?><sup>*</sup></label>
                            <span class="select-date">
                                <input type="text" class="form-control chooseDate require" name="enquiry_todate" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_enquiry_nextfollowtodate'));?>" value="<?php echo !empty($lead_management_data)?date('d-m-Y',strtotime($lead_management_data[0]['enquiry_todate'])):'';?>" required>
                            </span> 
						</div>
                    </div>
					
				<?php
				$id = isset($lead_management_data[0]['id']) && $lead_management_data[0]['id'] ? $lead_management_data[0]['id'] : '';
				if($id){
                    echo '<input type="hidden" value="'.$id.'" name="id">';
                    $type = 'edit';
                }else{
                    $type = 'add';
                }
                $ltr_add_lead_management = html_escape($this->common->languageTranslator('ltr_add_lead_management'));
                $ltr_update_lead_management = html_escape($this->common->languageTranslator('ltr_update_lead_management'));
                ?>
                <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
                    <input type="submit" value="<?php echo !empty($lead_management_data)? $ltr_update_lead_management : $ltr_add_lead_management ;?>" class="edu_admin_btn addNewLeadManagement" data-type="<?php echo html_escape($type);?>" />
                </div>
               
        </div>
    </div>
</section>
<?php //echo "aaa"; print_r($enquiry_data);exit; ?>
<section class="edu_admin_content">
    <div class="edu_admin_right sectionHolder edu_add_users">
        <div class="edu_admin_informationdiv edu_main_wrapper edu_add_student_wrapper">
            <form class="form" id="add_enquiry" method="post" enctype="multipart/form-data" autocomplete="off" data-parsley-validate="">
                <div class="row">
                   
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_name'));?><sup>*</sup></label>
                            <input type="text" class="form-control require alphaField" name="name" maxlength="40" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_name'));?>" value="<?php echo !empty($enquiry_data)?$enquiry_data[0]['name']:'';?>" required>
                        </div>
                    </div>
					
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_contact'));?><sup>*</sup></label>
                            <input type="text" class="form-control require" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_contact'));?>"  name="mobile" maxlength="12" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="<?php echo !empty($enquiry_data)?$enquiry_data[0]['mobile']:'';?>" data-valid="mobile" data-error="<?php echo html_escape($this->common->languageTranslator('ltr_valid_contact_msg'));?>" required>
                        </div>
                    </div>
					
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_enquiry_for'));?><sup>*</sup></label>
                            <textarea class="form-control require" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_enquiry_for'));?>"  name="message" maxlength="50" value="<?php echo !empty($enquiry_data)?$enquiry_data[0]['message']:'';?>" required><?php echo !empty($enquiry_data)?$enquiry_data[0]['message']:'';?></textarea>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_remarks'));?><sup>*</sup></label>
                            <textarea class="form-control require" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_remarks'));?>"  name="remarks" maxlength="10" value="<?php echo !empty($enquiry_data)?$enquiry_data[0]['remarks']:'';?>" required><?php echo !empty($enquiry_data)?$enquiry_data[0]['remarks']:'';?></textarea>
                        </div>
                    </div>
					
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_enquiry_status'));?><sup>*</sup></label>
							 <select class="form-control require edu_selectbox_with_search" name="enquiry_status" data-placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_enquiry_status'));?>" required>
                                <option value=""><?php echo html_escape($this->common->languageTranslator('ltr_enquiry_status'));?> </option>
                                <option value="Call answered" <?php echo (!empty($enquiry_data) && $enquiry_data[0]['enquiry_status']=='Call answered')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_call_answered'));?></option>
								<option value="Call busy" <?php echo (!empty($enquiry_data) && $enquiry_data[0]['enquiry_status']=='Call busy')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_call_busy'));?></option>
								<option value="Call unavailable" <?php echo (!empty($enquiry_data) && $enquiry_data[0]['enquiry_status']=='Call unavailable')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_call_unavailable'));?></option>
								<option value="Callback requested" <?php echo (!empty($enquiry_data) && $enquiry_data[0]['enquiry_status']=='Callback requested')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_callback_requested'));?></option>
                            </select>
                        </div>
                    </div>

					
                <?php
				$id = isset($enquiry_data[0]['id']) && $enquiry_data[0]['id'] ? $enquiry_data[0]['id'] : '';
				if($id){
                    echo '<input type="hidden" value="'.$id.'" name="id">';
                    $type = 'edit';
                }else{
                    $type = 'add';
                }
                $ltr_add_enquiry = html_escape($this->common->languageTranslator('ltr_add_enquiry'));
                $ltr_update_enquiry = html_escape($this->common->languageTranslator('ltr_update_enquiry'));
                ?>
                <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
                    <input type="submit" value="<?php echo !empty($enquiry_data)? $ltr_update_enquiry : $ltr_add_enquiry ;?>" class="edu_admin_btn addNewEnquiry" data-type="<?php echo html_escape($type);?>" />
                </div>
               
        </div>
    </div>
</section>
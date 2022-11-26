<?php //echo $lead_management_data[0]['source'];exit;?>
<section class="edu_admin_content">
	<div>
    	<h6 style="margin-left:31px;height:19px;padding-top:11px;">Select Criteria</h6>
    </div>
	<div class="edu_admin_right sectionHolder edu_student_manager">
	    <div class="edu_table_wrapper sectionHolder">
			<div class="edu_admin_informationdiv">
                <form method="post" action="" autocomplete="off">
                    <div class="edu_manage_studer_filter"> 
                        <div class="row">
                            <div class="col-lg-2 col-md-4 col-sm-4 col-xs-12">
                               <div class="form-group"> 
		                            <label><?php echo html_escape($this->common->languageTranslator('ltr_source'));?><sup>*</sup></label>
		                            <select class="form-control require edu_selectbox_with_search" name="gender" data-placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_source'));?>">
		                                <option value=""><?php echo html_escape($this->common->languageTranslator('ltr_source'));?> </option>
		                                <option value="Walkin" <?php echo (!empty($lead_management_data) && $lead_management_data[0]['source']=='male')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_walkin'));?></option>
		                                <option value="Website" <?php echo (!empty($lead_management_data) && $lead_management_data[0]['source']=='female')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_website'));?></option>
		                                <option value="Google Ads" <?php echo (!empty($lead_management_data) && $lead_management_data[0]['source']=='other')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_googleads'));?></option>
		                                <option value="Facebook Ads" <?php echo (!empty($lead_management_data) && $lead_management_data[0]['source']=='other')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_facebookads'));?></option>
		                            </select>
		                        </div>
                            </div>	
                            <div class="col-lg-2 col-md-4 col-sm-4 col-xs-12">
                                <div class="form-group"> 
		                            <label><?php echo html_escape($this->common->languageTranslator('ltr_enquiry_fromdate'));?><sup>*</sup></label>
		                            <span class="select-date">
		                                <input type="text" class="form-control chooseDate dobpicker require" name="enquiry_fromdate" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_enquiry_fromdate'));?>" value="<?php echo !empty($student_data)?date('d-m-Y',strtotime($student_data[0]['enquiry_fromdate'])):'';?>">
		                            </span> 
		                        </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <div class="form-group"> 
		                            <label><?php echo html_escape($this->common->languageTranslator('ltr_enquiry_todate'));?><sup>*</sup></label>
		                            <span class="select-date">
		                                <input type="text" class="form-control chooseDate dobpicker require" name="enquiry_todate" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_enquiry_todate'));?>" value="<?php echo !empty($student_data)?date('d-m-Y',strtotime($student_data[0]['enquiry_todate'])):'';?>">
		                            </span> 
		                        </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <div class="form-group"> 
		                            <label><?php echo html_escape($this->common->languageTranslator('ltr_status'));?><sup>*</sup></label>
		                            <select class="form-control require edu_selectbox_with_search" name="status" data-placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_status'));?>">
		                                <option value=""><?php echo html_escape($this->common->languageTranslator('ltr_status'));?> </option>
		                                <option value="active" <?php echo (!empty($student_data) && $student_data[0]['gender']=='male')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_active'));?></option>
		                                <option value="inactive" <?php echo (!empty($student_data) && $student_data[0]['gender']=='female')?'selected':'';?>><?php echo html_escape($this->common->languageTranslator('ltr_inactive'));?></option>
		                            </select>
		                        </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group"> 
                                	<span>
                                       	<input type="button" value="<?php echo html_escape($this->common->languageTranslator('ltr_search'));?>" class="btn btn-primary find_student"> 
					                <span>
                                </div>
                            </div>
                            <div class="col-lg-1 col-md-6 col-sm-6 col-xs-12 text-sm-right">
                                <div class="form-group">                                
                                	        <a href="<?php echo base_url('admin/add_lead_management');?>" class="edu_admin_btn"><i class="icofont-plus"></i><?php echo html_escape($this->common->languageTranslator('ltr_add'));?></a>
                                </div>
                            </div>
                        </div>
                    </div>	
                </form>  
			</div>
		</div>

		<?php if($_SESSION['super_admin'] == '1'){ ?>
        <div class="edu_table_wrapper mb_30">
            <div class="edu_admin_informationdiv sectionHolder">
               
            </div>
        </div>
        <?php } ?>
		<div class="createDivWrapper edu_add_question create_ppr_popup stdn_mng hide">
    		<div class="edu_admin_informationdiv sectionHolder">
    		    <div class="ppr_popup_inner">
        			<div class="row align-items-center text-center">
        			    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
						<button class="multiDelete btn_delete btn btn-primary" data-toggle="tooltip" data-placement="top" title="Delete" data-table="student_lead_management" data-column="id"><?php echo html_escape($this->common->languageTranslator('ltr_delete'));?></button>
	        			</div>
					</div>	
				</div>
        		</div>
    		</div>
		</div>
		<?php 
			if(!empty($lead_management_data)){
			?>
		<div class="edu_main_wrapper edu_table_wrapper sectionHolder ">
			<div class="edu_admin_informationdiv dropdown_height">
                <div class="tableFullWrapper">
                    <table class="server_datatable datatable table table-striped table-hover dt-responsive" cellspacing="0" width="100%" data-url="ajaxcall/lead_management_table">
                        <thead>
                            <tr>
							    <th><input type="checkbox" class="checkAllAttendance"></th>
							    <th>#</th>
							    <th><?php echo html_escape($this->common->languageTranslator('ltr_name'));?></th>
							    <th><?php echo html_escape($this->common->languageTranslator('ltr_contact_number'));?></th>
							    <th><?php echo html_escape($this->common->languageTranslator('ltr_source'));?></th>
							    <th><?php echo html_escape($this->common->languageTranslator('ltr_enquiry_date'));?></th>
							    <th><?php echo html_escape($this->common->languageTranslator('ltr_enquiry_fromdate'));?></th>
							    <th><?php echo html_escape($this->common->languageTranslator('ltr_enquiry_todate'));?></th>
							    <th><?php echo html_escape($this->common->languageTranslator('ltr_status'));?></th>
							    <th class="no-sort"><?php echo html_escape($this->common->languageTranslator('ltr_actions'));?></th>
							</tr>
                        </thead>
                        <tbody> 
                        </tbody>
                    </table>
                </div>
			</div>
		</div>
		<?php 
			}else{ 
			    
			    echo '<section class="edu_admin_content">
                        <div class="edu_admin_right sectionHolder edu_add_users">
                            <div class="edu_admin_informationdiv edu_main_wrapper">
                                <div class="eac_text eac_page_re">'.html_escape($this->common->languageTranslator('ltr_students_no_data')).'</div>
                            </div>
                        </div>
                    </section>';
			}
			
		 ?>
	</div>
</section> 

<!-- Pop Up Start  -->
<div id="stImgModal" class="edu_popup_container mfp-hide">
    <div class="edu_popup_wrapper">
        <div class="edu_popup_inner">
            <h4 class="edu_sub_title" id="stImgModalLabel"><?php echo html_escape($this->common->languageTranslator('ltr_student_image'));?></h4>
            <div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group text-center">
						<img id="std_img" class="stdnt_proflie_img" src="" alt="Student Image"/>
					</div>
				</div>
			</div>
        </div>
    </div>
</div>

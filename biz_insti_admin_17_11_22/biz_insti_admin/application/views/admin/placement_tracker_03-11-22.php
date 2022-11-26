<?php //echo "placement_tracker"; print_r($batches); exit; ?>
<section class="edu_admin_content">
	<div class="edu_admin_right sectionHolder edu_teacher_manager">
		<!--<div class="edu_btn_wrapper sectionHolder padderBottom30 text-right">
	        <a href="#input_feilds_teacher" class="edu_admin_btn ml-2 add_doubt_ask"><i class="icofont-plus"></i>Add Doubt Ask</a>
	    </div>-->
	    
		<?php 
			if(!empty($student_data)){
			?>
		<div class="edu_main_wrapper edu_table_wrapper sectionHolder ">
			<div class="edu_admin_informationdiv">
                <div class="tableFullWrapper">
                    <table class="datatable table table-striped table-hover dt-responsive" id="student_csv"  cellspacing="0" width="100%" data-url="ajaxcall/placement_tracker">
                        <thead>
                            <tr>
                                <th><?php echo html_escape($this->common->languageTranslator('ltr_sr_no'));?></th>
								<th><?php echo html_escape($this->common->languageTranslator('ltr_acadamy_location'));?></th>
                                <th><?php echo html_escape($this->common->languageTranslator('ltr_student_name'));?></th>
                                <th><?php echo html_escape($this->common->languageTranslator('ltr_student_number'));?></th>
								<th><?php echo html_escape($this->common->languageTranslator('ltr_stud_ref_no'));?></th>
                                <th><?php echo html_escape($this->common->languageTranslator('ltr_course_category'));?></th>
                                <th><?php echo html_escape($this->common->languageTranslator('ltr_course_name'));?></th>
                                <th><?php echo html_escape($this->common->languageTranslator('ltr_course_fees'));?></th>
                                <th><?php echo html_escape($this->common->languageTranslator('ltr_amount_paid'));?></th>
                                <th><?php echo html_escape($this->common->languageTranslator('ltr_amount_pending'));?></th>
                                <th><?php echo html_escape($this->common->languageTranslator('ltr_student_status'));?></th>
                                <th><?php echo html_escape($this->common->languageTranslator('ltr_graduate_on'));?></th>
                                <!--<th><?php //echo html_escape($this->common->languageTranslator('ltr_placement_status'));?></th>-->
								<th class="no-sort"><?php echo html_escape($this->common->languageTranslator('ltr_placement_status'));?></th>
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
                            <div class="eac_text eac_page_re">'.html_escape($this->common->languageTranslator('ltr_no_record')).'</div>
                    </div>
                </section>';
			    
			} ?>
	</div>
</section> 

<!-- Pop view characters Start  -->
<div id="placementViewPopup" class="edu_popup_container mfp-hide">
    <div class="edu_popup_wrapper">
        <div class="edu_popup_inner">
            <form class="form" id="add_student_placement" method="post" enctype="multipart/form-data" autocomplete="off" >
                <div class="row">
					
					<input type="hidden" name="student_id" value="">
                    
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group">
							<label><?php echo html_escape($this->common->languageTranslator('ltr_placement_date'));?></label>
							<span class="select-date">
                                <input type="text" class="form-control chooseDate require" name="placement_date" placeholder="" value="">
                            </span> 
						</div>
					</div>
					
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_comapany'));?></label>
                            <input type="text" class="form-control require alphaField" name="company" placeholder="" value="">
                        </div>
                    </div>
					
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_position'));?></label>
                            <input type="text" class="form-control require alphaField" name="position" placeholder="" value="">
                        </div>
                    </div>
					
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_salary'));?></label>
                            <input type="text" class="form-control" name="salary" placeholder="" value="">
                        </div>
                    </div>
					
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_contract_month'));?></label>
                            <input type="text" class="form-control" name="contract_month" placeholder="" value="">
                        </div>
                    </div>
					
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="form-group"> 
                            <label><?php echo html_escape($this->common->languageTranslator('ltr_description'));?></label>
                            <textarea class="form-control require" placeholder=""  name="description" value=""></textarea>
                        </div>
                    </div>
					
					<div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
						<input type="button" value="Submit" class="edu_admin_btn addstudentplacement" data-type="" />
					</div>
					
				</div>
			</form>
        </div>
    </div>
</div>
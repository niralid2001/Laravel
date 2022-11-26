<?php //print_r("student_placement");exit; ?>
<section class="edu_admin_content">
	<div class="edu_admin_right sectionHolder edu_notice_manage">
	   <div class="edu_btn_wrapper sectionHolder padderBottom30 text-right">
	        <!--<a href="#input_feilds_notice" class="edu_admin_btn openPopupLink"><i class="icofont-plus"></i><?php //echo html_escape($this->common->languageTranslator('ltr_add_placement'));?></a>-->
	    </div>
		<div class="edu_main_wrapper edu_table_wrapper mb_30">
			<div class="edu_admin_informationdiv sectionHolder">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="edu_title_wrapper">
							<h4 class="edu_sub_title"><?php echo html_escape($this->common->languageTranslator('ltr_student_placement_details'));?></h4>
						</div>
					</div>
					<?php 
					    if(!empty($placement_data)){
					        
					        echo '
								
							<div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 col-xs-12">
								<div class="edu_extra_class padderTop20">
									<p class="clsdesc"><span class="boldText">'.html_escape($this->common->languageTranslator('ltr_placement_date')).'- </span>'.$placement_data[0]['placement_date'].'</p>
									<p class="clsdesc"><span class="boldText">'.html_escape($this->common->languageTranslator('ltr_comapany')).' - </span>'.$placement_data[0]['company'].'</p>
									<p class="clsdesc"><span class="boldText">'.html_escape($this->common->languageTranslator('ltr_position')).'- </span>'.$placement_data[0]['position'].'</p>
									<p class="clsdesc"><span class="boldText">'.html_escape($this->common->languageTranslator('ltr_salary')).'- </span>'.$placement_data[0]['salary'].'</p>
									<p class="clsdesc"><span class="boldText">'.html_escape($this->common->languageTranslator('ltr_contract_month')).'- </span>'.$placement_data[0]['contract_month'].'</p>
									<p class="clsdesc"><span class="boldText">'.html_escape($this->common->languageTranslator('ltr_description')).'- </span>'.$placement_data[0]['description'].'</p>
								</div>
							</div>';
						
					} ?>	
				</div>
			</div>
		</div>
		<!--<div class="edu_main_wrapper edu_table_wrapper">
			<div class="edu_admin_informationdiv sectionHolder">
				<div class="tableFullWrapper">
    				<table class="server_datatable datatable table table-striped table-hover dt-responsive" data-url="ajaxcall/student_placement_table/<?php echo $teacher_id; ?>" cellspacing="0" width="100%">
    					<thead>
    						<tr>
    							<th>#</th>
    							<th><?php //echo html_escape($this->common->languageTranslator('ltr_placement_date'));?></th>
    							<th><?php //echo html_escape($this->common->languageTranslator('ltr_comapany'));?></th>
    							<th><?php// echo html_escape($this->common->languageTranslator('ltr_position'));?></th>
    							<th><?php //echo html_escape($this->common->languageTranslator('ltr_salary'));?></th>
    							<th><?php //echo html_escape($this->common->languageTranslator('ltr_contract_month'));?></th>
    							<th><?php //echo html_escape($this->common->languageTranslator('ltr_description'));?></th>
    						</tr>
    					</thead>
    					<tbody>
    					</tbody> 
    				</table>
    			</div>
			</div>
		</div>-->
	</div>
</section>

<!-- Pop Up Start  -->
<div id="input_feilds_notice" class="edu_popup_container mfp-hide">
    <div class="edu_popup_wrapper">
        <div class="edu_popup_inner">
            <h4 class="edu_sub_title" id="myModalLabel1"><?php echo html_escape($this->common->languageTranslator('ltr_add_notice'));?></h4>
            <form method="post">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
    					<div class="form-group">
							<label><?php echo html_escape($this->common->languageTranslator('ltr_notice_title'));?><sup>*</sup></label>
							<input type="text" class="form-control require" name="title" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_notice_title'));?>">
						</div>
    				</div>
					<input type="hidden" id="teacher_id" value="<?php echo $teacher_id; ?>" name="teacher_id">
					<div class="col-lg-12 col-md-12 col-sm-12 col-12">
    					<div class="form-group">
							<label><?php echo html_escape($this->common->languageTranslator('ltr_type_notice_here'));?> <sup>*</sup></label>
							<textarea class="form-control require" name="description" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_description'));?>"></textarea>
						</div>
    				</div>
    				<div class="col-lg-12 col-md-12 col-sm-12 col-12">
    					<div class="edu_btn_wrapper">
							<input type="button" value="<?php echo html_escape($this->common->languageTranslator('ltr_add_notice'));?>" class="edu_admin_btn addstudentplacement" />
						</div>
    				</div>
				</div>
            </form>
        </div>
    </div>
</div>


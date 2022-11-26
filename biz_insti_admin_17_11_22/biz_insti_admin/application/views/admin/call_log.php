<?php //echo $call_log[0]['name'];exit;?>
<section class="edu_admin_content">
	<div>
    	<h6 style="margin-left:31px;height:19px;padding-top:11px;"><?php echo html_escape($this->common->languageTranslator('+'));?></h6>
    </div>
	<div class="edu_admin_right sectionHolder edu_student_manager">
	    <div class="edu_table_wrapper sectionHolder">
			<div class="edu_admin_informationdiv">
                <form class="form" id="add_call_log" method="post" enctype="multipart/form-data" autocomplete="off" data-parsley-validate="">
                    <div class="edu_manage_studer_filter"> 
                        <div class="col-12 row">
							<div class="col-4">
								<div class="col-lg-12 col-md-12 col-sm-12 col-12">
									<div class="form-group"> 
										<label><?php echo html_escape($this->common->languageTranslator('ltr_name'));?><sup>*</sup></label>
										<input type="text" class="form-control require alphaField" name="name" maxlength="40" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_name'));?>" value="<?php echo !empty($record)?$record[0]['name']:'';?>" required>
									</div>
								</div>
								
								<div class="col-lg-12 col-md-12 col-sm-12 col-12">
									<div class="form-group"> 
										<label><?php echo html_escape($this->common->languageTranslator('ltr_phone'));?><sup>*</sup></label>
										<input type="text" class="form-control require" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_phone'));?>"  name="phone" maxlength="12" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="<?php echo !empty($record)?$record[0]['phone']:'';?>" data-valid="mobile" data-error="<?php echo html_escape($this->common->languageTranslator('ltr_valid_contact_msg'));?>" required>
									</div>
								</div>
								
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="form-group"> 
										<label><?php echo html_escape($this->common->languageTranslator('ltr_date'));?><sup>*</sup></label>
										<span class="select-date">
											<input id="fromdate" type="text" class="form-control chooseDate require" name="date" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_date'));?>" value="<?php echo !empty($record)?date('d-m-Y',strtotime($record[0]['date'])):'';?>" required>
										</span> 
									</div>
								</div>
								
								<div class="col-lg-12 col-md-12 col-sm-12 col-12">
									<div class="form-group"> 
										<label><?php echo html_escape($this->common->languageTranslator('ltr_description'));?><sup>*</sup></label>
										<textarea name="description" rows="2" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_description'));?>" class="form-control" required><?php echo !empty($record)?$record[0]['description']:'';?></textarea>
									</div>
								</div>
								
								<div class="col-lg-12 col-md-12 col-sm-12 col-12">
									<div class="form-group"> 
										<label><?php echo html_escape($this->common->languageTranslator('ltr_next_followup_date'));?><sup>*</sup></label>
										<span class="select-date">
											<input id="nextfollowupdate" type="text" class="form-control chooseDate require" name="next_followup_date" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_next_followup_date'));?>" value="<?php echo !empty($record)?date('d-m-Y',strtotime($record[0]['next_followup_date'])):'';?>" required>
										</span> 
									</div>
								</div>
								
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="form-group"> 
										<label><?php echo html_escape($this->common->languageTranslator('ltr_call_duration'));?><sup>*</sup></label>
										<span class="select-date">
											<input id="" type="number" class="form-control totime require" name="call_duration" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_call_duration'));?>" value="<?php echo !empty($record)?$record[0]['call_duration']:'';?>" required>
										</span> 
									</div>
								</div>
								
								
								<div class="col-lg-12 col-md-12 col-sm-12 col-12">
									<div class="form-group"> 
										<label><?php echo html_escape($this->common->languageTranslator('ltr_note'));?><sup>*</sup></label>
										<textarea name="note" rows="2" placeholder="<?php echo html_escape($this->common->languageTranslator('ltr_note'));?>" class="form-control" required><?php echo !empty($record)?$record[0]['note']:'';?></textarea>
									</div>
								</div>
								
								<div class="col-lg-12 col-md-12 col-sm-12 col-12">
									<div class="form-group"> 
										<input type="hidden" name="call_type" value="Incoming">
									</div>
								</div>
								
								<?php
									$id = isset($record[0]['id']) && $record[0]['id'] ? $record[0]['id'] : '';
									if($id){
										echo '<input type="hidden" value="'.$id.'" name="id">';
										$type = 'edit';
									}else{
										$type = 'add';
									}
									$ltr_add_call_log = html_escape($this->common->languageTranslator('ltr_add_call_log'));
									$ltr_update_call_log = html_escape($this->common->languageTranslator('ltr_update_call_log'));
								?>
								<div class="col-lg-2 col-md-6 col-sm-6 col-xs-12">
									<div class="form-group"> 
										<?php
										$id = isset($record[0]['id']) && $record[0]['id'] ? $record[0]['id'] : '';
										if($id)
											{ 
										?>
										<span>
											<input type="submit" value="<?php echo html_escape($this->common->languageTranslator('ltr_editcalllog'));?>" class="btn btn-primary addNewCalllog"> 
										<span>
										<?php 
										} 
										else 
											{
										?>
											<span>
											<input type="submit" value="<?php echo html_escape($this->common->languageTranslator('ltr_addcalllog'));?>" class="btn btn-primary addNewCalllog"> 
										<span>
											<?php 
											}
										?>

									</div>
								</div>
                            </div>
							<div class="col-8">
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
											<button class="multiDelete btn_delete btn btn-primary" data-toggle="tooltip" data-placement="top" title="Delete" data-table="call_log" data-column="id"><?php echo html_escape($this->common->languageTranslator('ltr_delete'));?></button>
											</div>
										</div>	
									</div>
									</div>
								</div>
							
								<?php 
									//print_r($call_log[0]['name']);exit;
									if(!empty($call_log)){
									?>
									<div class="edu_main_wrapper edu_table_wrapper sectionHolder ">
										<div class="edu_admin_informationdiv dropdown_height">
											<div class="tableFullWrapper">
												<table class="server_datatable datatable table table-striped table-hover dt-responsive" cellspacing="0" width="100%" data-url="ajaxcall/call_log_table">
													<thead>
														<tr>
															<th><input type="checkbox" class="checkAllAttendance"></th>
															<th>#</th>
															<th><?php echo html_escape($this->common->languageTranslator('ltr_name'));?></th>
															<th><?php echo html_escape($this->common->languageTranslator('ltr_phone'));?></th>
															<th><?php echo html_escape($this->common->languageTranslator('ltr_date'));?></th>
															<th><?php echo html_escape($this->common->languageTranslator('ltr_next_followup_date'));?></th>
															<th><?php echo html_escape($this->common->languageTranslator('ltr_calltype'));?></th>
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
															<div class="eac_text eac_page_re">'.html_escape($this->common->languageTranslator('ltr_call_log_no_data')).'</div>
														</div>
													</div>
												</section>';
										}
										
									 ?>
								
							</div>
                        </div>
                    </div>	
                </form>  
			</div>
		</div>
		</div>
		
		
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

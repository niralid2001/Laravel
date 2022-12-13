<?php
  
function changeDateFormate($date,$date_format){
    return \Carbon\Carbon::createFromFormat('Y-m-d', $date)->format($date_format);    
}

function getCmsPageName($id = ''){
    $pageData = App\Models\Page::select('name', 'description', 'slug')->where([['id' , $id],['is_archive','0']])->first();
    return $pageData;
}

function getSettingInfo($label){
    $sData = App\Models\Page::select('value')->where('label', $label)->first();
    $result = isset($sData->value) && $sData->value ? $sData->value : NULL;
    return $result;
}

function getSettingDetail(){
    $AdminSetting_list = App\Models\Setting::select('id', 'label', 'value')->get();
    $settings = array();
    if (count($AdminSetting_list) != 0) {
        foreach ($AdminSetting_list as $item) {
            $settings[$item->label] = $item->value;
        }
    }

    return $settings;
}

function fileUpload($request, $file, $path){
    $imageName = $request->$file->getClientOriginalName();
    $file_ext = $request->$file->getClientOriginalExtension();
    $fileInfo = pathinfo($imageName);
    $filename = str_replace(' ', '', $fileInfo['filename']);
    $newname = $filename.time() . "." . $file_ext;
    $destinationPath1 = public_path($path);
    $request->file($file)->move($destinationPath1, $newname);
    return $newname;
}

function removeFile($path){
    $filePath = public_path($path);
    File::delete($filePath);
}

function removeDirectory($path){
    $filePath = public_path($path);
    File::deleteDirectory($filePath);
}

function slugify($text){
    // replace non letter or digits by -
    $text = preg_replace('~[^\pL\d]+~u', '-', $text);
    // transliterate
    $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);
    // remove unwanted characters
    $text = preg_replace('~[^-\w]+~', '', $text);
    // trim
    $text = trim($text, '-');
    // remove duplicate -
    $text = preg_replace('~-+~', '-', $text);
    // lowercase
    $text = strtolower($text);
    if (empty($text)) {
        return 'n-a';
    }
    return $text;
}

function getColumnValueinArray($table_nm, $column, $where = null){
    $array = array();
    $query = DB::table($table_nm)
                    ->select($column);
    if($where != ''){
        $query->where($where);
    }

    $result = $query->get();
    if($result->count()){
        foreach($result as $value){
            array_push($array, $value->$column);
        }
    }
    return $array;
}

function getColumnValueFromWhere($table_nm, $column, $where = null){
    $column_val = '';
    $query = DB::table($table_nm)
                    ->select($column);
    if($where != ''){
        $query->where($where);
    }

    $result = $query->first();
    $column_val = isset($result->$column) && $result->$column ? $result->$column : NULL;
    return $column_val;
}

function getRowByWhere($table_nm, $where = null){
    $query = DB::table($table_nm)
                    ->select('*');
    if($where != ''){
        $query->where($where);
    }

    $result = $query->first();
    return $result;
}

function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

function formatNumber($no){
    $no = number_format($no, 2, '.', '');
    return $no;
}

function containsDecimal( $value ) {
    if ( strpos( $value, "." ) !== false ) {
        return true;
    }
    return false;
}
function getModules(){
    $main_modules = App\Models\Modules::select('id' ,'module')->get();
    $modules = array();
    if($main_modules->count()){
        foreach($main_modules as $value){
            $module_roles = \App\Models\ModuleRoles::select('id', 'title')->where('module_id', $value->id)->get();
            $modules[$value->module] = $module_roles;
        }
    }
    return $modules;
}

function getRolePermission($role_id){
    $roles = App\Models\UserRoles::select('module_roles_id')->where('user_type_id', $role_id)->get();
    $permissions = array();
    foreach ($roles as $value){
        $permissions[] = $value->module_roles_id;
    }
    return $permissions;
}

function getProjectShortDescription($projectId){
    $abstrct = App\Models\ProjectAbstract::where('project_id', $projectId)->orderBy('id', 'asc')->first();
    $description = isset($abstrct->description) && $abstrct->description ? $abstrct->description : NULL;
    if(!$description){
        $summary = App\Models\ProjectSummary::where('project_id', $projectId)->orderBy('id', 'asc')->first();
        $description = isset($summary->description) && $summary->description ? $summary->description : NULL;
        if(!$description){
            $desc = App\Models\ProjectDescription::where('project_id', $projectId)->orderBy('id', 'asc')->first();
            $description = isset($desc->description) && $desc->description ? $desc->description : NULL;
        }
    }
    
    return $description;
}

function getProjectTemplateShortDescription($projectId){
    $abstrct = App\Models\ProjectTemplateAbstract::where('project_template_id', $projectId)->orderBy('id', 'asc')->first();
    $description = isset($abstrct->description) && $abstrct->description ? $abstrct->description : NULL;
    if(!$description){
        $summary = App\Models\ProjectTemplateSummary::where('project_template_id', $projectId)->orderBy('id', 'asc')->first();
        $description = isset($summary->description) && $summary->description ? $summary->description : NULL;
        if(!$description){
            $desc = App\Models\ProjectTemplateDescription::where('project_template_id', $projectId)->orderBy('id', 'asc')->first();
            $description = isset($desc->description) && $desc->description ? $desc->description : NULL;
        }
    }
    return $description;
}

function updateProjectReviewInfo($projectId, $committee_id){
    \App\Models\Project::where('id', $projectId)->update(array('technical_committee_last_review_time' => date('Y-m-d h:i:s'), 'technical_committee_id' => $committee_id));
}

function getDesignersReservationCalls($designer_id , $call_id = ''){
    $query = \App\Models\CallProjects::with('projectDetail')->select('id','project_id')->where([['designer_id', $designer_id]]);
    if($call_id){
        $query->where([['call_id', $call_id]]);
    }
    $bookinfo = $query->first();
    return $bookinfo;
}

function callIdCount(){
    $call_id = App\Models\CallProjects::select('call_id')->where('status','=',0)->get();
    return $call_id->count();
}

function getUserNotification($user_id){
    $notifications = App\Models\UserNotification::with('commentDetail', 'callDetail', 'staffDetail', 'callInformation')->where([['user_id', $user_id], ['is_read', 0]])->orderBy('id', 'desc')->get();
    return $notifications;
}

function checkIfDesignerNeedToConfirmCall($user_id, $call_id){
    $call_detail = App\Models\CallProjects::select('id')->where([['call_id', '=', $call_id], ['designer_id', '=', $user_id], ['status', '=', 1]])->first();
    $result = isset($call_detail->id) && $call_detail->id ? $call_detail->id : NULL;
    return $result;
}

function isProjectBookedForPublishedCall($project_id){
    $query = \App\Models\CallProjects::with('callInformation')->select('id')->where([['project_id', $project_id], ['status', 0]]);
    $query->whereHas('callInformation',function($q) use ($project_id) {
        $q->where('status', App\Constant::CALL_NOTIFIED);
    });
    $result = $query->first();
    $id = isset($result->id) && $result->id ? $result->id : NULL;
    return $id;
}

function isProjectVotedByUser($user_id, $project_id){
    $query = App\Models\ProjectVotes::select('id')->where([['voter_id', $user_id], ['project_id', $project_id]])->first();
    $id = isset($query->id) && $query->id ? $query->id : NULL;
    return $id;
}

function isVisitorHasGivenVoteOnCall($user_id, $call_id){
    $query = App\Models\ProjectVotes::select('id')->where([['voter_id', $user_id]]);
    $query->whereHas('projectDetail',function($q) use ($call_id) {
        $q->where('call_id', $call_id);
    });
    $query = $query->first();
    $id = isset($query->id) && $query->id ? $query->id : NULL;
    return $id;
}

function getWinnerProject($call_id){
    $projects = App\Models\CallProjects::select('project_id')->where([['call_id', '=', $call_id], ['status', '=', 0]])->get();
    $project_votes = array();
    if($projects->count()){
        foreach($projects as $project){
            $votes = App\Models\Project::select('total_votes')->where([['id', '=', $project->project_id]])->first();
            $project_votes[$project->project_id] = isset($votes->total_votes) && $votes->total_votes ? $votes->total_votes : 0;
        }
    }

    $winner_project_data = array();
    $fund_information = \App\Models\ManagementFundInformation::select('total_available_fund')->where('id', '=', 1)->first();
    $total_available_fund = isset($fund_information->total_available_fund) && $fund_information->total_available_fund ? $fund_information->total_available_fund : 0.00;
    if(count($project_votes)){
        /** project wins with the highest no of votes **/
        $winner_projects = getHighestValueFromArray($project_votes, array(), 0);
        if(count($winner_projects) > 1){
            $project_budgets = array();
            foreach($winner_projects as $wk => $wv){
                $budgetInfo = App\Models\Project::select('budget', 'id')->where([['id' , '=',  $wk]])->first();
                $budget = isset($budgetInfo->budget) && $budgetInfo->budget ? $budgetInfo->budget : 0;
                $project_budgets[$wk] = $budget;
            }
            /**In case of projects with the same number of votes, the one with a higher budget wins.**/
            if(count($project_budgets)){
                $heighest_budget_info = getHighestValueFromArray($project_budgets, array(), 0);
                if(count($heighest_budget_info) == 1){
                    $winner_project_id = array_key_first($heighest_budget_info);
                    $project_cost_data = \App\Models\Project::select('project_costs')->where([['id', $winner_project_id]])->first();
                    $project_costs = isset($project_cost_data->project_costs) && $project_cost_data->project_costs ? $project_cost_data->project_costs : 0.00;

                    if($total_available_fund > $project_costs){
                        /** In case of projects with the same number of votes, the one with a higher budget & funds wins. **/
                        $winner_project_data = array('id' => $winner_project_id, 'comment' => 'Project is win by heighest no of votes('.$winner_projects[$winner_project_id].') and budget, also financed.', 'status' => App\Constant::FUNDED);
                    } else {
                        /** if there are not enough funds and there are projects with the same number of votes, the selection process must be repeated by selecting the project with the lowest budget **/
                        $winner_project_id = getLowestValueFromArray($project_budgets);
                        $project_cost_data = \App\Models\Project::select('project_costs')->where([['id', $winner_project_id]])->first();
                        $project_costs = isset($project_cost_data->project_costs) && $project_cost_data->project_costs ? $project_cost_data->project_costs : 0.00;

                        if($total_available_fund > $project_costs){
                            $winner_project_data = array('id' => $winner_project_id, 'comment' => 'Project is win by heighest no of votes('.$winner_projects[$winner_project_id].') and lowest budget, also financed.', 'status' => App\Constant::FUNDED);
                        } else {
                            $winner_project_data = array('id' => $winner_project_id, 'comment' => 'Project is win by heighest no of votes('.$winner_projects[$winner_project_id].') and lowest budget, can not be financed due to lack of common funds.', 'status' => App\Constant::NOT_AVAILABLE_FUND);
                        }
                    }
                } else{
                    $winner_project_id = array_key_first($heighest_budget_info);
                    $project_cost_data = \App\Models\Project::select('project_costs')->where([['id', $winner_project_id]])->first();
                    $project_costs = isset($project_cost_data->project_costs) && $project_cost_data->project_costs ? $project_cost_data->project_costs : 0.00;
                    if($total_available_fund > $project_costs){
                        $winner_project_data = array('id' => $winner_project_id, 'comment' => 'There are '.count($heighest_budget_info).' project that has same no of votes and budget. So project is win by '.$winner_projects[$winner_project_id].' votes randomly and also financed.', 'status' => App\Constant::FUNDED);
                    } else {
                        $winner_project_id = getLowestValueFromArray($project_budgets);
                        $project_cost_data = \App\Models\Project::select('project_costs')->where([['id', $winner_project_id]])->first();
                        $project_costs = isset($project_cost_data->project_costs) && $project_cost_data->project_costs ? $project_cost_data->project_costs : 0.00;

                        if($total_available_fund > $project_costs){
                            $winner_project_data = array('id' => $winner_project_id, 'comment' => 'There are '.count($heighest_budget_info).' project that has same no of votes and budget. So project is win by '.$winner_projects[$winner_project_id].' votes randomly and also financed.', 'status' => App\Constant::FUNDED);
                        } else {
                            $winner_project_data = array('id' => $winner_project_id, 'comment' => 'There are '.count($heighest_budget_info).' project that has same no of votes and budget. So project is win by '.$winner_projects[$winner_project_id].' votes randomly and can not be financed due to lack of common funds.', 'status' => App\Constant::NOT_AVAILABLE_FUND);
                        }
                    }
                }
            }
        } else {
            $winner_project_id = array_key_first($winner_projects);
            $project_cost_data = \App\Models\Project::select('project_costs')->where([['id', $winner_project_id]])->first();
            $project_costs = isset($project_cost_data->project_costs) && $project_cost_data->project_costs ? $project_cost_data->project_costs : 0.00;

            if($total_available_fund > $project_costs){
                $winner_project_data = array('id' => $winner_project_id, 'comment' => 'Project is win by heighest no of votes('.$winner_projects[$winner_project_id].') and also financed.', 'status' => App\Constant::FUNDED);
            } else {
                $winner_project_data = array('id' => $winner_project_id, 'comment' => 'Project is win by heighest no of votes('.$winner_projects[$winner_project_id].') and can not be financed due to lack of common funds.', 'status' => App\Constant::NOT_AVAILABLE_FUND);
            }
        }
    }
    return $winner_project_data;
}

function getHighestValueFromArray($array, $return_array = array(), $heighest_value = 0){
    $key = array_search(max($array), $array);

    if($heighest_value == $array[$key]) {
        $return_array[$key] = $array[$key];
    } elseif($heighest_value < $array[$key]){
        $return_array[$key] = $array[$key];
        $heighest_value = $array[$key];
        unset($array[$key]);
        if(count($array)){
            $return_array = getHighestValueFromArray($array, $return_array, $heighest_value);
        }
    }
    return $return_array;
}

function getLowestValueFromArray($array){
    $key = array_search(min($array), $array);
    return $key;
}

function getCallProjectsOrderByVotes($call_id = '', $winner_project_id = ''){
    $projects = App\Models\Project::select('*')
                ->join('call_projects', 'call_projects.project_id', '=', 'projects.id')
                ->where('call_projects.call_id', '=', $call_id);
                if($winner_project_id){
                    $projects->where('projects.id', '!=', $winner_project_id);
                }
    $result = $projects->orderBy('projects.total_votes', 'desc')
            ->get();
    return $result;
}

function getProjectRewards($project_id = '', $call_id = ''){
    $result = App\Models\ProjectFinance::where([['project_id', '=', $project_id], ['call_id', '=', $call_id]])->sum('finance');
    $result = formatNumber($result);
    return $result;
}

function diffMonth($from, $to) {
    $fromYear = date("Y", strtotime($from));
    $fromMonth = date("m", strtotime($from));
    $toYear = date("Y", strtotime($to));
    $toMonth = date("m", strtotime($to));
    if ($fromYear == $toYear) {
        return ($toMonth-$fromMonth)+1;
    } else {
        return (12-$fromMonth)+1+$toMonth;
    }
}

function getAllUsers($user_type = "",$is_online = ""){
    $query = \App\Models\User::select('id')->where([['is_active', '=', 0],['is_archive', '=', 0]]);
    if($user_type != ''){
        $query->where([['user_type', '=', $user_type]]);
    }
    if($is_online != ''){
        $query->where([['is_online', '=', $is_online]]);
    }
    $allUsers = $query->get();
    $total_users = $allUsers->count();
    return $total_users;
}

function getAllProjects($status = ""){
    $query = \App\Models\Project::select('id')->where([['is_archive', '=', 0]]);
    if($status != ''){
        $query->where([['status', '=', $status]]);
    }
    $allProjects = $query->get();
    $total_projects = $allProjects->count();
    return $total_projects;
}

function getProjectsReviewdByTechnicalCommission(){
    $allProjects = \App\Models\Project::select('id')->where([['technical_committee_id', '!=', NULL]])->get();
    $total_project = $allProjects->count();
    return $total_project;
}

function getProjectsReviewdByControlCommission(){
    $allProjects = \App\Models\Project::select('id')->where([['control_committe_id', '!=', NULL]])->get();
    $total_project = $allProjects->count();
    return $total_project;
}

function getWinningProjects(){
    $allWinningProjects = \App\Models\Project::select('id')->where([['is_winner', '=', 1]])->get();
    $total_winning_project = $allWinningProjects->count();
    return $total_winning_project;
}

function getAllCalls($status=""){
    $query = \App\Models\CallDetails::select('id')->where([['is_archive', '=', 0]]);
    if($status){
        $query->where([['status', '=', $status]]);
    }
    $allCalls = $query->get();
    $total_calls = $allCalls->count();
    return $total_calls;
}

function getevaluationCount(){
    $evaluation = App\Models\TellUsAboutProjectsIdeas::select('id')->where('is_archive','=',0)->get();
    return $evaluation->count();
}

function getfinanceinfoCount(){
    $finance = App\Models\ProjectFinance::select('id')->get();
    return $finance->count();
}

function getfinanceCount(){
    $result = App\Models\ProjectFinance::select('id','finance')->sum('finance');
    $result = formatNumber($result);
    return $result;
}

function getFinanceProjectCount(){
    $result = App\Models\Project::select('id','budget','status')->where('status','=',6)->sum('budget');
    $result = formatNumber($result);
    return $result;
}

function getDistributedProjectCount(){
    $result = App\Models\Project::select('id','project_costs','status')->where('status','=',6)->sum('project_costs');
    $result = formatNumber($result);
    return $result;
}

function getTotalWinningsCount(){
    $result = App\Models\Project::select('id','reward_amount','status')->where('status','=',6)->sum('reward_amount');
    $result = formatNumber($result);
    return $result;
}

function getValueOfCommissionCount(){
    $result = App\Models\Project::select('id','management_amount','status')->where('status','=',6)->sum('management_amount');
    $result = formatNumber($result);
    return $result;
}

function getInitials($string) {
    $words = explode(' ', $string);
    if ( ! $words ) {
        return false;
    }
    $result = '';
    foreach ( $words as $word ) $result .= $word[0];
    return strtoupper( $result );
}
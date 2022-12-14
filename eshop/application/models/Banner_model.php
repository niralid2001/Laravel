<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Banner_model extends CI_Model
{
    public function __construct()
    {
        $this->load->database();
        $this->load->library(['ion_auth', 'form_validation']);
        $this->load->helper(['url', 'language', 'function_helper']);
    }

    public function get_banners($id = NULL, $limit = '', $offset = '', $sort = 'row_order', $order = 'ASC')
    {
        $where = ['b.status' => 1];

        $this->db->select('b.*');
        $this->db->where($where);

        if (!empty($limit) || !empty($offset)) {
            $this->db->offset($offset);
            $this->db->limit($limit);
        }

        $this->db->order_by($sort, $order);

        $query = $this->db->get('banners b');
        $banners = $query->result();
        $count_res = $this->db->count_all_results('banners b');
        $i = 0;
        foreach ($banners as $b) {
            $banners[$i]->text = output_escaping($b->name);
            $banners[$i]->name = output_escaping($banners[$i]->name);
            $banners[$i]->image = get_image_url($banners[$i]->image, 'thumb', 'sm');
            $i++;
        }
        if (isset($banners[0])) {
            $banners[0]->total = $count_res;
        }
        return  json_decode(json_encode($banners), 1);
    }

    public function delete_banner($id)
    {
        $this->db->trans_start();
        $id = escape_array($id);
        $this->db->set('status', NULL)->where('id', $id)->update('banners');
        $this->db->trans_complete();
        $response = TRUE;
        return $response;
    }

    public function get_banner_list()
    {
        $offset = 0;
        $limit = 10;
        $sort = 'id';
        $order = 'ASC';
        $multipleWhere = '';
        $where = ['status !=' => NULL];

        if (isset($_GET['offset']))
            $offset = $_GET['offset'];
        if (isset($_GET['limit']))
            $limit = $_GET['limit'];

        if (isset($_GET['sort']))
            if ($_GET['sort'] == 'id') {
                $sort = "id";
            } else {
                $sort = $_GET['sort'];
            }
        if (isset($_GET['order']))
            $order = $_GET['order'];

        if (isset($_GET['search']) and $_GET['search'] != '') {
            $search = $_GET['search'];
            $multipleWhere = ['`id`' => $search, '`name`' => $search];
        }

        $count_res = $this->db->select(' COUNT(id) as `total` ');

        if (isset($multipleWhere) && !empty($multipleWhere)) {
            $count_res->or_like($multipleWhere);
        }

        $ban_count = $count_res->where($where)->get('banners')->result_array();
        foreach ($ban_count as $row) {
            $total = $row['total'];
        }

        $search_res = $this->db->select(' * ');
        if (isset($multipleWhere) && !empty($multipleWhere)) {
            $search_res->or_like($multipleWhere);
        }
        if (isset($where) && !empty($where)) {
            $search_res->where($where);
        }

        $ban_search_res = $search_res->order_by($sort, "asc")->limit($limit, $offset)->get('banners')->result_array();
        $bulkData = array();
        $bulkData['total'] = $total;
        $rows = array();
        $tempRow = array();

        foreach ($ban_search_res as $row) {
            if (!$this->ion_auth->is_seller()) {
                $operate = '<a href="' . base_url('admin/banner/create_banner' . '?edit_id=' . $row['id']) . '" class=" btn btn-success btn-xs mr-1 mb-1" title="Edit" data-id="' . $row['id'] . '" data-url="admin/banner/create_banner"><i class="fa fa-pen"></i></a>';
                $operate .= '<a class="delete-banner btn btn-danger btn-xs mr-1 mb-1" title="Delete" href="javascript:void(0)" data-id="' . $row['id'] . '" ><i class="fa fa-trash"></i></a>';
            }
            if ($row['status'] == '1') {
                $tempRow['status'] = '<a class="badge badge-success text-white" >Active</a>';
                if (!$this->ion_auth->is_seller()) {
                    $operate .= '<a class="btn btn-warning btn-xs update_active_status mr-1 mb-1" data-table="banners" title="Deactivate" href="javascript:void(0)" data-id="' . $row['id'] . '" data-status="' . $row['status'] . '" ><i class="fa fa-eye-slash"></i></a>';
                }
            } else {
                $tempRow['status'] = '<a class="badge badge-danger text-white" >Inactive</a>';
                if (!$this->ion_auth->is_seller()) {
                    $operate .= '<a class="btn btn-primary btn-xs update_active_status mr-1 mb-1" data-table="banners" href="javascript:void(0)" title="Active" data-id="' . $row['id'] . '" data-status="' . $row['status'] . '" ><i class="fa fa-eye"></i></a>';
                }
            }

            $tempRow['id'] = $row['id'];
            $tempRow['name'] = output_escaping($row['name']);

            if (empty($row['image']) || file_exists(FCPATH  . $row['image']) == FALSE) {
                $row['image'] = base_url() . NO_IMAGE;
                $row['image_main'] = base_url() . NO_IMAGE;
            } else {
                $row['image_main'] = base_url($row['image']);
                $row['image'] = get_image_url($row['image'], 'thumb', 'sm');
            }
            $tempRow['image'] = "<a href='" . $row['image_main'] . "' data-toggle='lightbox' data-gallery='gallery'> <img src='" . $row['image'] . "' class='h-25' ></a>";

            if (!$this->ion_auth->is_seller()) {
                $tempRow['operate'] = $operate;
            }
            $rows[] = $tempRow;
        }
        $bulkData['rows'] = $rows;
        print_r(json_encode($bulkData));
    }

    public function add_banner($data)
    {
        $data = escape_array($data);

        $ban_data = [
            'name' => $data['banner_input_name'],
            'status' => '1',
        ];

        if (isset($data['edit_banner'])) {
            unset($ban_data['status']);
            if (isset($data['banner_input_image'])) {
                $ban_data['image'] = $data['banner_input_image'];
            }

            $this->db->set($ban_data)->where('id', $data['edit_banner'])->update('banners');
        } else {
            if (isset($data['banner_input_image'])) {
                $ban_data['image'] = $data['banner_input_image'];
            }
            $this->db->insert('banners', $ban_data);
        }
    }
}

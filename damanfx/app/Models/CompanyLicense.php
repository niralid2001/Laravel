<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CompanyLicense extends Model
{
    use HasFactory;
    protected $table = 'company_licenses';
    protected $fillable = ['id', 'company_id', 'license_id', 'created_by', 'updated_by'];

    public function licenseDetail(){
        return $this->belongsTo(License::class, 'license_id');
    }
}

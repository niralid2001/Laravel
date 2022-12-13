<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BonusLicenses extends Model
{
    use HasFactory;
    protected $table = 'bonus_licenses';
    protected $fillable = ['id', 'bonus_id', 'license_id', 'created_by', 'updated_by'];

    public function licenseDetail(){
        return $this->belongsTo(License::class, 'license_id');
    }
}

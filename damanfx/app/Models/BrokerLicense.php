<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BrokerLicense extends Model
{
    use HasFactory;
    protected $table = 'broker_licenses';
    protected $fillable = ['id', 'broker_id', 'license_id', 'created_by', 'updated_by'];

    public function licenseDetail(){
        return $this->belongsTo(License::class, 'license_id');
    }
}

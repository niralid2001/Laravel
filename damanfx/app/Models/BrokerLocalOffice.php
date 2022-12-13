<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BrokerLocalOffice extends Model
{
    use HasFactory;
    protected $table = 'broker_local_offices';
    protected $fillable = ['id', 'broker_id', 'country_id', 'created_by', 'updated_by'];

    public function countryDetail(){
        return $this->belongsTo(Country::class, 'country_id');
    }
}

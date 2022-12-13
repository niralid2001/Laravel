<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CompanyLocalOffice extends Model
{
    use HasFactory;
    protected $table = 'company_local_offices';
    protected $fillable = ['id', 'company_id', 'country_id', 'created_by', 'updated_by'];

    public function countryDetail(){
        return $this->belongsTo(Country::class, 'country_id');
    }
}

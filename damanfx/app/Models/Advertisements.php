<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Advertisements extends Model
{
    use HasFactory;
    protected $table = 'advertisements';
    protected  $fillable = ['id', 'image', 'created_by', 'updated_by'];

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentOption extends Model
{
    use HasFactory;
    protected $table = 'payment_options';
    protected $fillable = ['id', 'name', 'is_archive', 'slug', 'created_by', 'created_at', 'updated_by', 'updated_at'];
}

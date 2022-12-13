<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TradingPlatform extends Model
{
    use HasFactory;
    protected $table = 'trading_platform';
    protected $fillable = ['id', 'name', 'is_archive', 'slug', 'description', 'created_by', 'created_at', 'updated_by', 'updated_at'];
}

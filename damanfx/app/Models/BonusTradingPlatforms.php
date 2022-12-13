<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BonusTradingPlatforms extends Model
{
    use HasFactory;    
    protected $table = 'bonus_trading_platforms';
    protected $fillable = ['id', 'bonus_id', 'trading_platform_id', 'created_by', 'updated_by'];

    public function platformDetail(){
        return $this->belongsTo(TradingPlatform::class, 'trading_platform_id');
    }
}

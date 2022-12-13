<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BrokerTradingPlatform extends Model
{
    use HasFactory;
    protected $table = 'broker_trading_platforms';
    protected $fillable = ['id', 'broker_id', 'trading_platform_id', 'created_by', 'updated_by'];

    public function platformDetail(){
        return $this->belongsTo(TradingPlatform::class, 'trading_platform_id');
    }
}

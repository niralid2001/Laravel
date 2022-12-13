<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BrokerTradingAsset extends Model
{
    use HasFactory;
    protected $table = 'broker_trading_assets';
    protected $fillable = ['id', 'broker_id', 'trading_asset_id', 'created_by', 'updated_by'];

    public function assetDetail(){
        return $this->belongsTo(TradingAsset::class, 'trading_asset_id');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BrokerDetail extends Model
{
    use HasFactory;
    protected $table = 'broker_details';
    protected $fillable = ['id', 'name', 'slug', 'image', 'address', 'description', 'is_demo_account', 'is_withdrawal_commission', 'minimum_deposit_amount', 'is_islamic_account', 'year_founded', 'meta_title', 'meta_keyword', 'meta_description', 'focus_keyphrase', 'bonus_amount', 'offer', 'bonus_url', 'bonus_end_date', 'min_spread', 'max_leverage', 'currency_pass', 'customer_support', 'type_of_broker', 'trading_instruments', 'used_by', 'scores', 'broker_url', 'is_show_in_front', 'is_archive', 'created_by', 'updated_by'];

    public function tradingAssets(){
        return $this->hasMany(BrokerTradingAsset::class, 'broker_id')->with('assetDetail');
    }

    public function tradingPlatforms(){
        return $this->hasMany(BrokerTradingPlatform::class, 'broker_id')->with('platformDetail');
    }

    public function licenses(){
        return $this->hasMany(BrokerLicense::class, 'broker_id')->with('licenseDetail');
    }

    public function localOffices(){
        return $this->hasMany(BrokerLocalOffice::class, 'broker_id')->with('countryDetail');
    }

    public function depositOptions(){
        return $this->hasMany(BrokerDepositOption::class, 'broker_id')->with('paymentOptionDetail');
    }

    public function withdrawalOptions(){
        return $this->hasMany(BrokerWithdrawalOption::class, 'broker_id')->with('paymentOptionDetail');
    }
}

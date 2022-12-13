<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CompanyDetail extends Model
{
    use HasFactory;
    protected $table = 'company_details';
    protected $fillable = ['id', 'name', 'slug', 'image', 'address', 'description', 'is_demo_account', 'is_withdrawal_commission', 'minimum_deposit_amount', 'is_islamic_account', 'year_founded', 'is_archive', 'created_by', 'updated_by'];

    public function tradingAssets(){
        return $this->hasMany(CompanyTradingAsset::class, 'company_id')->with('assetDetail');
    }

    public function tradingPlatforms(){
        return $this->hasMany(CompanyTradingPlatform::class, 'company_id')->with('platformDetail');
    }

    public function licenses(){
        return $this->hasMany(CompanyLicense::class, 'company_id')->with('licenseDetail');
    }

    public function localOffices(){
        return $this->hasMany(CompanyLocalOffice::class, 'company_id')->with('countryDetail');
    }

    public function depositOptions(){
        return $this->hasMany(CompanyDepositOption::class, 'company_id')->with('paymentOptionDetail');
    }

    public function withdrawalOptions(){
        return $this->hasMany(CompanyWithdrawalOption::class, 'company_id')->with('paymentOptionDetail');
    }
}

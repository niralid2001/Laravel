<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CompanyWithdrawalOption extends Model
{
    use HasFactory;
    protected $table = 'company_withdrawal_options';
    protected $fillable = ['id', 'company_id', 'payment_option_id', 'created_by', 'updated_by'];

    public function paymentOptionDetail(){
        return $this->belongsTo(PaymentOption::class, 'payment_option_id');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BrokerWithdrawalOption extends Model
{
    use HasFactory;
    protected $table = 'broker_withdrawal_options';
    protected $fillable = ['id', 'broker_id', 'payment_option_id', 'created_by', 'updated_by'];

    public function paymentOptionDetail(){
        return $this->belongsTo(PaymentOption::class, 'payment_option_id');
    }
}

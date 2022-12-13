<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TradeUsers extends Model
{
    use HasFactory;
    protected $table = 'trade_users';
    protected $fillable = ['id', 'fname', 'lname', 'email', 'phone', 'investment_capital', 'is_archive'];
}

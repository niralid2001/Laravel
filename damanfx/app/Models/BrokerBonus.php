<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BrokerBonus extends Model
{
    use HasFactory;
    protected $table = 'broker_bonus';
    protected $fillable = ['id', 'broker_id', 'bonus_id', 'created_by', 'updated_by'];

    public function brokerDetail(){
        return $this->belongsTo(BrokerDetail::class, 'broker_id');
    }

    public function bonusDetail(){
        return $this->belongsTo(Bonus::class, 'bonus_id')->select('id', 'amount', 'title');
    }
}

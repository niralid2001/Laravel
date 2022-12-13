<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bonus extends Model
{
    use HasFactory;

    protected $table = 'bonus';
    protected $fillable = ['id', 'amount', 'end_date', 'title', 'bonus_url', 'image', 'description', 'verification', 'withdrawal', 'how_to_apply', 'available_for', 'max_leverage','is_archive', 'created_by', 'updated_by'];

    public function brokers(){
        return $this->hasMany(BrokerBonus::class, 'bonus_id')->with('brokerDetail');
    }
}

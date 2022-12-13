<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BonusTypeOptions extends Model
{
    use HasFactory;
    protected $table = 'bonus_type_options';
    protected $fillable = ['id', 'bonus_id', 'bonus_type_id', 'created_by', 'updated_by'];

    public function bonusTypeDetail(){
        return $this->belongsTo(BonusType::class, 'bonus_type_id');
    }
}

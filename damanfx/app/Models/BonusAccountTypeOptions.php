<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BonusAccountTypeOptions extends Model
{
    use HasFactory;
    protected $table = 'bonus_account_type_options';
    protected $fillable = ['id', 'bonus_id', 'account_type_id', 'created_by', 'updated_by'];

    public function accountTypeDetail(){
        return $this->belongsTo(AccountType::class, 'account_type_id');
    }
}

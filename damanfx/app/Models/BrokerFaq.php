<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BrokerFaq extends Model
{
    use HasFactory;

    protected $table = 'broker_faq';
    protected $fillable = ['id', 'broker_id', 'question', 'slug', 'answer', 'is_archive', 'created_by', 'updated_by'];
}

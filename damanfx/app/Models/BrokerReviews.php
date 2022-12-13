<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BrokerReviews extends Model
{
    use HasFactory;
    protected $table = 'broker_reviews';
    protected $fillable = ['id', 'broker_id', 'review', 'name', 'email', 'comment'];
}

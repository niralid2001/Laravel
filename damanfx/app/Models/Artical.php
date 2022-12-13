<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Artical extends Model
{
    use HasFactory;
    protected $table = 'artical';
    protected  $fillable = ['id', 'title', 'slug', 'image', 'description', 'author_name', 'author_image', 'is_archive', 'meta_keyword', 'meta_description', 'created_by', 'updated_by'];
}

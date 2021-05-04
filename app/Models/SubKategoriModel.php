<?php

namespace App\Models;

use CodeIgniter\Model;

class SubKategoriModel extends Model
{
    protected $table = 'sub_kategori_soal';
    protected $primaryKey = 'sub_soal_id';
    protected $allowedFields = ['kode_sub_kategori', 'nama_sub_kategori'];
}
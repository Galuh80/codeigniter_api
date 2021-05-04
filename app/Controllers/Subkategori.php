<?php

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\SubKategoriModel;

class Subkategori extends ResourceController
{
	use ResponseTrait;

	public function index()
	{
		$model = new SubKategoriModel();
		$data = $model->findAll();
		return $this->respond($data, 200);
	}

	public function show($id = null)
	{
		$model = new SubKategoriModel();
		$data = $model->getWhere(['sub_soal_id' => $id])->getResult();
		if ($data) {
			return $this->respond($data);
		} else {
			return $this->failNotFound('Data Found with id ' . $id);
		}
	}

	public function create()
	{
		$model = new SubKategoriModel();
		$data = [
			'kode_sub_kategori' => $this->request->getPost('kode_sub_kategori'),
			'nama_sub_kategori' => $this->request->getPost('nama_sub_kategori')
		];
		$data = json_decode(file_get_contents("php://input"));

		$model->insert($data);
		$response = [
			'status'   => 201,
			'error'    => null,
			'messages' => [
				'success' => 'Data Saved'
			]
		];

		return $this->respondCreated($response);
	}

	public function update($id = null)
	{
		$model = new SubKategoriModel();
		$json = $this->request->getJSON();
		if ($json) {
			$data = [
				'kode_sub_kategori' => $json->kode_sub_kategori,
				'nama_sub_kategori' => $json->nama_sub_kategori
			];
		} else {
			$input = $this->request->getRawInput();
			$data = [
				'kode_sub_kategori' => $input['kode_sub_kategori'],
				'nama_sub_kategori' => $input['nama_sub_kategori']
			];
		}
		// Insert to Database
		$model->update($id, $data);
		$response = [
			'status'   => 200,
			'error'    => null,
			'messages' => [
				'success' => 'Data Updated'
			]
		];
		return $this->respond($response);
	}

	public function delete($id = null)
	{
		$model = new SubKategoriModel();
		$data = $model->find($id);
		if ($data) {
			$model->delete($id);
			$response = [
				'status'   => 200,
				'error'    => null,
				'messages' => [
					'success' => 'Data Deleted'
				]
			];
			return $this->respondDeleted($response);
		} else {
			return $this->failNotFound('Data Found with id ' . $id);
		}
	}
}

<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddUsuario extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id' => [
                'type' => 'INT',
                'constraint' => 5,
                'unsigned' => true,
                'auto_increment' => true,		
			],
			'nome' => [
				'type' => 'VARCHAR',
				'constraint' => '255',
			],
			'email' => [
				'type' => 'VARCHAR',
				'constraint' => '100',
			],
			'senha' => [
				'type' => 'VARCHAR',
				'constraint' => '255',
			],
			'created_at datetime default current_timestamp',
		]);
		$this->forge->addKey('id', TRUE);
		$this->forge->createTable('usuario');
	}

	public function down()
	{
		$this->forge->dropTable('usuario');
	}
}

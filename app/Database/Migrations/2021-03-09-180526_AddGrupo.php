<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddGrupo extends Migration
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
			'created_at datetime default current_timestamp',			
		]);
		$this->forge->addKey('id', TRUE);
		$this->forge->createTable('grupo');
	}

	public function down()
	{
		$this->forge->dropTable('grupo');
	}
}

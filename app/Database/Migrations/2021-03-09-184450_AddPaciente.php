<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddPaciente extends Migration
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
			'cpf' => [
				'type' => 'VARCHAR',
				'constraint' => '255',
			],			
			'nome' => [
				'type' => 'VARCHAR',
				'constraint' => '255',
			],			
			'nome_mae' => [
				'type' => 'VARCHAR',
				'constraint' => '255',
			],			
			'data_nascimento' => [
				'type' => 'DATE',
			],
			'telefone' => [
				'type' => 'VARCHAR',
				'constraint' => '255',
			],	
			'created_at datetime default current_timestamp',		
		]);
		$this->forge->addKey('id', TRUE);
		$this->forge->createTable('paciente');
	}

	public function down()
	{
		$this->forge->dropTable('paciente');
	}
}
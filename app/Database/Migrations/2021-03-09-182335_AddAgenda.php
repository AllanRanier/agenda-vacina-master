<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddAgenda extends Migration
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
			'data_hora' => [
				'type' => 'TIMESTAMP',			
			],			
			'vagas' => [
				'type' => 'INT',			
			],			
			'grupo_id' => [
				'type' => 'INT',			
			],	
			'created_at datetime default current_timestamp',		
		]);
		$this->forge->addKey('id', TRUE);
		$this->dbforge->add_key('grupo_id', TRUE);
		$this->forge->addForeignKey('grupo_id','grupo','id','CASCADE','RESTRICT');
		$this->forge->createTable('agenda');
	}

	public function down()
	{
		$this->forge->dropTable('agenda');
	}
}
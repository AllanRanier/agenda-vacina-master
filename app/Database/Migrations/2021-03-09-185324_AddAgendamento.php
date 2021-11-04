<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddAgendamento extends Migration
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
			'agenda_id' => [
				'type' => 'INT',

			],
			'grupo_id' => [
				'type' => 'INT',

			],			
			'paciente_id' => [
				'type' => 'INT',

			],			
			'usuario_id' => [
				'type' => 'INT',

			],			
			'created_at datetime default current_timestamp',			
		]);
		$this->forge->addKey('id', TRUE);
		$this->dbforge->add_key('grupo_id', TRUE);
		$this->dbforge->add_key('agenda_id', TRUE);
		$this->dbforge->add_key('paciente_id', TRUE);
		$this->dbforge->add_key('usuario_id', TRUE);
		$this->forge->addForeignKey('agenda_id','agenda','id','CASCADE','RESTRICT');
		$this->forge->addForeignKey('grupo_id','grupo','id','CASCADE','RESTRICT');
		$this->forge->addForeignKey('paciente_id','paciente','id','CASCADE','RESTRICT');
		$this->forge->addForeignKey('usuario_id','usuario','id','CASCADE','RESTRICT');
		$this->forge->createTable('agendamento');
	}

	public function down()
	{
		$this->forge->dropTable('agendamento');
	}
}

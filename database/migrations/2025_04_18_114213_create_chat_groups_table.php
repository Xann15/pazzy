<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChatGroupsTable extends Migration
{
    public function up()
    {
        Schema::create('chat_groups', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->text('description')->nullable();
            $table->string('avatar')->nullable();

            $table->unsignedBigInteger('created_by')->nullable();

            // Max members (based on level)
            $table->enum('max_members', [15, 35, 65, 125, 225, 350, 500])->default(15);
            $table->enum('level', ['basic', 'bronze', 'silver', 'gold', 'platinum', 'diamond', 'love'])->default('basic');

            $table->timestamps();

            $table->foreign('created_by')->references('id')->on('users')->nullOnDelete();
        });
    }

    public function down()
    {
        Schema::dropIfExists('chat_groups');
    }
}

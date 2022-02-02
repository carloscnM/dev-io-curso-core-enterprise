using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace NSE.Clientes.API.Migrations
{
    public partial class EnderecoPadrao : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<Guid>(
                name: "EnderecoDefaultId",
                table: "Clientes",
                type: "uniqueidentifier",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "EnderecoDefaultId",
                table: "Clientes");
        }
    }
}

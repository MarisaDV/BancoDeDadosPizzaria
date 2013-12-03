USE master
GO

ALTER DATABASE Pizzaria SET RECOVERY FULL
GO

:setvar diretorio "C:\Pizzaria"

EXEC XP_CREATE_SUBDIR '$(diretorio)'
GO

BACKUP DATABASE Pizzaria
	TO DISK = 'C:\Pizzaria\PizzariaCompleto.BAK'
GO

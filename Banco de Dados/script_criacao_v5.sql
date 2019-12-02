CREATE TABLE tblContas (
    idConta int primary key identity(1,1),
    login varchar(50) not null,
    senha varchar(256)
)

CREATE TABLE tblSquad (
    idSquad int primary key identity(1,1),
    apelidoSquad varchar(20) not null,
    areaSquad varchar(20),
    fkConta int foreign key references tblContas(idConta)
)


CREATE TABLE tblCargo (
    idCargo int primary key identity(1,1),
    nomeCargo varchar(40) not null,
)

CREATE TABLE tblMaquina (
    idMaquina int primary key identity(1000, 1),
    apelidoMaquina varchar(140),
)

CREATE TABLE tblFuncionario (
    idFuncionario int primary key identity(1000,1),
    identificador varchar(30),
    nomeFuncionario varchar(90) not null,
    fkSquad int foreign key references tblSquad(idSquad),
    fkCargo int foreign key references tblCargo(idCargo),
    fkMaquina int foreign key references tblMaquina(idMaquina)
)

CREATE TABLE tblInfoCPU (
    idInfoCPU int identity(1000, 1),
    nomeCPU varchar(200) not null,
    byUser decimal(12,2),
    bySystem decimal(12,2),
    totalUso decimal(12,2),
    fkMaquina int foreign key references tblMaquina(idMaquina),
    primary key(idInfoCPU, fkMaquina)
)

ALTER TABLE tblFuncionario ADD sexo char(1) CHECK (sexo in ('M', 'F'))

CREATE TABLE tblInfoRAM (
    idInfoRAM int identity(1000, 1),
    totalRamUsado decimal(12,2),
    totalRam decimal(12,2),
    fkMaquina int foreign key references tblMaquina(idMaquina),
    primary key(idInfoRAM, fkMaquina)
)

CREATE TABLE tblInfoHD (
    idInfoHD int identity(1000,1),
    espacoTotal decimal(12,2),
    espacoTotalDisponivel decimal(12,2),
    fkMaquina int foreign key references tblMaquina(idMaquina),
    primary key(idInfoHD, fkMaquina)
)

CREATE TABLE tblInfoProcessos (
    idInfoProcessos int identity(1000,1),
    nomeProcesso varchar(100),
    tempoDeUso varchar(12),
    dataCapturada datetime,
    fkMaquina int foreign key references tblMaquina(idMaquina)
    primary key(idInfoProcessos, fkMaquina)
)

CREATE TABLE tblTipoNotificacao(
    idTipoNotificacao int primary key identity,
    nomeTipoNotificacao varchar(100)
)

CREATE TABLE tblNotificacao(
    idNotificacao int primary key identity(100,1),
    observacao varchar(100),
    dataCapturada datetime,
    fkFuncionario int foreign key references tblFuncionario(idFuncionario),
    fkTipoNotificacao int foreign key references tblTipoNotificacao(idTipoNotificacao),
    fkSquad int foreign key references tblSquad(idSquad)
)

CREATE TABLE tblStatusFuncionario (
    idStatusFuncionario int primary key identity,
    horaEntrou datetime not null,
    horaSaiu datetime,
    fkFuncionario int foreign key references tblFuncionario(idFuncionario)
)

CREATE TABLE tblOshiLogs (
	idLog int primary key identity,
    mensagem varchar(500) not null,
    datalog datetime not null,
    fkMaquina int foreign key references tblMaquina (idMaquina)
    
)
create database Proyecto_IPC2
use Proyecto_IPC2

create table Admin(
id_admin int IDENTITY(1,1) primary key,
Nombreadmin varchar(45),
Nombre varchar(45),
Apellido varchar(45),
Contra varchar(45),
Fecha_nac Date,
Pais varchar(45),
Correo varchar(50));

create table Usuario(
id_us int IDENTITY(1,1) primary key,
Nombre_usuario varchar(45),
Nombre varchar(45),
Apellido varchar(45),
Contra varchar(45),
Fecha_nac Date,
Pais varchar(45),
Correo varchar(50));

create table Torneo(
id_torneo int IDENTITY(1,1) primary key,
Nombre varchar(45),
id_admin int,
foreign key(id_admin) REFERENCES Admin(id_admin));

create table ListaTorneo(
id_listaTorneo int IDENTITY(1,1) primary key,
id_torneo int,
id_us int,
foreign key(id_torneo) REFERENCES Torneo(id_torneo),
foreign key (id_us) REFERENCES Usuario(id_us)
);

create table Invitacion(
id_invitacion int IDENTITY(1,1) primary key,
contenido varchar(100),
id_us int,
foreign key (id_us) REFERENCES Usuario(id_us)
);

create table Solitario(
id_solitario int IDENTITY(1,1) primary key,
id_us int,
foreign key(id_us) REFERENCES Usuario(id_us)
);

create table Detalle_torneo(
id_detalle_torneo int IDENTITY(1,1) primary key,
id_torneo int,
id_us int,
foreign key(id_torneo) REFERENCES Torneo(id_torneo),
foreign key (id_us) REFERENCES usuario(id_us)
);

create table Versus(
id_versus int IDENTITY (1,1) primary key,
id_invitacion int,
id_us int,
foreign key(id_invitacion) REFERENCES Invitacion(id_invitacion),
foreign key(id_us) REFERENCES Usuario(id_us)
);

create table Detalle_Solitario(
id_detalle_solitario int IDENTITY (1,1) primary key,
movimiento int null,
ganado int null,
perdido int null,
empatado int null,
id_solitario int,
foreign key (id_solitario) REFERENCES Solitario(id_solitario)
);

create table Partido(
id_partido int IDENTITY (1,1) primary key,
ronda int,
movimineto int,
id_detalle_torneo int,
foreign key (id_detalle_torneo) REFERENCES Detalle_torneo(id_detalle_torneo)
);

create table Tipo(
id_tipo int IDENTITY (1,1) primary key,
ganado int null,
perdido int null,
empatado int null,
id_partido int,
foreign key (id_partido) REFERENCES Partido(id_partido)
);

create table Detalle_Versus(
id_detalle_versus int IDENTITY(1,1) primary key,
movimiento int null,
ganado int null,
perdido int null,
empatado int null,
id_versus int,
foreign key (id_versus) REFERENCES Versus(id_versus)
);

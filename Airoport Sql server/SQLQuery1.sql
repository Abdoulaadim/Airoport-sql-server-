create Database airoport
use airoport


/*_______________Table Pilote____________________*/

create table Pilote ( Npil int PRIMARY KEY NOT NULL IDENTITY(1,1),
					  Pilnom varchar(20),Adr varchar(20));


insert into Pilote values('SERGE','Nice');
insert into Pilote values('JEAN','Paris');
insert into Pilote values('CLAUDE','Grenoble');
insert into Pilote values('ROBERT','Nantes');
insert into Pilote values('MICHEL','PAris');
insert into Pilote values('LUCIEN','Toulouse');
insert into Pilote values('BRTRAND','Lyon');
insert into Pilote values('HERVE','Bastia');
insert into Pilote values('LUC','Paris');
insert into Pilote values('ritha','Grenoble');
insert into Pilote values('Kabira','Grenoble');
insert into Pilote values('Milouda','Grenoble');
insert into Pilote values('Wijdane','Grenoble');
insert into Pilote values('Rajaa','Grenoble');
insert into Pilote values('Zineb','Grenoble');
insert into Pilote values('Khadija','Grenoble');
insert into Pilote values('Meryeme','Grenoble');
insert into Pilote values('Laila','Grenoble');





Drop table pilote


select * from Pilote

/*_______________Table Avion____________________*/


create table Avion ( Nav int PRIMARY KEY NOT NULL  ,
					Avnom  varchar(20),Avmarque varchar(20),Cap int, Loc varchar(20))



insert into Avion values(100,'AIRBUS','A320',300,'Nice');
insert into Avion values(101,'BOIENG','B707',250,'Paris');
insert into Avion values(102,'AIRBUS','A320',300,'Toulouse');
insert into Avion values(103,'CARAVELLE','Caravelle',200,'Toulouse');
insert into Avion values(104,'BOIENG','B747',400,'Paris');
insert into Avion values(105,'AIRBUS','A320',300,'Grenoble');
insert into Avion values(106,'ATR','ATR42',50,'Paris');
insert into Avion values(107,'BOIENG','B727',300,'Lyon');
insert into Avion values(108,'BOIENG','B727',300,'Nantes');
insert into Avion values(109,'AIRBUS','A340',300,'Nice');


select * from Avion
Drop table avion

/*_______________Table Vol____________________*/


create table Vol ( Nvol int PRIMARY KEY NOT NULL IDENTITY(1,1),Volnom varchar(20),VD varchar (20), VA varchar(20),HD int,HA int,Npil int,Nav int)
				    
Alter Table Vol ADD CONSTRAINT FK_VOLPILOTE   FOREIGN KEY (Npil) REFERENCES Pilote (Npil)
Alter Table Vol ADD CONSTRAINT FK_VOLAVION   FOREIGN KEY (Nav) REFERENCES Avion (Nav)

Alter table vol drop CONSTRAINT FK_VOLPILOTE
Drop table Vol


insert into vol values ('IT100','NICE','PARIS',7,9,1,100)
insert into vol values ('IT1001','PARIS','TOULOUSE',11,12,2,100)
insert into vol values ('IT102','PARIS','NICE',12,14,1,101)
insert into vol values ('IT103','GRENOBLE','TOULOUSE',9,11,3,105)
insert into vol values ('IT104','TOULOUSE','GRENOBLE',17,19,3,100)
insert into vol values ('IT105','LYON','PARIS',6,7,7,107)
insert into vol values ('IT106','BASTIA','PARIS',10,13,8,109)
insert into vol values ('IT107','PARIS','BRIVE',7,8,9,106)
insert into vol values ('IT108','BRIVE','PARIS',19,20,9,106)
insert into vol values ('IT109','PARIS','LYON',18,19,7,107)
insert into vol values ('IT110','TOULOUSE','PARIS',15,16,2,102)
insert into vol values ('IT111','NICE','NANTES',17,19,4,101)

select * from Vol



/*_______________Select____________________*/

select * from Pilote
select * from Avion
select * from Vol

/*_______________DISTINCT____________________ */

/*L' SELECT DISTINCTinstruction est utilisée pour renvoyer uniquement des valeurs distinctes (différentes).*/

select Avmarque,cap from avion where cap>200

select distinct Avmarque, cap from avion where cap>200

/*_________________________Where___________________________*/

select * from avion where Loc = 'Nice'

/*_________________________AND,OR,NOT___________________________*/

select * from avion where Loc = 'Nice' and Avmarque='A320'

select   * from avion where Loc = 'Nice' or Loc='Paris'

select * from avion where not loc='Paris'

/*_________________________ORDER BY___________________________*/

select * from Pilote order by Npil
select * from Pilote order by Npil DESC


/*_________________________Null values___________________________*/

select * from  pilote where adr is null

select * from  pilote where adr is not null


/*__________________________INSERT,DELETE,UPDATE____________________*/

select * from Pilote

insert into Pilote values('Rhita','Marrckech')

update Pilote set Pilnom='Kabira',adr='Tanger' where npil = 12

delete Pilote where npil =12

/*__________________________Select TOP____________________*/


select  top 3 *  From Pilote  

select  TOP 2 PERCENT * from Pilote

/*__________________________Min & MAx____________________*/

select MIN (cap) AS SMALLAVION From avion

select MAX (cap) AS LargeAVION From avion

/*__________________________COUNT  & AVG & SUM____________________*/

select count (Npil) as nombre_pilote From Pilote

select AVG  (cap) as  moyen_cap_avion From avion

select Sum  (cap) as  somme_cap_avion From avion

select count (Nav) as nombre_avion from avion

select count  (Distinct Nav) as nombre_avion from avion

select min (avmarque) as small_avion from avion where cap in (select min (cap) from avion)


select min(cap),max(cap) from avion where Avmarque = 'BOIENG'

select AVG(cap) as moyenne_avion_à_paris from avion where loc='Paris'


/*__________________________Like____________________*/


/* commence  par p*/
select * from  Pilote where Adr Like 'P%'

/* termine  par e*/
select * from  Pilote where Adr Like '%e'

/* n'importe quelle position  par e*/
select * from  Pilote where Adr Like '%e%'

/* i dans la deuxieme position */
select * from  Pilote where Adr Like '_i%'

/* L Comporte au moins 3 caratere */
select * from  Pilote where Adr Like 'L_%'

/* commence par p et se termine par s */
select * from  Pilote where Adr Like 'p%s'

/* ne commence pas  par p */
select * from  Pilote where Adr NOT Like 'p%'

/*  commence pas n'importe quel caractère suivi   par ar */
select * from  Pilote where Adr  Like '_ar%'

/*  commence par p suivi par n'importe quel caractère, suivi r    */
select * from  Pilote where Adr  Like 'p_r_s%'


/*  commence par p,t ou l  */
select * from  Pilote where Adr  Like '[PTL]%'

/* selectionne tous les adresse commence par L,M,N ou P  */
select * from  Pilote where Adr  Like '[L-P]%'

/* selectionne tous les adresse ne commence  parpar p,t ou l  */
select * from  Pilote where Adr not  Like '[PTL]%'


/*__________________________IN____________________*/

select * from  Pilote where adr in ('Paris','Nice')

select * from  Pilote where adr not in ('Paris','Nice')

select * from  Pilote where adr in (select  VD from vol)



/*__________________________Between____________________*/

select pilnom from pilote where npil between 2 and 5 

select * from pilote where npil not between 2 and 5 order by adr

/*__________________________Aliases____________________*/

select adr as adresse from pilote

/*__________________________Join && Inner join____________________*/

select vol.vd,vol.va,pilote.pilnom from vol  join pilote on vol.npil = pilote.npil

select vol.vd,vol.va,pilote.pilnom from vol  Inner join pilote on vol.npil = pilote.npil


select vol.vd,vol.va,pilote.pilnom,avion.avmarque from ((vol  Inner join pilote on vol.npil = pilote.npil) Inner join avion on  vol.nav = avion.nav)


/*__________________________Left join____________________*/

select vol.vd,vol.va, pilote.pilnom from vol Left join pilote on  vol.npil = pilote.npil

/*__________________________right join____________________*/

select vol.vd,vol.va, pilote.pilnom from vol right join pilote on  vol.npil = pilote.npil


/*__________________________Full join____________________*/

select vol.vd,vol.va, pilote.pilnom from vol Full outer join pilote on  vol.npil = pilote.npil


select * from vol
/*__________________________self join____________________*/

select distinct A.VD as depart, B.VD as depart1, A.volnom
from vol A , vol B
where A.nvol <> B.nvol
order by A.volnom

/*__________________________Union____________________*/

select adr from pilote
union
select loc from  avion

/*__________________________Group by____________________*/
 
select count(Npil),adr from pilote group by  adr

select count(Npil),adr from pilote group by  adr order by count(npil) desc


/*__________________________Having____________________*/


select count(Npil),adr from pilote group by  adr having count (npil)>2

select count(Npil),adr from pilote group by  adr having count (npil)>2 order by count(npil) asc


/*__________________________existe____________________*/

select va,vd from vol where exists (select avnom from avion where  vol.nav = avion.nav and cap < 300 )

/*__________________________Any,All____________________*/

select avmarque from avion where nav = Any (select nav from avion where cap = 400)

select avmarque from avion where nav = ALL (select nav from avion where cap = 400)


/*__________________________Select into____________________*/

select * into pilote1  from pilote

select * into pilote1 in database  from pilote

select * from pilote1

/*__________________________Case____________________*/
--mlmmlml
Select nav,avmarque,
case 
	when cap>300 then 'the cap is >30'
	when cap=300 then 'the cap is >30'
	Else 'the cap is under'
End as capText
from avion

select * from  avion

/*__________________________Function____________________*/

--/--------------------------------Function1------------------------/---
create function somme(@a int , @b int)
 returns int 
 as
 begin 
	declare 
	  @s int 
	  set @s=@a+@b
	  return @s
end

--/--------------------------------declaration1------------------------/---
declare 
@element1 int,
@element2 int,
@res int

set @element1 =10
set @element2=5
set @res =DBO.somme(@element1,@element2)

print @res


--/--------------------------------Function2------------------------/---
alter function calcul(@note float , @nombre float)
 returns float 
 as
 begin 
	declare 
	  @res float 
	  set @res=@nombre/@note
	  return @res
end

--/--------------------------------declaration2------------------------/---
declare 
@note float,
@nombre float,
@res float

set @note =18
set @nombre=5
set @res =DBO.calcul(@note,@nombre)

print @res


--/--------------1------------------Function2------------------------/---
create function recherche(@ville varchar(20))
 returns table 
 as return (select * from pilote where  adr=@ville)


 declare 
 @adresse varchar(20),
 @res table 


 set @adresse ='Paris'
 set @res = DBO.recherche(@adresse)
print(@res)

--/--------------------------------Function3------------------------/---
create function somme(@a int , @b int)
 returns int 
 as
 begin 
	declare 
	  @s int 
	  set @s=@a+@b
	  return @s
end

--/--------------------------------declaration3------------------------/---
declare 
@element1 int,
@element2 int,
@res int

set @element1 =10
set @element2=5
set @res =DBO.somme(@element1,@element2)



/*__________________________Procedure____________________*/

--/--------------------------------Procedure1------------------------/---

create proc P_somme @a int , @b int , @s int output

as
begin 
	set @s=@a+@b
end

--/--------------------------------DECLARATION------------------------/---

declare @x int 
declare @y int 
declare @res  int 

set @x=100
set @y=20
set @res = @x + @y
print @res


---------------------------------------------------------------------------------

declare @x int 
declare @y int 
declare @res  int 

set @x=100
set @y=20


exec P_somme @x ,@y ,@res  output

print @res

--/--------------------------------Procedure1------------------------/---

 alter procedure P_equation @a float ,@b float,@res varchar(30) output
 as
 begin
		if (@a <> 0)
			begin
			  set @res='la solution est' +convert(char(50),-@b/@a)
			end
			else
			begin 
				if(@b=0)
					 set @res = 'tout réel est une solution'
			end
			
			begin
				if(@b<0)
					set @res='la solution est ensemble vide'
			end
end
	
	




--/--------------------------------DECLARATION------------------------/---

declare @x float 
declare @y float
declare @solution char(30)

set @x=10
set @y=20

exec P_equation @x,@y,@solution output

print @solution
/*TODO validate schema.sql and data.sql
*/
drop database if exists currencyexchange;
create database currencyexchange;
use currencyexchange;

create table companies (
    id bigint unsigned not null auto_increment primary key,
    scode varchar(50) not null unique,
    sname varchar(50) not null unique,
    scity varchar(50) not null
) engine = InnoDb;

create table userlist (
    id bigint unsigned not null auto_increment primary key,
    slogin varchar(50) unique not null,
    sfirst_name varchar(50) not null,
    slast_name varchar(50) not null,
    semail varchar(50) not null,
    sphone varchar(10) not null default '0123456789',
    spassword varchar(64), -- varchar(64) to accommodate SHA-256 hashes
    benabled boolean not null,
    ncompany bigint unsigned not null,
    ddate_created timestamp default 0,
    ddate_modified timestamp default current_timestamp on update current_timestamp,
    foreign key (ncompany) references companies(id),
    unique index userlist_idx_1 (slogin),
    unique index userlist_idx_2 (semail)
) engine = InnoDb;

create table role (
    id bigint unsigned not null auto_increment primary key,
    scode varchar(50) not null unique,
    sname varchar(50) not null unique
    -- ncompany bigint unsigned not null,
    -- foreign key (ncompany) references companies(id)
) engine = InnoDb;

create table userrole (
    id bigint unsigned not null auto_increment primary key,
    nuser bigint unsigned not null,
    nrole bigint unsigned not null,
    foreign key (nuser) references userlist(id),
    foreign key (nrole) references role(id),
    unique index userrole_idx_1 (nuser, nrole)
) engine = InnoDb;

create table permission (
    id bigint unsigned not null auto_increment primary key,
    scode varchar(50) not null,
    sname varchar(255) not null,
    unique index permission_idx_1 (scode)
) engine = InnoDb;

create table role_permission (
    id bigint unsigned not null auto_increment primary key,
    nrole bigint unsigned not null,
    npermission bigint unsigned not null,
    foreign key (nrole) references role (id),
    foreign key (npermission) references permission (id),
    unique index role_permission_idx1 (nrole, npermission)
) engine = InnoDb;

create table classes (
    id bigint unsigned not null auto_increment primary key,
    scode varchar(50) not null,
    sname varchar(50) not null
) engine = InnoDb;

create table sections (
    id bigint unsigned not null auto_increment primary key,
    scode varchar(50) not null,
    sname varchar(50) not null,
	nclass bigint unsigned not null,
    foreign key (nclass) references classes(id)
) engine = InnoDb;

create table properties (
    id bigint unsigned not null auto_increment primary key,
    nsection bigint unsigned not null,
    spropCode varchar(255) not null,
    spropNameEN varchar(255) not null,
	spropNameUA  varchar(255) not null,
	spropNameRU  varchar(255) not null,
    foreign key (nsection) references sections(id)
) engine = InnoDb;

create table clninsrc(
	id smallint unsigned not null auto_increment primary key,
	scode varchar(50) unique not null,
	sname varchar(50) unique not null
)engine = InnoDb;

create table clnstats(
	id smallint unsigned not null auto_increment primary key,
	scode varchar(50) unique not null,
	sname varchar(50) unique not null
)engine = InnoDb;

create table clients (
    id bigint unsigned not null auto_increment primary key,
    sphone varchar(50) not null,
	ncompany bigint unsigned not null,
    sname varchar(50) not null,
    nclninsrc smallint unsigned not null default '1',
    nclnstats smallint unsigned not null default '1',
    ndealcnt int not null default '0',
	ndonedealcnt int not null default '0',
    ndeallatecnt int not null default '0',
    ddate_created timestamp default 0,
    ddate_modified timestamp default current_timestamp on update current_timestamp,
    foreign key (nclninsrc) references clninsrc(id),
	foreign key (nclnstats) references clnstats(id),
	foreign key (ncompany) references companies(id),
    unique index clients_idx_1 (sphone, ncompany)
) engine = InnoDb;

create table logclients (
    id bigint unsigned not null auto_increment primary key,
	nclient bigint unsigned not null,
	ncompany bigint unsigned not null,
    nuser bigint unsigned not null,
    sphone varchar(50) unique not null,
    sname varchar(50) not null,
    nclninsrc smallint unsigned not null default '1',
    nclnstats smallint unsigned not null default '1',
    ndealcnt int not null default '0',
	ndonedealcnt int not null default '0',
    ndeallatecnt int not null default '0',
    ddate_created timestamp default 0,
    foreign key (nclninsrc) references clninsrc(id),
	foreign key (nclnstats) references clnstats(id),
	foreign key (ncompany) references companies(id),
	foreign key (nclient) references clients(id),
	foreign key (nuser) references userlist(id)
) engine = InnoDb;

DELIMITER //

CREATE 
TRIGGER currencyexchange.clients_AFTER_INSERT 
AFTER INSERT 
ON currencyexchange.clients 
FOR EACH ROW
BEGIN

INSERT INTO currencyexchange.logclients(nclient,ncompany,nuser,sphone,sname,nclninsrc,nclnstats,ndealcnt,ndonedealcnt,ndeallatecnt)
VALUES(NEW.id,NEW.ncompany,NEW.nuser,NEW.sphone,NEW.sname,NEW.nclninsrc,NEW.nclnstats,NEW.ndealcnt,NEW.ndonedealcnt,NEW.ndeallatecnt);

END; //

DELIMITER ;

DELIMITER //

CREATE 
TRIGGER currencyexchange.clients_AFTER_UPDATE 
AFTER UPDATE 
ON currencyexchange.clients 
FOR EACH ROW
BEGIN

INSERT INTO currencyexchange.logclients(nclient,ncompany,nuser,sphone,sname,nclninsrc,nclnstats,ndealcnt,ndonedealcnt,ndeallatecnt)
VALUES(NEW.id,NEW.ncompany,NEW.nuser,NEW.sphone,NEW.sname,NEW.nclninsrc,NEW.nclnstats,NEW.ndealcnt,NEW.ndonedealcnt,NEW.ndeallatecnt);

END; //

DELIMITER ;

create table clntypecontact(
	id smallint unsigned not null auto_increment primary key,
	scode varchar(50) unique not null,
	sname varchar(50) unique not null
)engine = InnoDb;

create table clncontacts(
	id bigint unsigned not null auto_increment primary key,
	nclient bigint unsigned not null,
	nclntypecontact smallint unsigned not null,
	svalue varchar(50) not null, 
	ddate_created timestamp default 0,
    ddate_modified timestamp default current_timestamp on update current_timestamp,
	foreign key (nclient) references clients(id),
	foreign key (nclntypecontact) references clntypecontact(id),
	unique index clncontacts_idx_1 (nclient, nclnttypecontact, svalue)
)engine = InnoDb;

create table logclncontacts(
	id smallint unsigned not null auto_increment primary key,
	nclient bigint unsigned not null,
	nclntypecontact smallint unsigned not null,
	nclncontact bigint unsigned not null,
	nuser bigint unsigned not null,
	svalue varchar(50) not null, 
	ddate_created timestamp default 0,
    foreign key (nclient) references clients(id),
	foreign key (nclntypecontact) references clntypecontact(id),
	foreign key (nuser) references userlist(id),
	foreign key (nclncontact) references clncontacts(id)
)engine = InnoDb;

DELIMITER //

CREATE 
TRIGGER currencyexchange.clncontacts_AFTER_INSERT 
AFTER INSERT 
ON currencyexchange.clncontacts 
FOR EACH ROW
BEGIN

INSERT INTO `currencyexchange`.`logclncontacts`
(nclient,nclntypecontact,nclncontact,nuser,svalue)
VALUES(NEW.nclient,NEW.nclntypecontact,NEW.id,NEW.nuser,NEW.svalue);

END; //

DELIMITER ;

DELIMITER //

CREATE 
TRIGGER currencyexchange.clncontacts_AFTER_UPDATE 
AFTER UPDATE 
ON currencyexchange.clncontacts 
FOR EACH ROW
BEGIN

INSERT INTO `currencyexchange`.`logclncontacts`
(nclient,nclntypecontact,nclncontact,nuser,svalue)
VALUES(NEW.nclient,NEW.nclntypecontact,NEW.id,NEW.nuser,NEW.svalue);

END; //

DELIMITER ;

create table clndescr(
	id smallint unsigned not null auto_increment primary key,
	scode varchar(50) unique not null,
	sname varchar(50) unique not null
)engine = InnoDb;
==========================================
-- ACL tables
==========================================

create table acl_sid (
    id bigint unsigned not null auto_increment primary key,
    principal boolean not null,
    sid varchar(100) not null,
    unique index acl_sid_idx_1 (sid, principal)
) engine = InnoDb;

create table acl_class (
    id bigint unsigned not null auto_increment primary key,
    class varchar(100) unique not null
) engine = InnoDb;

create table acl_object_identity (
    id bigint unsigned not null auto_increment primary key,
    object_id_class bigint unsigned not null,
    object_id_identity bigint unsigned not null,
    parent_object bigint unsigned,
    owner_sid bigint unsigned,
    entries_inheriting boolean not null,
    unique index acl_object_identity_idx_1 (object_id_class, object_id_identity),
    foreign key (object_id_class) references acl_class (id),
    foreign key (parent_object) references acl_object_identity (id),
    foreign key (owner_sid) references acl_sid (id)
) engine = InnoDb;

create table acl_entry (
    id bigint unsigned not null auto_increment primary key,
    acl_object_identity bigint unsigned not null,
    ace_order bigint unsigned not null,
    sid bigint unsigned not null,
    mask int not null,
    granting boolean not null default 1,
    audit_success boolean not null default 0,
    audit_failure boolean not null default 0,
    unique index acl_entry_idx_1 (acl_object_identity, ace_order),
    foreign key (acl_object_identity) references acl_object_identity (id),
    foreign key (sid) references acl_sid (id)
) engine = InnoDb;

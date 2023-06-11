/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     30/12/2022 02:18:57                          */
/*==============================================================*/


alter table ORDERS
   drop constraint FK_ORDERS_MELAKUKAN_CUSTOMER;

alter table ORDERS
   drop constraint FK_ORDERS_MEMBUAT_USERS;

alter table ORDER_NOTES
   drop constraint FK_ORDER_NO_ORDER_PRODUK;

alter table ORDER_NOTES
   drop constraint FK_ORDER_NO_ORDER2_ORDERS;

alter table PRODUK
   drop constraint FK_PRODUK_MEMILIKI_KATEGORI;

drop table CUSTOMER cascade constraints;

drop table KATEGORI cascade constraints;

drop index MEMBUAT_FK;

drop index MELAKUKAN_FK;

drop table ORDERS cascade constraints;

drop index ORDER2_FK;

drop index ORDER_FK;

drop table ORDER_NOTES cascade constraints;

drop index MEMILIKI_FK;

drop table PRODUK cascade constraints;

drop table USERS cascade constraints;

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER 
(
   ID_CUSTOMER          VARCHAR2(10)         not null,
   NAMA_CUSTOMER        VARCHAR2(50),
   NOTELP_CUSTOMER      VARCHAR2(15),
   ALAMAT_CUSTOMER      VARCHAR2(2000),
   constraint PK_CUSTOMER primary key (ID_CUSTOMER)
);

/*==============================================================*/
/* Table: KATEGORI                                              */
/*==============================================================*/
create table KATEGORI 
(
   ID_KATEGORI          VARCHAR2(10)         not null,
   NAMA_KATEGORI        VARCHAR2(50),
   constraint PK_KATEGORI primary key (ID_KATEGORI)
);

/*==============================================================*/
/* Table: ORDERS                                                */
/*==============================================================*/
create table ORDERS 
(
   ID_ORDER             VARCHAR2(50)         not null,
   ID_USER              VARCHAR2(10),
   ID_CUSTOMER          VARCHAR2(10),
   TANGGAL              DATE,
   STATUS               VARCHAR2(10),
   NAMA_CUSTOMER        VARCHAR2(50),
   NOTELP_CUSTOMER      VARCHAR2(15),
   ALAMAT_CUSTOMER      VARCHAR2(2000),
   TOTAL                INTEGER,
   constraint PK_ORDERS primary key (ID_ORDER)
);

/*==============================================================*/
/* Index: MELAKUKAN_FK                                          */
/*==============================================================*/
create index MELAKUKAN_FK on ORDERS (
   ID_CUSTOMER ASC
);

/*==============================================================*/
/* Index: MEMBUAT_FK                                            */
/*==============================================================*/
create index MEMBUAT_FK on ORDERS (
   ID_USER ASC
);

/*==============================================================*/
/* Table: ORDER_NOTES                                           */
/*==============================================================*/
create table ORDER_NOTES 
(
   ID_PRODUK            VARCHAR2(10)         not null,
   ID_ORDER             VARCHAR2(50)         not null,
   NAMA_PRODUK          VARCHAR2(50),
   JUMLAH_ORDER         INTEGER,
   TOTAL_SEMENTARA      INTEGER,
   constraint PK_ORDER_NOTES primary key (ID_PRODUK, ID_ORDER)
);

/*==============================================================*/
/* Index: ORDER_FK                                              */
/*==============================================================*/
create index ORDER_FK on ORDER_NOTES (
   ID_PRODUK ASC
);

/*==============================================================*/
/* Index: ORDER2_FK                                             */
/*==============================================================*/
create index ORDER2_FK on ORDER_NOTES (
   ID_ORDER ASC
);

/*==============================================================*/
/* Table: PRODUK                                                */
/*==============================================================*/
create table PRODUK 
(
   ID_PRODUK            VARCHAR2(10)         not null,
   ID_KATEGORI          VARCHAR2(10),
   NAMA_PRODUK          VARCHAR2(50),
   JUMLAH_PRODUK        INTEGER,
   HARGA_PRODUK         INTEGER,
   NAMA_KATEGORI        VARCHAR2(50),
   DESKRIPSI_PRODUK     VARCHAR2(1000),
   constraint PK_PRODUK primary key (ID_PRODUK)
);

/*==============================================================*/
/* Index: MEMILIKI_FK                                           */
/*==============================================================*/
create index MEMILIKI_FK on PRODUK (
   ID_KATEGORI ASC
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS 
(
   ID_USER              VARCHAR2(10)         not null,
   USERNAME_USER        VARCHAR2(50),
   PASSWORD_USER        VARCHAR2(50),
   constraint PK_USERS primary key (ID_USER)
);

alter table ORDERS
   add constraint FK_ORDERS_MELAKUKAN_CUSTOMER foreign key (ID_CUSTOMER)
      references CUSTOMER (ID_CUSTOMER);

alter table ORDERS
   add constraint FK_ORDERS_MEMBUAT_USERS foreign key (ID_USER)
      references USERS (ID_USER);

alter table ORDER_NOTES
   add constraint FK_ORDER_NO_ORDER_PRODUK foreign key (ID_PRODUK)
      references PRODUK (ID_PRODUK);

alter table ORDER_NOTES
   add constraint FK_ORDER_NO_ORDER2_ORDERS foreign key (ID_ORDER)
      references ORDERS (ID_ORDER);

alter table PRODUK
   add constraint FK_PRODUK_MEMILIKI_KATEGORI foreign key (ID_KATEGORI)
      references KATEGORI (ID_KATEGORI);


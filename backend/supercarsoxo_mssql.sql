-- MSSQL / Azure SQL Compatible Dump

CREATE TABLE [categories] (
  [Categorie_ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Categorie_Name] varchar(255) NOT NULL
);

CREATE TABLE [client] (
  [Client_ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Client_Name] varchar(255) NOT NULL,
  [Client_Surname] varchar(255) NOT NULL,
  [Client_Email] varchar(255) NOT NULL,
  [Client_Phone] varchar(255) NOT NULL,
  [Client_Password] varchar(255) NOT NULL,
  [Client_Pic] varchar(255) NOT NULL
);

CREATE TABLE [cars] (
  [Car_ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Car_Name] varchar(255) NOT NULL,
  [Car_Marque] varchar(255) NOT NULL,
  [Car_Matricule] varchar(255) NOT NULL,
  [Car_Color] varchar(255) NOT NULL,
  [Car_img] varchar(255) NOT NULL,
  [img1] varchar(255) NOT NULL,
  [img2] varchar(255) NOT NULL,
  [img3] varchar(255) NOT NULL,
  [Car_likes] int NOT NULL,
  [Client_ID] int NOT NULL UNIQUE,
  [Categorie_ID] int NOT NULL UNIQUE,
  CONSTRAINT [cars_ibfk_2] FOREIGN KEY ([Categorie_ID]) REFERENCES [categories] ([Categorie_ID]) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT [cars_ibfk_3] FOREIGN KEY ([Client_ID]) REFERENCES [client] ([Client_ID]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [cars_categories] (
  [CarCategorie_ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Car_ID] int NOT NULL UNIQUE,
  [Categorie_ID] int NOT NULL UNIQUE
);

-- Insert Data

SET IDENTITY_INSERT [categories] ON;
INSERT INTO [categories] ([Categorie_ID], [Categorie_Name]) VALUES
(1, 'Sport'),
(2, 'Luxe'),
(3, 'Special'),
(4, 'Supercars'),
(5, 'Maserasss');
SET IDENTITY_INSERT [categories] OFF;

SET IDENTITY_INSERT [client] ON;
INSERT INTO [client] ([Client_ID], [Client_Name], [Client_Surname], [Client_Email], [Client_Phone], [Client_Password], [Client_Pic]) VALUES
(1, 'Bifenzine', 'Mohamed', 'okta@gmail.com', '0611121314', '123', ''),
(2, 'OkTa', 'Aymen', 'Aymen@gmail.com', '065478912', '111', ''),
(3, 'Koravi', 'Ravi', 'Koravi@gmail.com', '0611111145', '222', ''),
(4, 'alfardan', 'Hamdan', 'alfardan@gmail.com', '0612457896', '333', ''),
(5, 'lmanga', 'said', 'lmangasaid@gmail.com', '0631456987', '444', ''),
(24, 'Kawashima', 'Tokyo', 'ota@ot.com', '02136547', 'momento', 'tokyo.jpg'),
(25, 'ozatki', 'takami', 'oza@gmail.com', '06123456894', '123', 'takami.jpg'),
(26, 'mitsu', 'osaka', 'okami@gmail.com', '063214511', '123', 'osaka.jpg'),
(27, 'apo', 'opa', 'o@p.c', '1123211112322', '123', '');
SET IDENTITY_INSERT [client] OFF;

SET IDENTITY_INSERT [cars] ON;
INSERT INTO [cars] ([Car_ID], [Car_Name], [Car_Marque], [Car_Matricule], [Car_Color], [Car_img], [img1], [img2], [img3], [Car_likes], [Client_ID], [Categorie_ID]) VALUES
(1, 'Supra A90', 'Toyota', 'A-S 7988', 'Gris', 'supra_a90_gris.jpg', 'supra1.jpg', 'supra2.jpg', 'supra3.jpeg', 12, 1, 4),
(13, 'AMG GT 63', 'Mercedes', 'A 7989', 'Black Mate', 'gt63_blackmate.jpg', 'gt1.jpg', 'gt2.jpg', 'gt3.jpg', 17, 26, 2),
(14, 'RS6', 'Audi', 'S 33456', 'Black', 'rs61.jpg', 'rs62.jpg', 'rs63.jpg', 'rs43.jpg', 11, 25, 5),
(15, 'M4', 'BMW', 'B 55564', 'Black', 'bmw_m4.jpeg', 'bmw1.jpg', 'bmw2.jpg', 'bmw3.jpg', 17, 5, 1),
(17, 'GTR 2023', 'NISSAN', 'm 23654', 'Gris', 'nissan_gtr.jpg', 'nissangtr1.jpg', 'nissangtr2.jpg', 'nissangtr3.jpg', 10, 24, 3);
SET IDENTITY_INSERT [cars] OFF;

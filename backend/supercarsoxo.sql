-- 1. Create client table
CREATE TABLE client (
  Client_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  Client_Name varchar(255) NOT NULL,
  Client_Surname varchar(255) NOT NULL,
  Client_Email varchar(255) NOT NULL,
  Client_Phone varchar(255) NOT NULL,
  Client_Password varchar(255) NOT NULL,
  Client_Pic varchar(255) NOT NULL
);

-- 2. Create categories table
CREATE TABLE categories (
  Categorie_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  Categorie_Name varchar(255) NOT NULL
);

-- 3. Create cars table
CREATE TABLE cars (
  Car_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  Car_Name varchar(255) NOT NULL,
  Car_Marque varchar(255) NOT NULL,
  Car_Matricule varchar(255) NOT NULL,
  Car_Color varchar(255) NOT NULL,
  Car_img varchar(255) NOT NULL,
  img1 varchar(255) NOT NULL,
  img2 varchar(255) NOT NULL,
  img3 varchar(255) NOT NULL,
  Car_likes int NOT NULL,
  Client_ID int NOT NULL,
  Categorie_ID int NOT NULL,
  CONSTRAINT FK_Client FOREIGN KEY (Client_ID) REFERENCES client(Client_ID),
  CONSTRAINT FK_Category FOREIGN KEY (Categorie_ID) REFERENCES categories(Categorie_ID)
);

-- 4. Insert Categories
INSERT INTO categories (Categorie_Name) VALUES ('Sport'), ('Luxe'), ('Special'), ('Supercars'), ('Maserasss');

-- 5. Insert Clients
INSERT INTO client (Client_Name, Client_Surname, Client_Email, Client_Phone, Client_Password, Client_Pic) VALUES 
('Bifenzine', 'Mohamed', 'okta@gmail.com', '0611121314', '123', ''),
('OkTa', 'Aymen', 'Aymen@gmail.com', '065478912', '111', '');

-- 6. Insert Cars (Make sure IDs exist in clients/categories)
INSERT INTO cars (Car_Name, Car_Marque, Car_Matricule, Car_Color, Car_img, img1, img2, img3, Car_likes, Client_ID, Categorie_ID) VALUES
('Supra A90', 'Toyota', 'A-S 7988', 'Gris', 'supra_a90_gris.jpg', 'supra1.jpg', 'supra2.jpg', 'supra3.jpeg', 12, 1, 4);
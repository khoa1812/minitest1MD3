create database minitest;

use minitest;

create table City (
    id int primary key,
    name nvarchar(255)
);

create table CategoryTour (
    id int primary key,
    categoryCode nvarchar(255),
    categoryName nvarchar(255)
);

create table Clients (
    id int primary key,
    nameClient nvarchar(255),
    idNumber nvarchar(255),
    dateBirth date,
    city_id int, foreign key (city_id) references City (id)
);

create table Destination (
    id int primary key,
    destinationName nvarchar(255),
    describes nvarchar(255),
    cost double,
    city_id int, foreign key (city_id) references City(id)
);

create table Tour (
    id int primary key,
    tourCode nvarchar(255),
    category_id int, foreign key (category_id) references CategoryTour(id),
    destination_id int, foreign key (destination_id) references Destination(id),
    dateStart date,
    dateEnd date
);

create table OrderTour (
    id int primary key,
    tour_id int, foreign key (tour_id) references Tour (id),
    client_id int, foreign key (client_id) references Clients(id),
    statuss nvarchar(255)
);

insert into City (id, name) values (1, 'Hanoi'), (2, 'Ho Chi Minh City'),
                                   (3, 'Da Nang'), (4, 'Hue'), (5, 'Can Tho');

insert into CategoryTour (id, categoryCode, categoryName) values
                                    (1, 'CT001', 'Summer'),
                                    (2, 'CT002', 'Winter');

insert into Clients (id, nameClient, idNumber, dateBirth, city_id) values
            (1, 'Nguyen Van A', '123456789', '1990-01-01', 1),
            (2, 'Tran Thi B', '987654321', '1985-05-05', 2),
            (3, 'Le Van C', '111223344', '1992-07-07', 3),
            (4, 'Pham Thi D', '222334455', '1993-08-08', 4),
            (5, 'Hoang Van E', '333445566', '1994-09-09', 5),
            (6, 'Nguyen Thi F', '444556677', '1980-10-10', 1),
            (7, 'Vo Van G', '555667788', '1979-11-11', 2),
            (8, 'Bui Thi H', '666778899', '1978-12-12', 3),
            (9, 'Dao Van I', '777889900', '1977-01-13', 4),
            (10, 'Mai Thi J', '888990011', '1976-02-14', 5);

insert into Destination (id, destinationName, describes, cost, city_id) values
            (1, 'Pho Co', 'Co kinh va nhieu mon an ngon', 200.0, 1),
            (2, 'Cho Ben Thanh', 'Nhieu dac san', 180.0, 2),
            (3, 'Co Do Hue', 'Dep va nhieu danh thang thoi co xua', 120.0, 4),
            (4, 'Cau Vang', 'Hinh ban tay phat rat dep', 155.0, 3),
            (5, 'Thien vien truc lam', 'Chua co xua', 80.0, 1);

insert into Tour (id, tourCode, category_id, destination_id, dateStart, dateEnd) values
            (1, 'T001', 1, 1, '2024-06-01', '2024-06-05'),
            (2, 'T002', 1, 2, '2020-03-06', '2020-04-10'),
            (3, 'T003', 1, 3, '2024-06-11', '2024-06-15'),
            (4, 'T004', 1, 4, '2024-06-16', '2024-06-20'),
            (5, 'T005', 1, 5, '2020-03-21', '2024-06-25'),
            (6, 'T006', 2, 1, '2024-07-01', '2024-07-05'),
            (7, 'T007', 2, 2, '2024-07-06', '2024-07-10'),
            (8, 'T008', 2, 3, '2024-07-11', '2020-04-15'),
            (9, 'T009', 2, 4, '2024-07-16', '2024-07-20'),
            (10, 'T010', 2, 5, '2024-07-21', '2024-07-25'),
            (11, 'T011', 1, 1, '2020-03-01', '2024-08-05'),
            (12, 'T012', 1, 2, '2024-08-06', '2024-08-10'),
            (13, 'T013', 1, 3, '2024-08-11', '2020-04-15'),
            (14, 'T014', 1, 4, '2020-03-16', '2024-08-20'),
            (15, 'T015', 1, 5, '2024-08-21', '2020-04-25');

insert into OrderTour (id, tour_id, client_id, statuss) values
            (1, 1, 1, 'Xac nhan'),
            (2, 2, 2, 'Xac nhan'),
            (3, 3, 3, 'Xac nhan'),
            (4, 4, 4, 'Dang cho'),
            (5, 5, 5, 'Da huy'),
            (6, 6, 6, 'Xac nhan'),
            (7, 7, 7, 'Dang cho'),
            (8, 8, 8, 'Da huy'),
            (9, 9, 9, 'Xac nhan'),
            (10, 10, 10, 'Dang cho');

select * from City;

select * from CategoryTour;

select * from Clients;

select * from Destination;

select * from Tour;

select * from OrderTour;

select c.name AS CityName, count(t.id) AS NumberOfTours
from City c
         join Destination d on c.id = d.city_id
         join Tour t on d.id = t.destination_id
group by c.name;

select count(*) as ToursStartingInMarch2020
from Tour
where dateStart between '2020-03-01' and '2020-03-31';

select count(*) AS ToursEndingInApril2020
from Tour
where dateEnd between '2020-04-01' and '2020-04-30';



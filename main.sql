/*
ALTER TABLE tb_client DROP CONSTRAINT FK_tb_client_tb_gender;
ALTER TABLE tb_client DROP CONSTRAINT FK_tb_client_b_nationality;
ALTER TABLE tb_client DROP CONSTRAINT FK_tb_client_tb_country;
ALTER TABLE tb_client DROP CONSTRAINT FK_tb_client_tb_stuff;
ALTER TABLE tb_address DROP CONSTRAINT FK_tb_address_tb_client;
ALTER TABLE tb_address DROP CONSTRAINT FK_tb_address__address_type;
ALTER TABLE tb_address DROP CONSTRAINT FK_tb_address__address_type;
ALTER TABLE tb_address DROP CONSTRAINT FK_tb_address_tb_country;
ALTER TABLE additional_information DROP CONSTRAINT FK_l_information_tb_client;
ALTER TABLE tb_stuff DROP CONSTRAINT FK_tb_stuff_tb_position;
ALTER TABLE tb_order DROP CONSTRAINT FK_tb_order_tb_order_type;
ALTER TABLE tb_order DROP CONSTRAINT FK_tb_order_tb_product;
ALTER TABLE tb_order DROP CONSTRAINT FK_tb_order_tb_client;
DROP TABLE tb_client PURGE;
DROP SEQUENCE SQ_tb_client;
DROP TABLE tb_address PURGE;
DROP SEQUENCE SQ_tb_address;
DROP TABLE tb_address_type PURGE;
DROP SEQUENCE SQ_tb_address_type;
DROP TABLE additional_information PURGE;
DROP SEQUENCE SQ_additional_information;
DROP TABLE tb_country PURGE;
DROP SEQUENCE SQ_tb_country;
DROP TABLE tb_address_type PURGE;
DROP SEQUENCE SQ_tb_address_type;
DROP TABLE tb_gender PURGE;
DROP SEQUENCE SQ_tb_gender;
DROP TABLE tb_nationality PURGE;
DROP SEQUENCE SQ_tb_nationality;
DROP TABLE tb_stuff PURGE;
DROP SEQUENCE SQ_tb_stuff;
DROP TABLE tb_position PURGE;
DROP SEQUENCE SQ_tb_position;
DROP TABLE tb_product PURGE;
DROP SEQUENCE SQ_tb_product;
DROP TABLE tb_order PURGE;
DROP SEQUENCE SQ_tb_order;
DROP TABLE tb_order_type PURGE;
DROP SEQUENCE SQ_tb_order_type;
-- */

-------------------------------------------------------------------------------
--            tb_client
-------------------------------------------------------------------------------

CREATE TABLE tb_client (
    id                              INTEGER
  , first_name_v                    VARCHAR2(200)
  , birth_date_d                    INTEGER
  , gender_id                       INTEGER
  , nationality_id                  INTEGER
  , birth_place_id                  INTEGER
  , second_name_v                   VARCHAR2(200)
  , surname_v                       VARCHAR2(200)
  , stuff_id                        INTEGER
  , CONSTRAINT PK_tb_client PRIMARY KEY ( id )
);

COMMENT ON TABLE  tb_client                                 IS 'Table for storing clients';

CREATE SEQUENCE SQ_tb_two_client;

CREATE OR REPLACE TRIGGER TG_tb_client_BI
    BEFORE INSERT ON tb_client
    FOR EACH ROW
BEGIN
    if :NEW.id is NULL then
        :NEW.id := SQ_tb_client.nextVal;
    end if;
END;
/



-------------------------------------------------------------------------------
--            tb_address
-------------------------------------------------------------------------------

CREATE TABLE tb_address (
    id                              INTEGER
  , client_id                       INTEGER
  , type_id                         INTEGER
  , city_v                          VARCHAR2(200)
  , street_v                        VARCHAR2(200)
  , house_v                         VARCHAR2(200)
  , flat_n                          INTEGER
  , country_id                      INTEGER
  , CONSTRAINT PK_tb_address PRIMARY KEY ( id )
);

COMMENT ON TABLE  tb_address                                 IS 'Address Table';

CREATE SEQUENCE SQ_tb_address;

CREATE OR REPLACE TRIGGER TG_tb_address_BI
    BEFORE INSERT ON tb_address
    FOR EACH ROW
BEGIN
    if :NEW.id is NULL then
        :NEW.id := SQ_tb_address.nextVal;
    end if;
END;
/

-------------------------------------------------------------------------------
--            tb_address_type
-------------------------------------------------------------------------------

CREATE TABLE tb_address_type (
    id                              INTEGER
  , name_v                          VARCHAR2(200)
  , CONSTRAINT PK_tb_address_type PRIMARY KEY ( id )
);

COMMENT ON TABLE  tb_address_type                                 IS 'Table of address types ';

CREATE SEQUENCE SQ_tb_address_type;

CREATE OR REPLACE TRIGGER TG_tb_address_type_BI
    BEFORE INSERT ON tb_address_type
    FOR EACH ROW
BEGIN
    if :NEW.id is NULL then
        :NEW.id := SQ_tb_address_type.nextVal;
    end if;
END;
/



-------------------------------------------------------------------------------
--            additional_information
-------------------------------------------------------------------------------

CREATE TABLE additional_information (
    id                              INTEGER
  , client_id                       INTEGER
  , phone_v                         VARCHAR2(200)
  , email_v                         VARCHAR2(200)
  , social_network_v                VARCHAR2(200)
  , CONSTRAINT PK_additional_information PRIMARY KEY ( id )
);

COMMENT ON TABLE  additional_information                                 IS 'Table of additional information';

CREATE SEQUENCE SQ_additional_information;

CREATE OR REPLACE TRIGGER TG_additional_information_BI
    BEFORE INSERT ON additional_information
    FOR EACH ROW
BEGIN
    if :NEW.id is NULL then
        :NEW.id := SQ_additional_information.nextVal;
    end if;
END;
/



-------------------------------------------------------------------------------
--            tb_country
-------------------------------------------------------------------------------

CREATE TABLE tb_country (
    id                              INTEGER
  , name_v                          VARCHAR2(200)
  , CONSTRAINT PK_tb_country PRIMARY KEY ( id )
);

COMMENT ON TABLE  tb_country                                 IS 'Table of world countries';

CREATE SEQUENCE SQ_tb_country;

CREATE OR REPLACE TRIGGER TG_tb_country_BI
    BEFORE INSERT ON tb_country
    FOR EACH ROW
BEGIN
    if :NEW.id is NULL then
        :NEW.id := SQ_tb_country.nextVal;
    end if;
END;
/


-------------------------------------------------------------------------------
--            tb_gender
-------------------------------------------------------------------------------

CREATE TABLE tb_gender (
    id                              INTEGER
  , name_v                          INTEGER
  , CONSTRAINT PK_tb_gender PRIMARY KEY ( id )
);


CREATE SEQUENCE SQ_tb_gender;

CREATE OR REPLACE TRIGGER TG_tb_gender_BI
    BEFORE INSERT ON tb_gender
    FOR EACH ROW
BEGIN
    if :NEW.id is NULL then
        :NEW.id := SQ_tb_gender.nextVal;
    end if;
END;
/



-------------------------------------------------------------------------------
--            tb_nationality
-------------------------------------------------------------------------------

CREATE TABLE tb_nationality (
    id                              INTEGER
  , name_v                          VARCHAR2(200)
  , CONSTRAINT PK_tb_nationality PRIMARY KEY ( id )
);


CREATE SEQUENCE SQ_tb_nationality;

CREATE OR REPLACE TRIGGER TG_tb_nationality_BI
    BEFORE INSERT ON tb_nationality
    FOR EACH ROW
BEGIN
    if :NEW.id is NULL then
        :NEW.id := SQ_tb_nationality.nextVal;
    end if;
END;
/



-------------------------------------------------------------------------------
--            tb_stuff
-------------------------------------------------------------------------------

CREATE TABLE tb_stuff (
    id                              INTEGER
  , last_name_v                     VARCHAR2(200)
  , first_name_v                    VARCHAR2(200)
  , surname_v                       VARCHAR2(200)
  , salary_n                        INTEGER
  , position_id                     INTEGER
  , CONSTRAINT PK_two_tb_stuff PRIMARY KEY ( id )
);

COMMENT ON TABLE  tb_stuff                                 IS 'Table stuff';

CREATE SEQUENCE SQ_tb_stuff;

CREATE OR REPLACE TRIGGER TG_tb_stuff_BI
    BEFORE INSERT ON tb_stuff
    FOR EACH ROW
BEGIN
    if :NEW.id is NULL then
        :NEW.id := SQ_tb_stuff.nextVal;
    end if;
END;
/



-------------------------------------------------------------------------------
--            tb_position
-------------------------------------------------------------------------------

CREATE TABLE tb_position (
    id                              INTEGER
  , name_v                          VARCHAR2(200)
  , CONSTRAINT PK_two_tb_position PRIMARY KEY ( id )
);

COMMENT ON TABLE  tb_position                                 IS 'Position Stuff';

CREATE SEQUENCE SQ_tb_position;

CREATE OR REPLACE TRIGGER TG_tb_position_BI
    BEFORE INSERT ON tb_position
    FOR EACH ROW
BEGIN
    if :NEW.id is NULL then
        :NEW.id := SQ_tb_position.nextVal;
    end if;
END;
/



-------------------------------------------------------------------------------
--            tb_product
-------------------------------------------------------------------------------

CREATE TABLE tb_product (
    id                              INTEGER
  , name_v                          VARCHAR2(200)
  , price_n                         INTEGER
  , CONSTRAINT PK_tb_product PRIMARY KEY ( id )
);

COMMENT ON TABLE  tb_product                                 IS 'Product Table';

CREATE SEQUENCE SQ_tb_product;

CREATE OR REPLACE TRIGGER TG_tb_product_BI
    BEFORE INSERT ON tb_product
    FOR EACH ROW
BEGIN
    if :NEW.id is NULL then
        :NEW.id := SQ_tb_product.nextVal;
    end if;
END;
/



-------------------------------------------------------------------------------
--            tb_order
-------------------------------------------------------------------------------

CREATE TABLE tb_order (
    id                              INTEGER
  , type_id                         INTEGER
  , quantity_n                      INTEGER
  , product_id                      INTEGER
  , client_id                       INTEGER
  , CONSTRAINT PK_two_tb_order PRIMARY KEY ( id )
);

COMMENT ON TABLE  tb_order                                 IS 'Order Table';

CREATE SEQUENCE SQ_tb_order;

CREATE OR REPLACE TRIGGER TG_tb_order_BI
    BEFORE INSERT ON tb_order
    FOR EACH ROW
BEGIN
    if :NEW.id is NULL then
        :NEW.id := SQ_tb_order.nextVal;
    end if;
END;
/



-------------------------------------------------------------------------------
--            tb_order_type
-------------------------------------------------------------------------------

CREATE TABLE tb_order_type (
    id                              INTEGER
  , name_v                          INTEGER
  , CONSTRAINT PK_tb_order_type PRIMARY KEY ( id )
);

COMMENT ON TABLE  tb_order_type                                 IS 'Types of orders';

CREATE SEQUENCE SQ_tb_order_type;

CREATE OR REPLACE TRIGGER TG_tb_order_type_BI
    BEFORE INSERT ON tb_order_type
    FOR EACH ROW
BEGIN
    if :NEW.id is NULL then
        :NEW.id := SQ_tb_order_type.nextVal;
    end if;
END;
/



-------------------------------------------------------------------------------

ALTER TABLE tb_client ADD CONSTRAINT FK_tb_client_tb_gender FOREIGN KEY ( gender_id ) REFERENCES tb_gender ( id );
ALTER TABLE tb_client ADD CONSTRAINT FK_tb_client_b_nationality FOREIGN KEY ( nationality_id ) REFERENCES tb_nationality ( id );
ALTER TABLE tb_client ADD CONSTRAINT FK_tb_client_tb_country FOREIGN KEY ( birth_place_id ) REFERENCES tb_country ( id );
ALTER TABLE tb_client ADD CONSTRAINT FK_tb_client_tb_stuff FOREIGN KEY ( stuff_id ) REFERENCES tb_stuff ( id );
ALTER TABLE tb_address ADD CONSTRAINT FK_tb_address_tb_client FOREIGN KEY ( client_id ) REFERENCES tb_client ( id );
ALTER TABLE tb_address ADD CONSTRAINT FK_tb_address__address_type FOREIGN KEY ( type_id ) REFERENCES tb_address_type ( id );
ALTER TABLE tb_address ADD CONSTRAINT FK_tb_address_tb_country FOREIGN KEY ( country_id ) REFERENCES tb_country ( id );
ALTER TABLE additional_information ADD CONSTRAINT FK_l_information_tb_client FOREIGN KEY ( client_id ) REFERENCES tb_client ( id );
ALTER TABLE tb_stuff ADD CONSTRAINT FK_tb_two_stuff_tb_position FOREIGN KEY ( position_id ) REFERENCES tb_position ( id );
ALTER TABLE tb_order ADD CONSTRAINT FK_tb_order_tb_order_type FOREIGN KEY ( type_id ) REFERENCES tb_order_type ( id );
ALTER TABLE tb_order ADD CONSTRAINT FK_tb_order_tb_product FOREIGN KEY ( product_id ) REFERENCES tb_product ( id );
ALTER TABLE tb_order ADD CONSTRAINT FK_tb_order_tb_client FOREIGN KEY ( client_id ) REFERENCES tb_client ( id );
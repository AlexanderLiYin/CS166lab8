CREATE SEQUENCE part_numbers_seq START WITH 50000;
DROP LANGUAGE IF EXISTS plpgsql CASCADE;
CREATE LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION func_name()
RETURNS "trigger" AS 
$BODY$ 
BEGIN
New.part_number = nextval('part_numbers_seq');
return NEW;
END;
$BODY$
LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER pop_part_num BEFORE INSERT
ON part_nyc FOR EACH ROW
EXECUTE PROCEDURE func_name();

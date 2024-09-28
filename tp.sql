DELIMITER //

    CREATE PROCEDURE somme_carres(  num INT)
    BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE somme BIGINT DEFAULT 0;

   
    WHILE i <= num DO
        SET somme = somme + (i * i);
        SET i = i + 1;
    END WHILE;

    
    SELECT somme AS somme_des_carres;
    END //

 



*************


DELIMITER //

    CREATE PROCEDURE supprimer_caractere(  phrase TEXT,  rang INT)
    BEGIN
    DECLARE nouvelle_phrase TEXT;

    
    SET nouvelle_phrase = CONCAT(SUBSTRING(phrase, 1, rang - 1), SUBSTRING(phrase, rang + 1));

    
    SELECT nouvelle_phrase AS phrase_modifiee;
    END //

 



***************



DELIMITER //

    CREATE PROCEDURE chiffre_cesar(phrase TEXT,   decalage INT)
    BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE longueur INT;
    DECLARE nouvelle_phrase TEXT DEFAULT '';
    DECLARE caractere CHAR(1);

    
    SET longueur = CHAR_LENGTH(phrase);

    
    WHILE i <= longueur DO
        SET caractere = SUBSTRING(phrase, i, 1);

        
        IF caractere BETWEEN 'A' AND 'Z' THEN
            SET caractere = CHAR(((ASCII(caractere) - 65 + decalage) % 26) + 65);
        ELSEIF caractere BETWEEN 'a' AND 'z' THEN
            SET caractere = CHAR(((ASCII(caractere) - 97 + decalage) % 26) + 97);
        END IF;

        
        SET nouvelle_phrase = CONCAT(nouvelle_phrase, caractere);

         
        SET i = i + 1;
    END WHILE;

   
    SELECT nouvelle_phrase AS phrase_cryptee;
END //

 

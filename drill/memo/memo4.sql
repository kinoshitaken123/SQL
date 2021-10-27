--SELECT 列名 FROM テーブル名

--UPDATE テーブル名 SET 列名　= 値

--DELETE FROM テーブル名

--INSERT INTO テーブル名(列名・・・)
--VALUES(値・・・)

--DISTINCT 重複行を除外する
SELECT文に付加すると、結果ひょうの中で内容が重複している行があれば、その重複を取り除く。

SELECT DISTINCT 列名・・・
 FROM テーブル名
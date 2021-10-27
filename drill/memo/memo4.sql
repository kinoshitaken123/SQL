--SELECT 列名 FROM テーブル名

--UPDATE テーブル名 SET 列名　= 値

--DELETE FROM テーブル名

--INSERT INTO テーブル名(列名・・・)
--VALUES(値・・・)

--DISTINCT 重複行を除外する
SELECT文に付加すると、結果ひょうの中で内容が重複している行があれば、その重複を取り除く。

SELECT DISTINCT 列名・・・
 FROM テーブル名

 --ORDER BY 指定した列の値を基準として、検索結果を並べて取得することができる。
  SELECT 列名・・・　FROM テーブル名
  　ORDER BY 列名　並び順

  --昇順 ASC 降準 DESC
  --ORDER BY 句の初期値は昇順

  --出金額で昇順となるよう並び替えて取得する
  SELECT * FROM 家計簿
  　ORDER BY 出金額

  --複数の列で並び替える

  SELECT * FROM 家計簿
   ORDER BY 入金額 DESC, 出金額 DESC
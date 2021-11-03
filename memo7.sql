SELECT MAX(出金額)FROM 家計簿

SELECT 費目,出金額 FROM 家計簿
WHERE 出金額 = [書き留めた額]

--一つのSQLで最大の出費に菅する費目と金額を求める
SELECT 費目,出金額 FROM 家計簿
 WHERE 出金額 = (SELECT MAX(出金額)FROM 家計簿)

 --単一行福問い合わせ

 --SET句で福問い合わせを利用する

 UPDATE 家計簿集計
 　 SET 平均 = (SELECT AVG(出金額)
               FROM 家計簿アーカイブ
              WHERE 出金額 > 0
                AND 費目 = '食費' )
  WHERE 費目 = '食費'              

  --選択リストで副問い合わせを利用する
  SELECT 日付、メモ、出金額、
  　　　　　(SELECT 合計　FROM 家計簿集計
  　　　　　　WHERE 費目 = '食費') AS 過去の合計額
  　FROM 家計簿アーカイブ
   WHERE 費目 = '食費'

--INで副問い合わせを利用する
SELECT * FROM 家計簿集計
　WHERE 費目　IN (SELECT DISTINCT 費目　FROM 家計簿)

--ANYで副問い合わせを利用する
SELECT * FROM 家計簿
　WHERE 費目 = '食費'
　　AND 出金額　< ANY (SELECT 出金額　FROM 家計簿アーカイブ
　　　　　　　　　　　　　WHERE 費目 = '食費')

--副問い合わせからNULLを除外する
SELECT * FROM 家計簿アーカイブ　
 WHERE 費目 IN( SELECT 費目 FROM 家計簿
               WHERE 費目 IS NOT NULL
 )

 SELECT * FROM 家計簿アーカイブ　
 WHERE 費目 IN( SELECT COALESCE(費目、'不明') FROM 家計簿)
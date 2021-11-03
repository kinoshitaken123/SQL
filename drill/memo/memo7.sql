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

 --INSERT文で副問い合わせを利用する
 INSERT INTO 家計簿集計(費目、合計、平均、回数)
 SELECT 費目、SUM(出金額),AVG(出金額),0
   FROM 家計簿
  WHERE 出金額 > 0
  GROUP BY 費目 

  --食費の合計額を集計して集計テーブルを更新したい
  UPDATE 家計簿集計
  　SET 合計 = (SELECT SUN(出金額)
  　　　　　　　　FROM 家計簿アーカイブ
               WHERE 出金額　> 0
               AND 費目　 = '食費')
   WHERE 費目 = '食費'

   --1月と12月の出金額の合計を知りたい
   SELECT G.タイトル,G.出金額計
   　FROM (SELECT '合計0１月'　AS タイトル,SUM(出金額)AS 出金額計
             FROM 家計簿アーカイブ
             WHERE 日付 >= '2018-01-01'
             AND 日付　<= '2018-01-31'
           UNION
           SELECT '合計12月'　AS タイトル,SUN(出金額) AS 出金額計
           　FROM 家計簿アーカイブ  
           WHERE 日付 >= '2017-12-01'
             AND 日付　<= '2018-12-31') AS G            

    --今月初めて発生した費用を知りたい
    　SELECT　DISTINCT 費目　FROM 家計簿
    　　WHERE 費目　NOT IN (SELECT 費目 FROM　家計簿アーカイブ)

    --今月の給料で先月までよりも高い額であれば知りたい
    SELECT * FROM 家計簿
     WHERE 費目 = '給料'
       AND 入金額 > ALL(SELECT 入金額 FROM 家計簿アーカイブ
       WHERE 費目 = '給料')     
       INSERT INTO 家計簿アーカイブ
       SELECT * FROM 家計簿   
--NULLの判定
--NULLであることを判定する
式 IS NULL 

--NULLでないことを判定する
式 IS NOT NULL

SELECT *
  FROM 家計簿
WHERE 出金額　IS NULL

--LIKE演算子

SELECT * FROM 家計簿
 WHERE メモ　LIKE '%1月%'

 --BETWEEN演算子

 --BETWEEN演算子は、ある範囲内に値が収まっているかを判定する

 SELECT *
   FROM 家計簿
 WHERE 出金額 BETWEEN 100 AND 3000 

 --IN
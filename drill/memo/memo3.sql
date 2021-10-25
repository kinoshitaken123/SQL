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
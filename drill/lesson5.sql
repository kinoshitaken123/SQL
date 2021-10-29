--5-1

--1
A UPDATE 試験結果
　   SET 午後1 = (80*4) - (86+68+91)
   WHERE 受験者ID = 'SW1046'

B UPDATE 試験結果
     SET 論述　= (68*4) - (65+53+70)
   WHERE 受験者ID = 'SW1350'

C UPDATE 試験結果
     SET 論述　= (56*4) - (59+56+36)
   WHERE 受験者ID = 'SW1877'

--2
1 午前の点数は60以上であること
2　午前１と午後２を合計が１２０以上であること
3　論述の点数が、全科目の合計点の３割以上であること。
全科目の受験者IDを抽出する。ただし、列見出しは合格者IDとすること。

SELECT 受験者ID AS 合格者ID
  FROM 試験結果
 WHERE 午前 >= 60
   AND 午前１ + 午前２ >= 120
　　AND 0.3 * (午前　+ 午後１ + 午後２ + 論述)　<= 論述

--5-2
1. UPDATE 回答者
 　SET 国名 = CASE SUBSTRING(TRIM(メールアドレス)),
                          LENGTH(TRIM(メールアドレス))-1,2)
                WHEN 'jp' THEN '日本'
                WHEN 'uk' THEN 'イギリス'
                WHEN 'cn' THEN '中国' 
                WHEN 'fr' THEN 'フランス'  
                WHEN 'vn' THEN 'ベトナム' END     
                      
2. SELECT TRIM(メールアドレス) AS メールアドレス,
    CASE WHEN 年齢 >= 20 AND 年齢 < 30 THEN '20代'  
         WHEN 年齢 >= 30 AND 年齢 < 40 THEN '30代'  
         WHEN 年齢 >= 40 AND 年齢 < 50 THEN '40代'
         WHEN 年齢 >= 50 AND 年齢 < 60 THEN '50代' END       
    || ':' ||
    CASE 性別　WHEN 'M' THEN '男性'
              WHEN 'F' THEN '女性' END AS 男性
    FROM 回答者          
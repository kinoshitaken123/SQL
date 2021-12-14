--複数の表の形式でデータを取り扱うものを特にRDBMSという

SELECT 出金額
  FROM 家計簿

  SELECTには目的とする列名を,FROMには検索したいテーブル名を記述する。

  SELECT 日付、費目、出勤額
    FROM 家計簿
   WHERE 出金額 > 3000

   --データを追加

   INSERT INTO 家計簿
   　　　VALUES ('2018-02-25','居住費','３月の家賃',0,85000) 
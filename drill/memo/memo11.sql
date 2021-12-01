--インデックスの作成
CREATE INDEX インデゥクス名 ON テーブル名(列名)

--家計簿テーブルにインデックスを２つ作る
CREATE INDEX 費目IDインデックス oN 家計簿 (費目ID);
CREATE INDEX メモインデックス　ON 家計簿(メモ);

--DROP INDEX インデックス名
--コンピューターはテーブルが分割されていた方がデータを安全、確実、高速に取り扱える。

--リレーショナルデーターベース（RDB）
--RDBは、データを複数テーブルで安全、確実に管理しながら、
--必要に応じて人間に分かりやすい表に結合することができる

--テーブルAとテーブルBの結合
SELECT 選択列リスト
FROM　テーブルA
JOIN　テーブルB
  ON　両テーブルの結合条件

--結合とは
--結合とは、テーブルを丸ごと繋ぐことではなく、結合条件を満たされた行を一つ一つ繋ぐことである
faddとfsubは完成
fmulは非正規化数に誤差あり

faddが順序回路になりました(まさかの未テスト)

fadd、テストを作り、無事通りました

fadd,fsub,fmulが順序回路となりテストも通ったが、最大動作周波数を調べていない(実質未テスト)(話を聞く感じ100メガヘルツなら大丈夫っぽい)(ほんまか)

fdiv完成、divとしての規格およびinvとしての規格を通過。
結局テーブルを回路内に直接組込み、レイテンシ11となりました(実機でパンクしたらごめんちゃい)

いろいろあって、すべてバグっていることが判明。律速していくスタイル

とりあえずfadd,fsub,fmul,fdivのバグを修正

fdivのテーブル生成に用いたcのプログラムを上げました

テストスクリプトたちを上げました

faddパイプライン化、本気出せばレイテンシ2も見えてきそう?

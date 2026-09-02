# fiction-prose-jp

AI に小説の本文を書かせる・直させるときの「AIくささ」を取り除く、Claude Code と Codex の双方で使える執筆規範スキルです。
文章のリズムだけでなく、**持ち物・時刻・距離・人物が知っていることの整合**まで管理します。
（English summary: [README.en.md](README.en.md)）

## Before / After

AI に書かせた本文にありがちな一節:

> 森は静かだった。杉の葉ずれ。遠い沢の音。リオは歩いた。慎重に、進んだ。それはまさに、死と隣り合わせの探索だった。

このスキルを入れて書かせた一節:

> 杉の葉ずれと遠い沢の音のほかには、何も聞こえない森だった。リオは三歩に一度足を止めて、湿った土の匂いを確かめながら進む。その用心がどれほど要る森なのか、このときはまだ半分も分かっていなかった。

変わったこと——細切れの短文の連打（メトロノーム文）が消える。「まさに」のような空虚な強調が消える。「死と隣り合わせ」と意味を総括する代わりに、あとで効く具体（三歩に一度）と、先を読ませる引きを置く。

## 中身

スキル1本（[skills/fiction-prose-jp/SKILL.md](skills/fiction-prose-jp/SKILL.md)）。柱は4つです。

- **文長の波**: 短文は決め所専用の弾。平時は因果と観察を一文の中で繋ぎ切る。切るか繋ぐかは「これは誰が言っているか」（人の声が乗っているなら切ってよい・無人の観察なら繋ぐ）で判定
- **整合の管理**: 書き出す前の5行（前話の締め・時刻と場所・持ち物の増減・出す数・視点人物が新しく知ること）と、書き終えた後の突き合わせ。人物が知らないはずのことを知っている事故を潰す
- **判断文の三点照合**: 観察を越える断定には、根拠・知識経路・射程の3点が揃っているか。欠ける断定は書かせない
- **執筆後の点検手順**: 台詞だけ抜き出して話者を追う、移動と受け渡しを頭で再現する、など機械的に回せるチェックリスト

作品固有の文体規定（文体カルテ）がある場合はそちらが優先で、このスキルは「その基調の中で波を作る」ための層です。

## 導入（Claude Code / Codex）

`skills/` 配下を Claude Code の `~/.claude/skills/` または Codex の `$HOME/.agents/skills/` にコピーするだけです。スクリプトを使う場合:

Windows (PowerShell):

```powershell
# Claude Code（引数なし。従来どおり）
powershell -ExecutionPolicy Bypass -File .\install.ps1
# Codex
powershell -ExecutionPolicy Bypass -File .\install.ps1 -Target codex
# Claude Code と Codex の両方
powershell -ExecutionPolicy Bypass -File .\install.ps1 -Target both
```

Mac / Linux:

```sh
# Claude Code（引数なし。従来どおり）
sh install.sh
# Codex
sh install.sh codex
# Claude Code と Codex の両方
sh install.sh both
```

※ 同名のスキルが既にある場合は上書きされます。

## 使い方

小説の話・章・場面の執筆や、下書きの推敲・リライトを頼むと、Claude Code と Codex のどちらでも `SKILL.md` の description と依頼内容が一致したときに自動で発火します。Claude Code で明示的に使うときは `/fiction-prose-jp`、Codex では `$skill-name`（例: `$fiction-prose-jp`）で呼び出せます。Codex で利用可能なスキルの一覧は `/skills` で確認できます。導入後に反映されない場合は、対象のホストを再起動してください。
Claude Code 以外の AI ツールでも、`SKILL.md` は素の Markdown なので、システムプロンプトやカスタム指示に貼り付けて使えます。

## 姉妹リポジトリ

- [ai-writing-skills-jp](https://github.com/MetamoL/ai-writing-skills-jp) — 技術文書と記事・読み物のための文章規範
- [loop-engineering-jp](https://github.com/MetamoL/loop-engineering-jp) — AIに改善ループを回させるためのキット

## ライセンス

独自ライセンス（無料公開・source-available）です。全文は [LICENSE](LICENSE)。**利用は自由**（個人・業務どちらでも。スキルを使って書いた作品は商用含めて利用者のもの）、**本ファイル自体の再配布・転載・販売・自作としての公開は不可**。出典つきの短い引用を伴う紹介・論評は歓迎します。

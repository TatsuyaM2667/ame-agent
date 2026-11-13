# ame-agent

コーディング CLI(Claude Code・Gemini・Codex・OpenCode・Kimi)の出力を共通の JSON の行に直すフィルタ。

[ame-shell](https://github.com/TatsuyaM2667/ame-shell)(Wayland のデスクトップシェル)の一部を、単独で使えるように切り出したものです。
ame-shell は画面の要らない仕事を、1 つのことをして標準入出力でやりとりする小さなコマンドに分けています。これはその 1 つです。

## 使い方

```text
ame-agent: コーディング CLI の出力を、共通の出来事(1 行 1 つの JSON)に直すフィルタ。

  claude -p … --output-format stream-json | ame-agent [-f 形式] [-C 作業フォルダ]
  ame-agent sessions [フォルダ]          Claude Code のそのフォルダの会話(新しい順){"id","title","mtime"}
  ame-agent history フォルダ 会話の id   その会話の記録を、同じ出来事にして出す

形式: claude(既定。Qwen Code・Cursor Agent・Amp も)/ antigravity(agy)/ gemini / codex / opencode / kimi / raw
出来事(読み方は lib/agentfmt.zig。ame-shell の AI チャットのパネルも同じものを使う):
  {"type":"session","id"}            会話の id(次は --resume などに渡せる)
  {"type":"delta","text"}            少しずつ届く返事の続き / {"type":"text","text"} まとまった返事
  {"type":"user","text"}             人の発言(history のときだけ)
  {"type":"tool","title"}            ツールの実行 / {"type":"result","text","error"} その結果
  {"type":"error","message"} / {"type":"split"}(返事の区切り)/ {"type":"done","cost"}
  {"type":"raw","text"}              JSON でない行(色の指定は取り除く)
-C を付けると、ツールの見出しのパスからそのフォルダを省く。
```

## ビルド

```sh
zig build -Doptimize=ReleaseSafe   # zig-out/bin/ame-agent(Zig 0.13、libc だけ)
zig build test
```

## このリポジトリについて

正本は ame-shell の `src/cmd/ame-agent.zig` です。このリポジトリは `scripts/split-repos.sh` が生成して同期しています。
直したいところがあれば ame-shell の方へお願いします。

ライセンス: GPL-3.0(ame-shell と同じ)

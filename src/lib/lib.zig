// ame-shell の src/lib から、この道具が使う部品だけを持ってきたもの(生成。直すときは ame-shell の方を直す)
pub const agentfmt = @import("agentfmt.zig");

test {
    _ = agentfmt;
}

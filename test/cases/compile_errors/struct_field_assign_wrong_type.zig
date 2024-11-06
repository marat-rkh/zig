// https://github.com/ziglang/zig/issues/10663
const S = struct {
    data: []const u8,
};

fn foo(buf: []u8) S {
    return S{
        .data = &buf,
    };
}

pub fn main() !void {
    _ = foo("");
}

// error
// backend=stage2
// target=native
//
// :8:17: error: expected type '[]const u8', found '*const []u8'

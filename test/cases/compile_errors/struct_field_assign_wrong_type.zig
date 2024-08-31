// https://github.com/ziglang/zig/issues/10663
const std = @import("std");

const S = struct {
    data: []const u8,
};

fn foo() !S {
    const buf: []u8 = "";
    return S{
        .data = &buf,
    };
}

pub fn main() !void {
    foo() catch {};
}

// error
// backend=stage2
// target=native
//
// :11:17: error: expected type '[]const u8', found '*const []u8'

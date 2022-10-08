const std = @import("std");
const assert = std.debug.assert;
const Allocator = std.mem.Allocator;
const graphics = @import("../graphics.zig");
const c = @import("c.zig");

/// Returns a struct that has all the shared context functions for the
/// given type.
pub fn Context(comptime T: type) type {
    return struct {
        pub fn release(self: *T) void {
            c.CGContextRelease(@ptrCast(c.CGContextRef, self));
        }

        pub fn setLineWidth(self: *T, width: f64) void {
            c.CGContextSetLineWidth(
                @ptrCast(c.CGContextRef, self),
                width,
            );
        }

        pub fn setShouldAntialias(self: *T, v: bool) void {
            c.CGContextSetShouldAntialias(
                @ptrCast(c.CGContextRef, self),
                v,
            );
        }

        pub fn setShouldSmoothFonts(self: *T, v: bool) void {
            c.CGContextSetShouldSmoothFonts(
                @ptrCast(c.CGContextRef, self),
                v,
            );
        }

        pub fn setGrayFillColor(self: *T, gray: f64, alpha: f64) void {
            c.CGContextSetGrayFillColor(
                @ptrCast(c.CGContextRef, self),
                gray,
                alpha,
            );
        }

        pub fn setGrayStrokeColor(self: *T, gray: f64, alpha: f64) void {
            c.CGContextSetGrayStrokeColor(
                @ptrCast(c.CGContextRef, self),
                gray,
                alpha,
            );
        }

        pub fn setTextDrawingMode(self: *T, mode: TextDrawingMode) void {
            c.CGContextSetTextDrawingMode(
                @ptrCast(c.CGContextRef, self),
                @enumToInt(mode),
            );
        }

        pub fn setTextMatrix(self: *T, matrix: graphics.AffineTransform) void {
            c.CGContextSetTextMatrix(
                @ptrCast(c.CGContextRef, self),
                matrix.cval(),
            );
        }

        pub fn setTextPosition(self: *T, x: f64, y: f64) void {
            c.CGContextSetTextPosition(
                @ptrCast(c.CGContextRef, self),
                x,
                y,
            );
        }
    };
}

pub const TextDrawingMode = enum(c_int) {
    fill = c.kCGTextFill,
    stroke = c.kCGTextStroke,
    fill_stroke = c.kCGTextFillStroke,
    invisible = c.kCGTextInvisible,
    fill_clip = c.kCGTextFillClip,
    stroke_clip = c.kCGTextStrokeClip,
    fill_stroke_clip = c.kCGTextFillStrokeClip,
    clip = c.kCGTextClip,
};
#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw/min max/;
use POSIX qw/ceil/;

my $current_brightness = `cat /sys/class/backlight/intel_backlight/brightness`;
my $max_brightness = `cat /sys/class/backlight/intel_backlight/max_brightness`;
my $min_brightness = $max_brightness * 0.1;
my $unit = $max_brightness * 0.05;

my $new_brightness;

if ($ARGV[0] =~ /up/) {
    $new_brightness = min $max_brightness, ceil($current_brightness + $unit);
} else {
    $new_brightness = max $min_brightness, ceil($current_brightness - $unit);
}

`echo $new_brightness | tee /sys/class/backlight/intel_backlight/brightness`

import("math.lib");
import("filter.lib");

squared(x) = abs(x) * x;

process(x) = smooth(0.95, squared(x));

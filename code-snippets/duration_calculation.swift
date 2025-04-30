var now = mach_absolute_time()
var elapsed = now - date
var timebase: mach_timebase_info_data_t = .init()
mach_timebase_info(&timebase)
let latencyNanoSeconds = elapsed * UInt64(timebase.numer) / UInt64(timebase.denom)
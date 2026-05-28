import time
import datetime
import math

def gettime():
    return time.time()

def gettime_ms():
    return int(time.time() * 1000)

def gettime_ns():
    return int(time.time() * 1e9)

def gettime_us():
    return int(time.time() * 1e6)

def gettime_monotonic():
    return time.monotonic()

def gettime_monotonic_ns():
    return time.monotonic_ns()

def gettime_perf():
    return time.perf_counter()

def gettime_perf_ns():
    return time.perf_counter_ns()

def gettime_process():
    return time.process_time()

def gettime_thread():
    return time.thread_time()

def gettime_iso():
    return datetime.datetime.now().isoformat()

def gettime_iso_utc():
    return datetime.datetime.utcnow().isoformat()

def gettime_rfc3339():
    return datetime.datetime.now().astimezone().isoformat()

def gettime_rfc3339_utc():
    return datetime.datetime.utcnow().replace(tzinfo=datetime.timezone.utc).isoformat()

def gettime_datetime():
    return datetime.datetime.now()

def gettime_datetime_utc():
    return datetime.datetime.utcnow()

def gettime_formatted():
    return time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())

def gettime_formatted_ms():
    return time.strftime("%Y-%m-%d %H:%M:%S.%f", time.localtime())[:-3]

def gettime_formatted_us():
    return time.strftime("%Y-%m-%d %H:%M:%S.%f", time.localtime())

def gettime_formatted_ns():
    s = time.strftime("%Y-%m-%d %H:%M:%S.%f", time.localtime())[:-3]
    return s + str(int(time.time() * 1e9) % 1000).zfill(3)

def gettime_utc():
    return time.gmtime()

def gettime_utc_formatted():
    return time.strftime("%Y-%m-%d %H:%M:%S", time.gmtime())

def gettime_utc_formatted_ms():
    return time.strftime("%Y-%m-%d %H:%M:%S.%f", time.gmtime())[:-3]

def gettime_utc_formatted_us():
    return time.strftime("%Y-%m-%d %H:%M:%S.%f", time.gmtime())

def gettime_utc_formatted_ns():
    s = time.strftime("%Y-%m-%d %H:%M:%S.%f", time.gmtime())[:-3]
    return s + str(int(time.time() * 1e9) % 1000).zfill(3)

def gettime_epoch():
    return int(time.time())

def gettime_epoch_ms():
    return int(time.time() * 1000)

def gettime_epoch_us():
    return int(time.time() * 1e6)

def gettime_epoch_ns():
    return int(time.time() * 1e9)

def gettime_epoch_float():
    return time.time()

def gettime_epoch_utc():
    return int(time.mktime(time.gmtime()))

def gettime_epoch_local():
    return int(time.mktime(time.localtime()))

def gettime_weekday():
    return datetime.datetime.now().weekday()

def gettime_weeknumber():
    return datetime.datetime.now().isocalendar()[1]

def gettime_dayofyear():
    return datetime.datetime.now().timetuple().tm_yday

def gettime_leapyear():
    y = datetime.datetime.now().year
    return y % 4 == 0 and (y % 100 != 0 or y % 400 == 0)

def gettime_start_of_day():
    d = datetime.datetime.now()
    return datetime.datetime(d.year, d.month, d.day)

def gettime_end_of_day():
    d = datetime.datetime.now()
    return datetime.datetime(d.year, d.month, d.day, 23, 59, 59, 999999)

def timestamp_to_datetime(ts):
    return datetime.datetime.fromtimestamp(ts)

def timestamp_to_datetime_utc(ts):
    return datetime.datetime.utcfromtimestamp(ts)

def datetime_to_timestamp(dt):
    return int(dt.timestamp())

def datetime_to_timestamp_ms(dt):
    return int(dt.timestamp() * 1000)

def datetime_to_timestamp_us(dt):
    return int(dt.timestamp() * 1e6)

def datetime_to_timestamp_ns(dt):
    return int(dt.timestamp() * 1e9)

def format_to_timestamp(fmt, s):
    return int(time.mktime(datetime.datetime.strptime(s, fmt).timetuple()))

def format_to_timestamp_ms(fmt, s):
    return int(time.mktime(datetime.datetime.strptime(s, fmt).timetuple()) * 1000)

def format_to_timestamp_us(fmt, s):
    return int(time.mktime(datetime.datetime.strptime(s, fmt).timetuple()) * 1e6)

def format_to_timestamp_ns(fmt, s):
    return int(time.mktime(datetime.datetime.strptime(s, fmt).timetuple()) * 1e9)

def timestamp_to_format(ts, fmt):
    return datetime.datetime.fromtimestamp(ts).strftime(fmt)

def timestamp_to_format_utc(ts, fmt):
    return datetime.datetime.utcfromtimestamp(ts).strftime(fmt)

def get_timezone_offset_hours():
    return -time.timezone / 3600

def get_timezone_offset_seconds():
    return -time.timezone

def get_timezone_name():
    return time.tzname[0]

def convert_timezone(ts, hours):
    z = datetime.timezone(datetime.timedelta(hours=hours))
    return datetime.datetime.fromtimestamp(ts, z)

def convert_timezone_formatted(ts, hours, fmt):
    z = datetime.timezone(datetime.timedelta(hours=hours))
    return datetime.datetime.fromtimestamp(ts, z).strftime(fmt)

def now_tz(hours):
    z = datetime.timezone(datetime.timedelta(hours=hours))
    return datetime.datetime.now(z)

def now_tz_formatted(hours, fmt):
    z = datetime.timezone(datetime.timedelta(hours=hours))
    return datetime.datetime.now(z).strftime(fmt)

def get_filetime():
    return int((time.time() + 11644473600) * 10000000)

def get_tai_offset():
    return 37

def get_tai_time():
    return time.time() + 37

def get_unix_micro():
    return int(time.time() * 1_000_000)

def get_unix_milli_float():
    return time.time() * 1000

def get_unix_micro_float():
    return time.time() * 1_000_000

def get_unix_nano_float():
    return time.time() * 1_000_000_000
extends Node


var hours = 0 setget set_hours, get_hours
var minutes = 0 setget set_minutes, get_minutes
var seconds = 0.0 setget set_seconds, get_seconds

var starting = false


func start():
    starting = true


func stop():
    starting = false


func set_hours(h):
    hours = h


func get_hours():
    return hours


func set_minutes(m):
    if m >= 60:
        self.hours += int(m / 60)
        minutes = m % 60
    else:
        minutes = m


func get_minutes():
    return minutes


func set_seconds(s):
    if s >= 60:
        self.minutes += int(s / 60)
        seconds = int(s) % 60
    else:
        seconds = s


func get_seconds():
    return int(seconds)


func get_time_in_minutes():
    var ret = hours * 60 + minutes
    # ret += float(seconds) / 60.0
    return ret


func get_time_in_seconds():
    var ret = hours * 3600
    ret += minutes * 60
    ret += seconds
    return int(ret)


func _process(delta):
    if starting:
        var ss = seconds
        ss += delta
        self.seconds = ss


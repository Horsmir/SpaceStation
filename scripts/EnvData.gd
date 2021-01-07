extends Node


var env_data = {} # Словарь с текущим состоянием модулей
# Файл хранения текущего состояния модулей
var env_data_file_name = 'user://env_data.json'


func env_data_read():
    var file = File.new()
    file.open(env_data_file_name, File.READ)
    var data = file.get_as_text()
    var j_data = JSON.parse(data)
    env_data = j_data.result
    file.close()


func env_data_write():
    var file = File.new()
    file.open(env_data_file_name, File.WRITE)
    var data = to_json(env_data)
    file.store_string(data)
    file.close()


func _ready():
    env_data_read()


func get_data(module_id):
    var tmp_data = env_data.get(module_id, null)
    var curr_time = Clock.get_time_in_seconds()
    if tmp_data:
        tmp_data['o2_per'] += tmp_data['o2_leak'] * curr_time
        if tmp_data['o2_per'] < 0:
            tmp_data['o2_per'] = 0
        tmp_data['co2_per'] += tmp_data['co2_leak'] * curr_time
        if tmp_data['co2_per'] < 0:
            tmp_data['co2_per'] = 0
        tmp_data['temp'] += tmp_data['temp_leak'] * curr_time
        tmp_data['humid'] += tmp_data['humid_leak'] * curr_time
        if tmp_data['humid'] < 0:
            tmp_data['humid'] = 0
        tmp_data['press'] += tmp_data['press_leak'] * curr_time
        if tmp_data['press'] < 0:
            tmp_data['press'] = 0
    return tmp_data


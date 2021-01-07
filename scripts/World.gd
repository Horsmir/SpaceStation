extends Spatial


export (String) var module_id = 'main_module'

var o2 = 0
var co2 = 0
var temperature = 0
var humidity = 0
var pressure = 0
var o2_leak = 0
var co2_leak = 0
var temp_leak = 0
var humid_leak = 0
var press_leak = 0


func _ready():
    G.current_module = module_id
    get_env_data()
    Clock.start()


func get_env_data():
    var env_data = EnvData.get_data(module_id)
    o2 = env_data['o2_per']
    co2 = env_data['co2_per']
    temperature = env_data['temp']
    humidity = env_data['humid']
    pressure = env_data['press']
    o2_leak = env_data['o2_leak']
    co2_leak = env_data['co2_leak']
    temp_leak = env_data['temp_leak']
    humid_leak = env_data['humid_leak']
    press_leak = env_data['press_leak']


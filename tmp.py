import configparser

def read_ini(file_path):
    config = configparser.ConfigParser()
    config.optionxform = str
    config.read(file_path)
    for section in config.sections():
        for key in config[section]:
            print(section, key, config[section][key])
 
read_ini("config.ini")
import jsonpickle
import requests
import json
import cv2
import numpy as np
import time
import utils

addr = "http://209.97.162.90:1234/"
test_url = addr + '/api/test'

# prepare headers for http request
content_type = 'image/jpeg'
headers = {'content-type': content_type}

def analyze_photo_url(photo_url):
    file_name = "{}.jpg".format(int(time.time()))
    file_path = "images/{}".format(file_name)
    
    utils.save_image(photo_url, file_path)
    response = requests.post(test_url, data=open(file_path, 'rb').read(), headers=headers)
    if response.status_code == 200:
        frame = jsonpickle.decode(response.text)
        frame = frame.tobytes()

        # convert string of image data to uint8
        nparr = np.frombuffer(frame, np.uint8)

        # decode image
        img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)

        processed_file_name = "processed_{}".format(file_name)
        processed_file_path = "images/{}".format(processed_file_name)
        
        cv2.imwrite(processed_file_path, img)
        
        return response.status_code, processed_file_path
    else:
        return response.status_code, None
import requests
import utils
import os

from bot import Bot
from flask import Flask, request

app = Flask(__name__)
config = utils.read_ini("config.ini")
CONFIG_SECTION = "PROD"

FB_API_URL = 'https://graph.facebook.com/v12.0/me/messages'
# VERIFY_TOKEN = config[CONFIG_SECTION]["VERIFY_TOKEN"]
# PAGE_ACCESS_TOKEN = config[CONFIG_SECTION]["PAGE_ACCESS_TOKEN"]
VERIFY_TOKEN = os.environ["VERIFY_TOKEN"]
PAGE_ACCESS_TOKEN = os.environ["PAGE_ACCESS_TOKEN"]

lan = Bot(access_token=PAGE_ACCESS_TOKEN, api_version="12.0")

def verify_webhook(req):
    if req.args.get("hub.verify_token") == VERIFY_TOKEN:
        return req.args.get("hub.challenge")
    else:
        return "incorrect"

@app.route("/webhook", methods=['GET', 'POST'])
def listen():
    """This is the main function flask uses to 
    listen at the `/webhook` endpoint"""
    if request.method == 'GET':
        return verify_webhook(request)

    if request.method == 'POST':
        output = request.get_json()
        
        for event in output['entry']:
            messaging = event['messaging']
            for x in messaging:
                if x.get('message'):
                    recipient_id = x['sender']['id']
                    if x['message'].get('text'):
                        message = x['message']['text']
                        print("Received message: {}".format(message))
                        lan.send_text_message(recipient_id, message)
                    
                    if x['message'].get('attachments'):
                        for att in x['message'].get('attachments'):
                            # lan.send_attachment_url(recipient_id, att['type'], att['payload']['url'])
                            response = lan.send_image(recipient_id, "example.png")
                            print("response: ", response)
                else:
                    pass

        return "ok"
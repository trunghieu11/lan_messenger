curl  \
  -F 'recipient={"id":"5478507068842615"}' \
  -F 'message={"attachment":{"type":"image", "payload":{"is_reusable":true}}}' \
  -F 'filedata=@C:/Users/trunghieu11/Documents/Projects/virtual-assistant/LanMessenger/example.png;type=image/png' \
  "https://graph.facebook.com/v12.0/me/messages?access_token=EAAOlCqcUdggBAIDEDiofnPrMIrqPmJZAJrHmdPvuhacT52y85kFRh55ZClEAUqrnpOtZCHpsHYokTuPQJZAUPPHMHN69uy6ArZAyOlHT8adyEHNyyZAff8tk73GsvFasGLFTmQBbRJbU1o6rmN6CmZCp9zGsc16IrqFE6vpLZBkXZC0qI4ZCBXsYEBwdZB7WZCfiUNL6XyyWsTncUwZDZD"
  
  
curl -X POST -H "Content-Type: application/json" -d '{
  "recipient":{
    "id":"5478507068842615"
  },
  "message":{
    "attachment":{
      "type":"image", 
      "payload":{
        "url":"https://picsum.photos/200", 
        "is_reusable":true
      }
    }
  }
}' "https://graph.facebook.com/v12.0/me/message_attachments?access_token=EAAOlCqcUdggBAIDEDiofnPrMIrqPmJZAJrHmdPvuhacT52y85kFRh55ZClEAUqrnpOtZCHpsHYokTuPQJZAUPPHMHN69uy6ArZAyOlHT8adyEHNyyZAff8tk73GsvFasGLFTmQBbRJbU1o6rmN6CmZCp9zGsc16IrqFE6vpLZBkXZC0qI4ZCBXsYEBwdZB7WZCfiUNL6XyyWsTncUwZDZD"

curl -X POST -H "Content-Type: application/json" -d '{
    "recipient":{
      "id":"5478507068842615"
    },
    "message":{
      "attachment":{
        "type":"image", 
        "payload":{
          "attachment_id": "2474612166006289"
        }
      }
    }
  }' "https://graph.facebook.com/v12.0/me/messages?access_token=EAAOlCqcUdggBAIDEDiofnPrMIrqPmJZAJrHmdPvuhacT52y85kFRh55ZClEAUqrnpOtZCHpsHYokTuPQJZAUPPHMHN69uy6ArZAyOlHT8adyEHNyyZAff8tk73GsvFasGLFTmQBbRJbU1o6rmN6CmZCp9zGsc16IrqFE6vpLZBkXZC0qI4ZCBXsYEBwdZB7WZCfiUNL6XyyWsTncUwZDZD"

curl -X POST -H "Content-Type: application/json" -d '{
    "recipient":{
      "id":"5478507068842615"
    },
    "message":{
      "text":"hello, world!"
    }
  }' "https://graph.facebook.com/v12.0/me/messages?access_token=EAAOlCqcUdggBAIDEDiofnPrMIrqPmJZAJrHmdPvuhacT52y85kFRh55ZClEAUqrnpOtZCHpsHYokTuPQJZAUPPHMHN69uy6ArZAyOlHT8adyEHNyyZAff8tk73GsvFasGLFTmQBbRJbU1o6rmN6CmZCp9zGsc16IrqFE6vpLZBkXZC0qI4ZCBXsYEBwdZB7WZCfiUNL6XyyWsTncUwZDZD"
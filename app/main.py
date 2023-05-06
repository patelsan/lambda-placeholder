import json

def handler(event, context):
  print("RECEIVED EVENT:", event)
    
  return {
    'statusCode': 200,
    'body': json.dumps('Hello from the placeholder Lambda image!')
  }

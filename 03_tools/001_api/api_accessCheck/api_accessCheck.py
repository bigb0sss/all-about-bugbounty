'''
Desc    : This tool is to automatically check for API permissions
Author  : bigb0ss
Dev     :
    - (1) GET Request [Complete]
        - You can include an access token into 'token.cfg' file; otherwise, it will be an unauthorized mode
    - (2) POST Request [Not Started]
'''

import requests
import argparse
import sys
import configparser

class Color:
    yellow = '\033[95m'
    blue = '\033[94m'
    green = '\033[92m'
    red = '\033[91m'
    end  = '\033[0m'

""" Setup Argument Parameters """
parser = argparse.ArgumentParser(description='[INFO] API Access Check')
parser.add_argument('-u', '--url', help="Target URL (e.g., https://google.com/)")
parser.add_argument('-f', '--file', help="API Endpoints")
parser.add_argument('-t', '--token', help="API Authentication Token")
args = parser.parse_args()

""" Login Credentials """
config = configparser.RawConfigParser()
config.read("token.cfg")
api_token = config.get('API_KEYS', 'token')

def error():
    parser.print_help()
    sys.exit(1)

def api_get_request(url, file, api_token):
    # Reading API file + making requests
    headers = {
        "User-agent":"hacker0ne: spicyb0ss",
        "Authorization": api_token 
        }

    api = []

    for i in open(file, "r"):
        api .append(i.replace("\n", ""))

    for i in api:
        r = requests.get(url+i, headers=headers)
        print(f"[INFO] Testing: {i} - Status Code:", r.status_code)
        if r.status_code == 200: 
            print(Color.green + "ACCESSABLE! --> " + url+i + Color.end)
    return

if __name__ == '__main__':
    url = args.url if args.url != None else error()
    file = args.file if args.url != None else error()
    api_get_request(url, file, api_token)



import json
import requests
import hashlib
import os

PAPER_VERSION = 1.19
PAPER_LINK = "paper-current.jar"

params = {
    'accept': 'application/json'
}

response_builds = requests.get(f"https://api.papermc.io/v2/projects/paper/versions/{PAPER_VERSION}/builds", params)

print("status_code", response_builds.status_code)
if response_builds.status_code == 200:
    data = response_builds.json()
    download_build = None
    max_build = -1
    for build in data['builds']:
        if build['build'] > max_build and build['channel'] == 'default':
            download_build = build
            max_build = build['build']

    if download_build is not None:
        print(download_build)
        with open(PAPER_LINK,"rb") as f:
            bytes = f.read() # read entire file as bytes
            current_hash = hashlib.sha256(bytes).hexdigest();
            print("current", current_hash)
        if current_hash != download_build['downloads']['application']['sha256']:
            URL = f"https://api.papermc.io/v2/projects/paper/versions/{PAPER_VERSION}/builds/{download_build['build']}/downloads/{download_build['downloads']['application']['name']}"
            print(f"downloading new paper {URL}")
            response_dl = requests.get(URL)
            if response_dl.status_code != 200:
                print("Download error - quit")
                quit(1)
            open(download_build['downloads']['application']['name'], "wb").write(response_dl.content)
            with open(download_build['downloads']['application']['name'],"rb") as f:
                bytes = f.read() # read entire file as bytes
                downloaded_hash = hashlib.sha256(bytes).hexdigest();
                print("downloaded", downloaded_hash)
                if downloaded_hash != download_build['downloads']['application']['sha256']:
                    print("Hash error - quit")
                    quit(1)
                else:
                    print("Hash OK - replacing jar")
                    if os.path.islink(PAPER_LINK):
                        old_build = os.path.realpath(PAPER_LINK)
                        os.unlink(PAPER_LINK)
                        print(f"Removing [{old_build}]")
                        os.remove(old_build)
                    print(f"Linking [{PAPER_LINK}] --> [{download_build['downloads']['application']['name']}]")
                    os.symlink(download_build['downloads']['application']['name'], PAPER_LINK)
        else:
            print("Version is up to date")


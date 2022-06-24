import os
from zipfile import ZipFile
import shutil
import gdown

EZ_FRONTEND_API_REPO = 'org-41710699@github.com:IXMATIX/ez_frontend_api.git' 
EZ_FRONTEND_APP_REPO = 'org-41710699@github.com:IXMATIX/ez-frontend-app.git'

print("*"*10)
print("Preparing environment...")

if not os.path.isdir("src/ez_frontend_api"):
    print('Clonning ez_frontend_api repo:')
    os.system(f"git clone {EZ_FRONTEND_API_REPO}")
    os.system(f"mv ez_frontend_api/ src/ ")

if not os.path.isdir("src/ez-frontend-app"):
    print('Clonning ez-frontend-app repo:')
    os.system(f"git clone {EZ_FRONTEND_APP_REPO}")
    os.system(f"mv ez-frontend-app/ src/ ")

if not os.path.isdir("src/uploads"):
    os.system("mkdir src/uploads")
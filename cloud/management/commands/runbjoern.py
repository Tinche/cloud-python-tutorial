import bjoern
from cloud.wsgi import application

bjoern.run(application, '0.0.0.0', 8000)

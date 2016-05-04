from flask import Flask

from routes.routes import app_pages
from api.standardSensitivity import standardSensitivity


app = Flask(__name__,template_folder='template')

app.register_blueprint(app_pages)
app.register_blueprint(standardSensitivity)

app.run(debug = True)


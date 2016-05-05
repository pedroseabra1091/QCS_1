from flask import Flask

from routes.routes import app_pages
from api.standardSensitivity import standardSensitivity
from api.backgroundDose import backgroundDose


app = Flask(__name__,template_folder='template')

app.register_blueprint(app_pages)
app.register_blueprint(standardSensitivity)
app.register_blueprint(backgroundDose)

app.run(debug = True)


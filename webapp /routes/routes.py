from flask import render_template, Blueprint

app_pages = Blueprint('app_pages',__name__)

@app_pages.route('/',defaults = {'path':'/'})
@app_pages.route('/<path:path>')

def index(path):
	return render_template('index.html')
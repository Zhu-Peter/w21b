from flask import Flask, request, jsonify, make_response
from dbhelpers import run_statement, check_endpoint_info

app = Flask(__name__)

@app.get('/api/philosopher')
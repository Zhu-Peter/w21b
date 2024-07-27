from flask import Flask, request, jsonify, make_response
from dbhelpers import run_statement, check_endpoint_info

app = Flask(__name__)

@app.get('/api/philosopher')
def get_philosopher():
    
    try:
        result = run_statement("CALL get_all_philosopher()")
        if (result):
            return make_response(jsonify(result), 201)
    except Exception as error:
        err = {}
        err["error"] = f"Error calling api: {error}"
        return make_response(jsonify(err), 400)
    
@app.post('/api/philosopher')
def add_philosopher():
    
    # return jsonify(request.args)

    # name = request.json["name"]
    # bio = request.get_json(force=True)["bio"]
    # date_of_birth = request.get_json(force=True)["date_of_birth"]
    # date_of_death = request.get_json(force=True)["date_of_death"]
    # image_url = request.get_json(force=True)["image_url"]

    name = 'test'
    bio = 'test'
    date_of_birth = 0
    date_of_death = 0
    image_url = 'test'

    try:
        result = run_statement("CALL new_philosopher(?,?,?,?,?)", (name, bio, date_of_birth, date_of_death, image_url))
        if (result):
            return make_response(jsonify(result), 201)
    except Exception as error:
        err = {}
        err["error"] = f"Error calling api: {error}"
        return make_response(jsonify(err), 400)
    
@app.get('/api/quote')
def get_quote():

    id = request.args['id']
    
    try:
        result = run_statement("CALL get_philosopher_quote(?)", id)
        if (result):
            return make_response(jsonify(result), 201)
    except Exception as error:
        err = {}
        err["error"] = f"Error calling api: {error}"
        return make_response(jsonify(err), 400)
    
@app.post('/api/quote')
def post_quote():
    
    id = request.args['id']
    content = request.args['content']

    try:
        result = run_statement("CALL new_quote(?, ?)", (id, content))
        if (result):
            return make_response(jsonify(result), 201)
    except Exception as error:
        err = {}
        err["error"] = f"Error calling api: {error}"
        return make_response(jsonify(err), 400)

app.run(debug=True)
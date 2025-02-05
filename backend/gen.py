import os
import re
import time
from flask import Flask, request, jsonify
import google.generativeai as genai
from flask_cors import CORS


# Configure the API key
genai.configure(api_key="AIzaSyB3xjRkhK26hn6UtC5IDC3RYnEaBM7dSX4")

# Create the model
generation_config = {
    "temperature": 0.4,
    "top_p": 0.95,
    "top_k": 40,
    "max_output_tokens": 4192,
    "response_mime_type": "text/plain",
}

model = genai.GenerativeModel(
    model_name="gemini-1.5-flash",
    generation_config=generation_config,
)

# Create the Flask app
app = Flask(__name__)
CORS(app)  # Enable CORS for all routes


def get_gemini_response(prompt):
    try:
        print(f"Sending prompt to Gemini: {prompt}")
        start_time = time.time()
        response = model.generate_content(prompt)
        elapsed_time = time.time() - start_time
        print(f"Gemini raw response: {response} (took {elapsed_time:.2f} seconds)")
        return response.text if response else "No response generated."
    except Exception as e:
        print(f"Error generating content: {e}")
        return "Sorry, I'm having trouble generating a response."

def extract_calories(sentence):
    # Regular expression to find calories (e.g., '152 calories', '45 kcal')
    pattern = re.compile(r'(\d+)\s*(?:calories|kcal)', re.IGNORECASE)
    match = pattern.search(sentence)
    
    if match:
        return int(match.group(1))  # Corrected this line to return the extracted calories value
    return None

@app.route('/calculate_calories', methods=['POST'])
def calculate_calories():
    try:
        # Get the input data from the request (JSON format)
        data = request.get_json()
        
        # Validate input parameters
        if not data or 'food_name' not in data or 'quantity' not in data:
            return jsonify({'error': 'Missing required parameters: food_name and quantity'}), 400
        
        # Extract parameters
        food_name = data['food_name']
        quantity = data['quantity']
        
        # Construct the prompt dynamically
        prompt = f"Calculate the calories for {quantity} of {food_name}."
        print(f"Generated prompt: {prompt}")
        
        # Get the Gemini response
        response = get_gemini_response(prompt)
        
        # Extract calories from the Gemini response
        calories = extract_calories(response)
        
        if calories is not None:
            # return jsonify({'food_name': food_name, 'quantity': quantity, 'calories': calories}), 200
            return jsonify({'food_name': food_name, 'quantity': quantity, 'calories': calories}), 200
        else:
            return jsonify({'message': 'No calories information found in the response'}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    app.run(debug=True)

import speech_recognition as sr
import os
import google.generativeai as genai
import time
import pyttsx3

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



import re

def extract_calories(sentence):
    # Regular expression to find calories (e.g., '152 calories', '45 kcal')
    pattern = re.compile(r'(\d+)\s*(?:calories|kcal)', re.IGNORECASE)
    match = pattern.search(sentence)
    
    if match:
        return int(match.group(1))
    return None





# Function to handle commands after activation word is detected
def speak_commands(text):
            try:
                print("Generating response from Gemini AI, please wait...")
                response = get_gemini_response(text)
                print(f"Gemini AI: {response}")
                calories = extract_calories(response)
                if calories is not None:
                    print(f"Extracted calories: {calories}")
                else:
                    print(f"No calories found in: \"{response}\"")

            except sr.UnknownValueError:
                print("Google Speech Recognition could not understand audio")
            except sr.RequestError as e:
                print(f"Could not request results; {e}")


# Start listening for the activation word
text="food is lassi and quantity is 200 ml calculate the calories"
speak_commands(text)

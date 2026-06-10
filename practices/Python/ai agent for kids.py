from openai import OpenAI

client = OpenAI(api_key="YOUR_API_KEY")

def child_behavior_agent(age, issue):
    prompt = f"""
    Child Age: {age}
    Behavior: {issue}
    """

    response = client.chat.completions.create(
        model="gpt-5.3",
        messages=[
            {"role": "system", "content": "You are a child behavior expert AI."},
            {"role": "user", "content": prompt}
        ]
    )

    return response.choices[0].message.content


print(child_behavior_agent("2 years", "hitting others when angry"))



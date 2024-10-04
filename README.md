# Real Estate Recommendation System

## Problem statement

Real estate buyers struggle to find properties that match their unique preferences due to the lack of flexibility in adjusting feature importance. Current platforms do not offer real-time updates when users customize weights for characteristics like location, price, or size. A solution is needed to allow buyers to dynamically adjust feature weights and instantly view ranked property lists based on their preferences and property ratings.


## Objectives

- Develop a recommendation system that allows users to customize the importance of various property features, enabling personalized property rankings.
- Implement a real-time updating mechanism that reflects changes in user-defined weights for characteristics such as location, price, and size.
- Provide an expert system that evaluates properties based on user-defined criteria, ensuring accurate and relevant recommendations.

## Running the `engine.pl`

To run the `engine.pl`, follow these steps:

1. **Ensure Prolog is Installed**: Make sure you have a Prolog interpreter installed on your system. SWI-Prolog is recommended.

2. **Open the Terminal or Command Prompt**: Navigate to the directory where your `engine.pl` file is located.

3. **Start SWI-Prolog**: Run the command `swipl` to start the SWI-Prolog interpreter.

4. **Consult the Engine File**: Load your Prolog engine by running the following command in the SWI-Prolog prompt:
```prolog
?- [engine].
```

5. **Load the Knowledge Base**: Ensure your knowledge base is loaded by executing the command:
```prolog
?- load_kb.
```

6. **Start the Inference Engine**: Begin the inference process by calling:
```prolog
?- start_engine.
```

7. **Follow the Prompts**: Interact with the system as instructed by the output prompts.
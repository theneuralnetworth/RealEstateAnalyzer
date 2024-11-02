# Real Estate Recommendation System

## Problem statement

Real estate buyers struggle to find properties that match their unique preferences due to the lack of flexibility in adjusting feature importance. Current platforms do not offer real-time updates when users customize weights for characteristics like location, price, or size. A solution is needed to allow buyers to dynamically adjust feature weights and instantly view ranked property lists based on their preferences and property ratings.


## Objectives

- Develop a recommendation system that allows users to customize the importance of various property features, enabling personalized property rankings.
- Implement a real-time updating mechanism that reflects changes in user-defined weights for characteristics such as location, price, and size.
- Provide an expert system that evaluates properties based on user-defined criteria, ensuring accurate and relevant recommendations.

## Running the Prolog inference engine

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

## Running the WebAPI

1. **Open the Terminal or Command Prompt**: Navigate to the directory where your web api folder is located.
2. **Start api**: Run the command `dotnet run` to start the web api.
3. **Open api**: [http://localhost:5182](http://localhost:5182) to view it in your browser.

## Running the web application

1. **Open the Terminal or Command Prompt**: Navigate to the directory where your web app folder is located.
2. **Start app**: Run the command `npm start` to start the web app.
3. **Open app**: [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.

## Deliverables

| Deliverable | Class | Date | Status | Grade |
|---|---|---|---|---|
| Blog | `ENGCIA` & `PPROGIA` | 8th week | `WIP` | 10% |
| Relatório prévio | `ENGCIA` & `PPROGIA` | 5th week | `delivered` | 15% |
| Relatório Final | `ENGCIA` & `PPROGIA` | November 3rd | `WIP`| 15% |
| Expert System | `ENGCIA` & `PPROGIA` | November 3rd | `WIP`| 50% |
| DemoDay Pitch | `ENGCIA` & `PPROGIA` | 8th week | `WIP` | 10% |
| Artigo Científico | `PPROGIA` | November 6th | `` | 30% |

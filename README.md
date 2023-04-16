Project Title: Decentralized Prediction Market with Automated dAPI Sponsor Wallet Funding

Description: The project aims to create a decentralized prediction market that allows users to create and participate in prediction markets on various events. The platform uses API3's decentralized API (dAPI) to fetch data from external sources and resolve the prediction markets. The dAPIs require regular funding to their sponsor wallets to function correctly. To ensure smooth operation, this project integrates with the Gelato decentralized automation platform to automate the funding process of multiple dAPI sponsor wallets. 

Run the project:
Run Scaffold-ETH instruction launch.md

Smart Contract Directory:
packages/hardhat/contracts

Key Features: 

* Decentralized Prediction Market: Users can create new prediction markets on any topic or event and participate in 
existing ones by placing bets on the outcome. The smart contract handles all the necessary operations, such as creating new markets, tracking participants' bets, and distributing rewards based on the market outcome. 

* API3 dAPI Integration: The platform uses API3's decentralized APIs (dAPIs) to fetch reliable data from external sources, such as the outcomes of sports events, election results, or financial data. The decentralized nature of dAPIs ensures data integrity and reduces the risk of manipulation. 

* Automated dAPI Sponsor Wallet Funding: dAPIs require regular funding to their sponsor wallets to function. This project integrates with the Gelato decentralized automation platform to automate the funding process of multiple dAPI sponsor wallets, ensuring uninterrupted access to dAPIs. 

* Customizable Parameters: The project allows the prediction market creator to define parameters such as minimum balance and funding amount for the dAPI sponsor wallets. These parameters can be adjusted to ensure the optimal functioning of the platform. 

* Modular Design: The project is designed with a modular approach, making it easier to integrate new features or modify existing ones. The separation of concerns in the smart contracts ensures a clean and maintainable codebase. 

Project Structure: 
* PredictionMarket.sol: The main smart contract implementing the prediction market functionality, including creating new markets, placing bets, and distributing rewards. 

* Automation.sol: The smart contract responsible for automating the funding process of multiple dAPI sponsor wallets using the Gelato platform. 

* AutomateReady.sol: A utility contract that ensures the compatibility of the Automation contract with the Gelato platform. 

* Hardhat deployment script: A script to deploy the smart contracts to the desired blockchain network. 

The project leverages the power of decentralized APIs and automation to create a robust and user-friendly prediction market platform. The integration with Gelato ensures the continuous operation of the dAPIs, enhancing the overall reliability and performance of the platform.

In this decentralized prediction market project, there are three primary smart contracts: PredictionMarket, Automation, and AutomateReady. These smart contracts interact with each other, off-chain data sources, and the Gelato automation platform to enable a seamless and reliable user experience. Here's how they interact with each other and off-chain sources:

PredictionMarket.sol:
    This smart contract is the core of the prediction market platform. It handles the creation of new prediction markets, tracks user bets, and resolves markets based on the outcomes fetched from off-chain data sources.
Interaction with off-chain sources:

The PredictionMarket contract uses API3's decentralized APIs (dAPIs) to fetch data from external sources. These dAPIs communicate with off-chain data providers in a decentralized manner, ensuring data integrity and reducing the risk of manipulation.
When a prediction market is resolved, the contract calls the dAPI to get the outcome of the event. The dAPI returns the data, and the PredictionMarket contract uses this information to resolve the market and distribute rewards to the winning participants.
Automation.sol:
This smart contract is responsible for automating the funding process of multiple dAPI sponsor wallets using the Gelato platform. These wallets need regular funding to ensure uninterrupted access to dAPIs.
Interaction with other smart contracts:

The Automation contract inherits from AutomateReady.sol to ensure compatibility with the Gelato platform.
The contract holds the addresses of dAPI sponsor wallets and checks their balances periodically. If any wallet's balance falls below the defined minimum balance, the contract sends funds to those wallets.

AutomateReady.sol:
This utility contract provides the necessary functions and modifiers to ensure that the Automation contract is compatible with the Gelato platform.
Interaction with other smart contracts:

The AutomateReady contract is inherited by the Automation contract, providing it with the required functions and modifiers to interact with the Gelato platform.
Interaction with the Gelato platform:

The AutomateReady.sol contract includes the necessary functions to register, execute, and cancel tasks on the Gelato platform.
When the Automation contract is deployed, it registers a task on the Gelato platform to periodically check the dAPI sponsor wallet balances and fund them if necessary. The Gelato platform will execute the registered task at the defined intervals, automating the funding process.
In summary, the PredictionMarket contract fetches off-chain data using dAPIs, while the Automation contract ensures the smooth operation of dAPIs by automating their sponsor wallet funding process through the Gelato platform. The AutomateReady contract provides the necessary compatibility between the Automation contract and the Gelato platform.
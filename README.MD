Repro for the smart contracts

The following assumptions were made/discussed by vlad and me regarding the contracts and how they work:

Once you publish a paper, we create a new address and deploy the smart contract.
We add the authors to the contract. For now, authors may get added to the contract at any point, but can't be removed. Only the creator of the contract can add authors (which is always us).
If a transaction is sent to the wallet (--> someone bought the paper), it will split it equally to each of the authors after 'our' deduction was made
For now, the share is just written into the contract as well as a 5 digit integer of OUR share, so 51000 = 51.000% of the money goes to us


Things to consider when working with smart contracts:
To my knowledge, you have to use a second contract in order to add the authors, since you can't really call the contract to modify them by sending a transaction
Data storage is _really_ expensive. Almost a Cent per KB, this is something we need to keep in mind
I'm not yet sure how we should set the gas prices and limits, depends on the market. 
Solidity doesn't use floats, so the division of the funds needs some more thinking to ensure I didn't brainfart
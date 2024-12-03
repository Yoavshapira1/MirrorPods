Attempts to fulfill a model AI for regression (recover parameters of the minimum jerk curves),
atm only the classification task (determine how many sub movements there are) is fulfilled in a good accuracy.

The project is entirely PyTorch-based. 

## Content:
`SubMovNN.ipynb`: Notebook contains the project implementation. The notebook is pretty documented, open it with Jupyter and try it out.

`Dataset`: Directory contains the small dataset we generated (10,000 examples for each possible amount of sub movements).
The models were actually trained on the **Big** dataset (100,000 examples for each amount), that is too big for GitHub. Please contact Jason Friedman to retrieve it. 
However - you can always generate a new one, it takes a couple of hours with GPU.

`models`: The models we played around with. Please read the Notebook for more information.
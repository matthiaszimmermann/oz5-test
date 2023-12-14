# OpenZeppelin v5 Tests

## Install Foundry

```bash
curl -L https://foundry.paradigm.xyz | bash
source /Users/matthiaszimmermann/.zshenv
foundryup
```

## Add OpenZeppelin v5

```bash
forge install oz500=OpenZeppelin/openzeppelin-contracts@v5.0.0
```

Add file `remappings.txt` to project home 

```
@openzeppelin/contracts/=lib/oz500/contracts/
```


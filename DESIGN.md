# Design

## Models

### Wallet

Since the central theme of the app is money transfer, `Wallet` takes a central stage.
`Wallet` has columns denoting the identity of the person/team/stock owning it.

We opt to not create entities (person/team/stock etc) explicitly for simplicity reason.
Adding them is straightforward.

### Transaction

A `Transaction` records a money transfer between a source `Wallet` and a destination
`Wallet`.To ease the calculation of `balance_at` a given time, it also holds the
`cumulative_balance` of both the source and the destination `Wallet`.

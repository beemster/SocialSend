# Staking

For every amount of coins your wallet contains it will get a reward.

Based on the current balance between the number of Stakers and Masternodes the reward will be calculated as following.

COIN_AMOUNT: Balance of your wallet
STAKE_PERCENTAGE: percentage of stakers in the network at current block/difficulty
MN_PERCENTAGE: percentage of stakers in the network at current block/difficulty

( STAKE_PERCENTAGE of COIN_AMOUNT ) = YEARLY_REWARD

DAILY_REWARD = YEARLY_REWARD

The DAILY_REWARD will be paid out per block of 7 SEND, when the DAILY_REWARD is less than 7 SEND it will be paid out over more than 1 day.


## Example:
COIN_AMOUNT: 10000 SEND
STAKE_PERCENTAGE: 80
MN_PERCENTAGE: 20

YEARLY_REWARD = 9000 * 0.80 = 7200 SEND
DAILY_REWARD = 7200 / 365 = 19.73 SEND


You can find a SEND rewards table with percentages at following url
https://docs.google.com/spreadsheets/d/e/2PACX-1vTB2dKDCc8rsotlbDGe7wKL3JLqZR9nWkqWJgmyGp_PJv7lUxMqWr9luJIbL1TSCzxqIKlkxpVsLt1C/pubhtml

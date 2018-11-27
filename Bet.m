function [p_bet] = Bet(p_chips)
p_bet = input('\nPlease enter a bet greater than 10 chips: ');
while (p_bet < 10 && p_bet > 0) || p_chips<p_bet
    p_bet=input('\nBet must be greater than 10 and less than your total: ');
end
if p_bet<0
    p_bet = 0;
end

function [p_bet] = Bet(p_chips)

%if player doesnt enter min bet
p_bet = input('\nPlease place your bet. (To cashout, bet 0): ');
while (p_bet < 10 && p_bet > 0) || p_chips<p_bet
    
    %if player bet more than they have
    p_bet=input('Bet must be greater than 10 and less than your total: ');
end

%if player wants to quit
if p_bet<0
    p_bet = 0;
end

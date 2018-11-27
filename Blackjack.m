clc;
clear;
p_chips= 1000;
fprintf(['You have ' num2str(p_chips) ' chips right now. \n']);
cont = 0;
while cont == 0
result = 0;
[bet] = Bet(p_chips);
if bet == 0
    cont = 2;
    fprintf('Quitting Blackjack... \n');
    fprintf(['You cashed out with ' num2str(p_chips) ' chips. \n']);
end
if cont == 0
fprintf('\n');
[card1] = Deck();
[card2] = Deck();
[card3] = Deck();
phand = ['You were delt: ', card1, ' and ', card2,'\n'];
fprintf(phand);
dhand = ['The dealer has: ', card3,'\n'];
fprintf(dhand);
[C1] = Values(card1);
[C2] = Values(card2);
[C3] = Values(card3);
if (C1 + C2) == 22
    C1 = C1 - 10;
end
pTotal = C1 + C2;
choice = 'h';
if pTotal == 21
    fprintf('You got a blackjack! You win! \n')
    result = 4;
    choice = 's';
end
while choice == 'h'
    choice = input('Hit or Stand? h/s): ', 's');
    while choice ~= 'h' && choice ~= 's'
        choice = input('Hit or Stand? (h/s): ', 's');
    end
    if choice == 'h'
        [card4] = Deck();
        hand = ['You were delt: ', card4,'\n'];
        fprintf(hand);
        [C4] = Values(card4);
        if (pTotal + C4) > 21
            if C4 == 11
                C4 = 1;
                if (pTotal + C4) > 21
                    if C2 == 11
                        C2 = C2 - 10;
                        pTotal = pTotal - 10;
                    elseif C1 == 11
                        C1 = C1 - 10;
                        pTotal = pTotal - 10;
                    end
                end
            elseif C2 == 11
                C2 = 1;
                pTotal = pTotal - 10;
            elseif C1 == 11
                C1 = 1;
                pTotal = pTotal - 10;
            end
        end
        pTotal = (pTotal + C4);
        if pTotal > 21
            choice = 's';
            fprintf('You went over 21, you busted. You lost. \n')
            result = 2;
        end
    end
end
fprintf('\n')
if result == 0
    [card5] = Deck();
    dHand = ['The face down card the dealer had: ', card5,'\n'];
    fprintf(dHand);
    [C5] = Values(card5);
    if (C3 + C5) == 22
        C3 = C3 - 10;
    end
    dTotal = (C3 + C5);
    while dTotal < 17
        [card6] = Deck();
        dHand = ['Dealer was delt: ', card6,'\n'];
        fprintf(dHand);
        [C6] = Values(card6);
        if (dTotal + C6) > 21
            if C6 == 11
                C6 = 1;
                if (dTotal + C6) > 21
                    if C5 == 11
                        C5 = C5 - 10;
                        dTotal = dTotal - 10;
                    elseif C3 == 11
                        C3 = C3 - 10;
                        dTotal = dTotal - 10;
                    end
                end
            elseif C5 == 11
                C5 = 1;
                dTotal = dTotal - 10;
            elseif C3 == 11
                C3 = 1;
                dTotal = dTotal - 10;
            end
        end
        dTotal = (dTotal + C6);
        if dTotal > 21
            fprintf('Dealer busted. You Win! \n');
            result = 1;
        end
    end
    if result == 0
        if dTotal > pTotal
            fprintf('You lose. \n')
            result = 2;
        elseif pTotal > dTotal
            fprintf('You win! \n')
            result = 1;
        elseif pTotal == dTotal
            fprintf('You split. \n')
            result = 3;
        end
    end
end
if result == 1
    p_chips = p_chips+bet;
elseif result == 2
    p_chips = p_chips-bet;

elseif result == 4
    p_chips = p_chips+(1.5*bet);
end
fprintf(['You now have ' num2str(p_chips)],'\n');
[game] = WinLoss(p_chips);

if game == 1
    cont = 2;
elseif game == 2
    cont = 2;
    
end
end
end

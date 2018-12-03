clc;
clear;

%player initial chip count
p_chips= 1000;
fprintf(['You have ' num2str(p_chips) ' chips right now. \n']);

cont = 0;
while cont == 0
result = 0;

%bet for this hand
[bet] = Bet(p_chips);
if bet == 0
    cont = 2;
    fprintf('Quitting Blackjack... \n');
    fprintf(['You cashed out with ' num2str(p_chips) ' chips. \n']);
end
if cont == 0
fprintf('\n');

%deals cards
[card1] = Deck();
[card2] = Deck();
[card3] = Deck();

%prints dealer and player hands
phand = ['You were delt: ', card1, ' and ', card2,'\n'];
fprintf(phand);
dhand = ['The dealer has: ', card3,'\n'];
fprintf(dhand);

%determines the value of cards
[C1] = Values(card1);
[C2] = Values(card2);
[C3] = Values(card3);
if (C1 + C2) == 22
    C1 = C1 - 10;
end
pTotal = C1 + C2;
choice = 'h';

%if dealt BJ, win
if pTotal == 21
    fprintf('You got a blackjack! You win! \n')
    result = 4;
    choice = 's';
end

%player chooses to hit or stand
while choice == 'h'
    choice = input('Hit or Stand? h/s): ', 's');
    while choice ~= 'h' && choice ~= 's'
        choice = input('Hit or Stand? (h/s): ', 's');
    end

%if player hits
    if choice == 'h'
        [card4] = Deck();
        hand = ['You were delt: ', card4,'\n'];
        fprintf(hand);
        [C4] = Values(card4);

%Ace should be 1 or 11
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

%if the player went over 
        pTotal = (pTotal + C4);
        if pTotal > 21
            choice = 's';
            fprintf('You went over 21, you busted. You lost. \n')
            result = 2;
        end
    end
end
fprintf('\n')

%if player stood, dealers turn
if result == 0
    [card5] = Deck();

%prints dealers hand
    dHand = ['The face down card the dealer had: ', card5,'\n'];
    fprintf(dHand);

%determines dealers hand value
    [C5] = Values(card5);
    if (C3 + C5) == 22
        C3 = C3 - 10;
    end
    dTotal = (C3 + C5);

%dealer has to hit if less than 17
    while dTotal < 17
        [card6] = Deck();
        dHand = ['Dealer was delt: ', card6,'\n'];
        fprintf(dHand);
        [C6] = Values(card6);

%determines whether or not Ace should be 1 or 11
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
        
%determines if dealer busted
        dTotal = (dTotal + C6);
        if dTotal > 21
            fprintf('Dealer busted. You Win! \n');
            result = 1;
        end
    end

%determines which result should be printed
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

%determines players new chip count
if result == 1
    p_chips = p_chips+bet;
elseif result == 2
    p_chips = p_chips-bet;
elseif result == 3
  p_chips = p_chips;
elseif result == 4
    p_chips = p_chips+(1.5*bet);
end

%prints players new chip count
fprintf(['You now have ' num2str(p_chips)],'\n');
[game] = WinLoss(p_chips);

if game == 1
    cont = 2;
elseif game == 2
    cont = 2;
    
end
end
end

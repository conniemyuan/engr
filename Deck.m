function [str] = Deck()
deck = [1:52];
i = randperm(52);
deck = deck(i);

%creates the 4 suites
if (deck(1) <= 13)
    suit = ' Hearts';
elseif (deck(1)>13 && deck(1)<=26)
    suit = ' Diamonds';
elseif (deck(1)>26 && deck(1)<=39)
    suit = ' Clubs';
elseif (deck(1)>39)
    suit = ' Spades';
end

while deck(1) > 13
    deck(1) = deck(1) -13;
end

%defines face cards, Ace, and Tens
if deck(1) == 1
    deck(1) = 'A';
elseif deck(1) == 11
    deck(1) = 'J';
elseif deck(1) == 12
    deck(1) = 'Q';
elseif deck(1) == 13
    deck(1) = 'K';
elseif deck(1) == 10
    deck(1) = 'T';
end

%string for special cards
if deck(1) == 'A' || deck(1) == 'K' || deck(1) == 'Q' || deck(1) == 'J' || deck(1) == 'T'
    str = [deck(1), suit];
    
    %string for rest of cards
else
    str = [num2str(deck(1)), suit];
end
end

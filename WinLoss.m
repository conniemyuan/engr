function [game] = WinLoss(p_chips)
game = 0;

%player loses all chips
if p_chips < 10
    fprintf('You Lost All Your Chips: GAME OVER');
    game = 1;

%player gets over 100000 chips they win
    elseif p_chips >= 100000
      fprintf('\nYou Won All the Chips: CONGRATS');
      game = 2;
    end
end
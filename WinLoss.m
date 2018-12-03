function [game] = WinLoss(p_chips)
game = 0;
if p_chips < 10
    disp('\nYou Lost All Your Chips: GAME OVER');
    game = 1;
    elseif p_chips >= 1000000
      disp('\nYou Won All the Chips: CONGRATS');
      game = 2;
    end
end

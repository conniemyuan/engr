function [game] = WinLoss(p_chips)
game = 0;

%player loses all chips
if p_chips < 10
    fprintf('\nYou lost All your chips: GAME OVER');
    game = 1;

%player gets over 100000 chips they win
elseif p_chips >= 1000000
      fprintf('\nYour a millionaire: CONGRATS');
      game = 2;
    end
end

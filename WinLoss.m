function [game] = WinLoss(p_chips)
game = 0;

%player loses all chips
if p_chips < 10
    fprintf('\nYou lost All your chips: PLEASE LEAVE');
    game = 1;
    
    %player gets over 10000000 chips they win
elseif p_chips >= 10000000
    fprintf(['\nYou reached ' num2str(p_chips) ' chips!']);
    fprintf('\nYour a millionaire! Now you need to leave.');
    game = 2;
end
end

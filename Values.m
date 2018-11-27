function [value] = Values(card)
CNum = card(1);
if CNum == 'T'
    value = 10;
elseif CNum == 'A'
    value = 11;
elseif CNum == 'K'
    value = 10;
elseif CNum == 'Q'
    value = 10;
elseif CNum == 'J'
    value = 10;
    else
      value = str2double(CNum);
    end
end

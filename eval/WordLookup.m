function index = WordLookup(InputString)
global searchmap
if searchmap.isKey(InputString)
    index = searchmap(InputString);
elseif searchmap.isKey('<unk>')
    index = searchmap('<unk>');
else
    index = 0;
end

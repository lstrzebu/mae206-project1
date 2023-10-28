

dat = readcell("MAE_206_Project1_Results.csv");

datNew = dat{1};

datFinal = zeros(round(numel(datNew)/11), 12);

for k = 1:numel(datNew)
    for c = 1:12
        datFinal(k, c) = datNew(c);
    end
end
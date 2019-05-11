datamat=zeros(42,4); % data matrix to store features
for k=1:42
    filename=['s' num2str(k) '.wav'];
    [my2,fs] = audioread(filename);%Reading the files
    [zero_crossing,short_energy]=Charac_features(my2,fs);%Finding features
    %Storing features in the data matrix
    datamat(k,1)=k;
    %datamat(k,2)=m;
    datamat(k,3)=zero_crossing;
    datamat(k,2)=short_energy;
    %datamat(k,4)=v;
end
datamat(:,4) = ['M', 'F', 'M', 'M', 'M', 'M', 'M', 'F', 'F', 'M', 'F', 'M', 'F', 'M', 'F', 'M', 'F', 'M', 'F', 'M', 'F', 'F', 'M', 'M', 'F', 'F', 'M', 'M', 'M', 'M', 'M', 'M', 'F', 'F', 'F', 'F', 'M', 'F', 'M', 'M', 'M', 'M'];
testmat=zeros(12,4);
for i = 1:12
filename=['t' num2str(i) '.wav'];
[my2,fs] = audioread(filename);%Reading the files
[zero_crossing,short_energy]=Charac_features(my2,fs);
testmat(i,1)=i;
testmat(i,2)=short_energy;
testmat(i,3)=zero_crossing;
end
testmat(:,4)=['M', 'M', 'M', 'F', 'M', 'M', 'M', 'F', 'F', 'F', 'M', 'M'];

train_target = datamat(:, end);
test_target = testmat(:, end);
train_data = datamat(:, 1: end-1);
test_data = testmat(:, 1: end-1);

k = 9;

[classification_accuracy] = knn(train_data, test_data, train_target, test_target, k)

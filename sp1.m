datamat=zeros(11,4); % data matrix to store features
for k=1:11
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
datamat(:,4) = ['M', 'F', 'M', 'M', 'M', 'M', 'M', 'F', 'F', 'M', 'F'];
% testmatzeros(1,4);
filename=['s2.wav'];
[my2,fs] = audioread(filename);%Reading the files
[zero_crossing,short_energy]=Charac_features(my2,fs);
testmat(k,1)=k;
testmat(k,2)=short_energy;
testmat(k,3)=zero_crossing;
testmat(k,4)='F';

train_target = datamat(:, end);
test_target = testmat(:, end);
train_data = datamat(:, 1: end-1);
test_data = testmat(:, 1: end-1);

k = 2;

[classification_accuracy] = knn(train_data, test_data, train_target, test_target, k)
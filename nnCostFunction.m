function [J grad] = nnCostFunction(nn_params, input_layer_size, ...
                          hidden_layer_size, num_labels, X, y, lambda)

    input_layer_size = size(X,2);
    hidden_layer_size = size(y,2);
    Y = dummyvar(y);



    Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
    
    Theta2 = reshape(nn_params(1+(hidden_layer_size * (input_layer_size + 1))):1+2*(hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
     x = 1+2*hidden_layer_size*(input_layer_size + 1);
    Theta3 = reshape(nn_params(x:end), num_labels, hidden_layer_size + 1);
 




    m = size(X, 1);
    J = 0;
    Theta1_grad = zeros(size(Theta1));
    Theta2_grad = zeros(size(Theta2));
    Theta3_grad = zeros(size(Theta3));


    a1 = [ones(m, 1) X]; % add 1
    z2 = a1 * Theta1';
    a2 = sigmoid(z2);
    A2 = [ones(size(sigmoid(z2), 1), 1) sigmoid(z2)]; % add 1
    z3 = A2 * Theta2';
    a3 = sigmoid(z3); % H_theta(x)
    A3 = [ones(size(a3,1),1) a3];
    z4 = A3*Theta3';
    a4  = signoid(z4);


Y = dummyvar(y);

J = sum(sum(-1.*Y.*log(a4)-(1-Y).*log(1-a4),2))/m;

reg = (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2)) + sum(sum(Theta3(:,2:end).^2)))*lambda/(2*m);
J = J+reg;


delta4 = a4 - Y;

Theta3_grad = Theta3_grad + (delta4'*A3)/m;
delta3 = delta4*Theta3(:,2:end).*sigmoidGradient(Z3);

Theta2_grad = Theta2_grad + (delta3'*A2)/m;
delta2 = delta3*Theta2(:,2:end).*sigmoidGradient(Z2);

Theta1_grad = Theta1_grad+(delta2'*X)/m;





Theta1_grad(:,2:end) = Theta1_grad(:,2:end) + lambda*Theta1(:,2:end)/m;
Theta2_grad(:,2:end) = Theta2_grad(:,2:end) + lambda*Theta2(:,2:end)/m;
Theta3_grad(:,2:end) = Theta3_grad(:,2:end) + lambda*Theta3(:,2:end)/m;


grad = [Theta1_grad(:) ; Theta2_grad(:) ; Theta3_grad(:)];


end













    

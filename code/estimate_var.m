function [ mean, var ] = estimate_var( old_mean, old_var, new_elem, iteration )
%     mean = old_mean + (new_elem - old_mean) ./ iteration;
%     M2 = old_M2 + (new_elem - old_mean) .* (new_elem - mean);

    mean = old_mean + (new_elem - old_mean) ./ iteration;
%     var = ((iteration - 1) .* old_var + (new_elem - old_mean) .* (new_elem - mean)) / iteration;
    if(iteration < 2)
        var = old_var;
    else
        var = (iteration - 2) / (iteration - 1) .* old_var + (new_elem - old_mean).^2 ./ iteration;
    end
end


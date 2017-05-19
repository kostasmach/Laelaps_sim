function [NFR, FFR, NHR, FHR, NFL, FFL, NHL, FHL, ...
    slipFR, slipHR, slipFL, slipHL] = ground_forces( ...
    yFRf, yHRf, yFLf, yHLf, xFRfdot, yFRfdot, xHRfdot, ...
    yHRfdot, xFLfdot, yFLfdot, xHLfdot, yHLfdot)

global k_ground b_ground
global mu_d mu_s slip_error friction_velocity

%-------------------------------------------------------------------------%
% Normal forces from the ground
%-------------------------------------------------------------------------%
% Fore Right foot
%-------------------------------------------------------------------------%
% Flight phase
if yFRf > 0 
    NFR = 0;
% Stance phase
else 
    NFR = k_ground*abs(yFRf)^1.5 - b_ground*yFRfdot*abs(yFRf)^1.5;
end

%-------------------------------------------------------------------------%
% Hind Right foot
%-------------------------------------------------------------------------%
% Flight phase
if yHRf > 0 
    NHR = 0;
% Stance phase
else 
    NHR = k_ground*abs(yHRf)^1.5 - b_ground*yHRfdot*abs(yHRf)^1.5;
end

%-------------------------------------------------------------------------%
% Fore Left foot
%-------------------------------------------------------------------------%
% Flight phase
if yFLf > 0 
    NFL = 0;
% Stance phase
else 
    NFL = k_ground*abs(yFLf)^1.5 - b_ground*yFLfdot*abs(yFLf)^1.5;
end

%-------------------------------------------------------------------------%
% Hind Left foot
%-------------------------------------------------------------------------%
% Flight phase
if yHLf > 0 
    NHL = 0;
% Stance phase
else 
    NHL = k_ground*abs(yHLf)^1.5 - b_ground*yHLfdot*abs(yHLf)^1.5;
end


%-------------------------------------------------------------------------%
% Frictional forces
%-------------------------------------------------------------------------%
% Fore Right foot
%-------------------------------------------------------------------------%
% Flight phase
if yFRf > 0
    FFR = 0;
    slipFR  = -1; % indicating slipping in stance phase; no meaning here
% Stance phase
else
    % Calculate slip and stick friction forces
    Fstatic = mu_s * NFR;
    Fslip   = mu_d * NFR;
    
    % Determine stick/slip
    if abs(xFRfdot) <= slip_error % Friction zero crossing
        slipFR  = 0; % stick
        FFR = -sign(xFRfdot)*abs(xFRfdot)*(Fstatic/slip_error);
    else
        slipFR  = 1; % slip
        FFR = -sign(xFRfdot)*Fslip - sign(xFRfdot)* ...
            (Fstatic-Fslip)*exp(-abs(xFRfdot/friction_velocity));
    end
 
end

%-------------------------------------------------------------------------%
% Hind Right foot
%-------------------------------------------------------------------------%
% Flight phase
if yHRf > 0
    FHR = 0;
    slipHR  = -1; % indicating slipping in stance phase; no meaning here
% Stance phase
else
    % Calculate slip and stick friction forces
    Fstatic = mu_s * NHR;
    Fslip   = mu_d * NHR;
    
    % Determine stick/slip
    if abs(xHRfdot) <= slip_error % Friction zero crossing
        slipHR  = 0; % stick
        FHR = -sign(xHRfdot)*abs(xHRfdot)*(Fstatic/slip_error);        
    else
        slipHR  = 1; % slip
        FHR = -sign(xHRfdot)*Fslip - sign(xHRfdot)* ...
            (Fstatic-Fslip)*exp(-abs(xHRfdot/friction_velocity));        
    end
end

    
%-------------------------------------------------------------------------%
% Fore Left foot
%-------------------------------------------------------------------------%
% Flight phase
if yFLf > 0
    FFL = 0;
    slipFL  = -1; % indicating slipping in stance phase; no meaning here
% Stance phase
else
    % Calculate slip and stick friction forces
    Fstatic = mu_s * NFL;
    Fslip   = mu_d * NFL;
    
    % Determine stick/slip
    if abs(xFLfdot) <= slip_error % Friction zero crossing
        slipFL  = 0; % stick
        FFL = -sign(xFLfdot)*abs(xFLfdot)*(Fstatic/slip_error);        
    else
        slipFL  = 1; % slip
        FFL = -sign(xFLfdot)*Fslip - sign(xFLfdot)* ...
            (Fstatic-Fslip)*exp(-abs(xFLfdot/friction_velocity));        
    end  
end

%-------------------------------------------------------------------------%
% Hind Left foot
%-------------------------------------------------------------------------%
% Flight phase
if yHLf > 0
    FHL = 0;
    slipHL  = -1; % indicating slipping in stance phase; no meaning here
% Stance phase
else
    % Calculate slip and stick friction forces
    Fstatic = mu_s * NHL;
    Fslip   = mu_d * NHL;
    
    % Determine stick/slip
    if abs(xHLfdot) <= slip_error % Friction zero crossing
        slipHL  = 0; % stick
        FHL = -sign(xHLfdot)*abs(xHLfdot)*(Fstatic/slip_error);        
    else
        slipHL  = 1; % slip
        FHL = -sign(xHLfdot)*Fslip - sign(xHLfdot)* ...
            (Fstatic-Fslip)*exp(-abs(xHLfdot/friction_velocity));        
    end
end


end


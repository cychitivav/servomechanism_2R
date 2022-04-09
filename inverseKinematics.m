function varargout = inverseKinematics(varargin)
% INVERSEKINEMATICS  Calculates the inverse kinematics for a 2 DOF two-link 
% serial mechanism based on the Euclidean position of the endpoint of its 
% second link. The first link is of length L1 and the second L2.
%
%   theta = inverseKinematics(P) returns a vector with the angular position 
%   of each revolute joint in the mechanism.
%
%   [theta_1,theta_2] = inverseKinematics(x,y) returns the angular position 
%   of each revolute joint in the mechanism.
%
%   [...] = inverseKinematics(...,L1,L2) change the default values of the 
%   lengths L1 and L2.
%
%   See also directKinematics.

%% Assumption
    L1 = 30;
    L2 = 20;
%% Inputs
    if nargin == 1
        x = varargin{1}(1);
        y = varargin{1}(2);
    elseif nargin == 2
        x = varargin{1};
        y = varargin{2};
    elseif nargin == 3
        L1 = varargin{2};
        L2 = varargin{3};
    elseif nargin == 4
        L1 = varargin{3};
        L2 = varargin{4};
    else
        error('Bad number of input arguments.')
    end 
 %% Computations
    L = sqrt(x^2+y^2);
    alpha = atan2(y,x);

    theta = [alpha-acos(-(L2^2-L^2-L1^2)/(2*L*L1)), ... 
                   acos((L^2-L1^2-L2^2)/(2*L1*L2))];
%% Outputs
    if nargout == 1 || nargout == 0
        varargout{1} = theta;
    elseif nargout == 2
        varargout{1} = theta(1);
        varargout{2} = theta(2);
    else
        error('Bad number of output arguments.')
    end
end
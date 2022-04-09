function varargout = forwardKinematics(varargin)
% FORWARDKINEMATICS  Calculates the direct kinematics for a 2 DOF two-link 
% serial mechanism based on the angular position of its two joints of 
% revolution. The first link is of length L1 and the second L2.
%
%   [x,y] = forwardKinematics(theta_1,theta_2) returns the position in x and
%   y of the tip of the second link with respect to the initial revolution
%   joint.
%
%   P = forwardKinematics(theta) returns the position vector of 
%   the tip of the second link with respect to the initial revolution 
%   joint.
%
%   [...] = forwardKinematics(...,L1,L2) change the default values of the 
%   lengths L1 and L2.
%
%   See also inverseKinematics.

%% Assumption
    L1 = 30;
    L2 = 20;
%% Inputs
    if nargin == 1
        theta = varargin{1};
    elseif nargin == 2
        theta(1) = varargin{1};
        theta(2) = varargin{2};
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
    x = L2*cos(theta(1) + theta(2)) + L1*cos(theta(1));
    y = L2*sin(theta(1) + theta(2)) + L1*sin(theta(1));
%% Outputs
    if nargout == 1 || nargout == 0
        varargout{1} = [x,y]';
    elseif nargout == 2
        varargout{1} = x;
        varargout{2} = y;
    else
        error('Bad number of output arguments.')
    end
end
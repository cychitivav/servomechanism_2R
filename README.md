# Academic project Servomechanisms
This repository contains the development and execution of an academic project for the servomechanisms class, which consists of the design and validation in simulation of a 2R mechanism controlled to follow a 4-leaf stylized cloverleaf trajectory.

<p align="center">
    <img src="https://user-images.githubusercontent.com/30636259/162853501-dc5d82a1-a1a8-400b-a79d-732aa4fc7b76.png#gh-light-mode-only" width="450px">
    <img src="https://user-images.githubusercontent.com/30636259/162853672-40be02ba-91de-41b1-a5ad-18836164fe8d.png#gh-dark-mode-only" width="450px">
</p>

### Requirements
* One fixed base and two movable links. The movement must be in a vertical plane.
* Two motorized joints, both of Rotational (R) type.
* The test trajectory is measured at the distal end of the second link. The trajectory has the shape of a "four-leaf clover with stylized outline", as shown in the previous figure. For the case $L_{min}=15\ cm$.
* The desired trajectory and the path should be plotted from a computer, preferably in real time and should allow for scaling up to a factor of $1.3$ and rotation of $\pm90\degree$.
* At the start of the movement the mechanism (retracted) should be at most half the height of the "Stylized Clover" and to the left of the square in which it is circumscribed.
* The speed with which the trajectory is traversed is assumed to be constant. It is considered to be between $1\frac{cm}{s}$ and $10\frac{cm}{s}$.
* After an approach stage, the servomechanism should automatically follow the motion profiles by traversing the stylized clover for several cycles (up to 10) in a fast and precise way.

## Models
### Motor DC model
Considering the following dc motor model with fixed magnetic field (coil generated or with permanent magnet).

<p align="center">
    <img src="https://user-images.githubusercontent.com/30636259/173662956-409c41c4-61ee-4e02-92d1-ba1f6c51ae15.png#gh-light-mode-only" width="450px">
    <img src="https://user-images.githubusercontent.com/30636259/173663592-17c5418c-9343-4560-9dd9-1bbcb1713482.png#gh-dark-mode-only" width="450px">
</p>

This model is derived from physical principles

1. Newton's second law

$$
\begin{gather*}
    J\ddot{\theta}=-B\dot{\theta}+\tau
\end{gather*}
$$

2. 's law ($\phi=kte$)

$$
\begin{align*}
\tau\propto \phi k i_a\\
\tau=k_Ti_a
\end{align*}
$$

3. Kirchhoff's current law

$$
\begin{gather*}
    v_a=v_{R_a}+v_{L_a} +v_b\\
    v_b=i_aR_a+L_a\frac{d i_a}{dt}+v_b
\end{gather*}
$$

4. 's law

$$
\begin{gather*}
    v_b=k_b\dot{\theta}
\end{gather*}
$$

Unifying these equations, the following block diagram can be obtained

<p align="center" id="wow">
    <img src="https://user-images.githubusercontent.com/30636259/173683483-58f27318-6cc3-46f2-b923-0b03c311c33f.png#gh-light-mode-only" width="650px">
    <img src="https://user-images.githubusercontent.com/30636259/173684281-2898111d-b016-4e8c-8e96-203d026c09da.png#gh-dark-mode-only" width="650px">
</p>


$$
\begin{gather*}	
    \frac{\dot{\Theta}(s)}{V_a(s)}=\frac{k_T}{JL_as^2+(JR_a+BL_a)s+(BR_a+k_Tk_b)}
\end{gather*}
$$

Considering the following model of a DC motor with fixed magnetic field (coil-generated or permanent magnet).

This model will be used for the mechanism motors, which will move each of the rotational joints to reach a required position.

##### Inertia
The inertia of second block is the motor inertia plus the inertia of the mechanism. To calculate the total inertia, we need to know the inertia of the motor (provided by manufacturer) and the inertia of the links.



#### Simulink model
The motors can be modeled with the Simulink `transfer fcn` block and the function described above, or another option is to use Simscape Driveline with a controlled dc source voltage and `DC motor` block.

<p align="center">
    <img src="https://user-images.githubusercontent.com/30636259/173686218-ad43c320-ca9e-4997-8aea-0f5dc6a56c1c.png" width="650px" />
</p>

### Mechanism model


## Calculations

### Kinematics
#### Forward kinematics

<img align="left" src="https://user-images.githubusercontent.com/30636259/169440221-a951fa06-f200-44b3-a0d2-cb431e0f23e0.png#gh-light-mode-only" width="400px">
<img align="left" src="https://user-images.githubusercontent.com/30636259/169439978-71cb8980-b337-49ab-bfa0-746d3433f0e3.png#gh-dark-mode-only" width="400px">

$$
\begin{gather*}
    \cos(\theta_i)=\frac{x_i}{L_i}\\
    \sin(\theta_i)=\frac{y_i}{L_i}
\end{gather*}
$$

Taking into account the above, the final end of the mechanism is in:

$$
\begin{gather*}
    x=x_1+x_2\\
    \boxed{x=L_1\cos(\theta_1)+L_2\cos(\theta_1-\theta_2)}
\end{gather*}
$$

$$
\begin{gather*}
    y=y_1+y_2\\
    \boxed{y=L_1\sin(\theta_1)+L_2\sin(\theta_1-\theta_2)}
\end{gather*}
$$

<br clear="all">

> The development of these equations is in the [forward kinematics function](forwardKinematics.m).

#### Inverse kinematics

<img align="left" src="https://user-images.githubusercontent.com/30636259/162852730-4edd24f3-1cd4-49e1-a7b3-b6c2f1de69ab.png#gh-light-mode-only" width="400px">
<img align="left" src="https://user-images.githubusercontent.com/30636259/162852792-12c7eb79-8c1f-40f1-bb90-877961caac28.png#gh-dark-mode-only" width="400px">

$$
\begin{gather*}
    L^2=x^2+y^2\\
    \alpha=\arctan2\left(\frac{y}{x}\right)
\end{gather*}
$$

Using the law of cosines, we find that:

$$
\begin{gather*}
    L^2=L_1^2+L_2^2-2L_1L_2\cos(\pi-\theta_2)\\
    L^2=L_1^2+L_2^2+2L_1L_2\cos(\theta_2)\\
    \boxed{\theta_2=-\arccos{\left(\frac{L^2-L_1^2-L_2^2}{2L_1L_2}\right)}}
\end{gather*}
$$

$$
\begin{gather*}
    L_2^2=L_1^2+L^2-2LL_1\cos(\alpha-\theta_1)\\
    \boxed{\theta_1=\alpha+\arccos\left(-\frac{L_2^2-L_1^2-L^2}{2L_1L}\right)}
\end{gather*}
$$

<br clear="all">

For this project only the elbow down configuration is considered, but an elbow up solution is not ruled out.

> The development of these equations is in the [inverse kinematics function](forwardKinematics.m).


## Simulations


## Acknowledgements
* [Prof. Victor Hugo Grisales](mailto:vhgrisalesp@unal.edu.co)
* **Contributors**:
    * [Juan Sebastian Rangel](mailto:jrangel@unal.edu.co)
    * [Ivanna Medina](mailto:imedinac@unal.edu.co)
    * [Camilo Upegui]()
    * [Daniel Cruz]()

## References

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
* The speed with which the trajectory is traversed is assumed to be constant. It is considered to be between $1\ cm/s$ and $10\ cm/s$.
* After an approach stage, the servomechanism should automatically follow the motion profiles by traversing the stylized clover for several cycles (up to 10) in a fast and precise way.

## Models

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
    \boxed{x=L_1\cos(\theta_1)+L_2\cos(\theta_1+\theta_2)}
\end{gather*}
$$

$$
\begin{gather*}
    y=y_1+y_2\\
    \boxed{y=L_1\sin(\theta_1)+L_2\sin(\theta_1+\theta_2)}
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
    \boxed{\theta_2=\arccos\left(\frac{L^2-L_1^2-L_2^2}{2L_1L_2}\right)}
\end{gather*}
$$

$$
\begin{gather*}
    L_2^2=L_1^2+L^2-2LL_1\cos(\alpha-\theta_1)\\
    \boxed{\theta_1=\alpha-\arccos\left(-\frac{L_2^2-L_1^2-L^2}{2L_1L}\right)}
\end{gather*}
$$

<br clear="all">

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

# Academic project Servomechanisms

<!-- Code for equations in readme(dark and light theme) -->
<!-- <div align="center">
    <img src="https://render.githubusercontent.com/render/math?math=#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}#gh-dark-mode-only">
</div> -->

In this repository is the development and execution of an academic project for the servomechanisms class, which consists of the design of a 2R mechanism with its controller to follow a stylized 4-leaf clover trajectory.

<p align="center">
    <img src="https://user-images.githubusercontent.com/30636259/162853501-dc5d82a1-a1a8-400b-a79d-732aa4fc7b76.png#gh-light-mode-only" width="500px">
    <img src="https://user-images.githubusercontent.com/30636259/162853672-40be02ba-91de-41b1-a5ad-18836164fe8d.png#gh-dark-mode-only" width="500px">
</p>

## Kinematics

### Forward kinematics

<img align="left" src="https://user-images.githubusercontent.com/30636259/169440221-a951fa06-f200-44b3-a0d2-cb431e0f23e0.png#gh-light-mode-only" width="500px">
<img align="left" src="https://user-images.githubusercontent.com/30636259/169439978-71cb8980-b337-49ab-bfa0-746d3433f0e3.png#gh-dark-mode-only" width="500px">

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

### Inverse kinematics

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

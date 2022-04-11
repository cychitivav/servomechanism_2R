# Academic project Servomechanisms

<!-- Code for equations in readme(dark and light theme) -->
<!-- <div align="center">
    <img src="https://render.githubusercontent.com/render/math?math=#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}#gh-dark-mode-only">
</div> -->

In this repository is the development and execution of an academic project for the servomechanisms class, which consists of the design of a 2R mechanism with its controller to follow a stylized 4-leaf clover trajectory.

<p align="center">
    <img src="https://user-images.githubusercontent.com/30636259/162853501-dc5d82a1-a1a8-400b-a79d-732aa4fc7b76.png#gh-light-mode-only" width="50%">
    <img src="https://user-images.githubusercontent.com/30636259/162853672-40be02ba-91de-41b1-a5ad-18836164fe8d.png#gh-dark-mode-only" width="50%">
</p>

## Kinematics

### Forward kinematics

<img align="left" src="https://user-images.githubusercontent.com/30636259/162853342-b16c023d-a1df-4db6-a581-ba26dc9f7edf.png#gh-light-mode-only" width="50%">
<img align="left" src="https://user-images.githubusercontent.com/30636259/162854336-6a8ddec8-bac3-440e-9ae9-44d7c8041ed7.png#gh-dark-mode-only" width="50%">

<!-- $$
\large
\cos(\theta_i)=\frac{x_i}{L_i}\\
\sin(\theta_i)=\frac{y_i}{L_i}
$$ -->
<div align="center">
    <img src="https://render.githubusercontent.com/render/math?math=\large\cos(\theta_i)=\frac{x_i}{L_i}#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}\large\cos(\theta_i)=\frac{x_i}{L_i}#gh-dark-mode-only"> 
    <br>
    <img src="https://render.githubusercontent.com/render/math?math=\large\sin(\theta_i)=\frac{y_i}{L_i}#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}\large\sin(\theta_i)=\frac{y_i}{L_i}#gh-dark-mode-only">
</div>

Taking into account the above, the final end of the mechanism is in:

<!-- $$
x=x_1+x_2\\
\boxed{x=L_1\cos(\theta_1)+L_2\cos(\theta_1+\theta_2)}
$$ -->
<div align="center">
    <img src="https://render.githubusercontent.com/render/math?math=x=x_1%2Bx_2#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}x=x_1%2Bx_2#gh-dark-mode-only">
    <br>
    <img src="https://render.githubusercontent.com/render/math?math=\boxed{x=L_1\cos(\theta_1)%2BL_2\cos(\theta_1%2B\theta_2)}#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}\boxed{x=L_1\cos(\theta_1)%2BL_2\cos(\theta_1%2B\theta_2)}#gh-dark-mode-only">
</div>

<!-- $$
y=y_1+y_2\\
\boxed{y=L_1\sin(\theta_1)+L_2\sin(\theta_1+\theta_2)}
$$ -->
<div align="center">
    <img src="https://render.githubusercontent.com/render/math?math=y=y_1%2By_2#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}y=y_1%2By_2#gh-dark-mode-only">
    <br>
    <img src="https://render.githubusercontent.com/render/math?math=\boxed{y=L_1\sin(\theta_1)%2BL_2\sin(\theta_1%2B\theta_2)}#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}\boxed{y=L_1\sin(\theta_1)%2BL_2\sin(\theta_1%2B\theta_2)}#gh-dark-mode-only">
</div>

<br clear="all">

> The development of these equations is in the [forward kinematics function](forwardKinematics.m).

### Inverse kinematics

<img align="left" src="https://user-images.githubusercontent.com/30636259/162852730-4edd24f3-1cd4-49e1-a7b3-b6c2f1de69ab.png#gh-light-mode-only" width="40%">
<img align="left" src="https://user-images.githubusercontent.com/30636259/162852792-12c7eb79-8c1f-40f1-bb90-877961caac28.png#gh-dark-mode-only" width="40%">

<!-- $$
\large
L^2=x^2+y^2\\
\alpha=\arctan2\left(\frac{y}{x}\right)
$$ -->
<div align="center">
    <img src="https://render.githubusercontent.com/render/math?math=\large%20L^2=x^2%2By^2#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}\large%20L^2=x^2%2By^2#gh-dark-mode-only">
    <br>
    <img src="https://render.githubusercontent.com/render/math?math=\large\alpha=\arctan2\left(\frac{y}{x}\right)#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}\large\alpha=\arctan2\left(\frac{y}{x}\right)#gh-dark-mode-only">
</div>
<br>

Using the law of cosines, we find that:

<!-- $$
L^2=L_1^2+L_2^2-2L_1L_2\cos(\pi-\theta_2)\\
L^2=L_1^2+L_2^2+2L_1L_2\cos(\theta_2)\\
\boxed{\theta_2=\arccos\left(\frac{L^2-L_1^2-L_2^2}{2L_1L_2}\right)}
$$ -->
<div align="center">
    <img src="https://render.githubusercontent.com/render/math?math=L^2=L_1^2%2BL_2^2-2L_1L_2\cos(\pi-\theta_2)#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}L^2=L_1^2%2BL_2^2-2L_1L_2\cos(\pi-\theta_2)#gh-dark-mode-only">
    <br>
    <img src="https://render.githubusercontent.com/render/math?math=L^2=L_1^2%2BL_2^2%2B2L_1L_2\cos(\theta_2)#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}L^2=L_1^2%2BL_2^2%2B2L_1L_2\cos(\theta_2)#gh-dark-mode-only">
    <br>
    <img src="https://render.githubusercontent.com/render/math?math=\boxed{\theta_2=\arccos\left(\frac{L^2-L_1^2-L_2^2}{2L_1L_2}\right)}#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}\boxed{\theta_2=\arccos\left(\frac{L^2-L_1^2-L_2^2}{2L_1L_2}\right)}#gh-dark-mode-only">
</div>

<br>

<!-- $$
L_2^2=L_1^2+L^2-2LL_1\cos(\alpha-\theta_1)\\
\boxed{\theta_1=\alpha-\arccos\left(-\frac{L_2^2-L_1^2-L^2}{2L_1L}\right)}
$$ -->
<div align="center">
    <img src="https://render.githubusercontent.com/render/math?math=L_2^2=L_1^2%2BL^2-2LL_1\cos(\alpha-\theta_1)#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}L_2^2=L_1^2%2BL^2-2LL_1\cos(\alpha-\theta_1)#gh-dark-mode-only">
    <br>
    <img src="https://render.githubusercontent.com/render/math?math=\boxed{\theta_1=\alpha-\arccos\left(-\frac{L_2^2-L_1^2-L^2}{2L_1L}\right)}#gh-light-mode-only">
    <img src="https://render.githubusercontent.com/render/math?math=\color{white}\boxed{\theta_1=\alpha-\arccos\left(-\frac{L_2^2-L_1^2-L^2}{2L_1L}\right)}#gh-dark-mode-only">
</div>

<br clear="all">

> The development of these equations is in the [inverse kinematics function](forwardKinematics.m).

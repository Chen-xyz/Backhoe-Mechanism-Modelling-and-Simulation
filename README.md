Backhoe Mechanism modelling and simulation project
=================

Table of contents
=================

<!--ts-->
* [Home](#Backhoe-Mechanism-modelling-and-simulation-project)
* [Introduction](#Introduction)
* [Assumptions and Specifications](#Assumptions-and-Specifications)
* [Modeling](#Modeling)
* [Apriori Analysis](#Apriori-Analysis)
* [Numerical solution](#Numerical-solution)
* [Result](#Result)
* [3D Model](#3D-Model)
<!--te-->

Introduction
=================

The main goal of this project is to create a model for the mechanical linkage system of the
backhoe of a Caterpillar backhoe loader. The Backhoe mechanism contains many components
such as pumps, and motors. However, in this project, only rigid bars and hydraulic bars are
considered. In order to create a model of such a system, the following tasks must be done:

**1. Analyze the triangle formed by the backhoe, the angles of the triangle formed by
the bars of the backhoe were found in order to determine the rotation of the bar**

**2. The coordinate of the triangle at each frame of the motion needed to be found in order to locate the
position of the bar.**


Assumptions and Specifications
=================
Since the detailed specifications of a real-life product cannot be found easily online, 
the sample model is taken from the laboratory manual as shown below:
<p align = 'center'>
<img src = 'Images/P1.png' height = '492px'>
  
The measurement was taken based on the above picture. Where the first digit behind a letter
indicates the triangle number, and the second digit indicates the angle or length number of each
triangle. The specifications of the backhoe can be found [here.](https://github.com/Chen-xyz/Backhoe-Mechanism-Modelling-and-Simulation/blob/23ca517cceec82343ae12ef1031e7f5cec4e2bef/Parameters/lengths%20of%20rigid%20and%20hydraulic%20bar.png)

For clarity of analysis, the mechanism is set to the Y-Z plane, thus, the
coordinates in the X-plane will be 0. This means that when viewed from a Y-Z plane, the entire
system will be 2-D.


Modelling
=================
As can be observed from the graph, the backhoe mechanism involves 3 triangles each with
one length varying bar(hydraulic bar) and 2 fixed triangles. length of the fixed triangle is not
changing, thus it would not be the main part of the modelling here. The moveable triangles
can be viewed as triangles formed by 3 vectors which closure equation can be formed.


<h3>𝑇𝑟𝑖𝑎𝑛𝑔𝑙𝑒 1 = 𝑙11 + 𝑙13 = 𝑙12</h3>

<h3>𝑇𝑟𝑖𝑎𝑛𝑔𝑙𝑒 2 = 𝑙21 + 𝑙23 = 𝑙22</h3>

<h3>𝑇𝑟𝑖𝑛𝑔𝑙𝑒 3 = 𝑙31 + 𝑙33 = 𝑙32</h3>

This can be further broken down horizontally and vertically, and re-arrange:

<h3>−𝑙1𝑐𝑜𝑠𝜃1 − 𝑙3𝑐𝑜𝑠𝜃3 + 𝑙2𝑐𝑜𝑠𝜃2 = 0 E𝑞.1</h3>

<h3>−𝑙1𝑠𝑖𝑛𝜃1 − 𝑙3𝑠𝑖𝑛𝜃3 + 𝑙2𝑠𝑖𝑛𝜃3 = 0 E𝑞.2</h3>


The numbers within the equation indicate the angle and length number of each
triangle, which corresponds to the second digit on the diagram above.
The same relationship can be applied to the triangle 2 and triangle 3.



Apriori Analysis
==================
Since the equations are simply 2 non-linear equations, where the inverse of its derivative can be easily found, the Gaussian elimination does not need to be used. The equations can simply
solved by iterative methods such as Newton-Raphson's method:

<h2>𝑥<sub>𝑛+1</sub> = 𝑥<sub>𝑛</sub> − (𝐷𝑓(𝑥<sub>𝑛</sub>))<sup>−1</sup>(𝑓(𝑥<sub>𝑛</sub>))</h2>

In order to analyze using Newton-Raphson, an initial estimate is required. Since the
problem is interested in one specific static moment of the mechanism, the initial estimate
would be different depending on that specific moment. In this case, the initial estimate of
theta is simply hand-measured at the backhoe image.

To perform this iteration, the following mathematic model is developed:

<p align = 'center'>
<img src = 'Images/Mathematic Model.png' height = '492px'>



Numerical Solution
========================
The simulation was performed through MATLAB, details can be found [here.](https://github.com/Chen-xyz/Backhoe-Mechanism-Modelling-and-Simulation/blob/91a2b9b1a8f2cd2229ec0ee3b6f6d55c920d9ffe/Numerial%20Solution/Newton_Raphson.m)

Result
==================
The number of steps taken for each triangle is between 4 to 6 steps, and the result for each
triangle varies depending on the input i.e. Hydraulic length. For example, in the first triangle, 𝜃<sub>2</sub>
between the shortest and longest are 0.76 and 1.326. The angle tends to increase with
increasing hydraulic bar length, this pattern is also followed by 𝜃<sub>2</sub> and other triangles.
In order to judge the efficacy of the tolerance and to better present the result, the
coordinate of each vertex on the triangle at one specific static moment at the Y-Z plane is plotted
as follows:

<p align = 'center'>
<img src = 'Images/Vetices of all triangles at a specific moment.png' height = '492px'>

In order to explain how to obtain each of these vertices, the following diagram is used again：

<p align = 'center'>
<img src = 'Images/P1.png' height = '492px'>

Initially, 

P11 = [0,0,0] 

P12 = [0,L11cos𝜃<sub>11</sub>, L11sin𝜃<sub>12</sub>]

P13 = [0,L12cos(𝜃<sub>11</sub>+𝜃<sub>12</sub>), L2sin(𝜃<sub>11</sub>+𝜃<sub>12</sub>)]


After the mechanism motion starts, the coordinates of the second triangle are based on the location of the first triangle. For example, 


When, P13=P21

P22 = L12cos(𝜃<sub>11</sub>+𝜃<sub>12</sub>)+L21cos(L12cos(𝜃<sub>21</sub>))


The relationship between the remaining points follows this pattern, no further description will be discussed. The sides of the triangle, ie.L11, and L12 can also be referred to in this diagram.
Moreover, with the diagram, 𝜃1 of each triangle can be explained.

Where 𝜃<sub>11</sub> is simply fixed at 0.17 radians as obtained by measurement.


𝜃21 = ∠𝑃22 𝑃33 𝑃11 − 𝜃12 − 𝜃11 = 0.45radians

𝜃31 = 90° − (11° + 189° − 𝜃<sub>23</sub> + ∠𝑃31𝑃22𝑃23 − 𝜃<sub>21</sub> = 0.32𝑟𝑎𝑑𝑖𝑎𝑛s

3D Model
======================
After the coordinate is found, the data obtained can be used to create a 3D model of the
mechanism. In this case, each side of the triangle is set to be a cylindrical bar with cross
cross-sectional area of 0.1. A function m-file was developed to draw one bar. Thus, the function
m-file can be used multiple times to draw the entire mechanism based on the coordinate
obtained from above. The details of the code can be found [here.](https://github.com/Chen-xyz/Backhoe-Mechanism-Modelling-and-Simulation/blob/72462519c46a985a6f3ac0fc9535338202841578/Numerial%20Solution/DrawBar.m)


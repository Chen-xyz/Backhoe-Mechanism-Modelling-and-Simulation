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
* [Analysis](#Analysis)
* [Result](#Result)
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

<h3>#𝑇𝑟𝑖𝑎𝑛𝑔𝑙𝑒 1 = 𝑙11 + 𝑙13 = 𝑙12</h3>

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
theta is simply hand-measured for each triangle.

Numerical Solution
========================
The simulation was perfomred through MATLAB, details can be find [here.](https://github.com/Chen-xyz/Backhoe-Mechanism-Modelling-and-Simulation/blob/91a2b9b1a8f2cd2229ec0ee3b6f6d55c920d9ffe/Numerial%20Solution/Newton_Raphson.m)


# CRUD Application

A new Flutter project.

## Getting Started

This is a CRUD web portal consuming a service layer using firebase as backend.

The app is based on clean architecture based on the book and blog by Uncle Bob. It is a combination of concepts taken from the Onion Architecture and other architectures. The main focus of the architecture is separation of concerns and scalability. It consists of 3 main modules: App, Domain, Data

Source code dependencies only point inwards. This means inward modules are neither aware of nor dependent on outer modules. However, outer modules are both aware of and dependent on inner modules. Outer modules represent the mechanisms by which the business rules and policies (inner modules) operate. The more you move inward, the more abstraction is present. The outer you move the more concrete implementations are present. Inner modules are not aware of any classes, functions, names, libraries, etc.. present in the outer modules. They simply represent rules and are completely independent from the implementations.



![0_zUtZYiJ1bDTugOYY](https://user-images.githubusercontent.com/32741765/185176860-5d36e76a-4886-41da-9d33-2e2a2827b6bf.png)




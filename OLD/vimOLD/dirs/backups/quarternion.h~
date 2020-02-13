#ifndef QUARTERNION_H_
#define QUARTERNION_H_

#include <math.h>
#include <cmath>
#include <stdint.h>
#include <iostream>
#include <list>

class Quarternion{
    private:
        float calculateMean(std::list<float> &list);

    public:
        Quarternion();
        Quarternion(double _x, double _y, double _z, double _w);
        //double* quatToAxisAngle();
        void toAxisAngle();
        void parseTeapotPacket(uint8_t* teapot);
        void printQuat();
        void printLongQuat();
        void printAxis();
        void TESTAxisAngle();
        void axisAngleTEST();
        void normalise();
        void calculateQuatMean();

    private:
        static const double testQuat[];
        int avg_limit;
        std::list<float> w_avg;
        std::list<float> x_avg;
        std::list<float> y_avg;
        std::list<float> z_avg;

    public:
        double x;
        double y;
        double z;
        double w;
        float q[4];
        float axis[4];

        float w_AVG; 

};

#endif

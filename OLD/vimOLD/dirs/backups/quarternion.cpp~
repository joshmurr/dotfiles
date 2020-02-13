#include "quarternion.h"

const double Quarternion::testQuat[] = {0.7071068, 0, 0, 0.7071068};

Quarternion::Quarternion(){
    this->x = 0.0;
    this->y = 0.0;
    this->z = 0.0;
    this->w = 1.0; 
    this->avg_limit = 100;
}

Quarternion::Quarternion(double _x, double _y, double _z, double _w){
    this->x = _x;
    this->y = _y;
    this->z = _z;
    this->w = _w; 
}

void Quarternion::toAxisAngle(){
    // [0] == Theta
    // [1] == ax
    // [2] == ay
    // [3] == az
      
    // If the Quaternion is [0,0,0.7071068,0.7071068]. You will get the Axis-Angle is [0,0,1] and degrees is 90. You could consider it rotated 90 degrees on Z axis.
    // https://stackoverflow.com/questions/52584715/how-can-i-convert-a-quaternion-to-an-angle
    
    if(this->q[0] > 1) this->normalise();

    //for(int i=1; i<3; i++){
        //if(this->q[i] < -0.01 || this->q[i] > 0.01){
            //this->q[i] = 0.0;
        //}
    //}
    
    this->axis[0] = acos(this->q[0])*2.0;
    double s = sqrt(1-this->q[0]*this->q[0]);

    if(s < 0.01){
        this->axis[1] = this->q[1]; 
        this->axis[2] = this->q[2]; 
        this->axis[3] = this->q[3]; 
    } else {
        this->axis[1] = this->q[1] / s; 
        this->axis[2] = this->q[2] / s; 
        this->axis[3] = this->q[3] / s; 
    }


    //if(!this->x && !this->y && !this->z && !this->w) {
        ////return axis;
    //} else {
        //this->axis[0] = acos(this->q[0])*2.0; // Theta
        //this->axis[1] = this->q[1] / sin(acos(this->w));
        //this->axis[2] = this->q[2] / sin(acos(this->w));
        //this->axis[3] = this->q[3] / sin(acos(this->w));

        ////return axis;
    //}
}

void Quarternion::axisAngleTEST(){
    //double t[4] = {0.7071068, 0, 0, 0.7071068};
    double t[4] = {1, 0, 0, 0};

    this->axis[0] = acos(t[0])*2.0;
    double s = sqrt(1-t[0]*t[0]);

    if(s < 0.01){
        this->axis[1] = t[1]; 
        this->axis[2] = t[2]; 
        this->axis[3] = t[3]; 
    } else {
        this->axis[1] = t[1] / s; 
        this->axis[2] = t[2] / s; 
        this->axis[3] = t[3] / s; 
    }
}

void Quarternion::normalise(){
    double w2 = this->q[0] * this->q[0];
    double x2 = this->q[1] * this->q[1];
    double y2 = this->q[2] * this->q[2];
    double z2 = this->q[3] * this->q[3];

    double mag = sqrt(w2 + x2 + y2 + z2);

    this->q[0] = this->q[0] / mag;
    this->q[1] = this->q[1] / mag;
    this->q[2] = this->q[2] / mag;
    this->q[3] = this->q[3] / mag;

}

// UNUSED AVERAGES ------------------------------------------- //
void Quarternion::calculateQuatMean(){
    this->w_AVG = this->calculateMean(this->w_avg);
}

double Quarternion::calculateMean(std::list<double> &list){
    double avg = 0;
    std::list<double>::iterator it;
    for(it = list.begin(); it != list.end(); it++) avg += *it;
    return avg/= list.size();
}
// ----------------------------------------------------------- //

void Quarternion::TESTAxisAngle(){
    this->axis[0] = acos(this->testQuat[0])*2.0; // Theta
    this->axis[1] = testQuat[1] / sin(acos(this->testQuat[0]));
    this->axis[2] = testQuat[2] / sin(acos(this->testQuat[0]));
    this->axis[3] = testQuat[3] / sin(acos(this->testQuat[0]));
}

void Quarternion::parseTeapotPacket(uint8_t* teapot){
    // This is taken from Jeff Rowbergs MPUTeapot Processing sketch
    //
    // q[0] == w
    // q[1] == x
    // q[2] == y
    // q[3] == z
    
    this->q[0] = ((teapot[2] << 8) | teapot[3]) / 16384.0;
    this->q[1] = ((teapot[4] << 8) | teapot[5]) / 16384.0;
    this->q[2] = ((teapot[6] << 8) | teapot[7]) / 16384.0;
    this->q[3] = ((teapot[8] << 8) | teapot[9]) / 16384.0;
    for (int i = 0; i < 4; i++) if (q[i] >= 2) q[i] = -4 + q[i];

    //if(this->w_avg.size() == this->avg_limit){
        //this->w_avg.pop_front();
    //}
    //this->w_avg.push_back(this->q[0]);
}

void Quarternion::printQuat() { 
    double w1 = (int)(this->q[0]*100 + .5);
    double w2 = w1 / 100;
    double x1 = (int)(this->q[1]*100 + .5);
    double x2 = x1 / 100;
    double y1 = (int)(this->q[2]*100 + .5);
    double y2 = y1 / 100;
    double z1 = (int)(this->q[3]*100 + .5);
    double z2 = z1 / 100;

    std::cout << "w: " << w2 << "\tx: " << x2 << "\ty: " << y2 << "\tz: " << z2 << std::endl;
}

void Quarternion::printLongQuat(){
    std::cout << "w: " << this->q[0] << "\tx: " << this->axis[1] << "\ty: " << this->q[2] << "\tz: " << this->q[3] << std::endl;
}

void Quarternion::printAxis() { 
    std::cout << "Theta:\t" << this->axis[0] << "\tax: " << this->axis[1] << "\tay: " << this->axis[2] << "\taz: " << this->axis[3] << std::endl;
}

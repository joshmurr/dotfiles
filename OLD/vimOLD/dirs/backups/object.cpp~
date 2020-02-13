#include "object.h"

Object::Object(){
    this->velocity = 0.0;
    //this->dataArray[0] = 0x00; //0b00000000
    this->dataArray[7] = 0x80; //0b10000000
    this->dataArray[6] = 0x40; //0b01000000
    this->dataArray[5] = 0x20; //0b00100000
    this->dataArray[4] = 0x10; //0b00010000
    this->dataArray[3] = 0x08; //0b00001000
    this->dataArray[2] = 0x04; //0b00000100
    this->dataArray[1] = 0x02; //0b00000010
    this->dataArray[0] = 0x01; //0b00000001
}

Object::Object(std::vector<Vec3d> &points){
    referredPoints = &points;
}

void Object::draw(Screen &screen, const SDL_Color &col){
    screen.drawObject(this->points, this->origin, col);
}

void Object::drawOrigin(Screen &screen){
    Vec3d x_ = this->axes[0] + this->origin;
    screen.draw3Dline(this->origin, x_, screen.RED);
    Vec3d y_ = this->axes[1] + this->origin;
    screen.draw3Dline(this->origin, y_, screen.GREEN);
    Vec3d z_ = this->axes[2] + this->origin;
    screen.draw3Dline(this->origin, z_, screen.BLUE);
}

void Object::update(){
    //if(this->velocity){
        //this->origin = this->origin + Vec3d(0.0, 0.1, 0.0);
    //}
}

void Object::rotateX(double theta){
    double cosTheta = cos(theta);
    double sinTheta = sin(theta);

    for(std::vector<Vec3d>::iterator p=this->points.begin(); p!=this->points.end(); ++p){
        p->y = cosTheta*p->y - sinTheta*p->z;
        p->z = sinTheta*p->y + cosTheta*p->z;
    }
}

void Object::rotateY(double theta){
    double cosTheta = cos(theta);
    double sinTheta = sin(theta);

    for(std::vector<Vec3d>::iterator p=this->points.begin(); p!=this->points.end(); ++p){
        p->x = cosTheta*p->x + sinTheta*p->z;
        p->z = cosTheta*p->z - sinTheta*p->x;
    }
}

void Object::rotateZ(double theta){
    double cosTheta = cos(theta);
    double sinTheta = sin(theta);

    for(std::vector<Vec3d>::iterator p=this->points.begin(); p!=this->points.end(); ++p){
        p->x = cosTheta*p->x - sinTheta*p->y;
        p->y = sinTheta*p->x + cosTheta*p->y;
    }
}

void Object::rotateYPR(double* q){
    this->gravity[0] = 2.0 * (q[1]*q[3] - q[0]*q[2]);
    this->gravity[1] = 2.0 * (q[0]*q[1] + q[2]*q[3]);
    this->gravity[2] = q[0]*q[0] - q[1]*q[1] - q[2]*q[2] - q[3]*q[3];

    this->ypr[0] = atan2(2*q[1]*q[2] - 2*q[0]*q[3], 2*q[0]*q[0] + 2*q[1]*q[1] - 1);
    this->ypr[1] = atan(gravity[0] / sqrt(gravity[1]*gravity[1] + gravity[2]*gravity[2]));
    this->ypr[2] = atan(gravity[1] / sqrt(gravity[0]*gravity[0] + gravity[2]*gravity[2]));

    this->rotateY(-ypr[0]);
    this->rotateZ(-ypr[1]);
    this->rotateX(-ypr[2]);
}

void Object::rotateAxisAngle(double* axis){
    double theta = axis[0] - oldTheta;
    this->oldTheta = axis[0];
    double ax    = -axis[1];
    double ay    = axis[2];
    double az    = -axis[3];

    //std::cout << theta << std::endl;

    if(isnan(theta) || isnan(ax) || isnan(ay) || isnan(az)) {
        std::cout<< "Found NaN" << std::endl;    
        return;
    }
    
    double cosT = cos(theta);
    double sinT = sin(theta);
    double t = 1.0 - cosT;

    double ax2 = ax*ax;
    double ay2 = ay*ay;
    double az2 = az*az;
    
    //// Normalize Axis Components
    //double mag = sqrt(ax2+ay2+az2);

    //if(mag == 0) {
        //std::cout << "Magnitude is 0: ERROR!" << std::endl;
        //return;
    //} else { 
        //ax /= mag;
        //ay /= mag;
        //az /= mag;
    //}

    //ax2 = ax*ax;
    //ay2 = ay*ay;
    //az2 = az*az;

    for(std::vector<Vec3d>::iterator p=this->points.begin(); p!=this->points.end(); ++p){
        // Store as temps:
        double tx = p->x;
        double ty = p->y;
        double tz = p->z;

        p->x = (cosT+ax2*t)*tx + (ax*ay*t-(az*sinT))*ty + (ax*az*t+(ay*sinT))*tz;
        p->y = (ay*ax*t+az*sinT)*tx + (cosT+ay2*t)*ty + (ay*az*t-(ax*sinT))*tz;
        p->z = (az*ax*t-(ay*sinT))*tx + (az*ay*t+(ax*sinT))*ty + (cosT+az2*t)*tz;
    }

    for(std::vector<Vec3d>::iterator p=this->axes.begin(); p!=this->axes.end(); ++p){
        // Store as temps:
        double tx = p->x;
        double ty = p->y;
        double tz = p->z;

        p->x = (cosT+ax2*t)*tx + (ax*ay*t-(az*sinT))*ty + (ax*az*t+(ay*sinT))*tz;
        p->y = (ay*ax*t+az*sinT)*tx + (cosT+ay2*t)*ty + (ay*az*t-(ax*sinT))*tz;
        p->z = (az*ax*t-(ay*sinT))*tx + (az*ay*t+(ax*sinT))*ty + (cosT+az2*t)*tz;
    }

    //double tx = this->origin.x;
    //double ty = this->origin.y;
    //double tz = this->origin.z;

    //this->origin.x = (cosT+ax2*t)*tx + (ax*ay*t-(az*sinT))*ty + (ax*az*t+(ay*sinT))*tz;
    //this->origin.y = (ay*ax*t+az*sinT)*tx + (cosT+ay2*t)*ty + (ay*az*t-(ax*sinT))*tz;
    //this->origin.z = (az*ax*t-(ay*sinT))*tx + (az*ay*t+(ax*sinT))*ty + (cosT+az2*t)*tz;
}

void Object::follow(const Vec3d &v){
    Vec3d dir = this->origin - v;
    dir.normalise();
    this->origin = this->origin + dir; 
}

void Object::moveUpAndDown(const Uint32 &ticks){
    Vec3d ud(0.0, 0.0, 20.0*sin(ticks*0.01));
    this->origin = this->origin + ud; 
}

void Object::setVelocity(double v){
    this->velocity = v;
}

void Object::setLocation(Vec3d loc){
    this->origin = loc;
}

void Object::resetHeadsetPosition(Vec3d _origin){
    std::cout << "Resetting headset position" << std::endl;
    this->origin = _origin;
    
    // Origin Axes:
    this->axes[0] = Vec3d(10, 0, 0);
    this->axes[1] = Vec3d(0, 10, 0);
    this->axes[2] = Vec3d(0, 0, -10);

    double size = 20.0;
    int i=0;
    double spacing = (M_PI * 2.0) / (double)8;
    //Main Ring
    for(; i<8; i++){
        double x = size * cos(spacing * i);
        double y = size * sin(spacing * i);
        points[i].x = x;
        points[i].y = y;
        points[i].z = 0.0;
    }
    // Mid Ring
    size = 12.0;
    spacing = (M_PI * 2.0) / (double)6;
    for(i=8; i<15; i++){
        double x = size * cos(spacing * i);
        double y = size * sin(spacing * i);
        points[i].x = x;
        points[i].y = y;
        points[i].z = -4.0;
    }
    i=15;
    // Top
    points[i].x = 0.0;
    points[i].y = 0.0;
    points[i].z = -10.0;
}

void Object::makeHeadset(Vec3d _origin){
    this->origin = _origin;

    // Origin Axes:
    Vec3d x_ = Vec3d(10, 0, 0);
    Vec3d y_ = Vec3d(0, 10, 0);
    Vec3d z_ = Vec3d(0, 0, -10);
    this->axes.push_back(x_);
    this->axes.push_back(y_);
    this->axes.push_back(z_);

    double size = 20.0;
    int i=0;
    int num=8;
    double spacing = (M_PI * 2.0) / (double)num;
    //Main Ring
    for(; i<num; i++){
        double x = size * cos(spacing * i);
        double y = size * sin(spacing * i);
        Vec3d p(x, y, 0.0);
        points.push_back(p);
    }
    // Mid Ring
    size = 12.0;
    num = 6;
    spacing = (M_PI * 2.0) / (double)num;
    for(i=0; i<num; i++){
        double x = size * cos(spacing * i);
        double y = size * sin(spacing * i);
        Vec3d p(x, y, -4.0);
        points.push_back(p);
    }
    // Top
    Vec3d p(0.0, 0.0, -10.0);
    points.push_back(p);
}


void Object::makeWall(Vec3d pos, double width, double height, double spacing){
    //double height = 200.0;
    //double width = 200.0;
    //double spacing = 20.0;
    double origin_x = -width/2;
    double origin_y = -height/2;
    for(double i=0.0; i<width; i+=spacing){
        for(double j=0.0; j<height; j+=spacing){
            Vec3d p(i+origin_x, origin_y, j);
            points.push_back(p);
        }
    }

}

void Object::makeSimpleRoom(Vec3d _origin, double width, double spacing){
    this->origin = _origin;
    double offset_x = width/2.0;
    double offset_y = width/2.0;
    for(double i=0.0; i<width; i+=spacing){
        for(double z=0.0; z<width/2.0; z+=spacing){
            Vec3d p_L(-offset_x, offset_y-i, z);
            Vec3d p_R(offset_x, -offset_y+i, z);
            Vec3d p_T(-offset_x+i, -offset_y, z);
            Vec3d p_B(offset_x-i, offset_y, z);
            points.push_back(p_L);
            points.push_back(p_R);
            points.push_back(p_T);
            points.push_back(p_B);
        }
    }
}

bool Object::checkOriginCollision(Object &obj){
    double dist = this->origin.dist(obj.origin);
    if(dist < 10.0) return true;
    return false;
}

uint16_t Object::checkCollisions(Screen &screen, Serial &arduino, Object &obj, bool DEBUG, bool all_motors){
    uint8_t byte1 = 0x00, byte2 = 0x00;
    uint16_t ret = 0x00;
    for(std::vector<Vec3d>::iterator p=this->points.begin(); p!=this->points.end(); ++p){
        for(std::vector<Vec3d>::iterator q=obj.points.begin(); q!=obj.points.end(); ++q){
            Vec3d pUpdate = *p + this->origin;
            Vec3d qUpdate = *q + obj.origin;
            double dist = pUpdate.dist(qUpdate);
            if(dist < 25.0) {
                screen.draw3Dline(pUpdate, qUpdate, screen.GREEN);
                // VIBRATE MOTORS
                if(!all_motors) {
                    // Vibrate individual motors
                    int collision = p-points.begin();
                    if(collision < 8) byte1 = byte1 + this->dataArray[p-points.begin()];
                    else byte2 = byte2 + this->dataArray[p-points.begin() - 8];
                } else {
                    // Vibrate all motors
                    byte1 = 0xFF;
                    byte2 = 0xFF;
                }
            }
        }
    }
    //std::bitset<8> b1(byte1);
    //std::bitset<8> b2(byte2);

    //std::cout << b1 << '\n';
    //std::cout << b2 << '\n';
    if(!DEBUG){
        ret = byte1 << 8 | byte2;
        return ret;
    } else {
        return 0x00;
    }
}

double Object::lookingAtSun(Vec3d &sun){
    // If close to -1 then they are pretty aligned
    Vec3d heading = this->axes[0];
    Vec3d sunHeading = sun - this->origin;

    heading.normalise();
    sunHeading.normalise();

    double alignment = sunHeading.dot(heading);

    return alignment;
}

double Object::checkDot(Vec3d &vec){
    return this->origin.dot(vec);
}

void Object::makeSun(Vec3d _origin){
    this->points.push_back(_origin); 
}

void Object::makeTarget(Vec3d _origin){
    this->points.push_back(_origin); 
}

void Object::makeStarField(double width, double height){
    for(int i=0; i<100; i++){
        Vec3d s(
            rand()%(int)width - width/2,
            rand()%(int)height - height/2,
            rand()%200 - 100
        );
        points.push_back(s);
    }
}

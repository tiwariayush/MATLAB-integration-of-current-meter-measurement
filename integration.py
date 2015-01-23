#!usr/bin/python

import time

class Integrate():
    '''
        Integrate class for generalised cross section
    '''

    def __init__(self, vmax):
        '''
            Function to initialize maximum velocity
            and add the data for maximum depth and
            width
        '''

        self.vmax = vmax
        self.wmax = 23.5
        self.dmax = 6.7
        self.expx = 80
        self.expy = 80

    def calculate_vel(self, width, depth, velocity):
        '''
            Function to calculate velocity using power
            law and finally printing the result with
            time sleep so as to look at the data
        '''
    
        self.vel = (self.vmax)*pow((abs(1-(2*width/self.wmax))), (1.0/self.expx))*pow((abs(1-(2*depth/self.dmax))), (1.0/self.expy))
    
        print 'Width of channel at this point is %s m'%width
        print 'Depth of channel at this point is %s m'%depth
        print 'Experimental velocity at this point is %s m/s'%velocity
        print 'Maximum velocity is %s m/s'%self.vmax
        print 'Calculated velocity by power law is %s m/s \n'%self.vel
        time.sleep(0.2)

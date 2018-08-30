#Joseph Elikishvili
#602 - HW8

import scipy.ndimage as ndimage
import scipy.misc as misc

#For some reason ojects.png needs to have i>i.mean ran before the gaussian filter, so added an optional parameter filter1 as a third parameter
def imageprocess(image, name, s, filter1 = True):
    i = misc.imread(image)                      #read the image file

    if filter1:                                 #optional filter before the gaussian filter
        img = i > i.mean()
    else:
        img = i

    i = ndimage.gaussian_filter(img, s)         #gaussian filter
    thres = i>i.mean()

    labels, num = ndimage.measurements.label(thres)
    centers = ndimage.center_of_mass(i, labels, range(1,num+1))
    print "Processed file: ", name,'\n', "Number of objects: ", num, '\n', "Center coordinates of objects", centers, '\n', '----------------'
    misc.imsave('c:/data/images/t_objects.png', thres)
    #misc.imsave('c:/data/images/t_circles.png', thres)
    #misc.imsave('c:/data/images/t_peppers.png', thres)

imageprocess('c:/data/images/objects.png', 'objects.png', 2, False)
#imageprocess('c:/data/images/circles.png', 'circles.png', 6)
#imageprocess('c:/data/images/peppers.png', 'peppers.png', 4)


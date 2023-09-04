from skimage import data
from skimage import filters

def camera_image_shape():
    return data.camera().shape

def edges_image_shape():
    camera = data.camera()
    return filters.sobel(camera).shape
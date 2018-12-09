# Dense capture
> Using [Detectron](https://github.com/facebookresearch/Detectron) as the backend.

## build from the docker file
```
docker build -t dense-cap .
nvidia-docker run -ti --rm \
    --name caffe2py2 \
    -v ${HOME}/projects/dense-cap/code:/workspace/code:ro \
    -v ${HOME}/projects/dense-cap/Detectron:/workspace/detectron \
    -v ${HOME}/data:/workspace/data:ro \
    -v ${HOME}/data/dense-cap/output:/workspace/output \
    -e "TERM=xterm-256color" \
    --shm-size=1g --ulimit memlock=-1 \
    dense-cap
```
#### run this test in the container
```
cd $DETECTRON && make && python2 ./detectron/tests/test_spatial_narrow_as_op.py
```

## use NGC container
```
nvidia-docker run -ti --rm \
    --name caffe2py2 \
    -v ${HOME}/projects/dense-cap/code:/workspace/code:ro \
    -v ${HOME}/data:/workspace/data:ro \
    -v ${HOME}/data/dense-cap/output:/workspace/output \
    -v ${HOME}/projects/detectron:/workspace/detectron\
    -e "TERM=xterm-256color" \
    --shm-size=1g --ulimit memlock=-1 \
    nvcr.io/nvidia/caffe2:18.07-py2
```

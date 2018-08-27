# Use Caffe2 from nvidia-docker image as parent image
FROM nvcr.io/nvidia/caffe2:18.07-py2

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     git \
#     && rm -rf /var/lib/apt/lists/*

# Detectron & COCO API
ENV DETECTRON=/workspace/detectron
ENV COCOAPI=/workspace/cocoapi
# RUN git clone https://github.com/facebookresearch/detectron $DETECTRON && \
#     cd $DETECTRON && \
#     pip install --requirement requirements.txt && \
#     make && \
COPY ./Detectron/requirements.txt /tmp/
RUN \
    pip install --upgrade pip && \
    pip install --requirement /tmp/requirements.txt && \
    git clone https://github.com/cocodataset/cocoapi.git $COCOAPI && \
    cd $COCOAPI/PythonAPI && \
    make install

# # Install Python dependencies
# COPY requirements.txt /tmp/
# RUN pip install --requirement /tmp/requirements.txt

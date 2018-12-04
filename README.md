# Docker tutorial for ML engineers

Summarized [Demystifying Docker for Data Scientists – A Docker Tutorial for Your Deep Learning Projects](https://blogs.technet.microsoft.com/machinelearning/2018/03/15/demystifying-docker-for-data-scientists-a-docker-tutorial-for-your-deep-learning-projects/) 

You could learn 
1. how to make container from image 
2. how to make image from container 
3. how to use dockerfile to build image 

## Build docker container manually 
- `docker run -it --name mycntkdemo microsoft/cntk:2.2-cpu-python3.5 /bin/bash`
- `pip install lightgbm`: install python lightgbm package in docker.
- `exit`: exit from the container.
- `docker start -ia mycntkdemo`: start mycntkdemo named container.
- `Ctrl-p + Ctrl-q`: move container to the background.
- `docker attach mycntkdemo`: move container from background to foreground.
- `docker run -it --name mycntkdemo -v /home/test:/root/test`: map local dir(`/home/test`) to docker dir(`/root/test`)
- `docker run -it --name mycntkdemo -v /home/test:/root/test microsoft/cntk:2.2-cpu-python3.5 /bin/bash`: map local dir to docker dir when initialize a container.
- `docker commit mycntkdemo mycntkwlgbm:version1`: tag container and save as new image.

## Build docker container using Dockerfile

- Dockerfile.

```
cat Dockerfile
FROM microsoft/cntk:2.2-cpu-python3.5
RUN apt-get update \
	&& apt-get install -y git
COPY . /root/mylightgbmex
RUN /root/anaconda3/envs/cntk-py35/bin/pip install -r /root/mylightgbmex/requirements.txt
CMD ["echo 'hello'"]
```

- Requirements for package installation. 

```
cat requirements.txt
wheel
lightgbm
```

- `docker build -t mycntkwlgbmimage`: creates an image named mycntkwlgbmimage by reading Dockerfile.

## References
- [초보를 위한 도커 안내서 - 도커란 무엇인가?](https://subicura.com/2017/01/19/docker-guide-for-beginners-1.html)
- [초보를 위한 도커 안내서 - 설치하고 컨테이너 실행하기](https://subicura.com/2017/01/19/docker-guide-for-beginners-2.html)
- [초보를 위한 도커 안내서 - 이미지 만들고 배포하기](https://subicura.com/2017/02/10/docker-guide-for-beginners-create-image-and-deploy.html)
- [Demystifying Docker for Data Scientists – A Docker Tutorial for Your Deep Learning Projects](https://blogs.technet.microsoft.com/machinelearning/2018/03/15/demystifying-docker-for-data-scientists-a-docker-tutorial-for-your-deep-learning-projects/)

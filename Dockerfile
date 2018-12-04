FROM microsoft/cntk:2.2-cpu-python3.5
RUN apt-get update \
	&& apt-get install -y git
COPY . /root/mylightgbmex
RUN /root/anaconda3/envs/cntk-py35/bin/pip install -r /root/mylightgbmex/requirements.txt
CMD ["echo 'hello'"]

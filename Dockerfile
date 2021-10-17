FROM continuumio/miniconda3
RUN rm /bin/sh && ln -s /bin/bash /bin/sh


COPY . /home/
RUN cd /home
RUN /opt/conda/bin/conda env create -f /home/environment.yml
RUN conda init bash
RUN . /opt/conda/etc/profile.d/conda.sh && conda activate py_env
CMD  cd /home && /opt/conda/envs/py_env/bin/panel serve /home/EDA.ipynb

#RUN nohup /opt/conda/envs/py_env/bin/panel serve /root/EDA.ipynb &

FROM python:3

RUN pip3 install python-tado

RUN git clone https://github.com/adrianslabu/tado_aa

RUN sed -i -e 's/"your_tado_username"/os.getenv('\''your_tado_username'\'')/g' ./tado_aa/tado_aa.py && \
  sed -i -e 's/"your_tado_password"/os.getenv('\''your_tado_password'\'')/g' ./tado_aa/tado_aa.py && \
  sed -i -e 's/checkingInterval = 10.0/checkingInterval = os.getenv('\''checkingInterval'\'') or 10.0/g' ./tado_aa/tado_aa.py && \
  sed -i -e 's/errorRetringInterval = 30.0/errorRetringInterval = os.getenv('\''errorRetringInterval'\'') or 30.0/g' ./tado_aa/tado_aa.py && \
  sed -i -e 's/minTemp = 5/minTemp = os.getenv('\''minTemp'\'') or 5/g' ./tado_aa/tado_aa.py && \
  sed -i -e 's/maxTemp = 25/maxTemp = os.getenv('\''maxTemp'\'') or 25/g' ./tado_aa/tado_aa.py && \
  sed -i -e 's/enableTempLimit = True/enableTempLimit = os.getenv('\''enableTempLimit'\'') or True/g' ./tado_aa/tado_aa.py && \
  sed -i -e 's/enableLog = False/enableLog = os.getenv('\''enableLog'\'') or False/g' ./tado_aa/tado_aa.py && \
  sed -i -e 's/logFile = "\/l.log"/logFile = os.getenv('\''logFile'\'') or "\/l.log"/g' ./tado_aa/tado_aa.py && \
  sed -i -e 's/enableLogRotation = False/enableLogRotation = os.getenv('\''enableLogRotation'\'') or False/g' ./tado_aa/tado_aa.py && \
  sed -i -e 's/maxLines = 50/maxLines = os.getenv('\''maxLines'\'') or 50/g' ./tado_aa/tado_aa.py


ENTRYPOINT [ "python", "./tado_aa/tado_aa.py" ]

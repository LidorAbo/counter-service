FROM python:alpine3.19
LABEL Maintainer=LidorAbo
EXPOSE 80
ARG REQUIREMENTS_FILE=requirements.txt
COPY $REQUIREMENTS_FILE .
RUN pip install --no-cache-dir -r $REQUIREMENTS_FILE
COPY . .
ENTRYPOINT ["python"]
CMD ["counter-service.py"]

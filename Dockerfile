# python3.9 lambda base image
FROM public.ecr.aws/lambda/python:3.9

# Installing the dependencies
RUN yum install -y git
RUN yum install -y tar

# Copying requirements.txt to container
COPY requirements.txt ./

# Installing python dependencies
RUN /var/lang/bin/python3.9 -m pip install --upgrade pip
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Copying function code to container
ADD app ${LAMBDA_TASK_ROOT}/app

# Setting the CMD to your handler file_name.function_name
CMD ["app.main.handler"]
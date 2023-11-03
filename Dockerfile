FROM python:3.11

WORKDIR /code
ENV PYTHONPATH "${PYTHONPATH}:/code"

RUN apt-get update -y && apt-get install zsh -y
RUN PATH="$PATH:/usr/bin/zsh"

# Update the package manager and install CMake
RUN apt-get update && apt-get install -y cmake

COPY requirements.txt .
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN rm requirements.txt

CMD '/bin/zsh'

FROM python:3.6.5-slim

# Meta-data
#LABEL maintainer="Mohamed Abolfadl <mabolfadl@gmail.com>" \
#      description="Data Science Workflow #1: Self-Contained Container\
#      Libraries, data, and code in one image"

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
#COPY . /app

RUN apt-get update  && apt-get install -y --no-install-recommends git

# Install the required libraries
RUN pip install --upgrade pip
RUN pip --no-cache-dir install pandas==0.24.2 google-cloud-storage simplejson pyarrow yfinance jobl>

# Make port 8888 available to the world outside this container
EXPOSE 8080

# Run jupyter when container launches
CMD ["jupyter", "lab", "--ip='*'", "--port=8080", "--no-browser", "--allow-root"]
#CMD python
#CMD ["bash"]
#CMD ["python","main.py"]

FROM gcc:latest

#Update apt and install necessary dependencies and tools
RUN apt-get update
RUN apt-get install wget flex bison vim bash-completion -y

#Download the cp-abe source code and necessary libraries
RUN wget http://acsc.cs.utexas.edu/cpabe/cpabe-0.11.tar.gz && wget http://acsc.cs.utexas.edu/cpabe/libbswabe-0.9.tar.gz && wget https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz --no-check-certificate

#Extract tar files and cleanup
RUN tar -xf cpabe-0.11.tar.gz && tar -xf libbswabe-0.9.tar.gz && tar -xf pbc-0.5.14.tar.gz

#Configure, make, make install each respective library (sed is ran on policy_lang.y as the code appears to be missing a semi-colon)
RUN cd pbc-0.5.14 && ./configure && make && make install
RUN cd libbswabe-0.9 && ./configure && make && make install
RUN cd cpabe-0.11 && sed -i 's/result: policy { final_policy = $1 }/result: policy { final_policy = $1; }/g' policy_lang.y && ./configure && make && make install

#Clean-up
RUN rm cpabe-0.11.tar.gz && rm libbswabe-0.9.tar.gz && rm pbc-0.5.14.tar.gz
RUN rm -r cpabe-0.11 && rm -r libbswabe-0.9 && rm -r pbc-0.5.14

#Stops the Dockerimage from auto terminating
ENTRYPOINT ["tail", "-f", "/dev/null"]

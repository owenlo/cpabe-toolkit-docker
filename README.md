# cpabe-toolkit-docker
A dockerised version of the CP-ABE Toolkit 

# Credit
This Dockerfile allows you to build a container for the CP-ABE Toolkit originally described and implemented by Bethencourse, Sahai and Waters [1, 2]. The libbswabe library [2], written by Bethenecourt, and PBC library [3] are used by this Dockerfile as required dependencies to run CP-ABE Toolkit.

# Usage

Clone or download the Dockerfile. In a terminal, navigate to location of Dockerfile and run the following command:

```docker build -t cp-abe .```

The Docker image can be started by using the following command:

```docker run -d cp-abe```

You can then start an interactive shell for the container using the following command:
```docker -it docker exec -it 49d9d611462e2968b43274f4f30f150a56068568ce96668555d40dff9af2ef0c /bin/bash```

Remember to replace the container ID (49d9...ef0c) with the output produced by your terminal. The commands ```cpabe-setup```, ```cpabe-keygen```, ```cpabe-enc```, ```cpabe-dec``` should be accessible from the terminal. See [2] for documentation on usage.

# References
[1] Bethencourt, J., Sahai, A., & Waters, B. (2007). Ciphertext-Policy Attribute-Based Encryption. In 2007 IEEE symposium on security and privacy (SP’07) (pp. 321–334).

[2] Bethencourt, J., Sahai, A., & Waters, B. (2011). Advanced Crypto Software Collection. Retrieved May 18, 2021, from http://acsc.cs.utexas.edu/cpabe/#description

[3] Bethencourt, J. (2011). http://acsc.cs.utexas.edu/cpabe/libbswabe-0.9.tar.gz. Retrieved May 18, 2021, from http://acsc.cs.utexas.edu/cpabe/

[4] Lynn, B. (2013). https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz. Retrieved May 18, 2021, from https://crypto.stanford.edu/pbc/

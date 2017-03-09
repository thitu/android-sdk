FROM thitu/android-dev-base

## Install Android SDK
##
ENV ANDROID_SDK_FILENAME android-sdk_r24.4.1-linux.tgz
ENV ANDROID_SDK_URL http://dl.google.com/android/${ANDROID_SDK_FILENAME}
ENV ANDROID_API_LEVELS android-24,android-25
ENV ANDROID_COMPONENTS extra-google-google_play_services,extra-google-m2repository,extra-android-m2repository,addon-google_apis-google-24,extra

## ENV ANDROID_IMAGES sys-img-arm64-v8a-google_apis-24
ENV ANDROID_IMAGES sys-img-arm64-v8a-android-24

ENV ANDROID_BUILD_TOOLS_VERSION 25.0.2
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_HOME ${ANDROID_HOME}
ENV PATH ${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/build-tools/${ANDROID_BUILD_TOOLS_VERSION}:${PATH}
ENV SHELL /bin/bash

RUN cd /opt && \
  wget -q ${ANDROID_SDK_URL} && \
  tar -xzf ${ANDROID_SDK_FILENAME} && \
  rm ${ANDROID_SDK_FILENAME} && \
  echo y | android update sdk --no-ui -a \
     --filter tools,platform-tools,build-tools-${ANDROID_BUILD_TOOLS_VERSION},${ANDROID_API_LEVELS},${ANDROID_COMPONENTS},${ANDROID_IMAGES} && \
  chown -R 0.0 ${ANDROID_HOME} && \
  echo "PATH=\"${PATH}\"" >> /etc/profile && \
  echo "export PATH" >> /etc/profile

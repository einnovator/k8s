# Metadata
LABEL org.label-schema.name="k8s" \
      org.label-schema.url="https://hub.docker.com/r/einnovator/k8s/" \
      org.label-schema.vcs-url="https://github.com/einnovator/k8s"

#Env
ENV KUBECONFIG=/.kube/config

# kubectl releases: https://github.com/kubernetes/kubernetes/releases
ENV KUBE_VERSION="v1.18.8"
# helm releases: https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="v3.3.1"
# ytt releases: https://github.com/k14s/ytt/releases/
ENV YTT_VERSION="v0.30.0"

RUN apk add --no-cache ca-certificates bash git openssh curl \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && wget -q https://github.com/k14s/ytt/releases/download/${YTT_VERSION}/ytt-linux-amd64 -O /usr/local/bin/ytt \
    && chmod +x /usr/local/bin/ytt \
    && chmod g+rwx /root \
    && mkdir /config \
    && chmod g+rwx /config    

WORKDIR /

CMD bash
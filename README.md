---
title: $ kubectl hacking - my journey with kate
author: Tobias Schneck, Loodse GmbH
patat:
    wrap: true
    pandocExtensions:
        - patat_extensions
        - autolink_bare_uris
    margins:
        left: 5
        right: 5
    theme:
        syntaxHighlighting:
            decVal: [bold, onDullRed]
        code: [dullBlack,onDullWhite]
        codeBlock: [dullBlack,onDullWhite]
...

# Welcome!

```bash
$ kubectl hacking

 _  __     _                          _            
| |/ /   _| |__   ___ _ __ _ __   ___| |_ ___  ___ 
| ' / | | | '_ \ / _ \ '__| '_ \ / _ \ __/ _ \/ __|
| . \ |_| | |_) |  __/ |  | | | |  __/ ||  __/\__ \
|_|\_\__,_|_.__/ \___|_|  |_| |_|\___|\__\___||___/
                                                   
 __  __           _                 __  __             _      _     
|  \/  | ___  ___| |_ _   _ _ __   |  \/  |_   _ _ __ (_) ___| |__  
| |\/| |/ _ \/ _ \ __| | | | '_ \  | |\/| | | | | '_ \| |/ __| '_ \ 
| |  | |  __/  __/ |_| |_| | |_) | | |  | | |_| | | | | | (__| | | |
|_|  |_|\___|\___|\__|\__,_| .__/  |_|  |_|\__,_|_| |_|_|\___|_| |_|
                           |_|                                      

```

---

# My journey to Kubernetes
Java programmer -> Testautomation  -> Docker -> OpenShift -> Kubernetes        
```
                              ..              
                              ..              
                           ........           
                   ...  ..++..++..++..  ...   
                    ..+++..  .++.  ..+++..    
                     .+.++.. .++. ..++.+.     
                    .+.  .++++++++++.  .+.    
                    ++.  ..++....++..  .++    
                  ..++.+++++++..+++++++.++..  
                .....++..  .++++++.  ..++.....
                     .++.  ++.  .++  .++.     
                      ..+..+.    .+..+..      
                         .+.++++++.+.         
                        .+.        .+.        
                        +.          .+                          
```

📧 mailto:tobi@loodse.com

🐦 https://twitter.com/toschneck

🐙 https://github.com/toschneck


---

# `kubectl` - what's his aim?

* Main command line tool for interact with Kubernetes writen in Golang
    * Maintained by SIG API Machinery (part of official community)
    * Source code: https://github.com/kubernetes/kubernetes/tree/master/pkg/kubectl
    * Uses `curl` - check e. g. `kubectl get pod -v 10`
    * Caches results under `~/.kube/cache/` 
  
* Other clients
    * client-go: https://github.com/kubernetes/client-go/
    * other main languages https://kubernetes.io/docs/reference/using-api/client-libraries
    * Generate client from Swagger specs
    * `curl` or other REST webclient
    ```bash
    curl --cert userbob.pem --key userBob-key.pem \
       --cacert /path/to/ca.pem \
       https://k8sServer:6443/api/v1/pods
    ```

---

# basic bash config

* Enable bash [auto completion](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-autocomplete) (update compatible)
```bash
# add to ~/.bashrc
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k
```

* [powerline go](https://github.com/justjanne/powerline-go)
    1. Install binary `go get -v  -u github.com/justjanne/powerline-go` 
    2. ensure powerline-go is available in the path: `export PATH=$PATH:$GOPATH/bin`
    3. config `~/.bashrc` -> `source ./powerline-go/.bashrc`


---

# basic bash config

* Enable kubectl plugin manager [krew](https://github.com/GoogleContainerTools/krew)
```bash
# add to ~/.bashrc
#
# export KREW_ROOT=/path/to/krew-folder
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
```



---

# kubeconfig

* Default configuration file: `~/.kube/config`
    * endpoints
    * SSL keys
    * contexts

* `$KUBECONFIG` environment variable or `--kubeconfig` flag
    * useful to manage multiple cluster
    * merge multiple config files
    ```bash
    kubectl --kubeconfig=conf1:conf2 config view --flatten > merged.conf
    ```

* Configures your current working environment. 
    * **Attention:** `set-context` modifies context values! `use-context` change the current context!
      ```bash
      # list and change context
      kubectl config get-context
      kubectl config use-context CONTEXT_NAME
    
      # set the used default namespace
      kubectl config set-context --current --namespace=default
      ```
    

---

# kubeconfig - tooling

--- 

    
# auto completion

# output parameter

# plugins

# quick deployments

run
expose

---

# Basic cluster nformation

What cluster do I use?

```
kubectl cluster-info
```

Whats about the components?
```bash
kubectl get componentstatuses
kubectl get cs
```

Troubleshoot the whole cluster
```bash
# download the state
kubectl cluster-info dump --output-directory=./output/cluster-state

# diagnose it
tree ./output/cluster-state

grep -r Error output/cluster-state
grep -C 5 -r Error output/cluster-state
```
---

# kustomize

---

# In-Cluster Tools
!= need a running components in the cluster

## [k9s](https://github.com/derailed/k9s)
* provides a curses based terminal UI

## [popeye](https://github.com/derailed/popeye)
* Kubernetes Cluster Sanitizer
* Find errors

---

# Questions?

> I'm happy to answer!

# Slides?

> Take a look at https://github.com/loodse/kubectl-hacking

# Something to add?

> Open a pull request 😉


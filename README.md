## Configure

To configure Guix for using this channel you need to create a `.config/guix/channels.scm` file with the following content:

``` scheme
(cons* (channel
        (name 'bonfire-guix)
        (url "https://github.com/fishinthecalculator/bonfire-guix")
        (branch "main")
        ;; Enable signature verification:
        (introduction
         (make-channel-introduction
          "2cc6f76adafb6333f0ec3e5fe4835fa0f0d9a0ff"
          (openpgp-fingerprint
           "8D10 60B9 6BB8 292E 829B  7249 AED4 1CC1 93B7 01E2"))))
       %default-channels)
```

Otherwise, if you already have a `.config/guix/channels.scm` you can simply prepend this channel to the preexisting ones:

``` scheme
(cons* (channel
        (name 'bonfire-guix)
        (url "https://github.com/fishinthecalculator/bonfire-guix")
        (branch "main")
        ;; Enable signature verification:
        (introduction
         (make-channel-introduction
          "2cc6f76adafb6333f0ec3e5fe4835fa0f0d9a0ff"
          (openpgp-fingerprint
           "8D10 60B9 6BB8 292E 829B  7249 AED4 1CC1 93B7 01E2"))))
       (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        ;; Enable signature verification:
        (introduction
         (make-channel-introduction
          "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
          (openpgp-fingerprint
           "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
       %default-channels)
```

### What is a Guix channel?

A [channel](https://guix.gnu.org/en/manual/devel/en/guix.html#Channels) is roughly the Guix equivalent of the AUR or container registries. It's a software repository providing Guix package and service definitions.

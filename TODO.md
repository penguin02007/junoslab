# TODO

## Connect VSCodium to netlab host over SSH

VSCodium can't use Microsoft's Remote-SSH extension; use the Open VSX replacement.

- [ ] Install the **Open Remote - SSH** extension (`jeanp413.open-remote-ssh`) in VSCodium.
- [ ] Add  netlab host to `~/.ssh/config`:
  ```
  Host netlab
    HostName 192.168.x.x
    User xyz
  ```
- [ ] Set up key-based login: `ssh-copy-id netlab`, then check that `ssh netlab` works.
- [ ] In VSCodium, press F1, run **Remote-SSH: Connect to Host…** and pick `netlab`.
- [ ] Open the repo folder on the remote host. The integrated terminal now runs on the Linux host.
- [ ] Check the host is ready: `netlab version`, `ls /dev/kvm`, `docker images | grep juniper_vmx`.

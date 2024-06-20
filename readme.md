## How to install

1) Ensure the script that you want to run at shutdown is executable:
```
chmod +x ~/scripts/pre-shutdown.sh
```
2) Move file `pre-shutdown.service` to `etc/systemd/system`
3) Change exact directory in this `.service` file
4) Reload systemd, enable the service so it starts at boot time, then start it up:
```
sudo systemctl daemon-reload
sudo systemctl enable pre-shutdown.service
sudo systemctl start pre-shutdown.service
```

- Check everthing is ok:
```
sudo systemctl status pre-shutdown.service
```



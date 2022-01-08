# drone-plugin-webhook-notification

Usage:

```yaml
- name: send notification
  image: chaunceyshannon/drone-plugin-webhook-notification
  settings:
    webhook_url: https://notification.example.com/httpPostRaw
    title: Do things for dev branch FAILED
    tag: "#WARN"
  when:
    branch: 
    - dev
    status:
    - failure 
```

See also: https://github.com/ChaunceyShannon/notification-webhook

The message will looks like

![image](https://user-images.githubusercontent.com/87258078/148642436-858d86f3-0353-4f74-bfd4-6406a9336de5.png)

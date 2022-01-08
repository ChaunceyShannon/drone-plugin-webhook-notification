# drone-plugin-webhook-notification

Usage:

```yaml
- name: send notification
  image: chaunceyshannon/drone-plugin-webhook-notification
  settings:
    webhook_url: https://notification.example.com/httpPostRaw
    title: TEST FAILED
    tag: "#WARN"
  when:
    branch: 
    - dev
    status:
    - failure 
```

See also: https://github.com/ChaunceyShannon/notification-webhook

The message will looks like

![image](https://user-images.githubusercontent.com/87258078/148642462-93ce8689-523a-461b-a865-cd5bd2a4b30d.png)

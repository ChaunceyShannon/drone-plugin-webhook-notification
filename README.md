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
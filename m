Return-Path: <linux-usb+bounces-26186-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0872B1260A
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 23:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8E86587F91
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 21:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A07025D53B;
	Fri, 25 Jul 2025 21:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yTJdZBkB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE77225D549
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 21:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753477787; cv=none; b=mIibfA4aJBMIoUXURANskUoiyiYsb52z+sibaNpFAMHJPVMdoqPo4wCPLQvWpMgELZ/mkfxDHgUn8/YTzF7CZg8eTEWCbxGI10/AxcFTHqxshI7V10AEuojUGfz9ZtiW2R84OCiHVNTUqdeP4S5DT0lpNnR7TRgEfhrtclO8lVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753477787; c=relaxed/simple;
	bh=wvTDL+zOKqwWvkUcACWSz8TqPKdKWNZr23YLmnm/Sjs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=G2oynDYL+oNLv09fuCgNWSbV650qmafmYbzxDL9zLrQbzyxwZzBksV5o6+RSJDCZSZL9ep/xQckVk3m19k94n7ty03qh3hZT1YEKwMY6dJqtEc8FdtsKRDwA8XPmqgRIaSH0Xa4438dTsK/a9+AeWRhQNaQZB9JyeBjS/Kz9tIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yTJdZBkB; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553d771435fso2688994e87.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 14:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753477783; x=1754082583; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T9yVgfr+aozEM8DGDxueuGs5udBY/KGw9B4OydgnYPo=;
        b=yTJdZBkBYio84/FKRa6AApTNJMlM5v4ii+DEX3uRQssDFyXlnsuFAnhm84WS6ICEns
         ofV2cP9mQ/Z0B7o2k05T4IlvVfzmd8lnhlAQbcWKeKGT1xeMtE3vKHPFooI8i5UzgKF6
         A2oNAy1WdEUd7dd2hlr6MjXo6SfPCnLvQRYWp1ffVXRua7IU1c4Gyyt26fm88QxPEY/H
         nRmM9aFL/WLzK/1f8myhNO7wEFsZz5ndLy8wEDV7gRGTfnbAks1pWd5kHvxLFX003la+
         WprbBhy2BI8Bk2hAlIMP5ihaUPPW+KHvy/CKzwoheww6TMcNj+dzvu3CTVmMAM5hAAus
         s1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753477783; x=1754082583;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T9yVgfr+aozEM8DGDxueuGs5udBY/KGw9B4OydgnYPo=;
        b=pOXX81y9r7KDTUIisaFvTjjF6i0YacXswrJJXwoGXWbvAaPfVdlUHo2FdwGFMJr9pO
         6OVQsOBaLaQrdF/Yh3p1ZRf+ahtDbRoK/n4o+Bu1AEXr+87MHAyeXDM9Tmpq8t2fwYE4
         2hbAjL7kL24bLWLrTUqQGfC3358/dd1VoysTz3MbsKaM1cQFyVB/MmSJwJPihblR8kRy
         x1j57v732T57NZXH8NisPQQJvHuDe2kxVzYFF5Y7BIObKTXXrI8FVkhQeNnvt9XvW3nx
         gF537G2rwR4BiXFsvLNUMpWnvFxde8UNPeMA9BiwI1zslD48H1xDc/lNhiDRc9nyg2X2
         UjTw==
X-Gm-Message-State: AOJu0YxIhYkvGTC9qxdj7nEX9xBUPvLMCeMWDiw8QbdaR9QtDi7ZmCEa
	wZ6D9/O7H1+xrDu8FJGPLaNYgBPoYRpi9KFod32raBpiPAoHjcUgzLyRW7T+Rpq+LV4NNRpdnBZ
	8AXZ+1lL3BSab31DWuonOXaycoxLg9i34sSiWvKOv
X-Gm-Gg: ASbGnculIu3q+ToaDjprZ/kSk8Rc82DMRXxJS6trk91R1qwu2ZjhzBOGNPMcErFwK2S
	8l0TtYF5VovBjTdyKJ06Se+XoeRY5dKF3kFyIgCeI8j28PCTDWkmjS0KfwVlVKrqFVEbblrZ0cc
	MNkT/mjdAOXQmPr9Zx9b/cr05plhXYal3IWzr4L6Y/ElEtHsPW//Vu0rh83CjF31S+rwcwQN3gl
	vbDi/ayfzDX2dnQoQ==
X-Google-Smtp-Source: AGHT+IGifILpKS3IG4n2+Ac2OUBO1CSxWtRZEAmcxqV6hPcbzuvYWZQOYdDp5cujkq3frMLW9Pr3x1TwH8tzdEFfJbU=
X-Received: by 2002:a05:6512:1585:b0:558:f694:a65e with SMTP id
 2adb3069b0e04-55b5f4ab853mr988146e87.34.1753477782471; Fri, 25 Jul 2025
 14:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Olivier Tuchon <tcn@google.com>
Date: Fri, 25 Jul 2025 23:09:26 +0200
X-Gm-Features: Ac12FXzQQGZ4NvFNY6vEn7KyJ4TvhCeqEXMq_9ovtI_Y8BpOS296TQL0DrwN-k8
Message-ID: <CALU+5Vb8kFrR_HMOrBDktxEEQE4d4qBTijVpSdSQz4d3qXsfJQ@mail.gmail.com>
Subject: [PATCH v2] usb: gadget: Address review comments and include missing files
To: Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patch addresses feedback on v1 from greg k-h and Alan Stern. It
also includes files that were missing from the initial submission.

The following changes have been made:
  - correct initial coding style issue (spaces for tabs)
  - add missing file required for the feature to build and run
  - improve FIFO full handling by truncating event data instead of
    dropping the event entirely
  - avoid capturing redundant data for IN submissions

Signed-off-by: Olivier Tuchon <tcn@google.com>
---
 drivers/usb/Kconfig                     |  2 +
 drivers/usb/Makefile                    |  1 +
 drivers/usb/gadget/udc/core.c           | 78 +++++++++++++++++++++++++
 drivers/usb/gadget_mon/Kconfig          | 20 +++----
 drivers/usb/gadget_mon/gadgetmon_main.c | 41 ++++++++-----
 include/linux/usb/gadget.h              | 23 ++++++++
 6 files changed, 141 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index abf8c6cdea9e..b615035cc7c6 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -107,6 +107,8 @@ source "drivers/usb/core/Kconfig"

 source "drivers/usb/mon/Kconfig"

+source "drivers/usb/gadget_mon/Kconfig"
+
 source "drivers/usb/host/Kconfig"

 source "drivers/usb/renesas_usbhs/Kconfig"
diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
index 949eca0adebe..2539151a5366 100644
--- a/drivers/usb/Makefile
+++ b/drivers/usb/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_USB_MUSB_HDRC) += musb/
 obj-$(CONFIG_USB_CHIPIDEA) += chipidea/
 obj-$(CONFIG_USB_RENESAS_USBHS) += renesas_usbhs/
 obj-$(CONFIG_USB_GADGET) += gadget/
+obj-$(CONFIG_USB_GADGET_MON) += gadget_mon/

 obj-$(CONFIG_USBIP_CORE) += usbip/

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index d709e24c1fd4..a7d22ef3ad74 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -28,6 +28,16 @@ static DEFINE_IDA(gadget_id_numbers);

 static const struct bus_type gadget_bus_type;

+/* ------------------------------------------------------------------------- */
+
+/* USB Gadget monitoring */
+#if IS_ENABLED(CONFIG_USB_GADGET_MON)
+static DEFINE_MUTEX(gadget_mon_lock);
+static const struct usb_gadget_mon_operations *gadget_mon_ops;
+#endif
+
+/* ------------------------------------------------------------------------- */
+
 /**
  * struct usb_udc - describes one usb device controller
  * @driver: the gadget driver pointer. For use by the class code
@@ -302,6 +312,18 @@ int usb_ep_queue(struct usb_ep *ep,
 out:
  trace_usb_ep_queue(ep, req, ret);

+#if IS_ENABLED(CONFIG_USB_GADGET_MON)
+ if (unlikely(rcu_access_pointer(gadget_mon_ops))) {
+ const struct usb_gadget_mon_operations *ops;
+
+ rcu_read_lock();
+ ops = rcu_dereference(gadget_mon_ops);
+ if (ops)
+ ops->request_queue(ep, req, ret);
+ rcu_read_unlock();
+ }
+#endif /* CONFIG_USB_GADGET_MON */
+
  return ret;
 }
 EXPORT_SYMBOL_GPL(usb_ep_queue);
@@ -996,6 +1018,18 @@ void usb_gadget_giveback_request(struct usb_ep *ep,

  trace_usb_gadget_giveback_request(ep, req, 0);

+#if IS_ENABLED(CONFIG_USB_GADGET_MON)
+ if (unlikely(rcu_access_pointer(gadget_mon_ops))) {
+ const struct usb_gadget_mon_operations *ops;
+
+ rcu_read_lock();
+ ops = rcu_dereference(gadget_mon_ops);
+ if (ops)
+ ops->request_giveback(ep, req);
+ rcu_read_unlock();
+ }
+#endif /* CONFIG_USB_GADGET_MON */
+
  req->complete(ep, req);
 }
 EXPORT_SYMBOL_GPL(usb_gadget_giveback_request);
@@ -1925,6 +1959,50 @@ static void __exit usb_udc_exit(void)
 }
 module_exit(usb_udc_exit);

+/* ------------------------------------------------------------------------- */
+
+/* USB Gadget monitoring */
+#if IS_ENABLED(CONFIG_USB_GADGET_MON)
+/*
+ * register_gadget_monitor - Register a monitoring module.
+ * @ops: the monitoring operations to register
+ *
+ * Allows a monitoring module to register its callbacks. Returns -EBUSY
+ * if a monitor is already registered
+ */
+int register_gadget_monitor(const struct usb_gadget_mon_operations *ops)
+{
+ int ret = 0;
+
+ mutex_lock(&gadget_mon_lock);
+ if (gadget_mon_ops)
+ ret = -EBUSY;
+ else
+ rcu_assign_pointer(gadget_mon_ops, ops);
+ mutex_unlock(&gadget_mon_lock);
+
+ return ret;
+}
+EXPORT_SYMBOL_GPL(register_gadget_monitor);
+
+/*
+ * unregister_gadget_monitor - Unregister a monitoring module.
+ * @ops: the monitoring operations to unregister
+ *
+ * A module must call this to unregister its callbacks before exiting
+ */
+void unregister_gadget_monitor(const struct usb_gadget_mon_operations *ops)
+{
+ mutex_lock(&gadget_mon_lock);
+ if (gadget_mon_ops == ops)
+ rcu_assign_pointer(gadget_mon_ops, NULL);
+ mutex_unlock(&gadget_mon_lock);
+
+ synchronize_rcu();
+}
+EXPORT_SYMBOL_GPL(unregister_gadget_monitor);
+#endif
+
 MODULE_DESCRIPTION("UDC Framework");
 MODULE_AUTHOR("Felipe Balbi <balbi@ti.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/usb/gadget_mon/Kconfig b/drivers/usb/gadget_mon/Kconfig
index 113423a2a96f..bfda5c006909 100644
--- a/drivers/usb/gadget_mon/Kconfig
+++ b/drivers/usb/gadget_mon/Kconfig
@@ -4,18 +4,18 @@
 #

 config USB_GADGET_MON
-  tristate "Gadget-side USB monitor"
-  depends on USB_GADGET
-  help
-    This option enables a low-level monitor for the USB gadget
-    subsystem, similar to what usbmon provides for the host side.
+ tristate "Gadget-side USB monitor"
+ depends on USB_GADGET
+ help
+   This option enables a low-level monitor for the USB gadget
+   subsystem, similar to what usbmon provides for the host side.

-    It creates a character device (/dev/gadgetmon0) that outputs a
-    stream of all USB request submissions and completions, allowing
-    for detailed debugging and performance analysis of gadget drivers.
+   It creates a character device (/dev/gadgetmon0) that outputs a
+   stream of all USB request submissions and completions, allowing
+   for detailed debugging and performance analysis of gadget drivers.

-    This is primarily a tool for developers. If you are not developing
-    or debugging a USB gadget function driver, say N.
+   This is primarily a tool for developers. If you are not developing
+   or debugging a USB gadget function driver, say N.

 config GADGETMON_BUFFER_SIZE_MB
  int "Buffer size for gadget monitor (in MiB)"
diff --git a/drivers/usb/gadget_mon/gadgetmon_main.c
b/drivers/usb/gadget_mon/gadgetmon_main.c
index 9017f91808ae..4597f10abc5e 100644
--- a/drivers/usb/gadget_mon/gadgetmon_main.c
+++ b/drivers/usb/gadget_mon/gadgetmon_main.c
@@ -50,7 +50,8 @@ static void gadgetmon_event(enum
gadgetmon_event_type event_type,
  unsigned long flags;
  struct gadgetmon_hdr hdr;
  u32 payload_len;
- u32 total_len;
+ u32 available_space;
+ u32 payload_to_copy;
  struct timespec64 ts;

  if (!req || !ep)
@@ -78,28 +79,32 @@ static void gadgetmon_event(enum
gadgetmon_event_type event_type,
  if (payload_len > GADGETMON_DATA_MAX)
  payload_len = GADGETMON_DATA_MAX;
  /*
- * optimization: for an OUT submission (host-to-device), the data
- * has not yet arrived from the host. The buffer is an empty
- * placeholder, so its content is not captured to save space.
+ * optimization: for all submission, the buffer data is not yet
+ * relevant. Capture no payload to save significant buffer space.
  */
- if (event_type == GADGETMON_EVENT_SUBMIT && hdr.dir == USB_DIR_OUT)
+ if (event_type == GADGETMON_EVENT_SUBMIT)
  payload_len = 0;

  hdr.data_len = payload_len;
- total_len = sizeof(hdr) + payload_len;

  /* lock and queue the event into the FIFO */
  spin_lock_irqsave(&mon_lock, flags);

- if (kfifo_avail(&mon_fifo) < total_len) {
- /* not enough space, drop the event silently */
+ available_space = kfifo_avail(&mon_fifo);
+
+ /* if the header itself doesn't fit, we must drop the even */
+ if (available_space < sizeof(hdr)) {
  spin_unlock_irqrestore(&mon_lock, flags);
  return;
  }

+ payload_to_copy = min(payload_len, available_space - sizeof(hdr));
+ if (payload_to_copy != payload_len)
+ hdr.data_len = payload_to_copy;
+
  kfifo_in(&mon_fifo, &hdr, sizeof(hdr));
- if (payload_len > 0)
- kfifo_in(&mon_fifo, req->buf, payload_len);
+ if (payload_to_copy > 0)
+ kfifo_in(&mon_fifo, req->buf, payload_to_copy);

  spin_unlock_irqrestore(&mon_lock, flags);

@@ -251,13 +256,20 @@ static int __init gadgetmon_init(void)
  goto err_del_cdev;
  }

- /* Atomically publish our monitoring functions to the UDC core */
- rcu_assign_pointer(gadget_mon_ops, &gadget_mon_ops_impl);
+ /* register our monitoring functions with the UDC core */
+ ret = register_gadget_monitor(&gadget_mon_ops_impl);
+ if (ret) {
+ pr_err("gadgetmon: Failed to register monitor, is another one loaded? (%d)\n",
+        ret);
+ goto err_destroy_device;
+ }

  pr_info("gadgetmon: Gadget Monitoring driver loaded\n");

  return 0;

+err_destroy_device:
+ device_destroy(mon_class, mon_dev_t);
 err_del_cdev:
  cdev_del(&mon_cdev);
 err_destroy_class:
@@ -278,8 +290,9 @@ static int __init gadgetmon_init(void)
  */
 static void __exit gadgetmon_exit(void)
 {
- rcu_assign_pointer(gadget_mon_ops, NULL);
- synchronize_rcu();
+ pr_info("Gadget Monitoring driver unloading\n");
+
+ unregister_gadget_monitor(&gadget_mon_ops_impl);

  device_destroy(mon_class, mon_dev_t);
  cdev_del(&mon_cdev);
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index df33333650a0..a263b8ea968f 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -971,4 +971,27 @@ extern void usb_ep_autoconfig_release(struct usb_ep *);

 extern void usb_ep_autoconfig_reset(struct usb_gadget *);

+/*-------------------------------------------------------------------------*/
+
+/* USB Gadget monitoring */
+#if IS_ENABLED(CONFIG_USB_GADGET_MON)
+/**
+ * struct usb_gadget_mon_operations - operations for gadget monitoring
+ * @request_queue: Called when a gadget driver queues a request.
+ * @request_giveback: Called just before a request is given back.
+ */
+struct usb_gadget_mon_operations {
+ void (*request_queue)(struct usb_ep *ep, const struct usb_request *req,
+ int status);
+ void (*request_giveback)(struct usb_ep *ep,
+ const struct usb_request *req);
+};
+
+int register_gadget_monitor(const struct usb_gadget_mon_operations *ops);
+void unregister_gadget_monitor(const struct usb_gadget_mon_operations *ops);
+#else
+static inline int register_gadget_monitor(const void *ops) { return 0; }
+static inline void unregister_gadget_monitor(const void *ops) { }
+#endif /* CONFIG_USB_GADGET_MON */
+
 #endif /* __LINUX_USB_GADGET_H */
-- 
2.50.1.487.gc89ff58d15-goog

Changes in v2:
  - Add optimization to skip capturing IN submissions
  - Truncate event payload on FIFO full instead of dropping (as
    suggested)
  - Added forgotten files (include/linux/usb/gadget.h,
    drivers/usb/core/Kconfig, drivers/usb/Makefile,
    drivers/usb/gadget/udc/core.c)
  - Fixed initial indentation issues


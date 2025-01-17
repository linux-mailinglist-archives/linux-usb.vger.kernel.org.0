Return-Path: <linux-usb+bounces-19500-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BACA1523D
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 15:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 296B27A5B3E
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 14:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DF7192D77;
	Fri, 17 Jan 2025 14:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k6D7UWPr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31226187332
	for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737125584; cv=none; b=mYzSP2lIH4hdBtfnh4jsKQXVlRKuQGo8Kin62cz0Wld319KuA5IyNxHyxxh8wnVeher3671RtQ3yVZrzsxjs5i42V+ayuTpHk/z1/sGLOKsjWveK1WeSx5TqbwvMSEO3GjJrZjkZ0LQkSxrH0JF4x5qXYpp4KT8WIfb/tO/wEvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737125584; c=relaxed/simple;
	bh=iHbXpApZXMdoYmO22LcNZiKWepotlBPXNi3hKmTmmTQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MlPiJonbu0SJprZF1/JRGVJUQ++SPcXgXO/xApJwoDljyBjF+c5vNWlOIBwAibG3g36NB/407+hbB4MaKGwjf8npovuapExNhoHz9mazIFEXHglKYOzNlp9bX0Bt+BA2EXKoDnGfChwvSffmZUPF+pPyg1IzPYfCT7leJKdxAIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k6D7UWPr; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21632eacb31so29789885ad.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737125582; x=1737730382; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=frSvqT6dyBKNEvGXV8Wp1l7540diAFryFwfnWgvRajk=;
        b=k6D7UWPrWDNCOwTIwnWlfQaQdOh4J7hJn+h8gv4ohAUQRHSbSz/IC7MP2RmNYmOxIf
         XvwK5PlstP1IwVrzWJAWVP9EIqq43P0CU+PgKksF56O5qUycrMpkHjXcw0Pua6lOUCjB
         q4NGQHgU5CoEFrhOJc6CeqkbVaKpewF0vX5IhLdzUE6rpzY7LYHetJCf0kqo6LP4gOXd
         3Z8rsWxKb/cKOeUhectEZAGrED9D7ZljF9xDf60lWyMo2MQ8kr4oPt/zqc0YW0XU6Zfj
         XMnlbA8rtnr2LU347m3tR0B+Rq8mcZpBqOxNL8dYs5w4pWiOO2w0troGUGsE3Jp8me68
         z6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737125582; x=1737730382;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frSvqT6dyBKNEvGXV8Wp1l7540diAFryFwfnWgvRajk=;
        b=eAIw8S716PzfBjy9XOGalNi0trpLKQOGq4gwJIwDeNM4X3614gL4BphriP/1EqawR+
         nmVSWxEXbIKll8/cCGX0yDaI60+LCRF8LbLTyh1z1lOANIJPxsNAK21Y7gjmeGiUHHsL
         wb406WS7ws+yJbjrnWR81qrccCxtc/q7JjRowzKG2qEFtDe7tfiqykk7neqpTreiIypS
         WP/+OSnF9hvYsxAACoaWBBdGEQ9yZyQsIVF6UM3cfxwrizSjfwsK/9kfu+vECe+KrpN8
         JNnRw88FeVM9mtu9XA9l8JNnIGfVxlAR+RWwaOxygHqwXkFIV+wWDtH54Lcz74vFbH8u
         wJQA==
X-Gm-Message-State: AOJu0YzDxN/dQjjjttwGlaBKApmUZ+NBzp92eUdnPJhc6Gn8F9rug7qO
	q24G20u48dbY0+cPdj9ZpE3M+N3+OCDbiMzWCtfsg/Oeemw8bGdymGCwy/1PqK8n4UMJRU9f6jN
	Wuv3rgPshjW2/Uw==
X-Google-Smtp-Source: AGHT+IF55fT+MIQRNgHb5FBEpqG+tB9zVOthP5UrALOkQrxjIkT0YPsd0Q/19oxIvzGCDSGgyzh9KIWvk9sQ9GY=
X-Received: from pfvb5.prod.google.com ([2002:a05:6a00:cc5:b0:72a:bcc3:4c9a])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:148e:b0:725:db34:6a7d with SMTP id d2e1a72fcca58-72dafbe9ca8mr4994052b3a.23.1737125582491;
 Fri, 17 Jan 2025 06:53:02 -0800 (PST)
Date: Fri, 17 Jan 2025 14:48:03 +0000
In-Reply-To: <20250117145145.3093352-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250117145145.3093352-1-guanyulin@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117145145.3093352-4-guanyulin@google.com>
Subject: [PATCH v9 3/5] usb: add apis for offload usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce offload_usage and corresponding apis to track offload usage
on each USB device. Offload denotes that there is another co-processor
accessing the USB device via the same USB host controller. To optimize
power usage, it's essential to monitor whether the USB device is
actively used by other co-processor. This information is vital when
determining if a USB device can be safely suspended during system power
state transitions.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/core/driver.c | 108 ++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.c    |   4 ++
 include/linux/usb.h       |  19 +++++++
 3 files changed, 131 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index f203fdbfb6f6..1bbf9592724f 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -2037,6 +2037,114 @@ int usb_disable_usb2_hardware_lpm(struct usb_device *udev)
 
 #endif /* CONFIG_PM */
 
+#ifdef CONFIG_USB_XHCI_SIDEBAND
+
+/**
+ * usb_offload_get - increment the offload_usage of a USB device
+ * @udev: the USB device to increment its offload_usage
+ *
+ * Incrementing the offload_usage of a usb_device indicates that offload is
+ * enabled on this usb_device; that is, another entity is actively handling USB
+ * transfers. This information allows the USB driver to adjust its power
+ * management policy based on offload activity.
+ *
+ * The caller must hold @udev's device lock.
+ *
+ * Return: 0 on success. A negative error code otherwise.
+ */
+int usb_offload_get(struct usb_device *udev)
+{
+	int ret;
+
+	if (udev->state == USB_STATE_NOTATTACHED ||
+			udev->state == USB_STATE_SUSPENDED)
+		return -EAGAIN;
+
+	/*
+	 * offload_usage could only be modified when the device is active, since
+	 * it will alter the suspend flow of the device.
+	 */
+	ret = pm_runtime_resume_and_get(&udev->dev);
+
+	if (ret < 0)
+		return ret;
+
+	refcount_inc(&udev->offload_usage);
+	pm_runtime_put_sync(&udev->dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_offload_get);
+
+/**
+ * usb_offload_put - drop the offload_usage of a USB device
+ * @udev: the USB device to drop its offload_usage
+ *
+ * The inverse operation of usb_offload_get, which drops the offload_usage of
+ * a USB device. This information allows the USB driver to adjust its power
+ * management policy based on offload activity.
+ *
+ * The caller must hold @udev's device lock.
+ *
+ * Return: 0 on success. A negative error code otherwise.
+ */
+int usb_offload_put(struct usb_device *udev)
+{
+	int ret;
+
+	if (udev->state == USB_STATE_NOTATTACHED ||
+			udev->state == USB_STATE_SUSPENDED)
+		return -EAGAIN;
+
+	/*
+	 * offload_usage could only be modified when the device is active, since
+	 * it will alter the suspend flow of the device.
+	 */
+	ret = pm_runtime_resume_and_get(&udev->dev);
+
+	if (ret < 0)
+		return ret;
+
+	/* Drop the count when it wasn't 0, ignore the operation otherwise. */
+	ret = refcount_add_not_zero(-1, &udev->offload_usage);
+	pm_runtime_put_sync(&udev->dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_offload_put);
+
+/**
+ * usb_offload_check - check offload activities on a USB device
+ * @udev: the USB device to check its offload activity.
+ *
+ * Check if there are any offload activity on the USB device right now. This
+ * information could be used for power management or other forms of resource
+ * management.
+ *
+ * The caller must hold @udev's device lock.
+ *
+ * Returns true on any offload activity, false otherwise.
+ */
+bool usb_offload_check(struct usb_device *udev)
+{
+	struct usb_device *child;
+	bool active;
+	int port1;
+
+	usb_hub_for_each_child(udev, port1, child) {
+		device_lock(&child->dev);
+		active = usb_offload_check(child);
+		device_unlock(&child->dev);
+		if (active)
+			return true;
+	}
+
+	return !!refcount_read(&udev->offload_usage);
+}
+EXPORT_SYMBOL_GPL(usb_offload_check);
+
+#endif /* CONFIG_USB_XHCI_SIDEBAND */
+
 const struct bus_type usb_bus_type = {
 	.name =		"usb",
 	.match =	usb_device_match,
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 0b4685aad2d5..888ab599fd06 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -672,6 +672,10 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
 	dev->lpm_disable_count = 1;
 	atomic_set(&dev->urbnum, 0);
 
+#ifdef CONFIG_USB_XHCI_SIDEBAND
+	refcount_set(&dev->offload_usage, 0);
+#endif
+
 	INIT_LIST_HEAD(&dev->ep0.urb_list);
 	dev->ep0.desc.bLength = USB_DT_ENDPOINT_SIZE;
 	dev->ep0.desc.bDescriptorType = USB_DT_ENDPOINT;
diff --git a/include/linux/usb.h b/include/linux/usb.h
index cfa8005e24f9..9b3f630e763e 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -645,6 +645,7 @@ struct usb3_lpm_parameters {
  *	parent->hub_delay + wHubDelay + tTPTransmissionDelay (40ns)
  *	Will be used as wValue for SetIsochDelay requests.
  * @use_generic_driver: ask driver core to reprobe using the generic driver.
+ * @offload_usage: number of offload activities happening on this usb device.
  *
  * Notes:
  * Usbcore drivers should not set usbdev->state directly.  Instead use
@@ -731,6 +732,10 @@ struct usb_device {
 
 	u16 hub_delay;
 	unsigned use_generic_driver:1;
+
+#ifdef CONFIG_USB_XHCI_SIDEBAND
+	refcount_t offload_usage;
+#endif
 };
 
 #define to_usb_device(__dev)	container_of_const(__dev, struct usb_device, dev)
@@ -837,6 +842,20 @@ static inline void usb_mark_last_busy(struct usb_device *udev)
 { }
 #endif
 
+#ifdef CONFIG_USB_XHCI_SIDEBAND
+extern int usb_offload_get(struct usb_device *udev);
+extern int usb_offload_put(struct usb_device *udev);
+extern bool usb_offload_check(struct usb_device *udev);
+#else
+
+static inline int usb_offload_get(struct usb_device *udev)
+{ return 0; }
+static inline int usb_offload_put(struct usb_device *udev)
+{ return 0; }
+static inline bool usb_offload_check(struct usb_device *udev)
+{ return false; }
+#endif
+
 extern int usb_disable_lpm(struct usb_device *udev);
 extern void usb_enable_lpm(struct usb_device *udev);
 /* Same as above, but these functions lock/unlock the bandwidth_mutex. */
-- 
2.48.0.rc2.279.g1de40edade-goog



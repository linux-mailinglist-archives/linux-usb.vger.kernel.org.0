Return-Path: <linux-usb+bounces-19410-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3605A13B5E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 14:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3834816616E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 13:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1061722B8DA;
	Thu, 16 Jan 2025 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zXM7CRV2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02EE22A803
	for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737035683; cv=none; b=qGKEMb148RN/7+VNZJQmHJtfS7/9kyWzBwZUsKxD6Z2AFfymeQABPELnooWeN//bmjBP/oiyjiIp9ip4Hkr8QSxvaVvEElKUXeCUw2Bb4YBHdehApSkwuHOtbMy8bYwSz0jqDh4myaKwHhkuDJznkC5d69FF4VI6CWXA00EHtzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737035683; c=relaxed/simple;
	bh=iHbXpApZXMdoYmO22LcNZiKWepotlBPXNi3hKmTmmTQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UgHaYEgHOt/aKnCMPBExBXBCXrAfF1YmyHaNjUk6xi928mWixalNKWFPX0lJqaZb3gPAdhPMmbSEO+iFuT+JLf54BowFckcRl26ol0M0J/CHHNP1r+H7e6ApAF5LAXpbvADCEpq69u/T4OVgGQhMZujm9r76/0RcNjzF0XMQfO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zXM7CRV2; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef775ec883so2023844a91.1
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 05:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737035680; x=1737640480; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=frSvqT6dyBKNEvGXV8Wp1l7540diAFryFwfnWgvRajk=;
        b=zXM7CRV23PYb7E3Eyo0jd9wkVBdN+KBRFM3sVdGmk8mnL23rDTnWo+q8mXve+I/7Yb
         2jup6msmE96/yNjPx+JFQviaRp8H1pWi5dCA/FQGe4c3b7R1ujM76sbbaBCygz9ROFDD
         zHeAYHVgFJOSrNOjyOgn0XG1kjyms4isd8LK8GHSOD8JRJrlUTqmVx/azG4eE+7Sq7DI
         cJOi11zi2Uk5S+PgFzbw9oU7y0BbZJEy1Nm2l5yVQaejPdt++NJvAYTi3AW7hjcfkcq8
         wb/TZVD0XmoK56tTeremOjbjU6ynUOnuAM/H/0ED+HgNJYjZ7MWu+UfV8IUsEZDqftE1
         Owag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737035680; x=1737640480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frSvqT6dyBKNEvGXV8Wp1l7540diAFryFwfnWgvRajk=;
        b=LUDBwthkuQFLeU13VjIoJp8VtOv/I70W7oIRzhpVPmrVM0HWOSM5PZqWsfVHGFzjAY
         KP8sUSe0mRox/2PfOJtYV+7nQXhEoKpy2kkGuQ+eHGSM+5/1UZgK8NmBAeIeE8kmJ3TB
         tKGqzxAHa40AzdoztlwSVFyLVtnTkooH9XO2GJwQGf+KMZ/esOVCxE+dW+QWNQ+41Kvk
         kiMuVGrTA+Z46l66nuRn54WWFVrTayUWgKPNPHm838ThqgfST75cdK/sZBGpD5/3xCEJ
         GLj0R59i/O2zI8YZ7jln1FwtgCvjC9ihWK/2Bo5JxQjPb6jxkj01n4CU5lVvLzEypoA1
         +oJQ==
X-Gm-Message-State: AOJu0YyDfDTCtELe4ECKOor7SLoCQul8wMCGJQX/vgjhDukhPEFb5YEe
	QmB5AJn+skH2WCUBao8RDwVy3D/D3DsUx0t8a9U1xR90nDv23D/croGdoNJ4NOD75M6FmW+oLJf
	+pis6W0Gu88bOXg==
X-Google-Smtp-Source: AGHT+IEFXpmhl6Uk6fSDur8w3nPtXbWer5SIEq/xjrwyyv25VZQnR2zXm1NoGGgYMQnYj1N80prvPspuV5zRs7g=
X-Received: from pjbcz3.prod.google.com ([2002:a17:90a:d443:b0:2ea:aa56:49c])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:56cb:b0:2ee:c04a:4281 with SMTP id 98e67ed59e1d1-2f548f102demr43736693a91.6.1737035680439;
 Thu, 16 Jan 2025 05:54:40 -0800 (PST)
Date: Thu, 16 Jan 2025 13:50:15 +0000
In-Reply-To: <20250116135358.2335615-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250116135358.2335615-1-guanyulin@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250116135358.2335615-4-guanyulin@google.com>
Subject: [PATCH v8 3/5] usb: add apis for offload usage tracking
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



Return-Path: <linux-usb+bounces-19154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B19D8A06C8E
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 04:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEBCD3A5AC2
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 03:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3881885A1;
	Thu,  9 Jan 2025 03:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k2oqESLV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0281714D7
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 03:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736395013; cv=none; b=eH/gvI5naUSW2JqitZrZqozVL0K7E1eOlPYTq1iIbdH4XpMjPnn6XK5M3DfewBs8Pl3UN4p2a014VaAvutWhIDe+OWaUBwkrB9mstPyTQMfG02CF/51Pma49m/Ygzv4uplQy4RGU/6eoa2m55s/1YkSX7p22Jc8bCyrPP5kd8K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736395013; c=relaxed/simple;
	bh=qD47mFE3rEqJaFm2tUJyM5imvW+agFlxeHfG7ZpS6Oo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oN0zQt6TjGaoKe3h+fQQdcGC44EEw0i0cuwnSeGVPkYHV40GnIsIAC+bNKm/jLSHjFJWhVB6WOjybAUdiMNNJLIKvW9nuRFWptC1FukpAMp5JBoVhdfM94XfCM984jRQHYlr1FBaYv5c8bTiT2mQgVPdaj/iKbZcLZ0B7z9N1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k2oqESLV; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2161d5b3eb5so7654665ad.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2025 19:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736395011; x=1736999811; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2aovcihj81aQ72/90alHYAGugMvajBS9wOWu8mRVTbM=;
        b=k2oqESLVKvsLBDD/S4N9Wzx4emFN2fcj05jb7OYqcOBOl6ATz2M5UF+oJFExAQNwbu
         giDpU+PMZhw3ZcduoWVexKNRsSFuaoM7/0tJIG6A2OryKraQ6cex21tq3HXjdpHiUmJI
         cLDWaanDBKvaHzl6dwQVlGrvnHzcQbfoVgZhqHjLk+0nNmQvLbrNx0+qzf5HzHsomECS
         xGBIUiedOjBh13SXnt4zmqgwxzOQVgRJroj704kPEEqaFGgsZnemMCDHJxXR1cg5EDM0
         4iJ5cYbJK+Kj8Qo4cv8Oi9Nq2guF8nD44Cuw7RrObmHfJtUxLbRs1KA3G5SiN1oqQX+I
         EOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736395011; x=1736999811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2aovcihj81aQ72/90alHYAGugMvajBS9wOWu8mRVTbM=;
        b=bEfUqwBIguWv5LmPVvkuDC/sLSzvQQ+CwGpAIvc5kMJ9xXUbHKarY4kd1rgtaGWhuc
         L43H0InewixiT8qlQDJLVYoaixaCf2vYSd9T7Keyb9SNOuxdyV5siW0qqpu9yI4Cv6z7
         1BDKE52GN+MAebmr46dMysre80rWXKFK6MOqOD7KmKo6++tffpJcoj1ZBtsiz/H7dxg6
         Nle/9zNbi2RrvCbRyNY8Y4ctURtG0h4AVaggNgKbOi1QsX8TFDmRJHLsON7uGKgbc6iq
         YdutFZ4ARxfCsn3QdrFicp4GvcoE8EkhoSPBDmpXB2QqDGjQkrqm+RHvio31slWwwjNF
         WfRA==
X-Gm-Message-State: AOJu0YyEgxI54D80KEiiyFg2XhIa0rMn/Sy9DtJ6+OKYc8borQxArf9b
	uxi8GiDHHjddgTKhuoXQXdFkMGX8N/qicTvzAyUMKytyGXxvgUUfpFoQU99LvqSRhEAam69YkpY
	ObXAxbhns6XR76A==
X-Google-Smtp-Source: AGHT+IF9SEICxhuGaDaYAOJsDAfUX42u4sbhlCKIXa4C2f+APQNh+Y/TdDoeKJtYIjbny0ziK/9kFlamEEWWHys=
X-Received: from plbje5.prod.google.com ([2002:a17:903:2645:b0:216:37d8:bda6])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:230b:b0:215:b087:5d62 with SMTP id d9443c01a7336-21a83fe4b38mr93216155ad.36.1736395010709;
 Wed, 08 Jan 2025 19:56:50 -0800 (PST)
Date: Thu,  9 Jan 2025 03:55:07 +0000
In-Reply-To: <20250109035605.1486717-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109035605.1486717-1-guanyulin@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109035605.1486717-4-guanyulin@google.com>
Subject: [PATCH v7 3/5] usb: add apis for offload usage tracking
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
index f203fdbfb6f6..01f6287cf73f 100644
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
+	ret = pm_runtime_get_sync(&udev->dev);
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
+	ret = pm_runtime_get_sync(&udev->dev);
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
2.47.1.613.gc27f4b7a9f-goog



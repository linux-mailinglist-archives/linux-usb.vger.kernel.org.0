Return-Path: <linux-usb+bounces-24353-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9810AAC653E
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 11:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E53627AF83D
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 09:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A904527511B;
	Wed, 28 May 2025 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kk4Xas/i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE862750F3
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 09:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423357; cv=none; b=PVUq+kXhwzAaIbtr9PVx98R10RLIyFMhQT9O1wJN+mc7hrbYqnim3CG8+8BvSz4hYNUpdAz/kRqs8EJbQ8kV6/aq/YLcu4mLF2GIkWoW8mDJf0qjxDPiNoVR6PslT5HWbdBsM5n2n+KOIuwYwGqSZz6JVlGukujmL0hzSV5D0j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423357; c=relaxed/simple;
	bh=QZ8nwHA2Zs5IEnJ/86ZrMAoj82ULzOVmYhVsq8xnvV0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PRL10cgywnDLbVZpKQVOqH2lDq4wvQE8C4kkf69Dqo/87nFLsB9u1+FrTLToQkJIMsfn2Kc0H+Z7KkUQrKKmkSjLAIFymIN5bnHQUCXM3xlXfQC+qPFZGwIfc6OcJ9pY4ufJukOs6OFZGy8gf7DCc0ESXtf/n9Yob1/3RZwrcq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kk4Xas/i; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742c03c0272so5447366b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 02:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748423354; x=1749028154; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7i0pI2VSaiukiHxpLuyRQrobpFu/1Ba7IiH2E3RcyA4=;
        b=Kk4Xas/imN00BaTVVlwEXFyFKxqLh4SF4jrmcQSq1Onjgk1s2qSjNIWP01OSHoF1bN
         fZjoyQqjN80C4MozsZG8FYdfQzSSyMto9gcKeukWUKTh15YsKAeg0lkB8flJn5kMQLyi
         3nm2TqYCnXF3qRZpN7sVDemh8p+/PjDqGXehJHQjFjpXZizsSvvNQE835RrCK7l28vzM
         7R9ZUvftCtNaH6Zs82jnHz3wJi+Fq3a0TFzHZ+jpv0qRXewhJ4w/7BK9Wc9dUx81G/Fi
         n7XN6nZbXpyACgYZOw9mMYvHf8C+pt1OYIc5Wsjbnwi9DiAs3vh0vD7ASOZCjJ3pcByi
         PK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748423354; x=1749028154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7i0pI2VSaiukiHxpLuyRQrobpFu/1Ba7IiH2E3RcyA4=;
        b=o96hTPMJ2OXDA2cmRh9TaOamP0UuFbgH3dpwqViyVPzXA2qH6rDZyP5eRO/GcCIhH9
         PcfM2/3lANGtBXgTBBWnCNhotPtT/+LDxoCOhD9hCCLIrnENYkDTql/i3GSgR9Dm2ZKL
         B16ykuv4vPvi2/2X1QaO1ThPWiFGPKMh09XSgYSKHZy4KiMtwTU/y+SQOgNn5aH4920N
         7WcvB72Y5JEksjFnM6O7Sap+zGZPOWtOJG0p2hVGfHH9lpagZcs3uuPR3OrP/Lg98SFf
         l8DvYVScmR+siqBknWFxfKBStbWfCi3ZyE6WsDKCgPgdp8g64eQb3PYvVU0SWvWktH5V
         kw7Q==
X-Gm-Message-State: AOJu0YxDnCOuCf52/YIS1m1mWMCSfQb6Cvu0Vaf1vxXaOuC1brvL270o
	ia2CHekv0VCunnjzXPIIdjZ9ruJgUNqz/+ZrFXupzdIrGy8hkbKBsdSVssH6pX9S8VEOVDl5g5N
	PO+mdEATvVSJGATDpNA==
X-Google-Smtp-Source: AGHT+IGAY35NYQRKcefBr55JNYjQ76Ji/yrxDy5NkYKXawxtZr4Wq4bM8PsSVQhHqGBP3evI8i14j8qyWM/F92s=
X-Received: from pfak3.prod.google.com ([2002:aa7:92c3:0:b0:746:270f:79c0])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:9154:b0:746:227c:a808 with SMTP id d2e1a72fcca58-746227ca91dmr11682121b3a.24.1748423353862;
 Wed, 28 May 2025 02:09:13 -0700 (PDT)
Date: Wed, 28 May 2025 09:04:07 +0000
In-Reply-To: <20250528090849.2095085-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250528090849.2095085-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250528090849.2095085-3-guanyulin@google.com>
Subject: [PATCH v13 2/4] usb: add apis for offload usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guan-Yu Lin <guanyulin@google.com>
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
 drivers/usb/core/driver.c | 125 ++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.c    |   1 +
 drivers/usb/host/Kconfig  |  11 ++++
 include/linux/usb.h       |  18 ++++++
 4 files changed, 155 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 460d4dde5994..0690619454fe 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -2036,6 +2036,131 @@ int usb_disable_usb2_hardware_lpm(struct usb_device *udev)
 
 #endif /* CONFIG_PM */
 
+#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
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
+ * Return: 0 on success. A negative error code otherwise.
+ */
+int usb_offload_get(struct usb_device *udev)
+{
+	int ret;
+
+	usb_lock_device(udev);
+	if (udev->state == USB_STATE_NOTATTACHED) {
+		ret = -ENODEV;
+		goto unlock_device;
+	} else if (udev->state == USB_STATE_SUSPENDED ||
+		   udev->offload_at_suspend) {
+		ret = -EBUSY;
+		goto unlock_device;
+	}
+
+	/*
+	 * offload_usage could only be modified when the device is active, since
+	 * it will alter the suspend flow of the device.
+	 */
+	ret = usb_autoresume_device(udev);
+
+	if (ret < 0)
+		goto unlock_device;
+
+	udev->offload_usage++;
+	usb_autosuspend_device(udev);
+
+unlock_device:
+	usb_unlock_device(udev);
+
+	return ret;
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
+ * Return: 0 on success. A negative error code otherwise.
+ */
+int usb_offload_put(struct usb_device *udev)
+{
+	int ret;
+
+	usb_lock_device(udev);
+	if (udev->state == USB_STATE_NOTATTACHED) {
+		ret = -ENODEV;
+		goto unlock_device;
+	} else if (udev->state == USB_STATE_SUSPENDED ||
+		   udev->offload_at_suspend) {
+		ret = -EBUSY;
+		goto unlock_device;
+	}
+
+	/*
+	 * offload_usage could only be modified when the device is active, since
+	 * it will alter the suspend flow of the device.
+	 */
+	ret = usb_autoresume_device(udev);
+
+	if (ret < 0)
+		goto unlock_device;
+
+	/* Drop the count when it wasn't 0, ignore the operation otherwise. */
+	if (udev->offload_usage)
+		udev->offload_usage--;
+	usb_autosuspend_device(udev);
+
+unlock_device:
+	usb_unlock_device(udev);
+
+	return ret;
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
+ * The caller must hold @udev's device lock. In addition, the caller should
+ * ensure downstream usb devices are all either suspended or marked as
+ * "offload_at_suspend" to ensure the correctness of the return value.
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
+		usb_lock_device(child);
+		active = usb_offload_check(child);
+		usb_unlock_device(child);
+		if (active)
+			return true;
+	}
+
+	return !!udev->offload_usage;
+}
+EXPORT_SYMBOL_GPL(usb_offload_check);
+
+#endif /* IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND) */
+
 const struct bus_type usb_bus_type = {
 	.name =		"usb",
 	.match =	usb_device_match,
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 118fa4c93a79..43efd9d939c0 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -670,6 +670,7 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
 	set_dev_node(&dev->dev, dev_to_node(bus->sysdev));
 	dev->state = USB_STATE_ATTACHED;
 	dev->lpm_disable_count = 1;
+	dev->offload_usage = 0;
 	atomic_set(&dev->urbnum, 0);
 
 	INIT_LIST_HEAD(&dev->ep0.urb_list);
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 109100cc77a3..49b9cdc11298 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -113,6 +113,17 @@ config USB_XHCI_SIDEBAND
 	  xHCI USB endpoints directly, allowing CPU to sleep while playing
 	  audio.
 
+config USB_XHCI_SIDEBAND_SUSPEND
+	  bool "xHCI support for sideband during system suspend"
+	  depends on USB_XHCI_SIDEBAND
+	  depends on USB_XHCI_PLATFORM
+	  depends on SUSPEND
+	  help
+	    Say 'Y' to enable the support for the xHCI sideband capability
+	    after system suspended. In addition to USB_XHCI_SIDEBAND, this
+	    config allows endpoints and interrupters associated with the
+	    sideband function when system is suspended.
+
 config USB_XHCI_TEGRA
 	tristate "xHCI support for NVIDIA Tegra SoCs"
 	depends on PHY_TEGRA_XUSB
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 1b2545b4363b..f5bca317fa4c 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -635,6 +635,8 @@ struct usb3_lpm_parameters {
  * @do_remote_wakeup:  remote wakeup should be enabled
  * @reset_resume: needs reset instead of resume
  * @port_is_suspended: the upstream port is suspended (L2 or U3)
+ * @offload_at_suspend: offload activities during suspend is enabled.
+ * @offload_usage: number of offload activities happening on this usb device.
  * @slot_id: Slot ID assigned by xHCI
  * @l1_params: best effor service latency for USB2 L1 LPM state, and L1 timeout.
  * @u1_params: exit latencies for USB3 U1 LPM state, and hub-initiated timeout.
@@ -723,6 +725,8 @@ struct usb_device {
 	unsigned do_remote_wakeup:1;
 	unsigned reset_resume:1;
 	unsigned port_is_suspended:1;
+	unsigned offload_at_suspend:1;
+	int offload_usage;
 	enum usb_link_tunnel_mode tunnel_mode;
 
 	int slot_id;
@@ -839,6 +843,20 @@ static inline void usb_mark_last_busy(struct usb_device *udev)
 { }
 #endif
 
+#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
+int usb_offload_get(struct usb_device *udev);
+int usb_offload_put(struct usb_device *udev);
+bool usb_offload_check(struct usb_device *udev);
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
2.49.0.1164.gab81da1b16-goog



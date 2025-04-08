Return-Path: <linux-usb+bounces-22727-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8255A7F364
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 05:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 678D4188E1EF
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 04:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41D425FA0F;
	Tue,  8 Apr 2025 03:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u8qylPtw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0377D25F963
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 03:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744084762; cv=none; b=k67ParChgjCMUfMvGgDbj9x7kDftm+gbvsJtAxa3k3U1RYDZq5hhGn7eP2YTgLFA0STuGnOXTBqAt451wQvsvCj1tZ9+NB/4cdkL2/lz1KQizo+UhJA3WitmxMwucNoEsRJOW2IXLf34I9Pu/mXi5LAZIto+sRxuLRDjHVHp8y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744084762; c=relaxed/simple;
	bh=N8IOtk+KCPgxRChOUScSPuKKtNbqdNsY+7biU5NAWu4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XR9LQTIQTm/bxOBb7G5mkxc40rNOHcltfbjHfL5dS6WYC+rr1uXSuaNo/t7kYOQmJTEGPXo0BtKswt9u/E/FSdm7ylA8ke/p6rnbf7bex84xioV3n5RRxcqW9oXekafTUgfIfHMgvGv0RASHuC0srMDOpONc0kZdv75h+91CKxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u8qylPtw; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af8c34d03a1so5137488a12.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Apr 2025 20:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744084760; x=1744689560; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nq70c9PTBvJCLyTf24I/PKmrwX82PnQf7xrAJUmbXKs=;
        b=u8qylPtwTNFvNmEPMA05alrHgA2UdI3f+Khxn4Wx1OhS2581ZyLD96UyAHLWkS+bCi
         0ZrOxkw6gU1w2MrayotPUL5sUH71IqihS4BHBTUl7bw3tLMWqIK/scO54TiHAsPWnGw9
         SGosH/DigU/7WnsdDE+fjwfOHDA7o8n8NprvUPQd/AzxqgDsuHxKuElSB5DH9abxTqaB
         EVrX9+gm6w6cyPIeGWw1xC+9P/5mZxmXu1gq0vSObq05vhWeQE4h4DpgDAuhQ3BqrAK9
         jt/88ulgVAiNTat7jXeYAiSy4VMuRiVMQRzSn/NAiNNWfANVU8ymPJ99lAHcyQcgpNVB
         SuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744084760; x=1744689560;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nq70c9PTBvJCLyTf24I/PKmrwX82PnQf7xrAJUmbXKs=;
        b=Q6d5syL7cz6WYhpHUZwchS8ZVjkArQ4cU+gEOsaznwCt+19ayzwDNie7oVNf68ZlDq
         8Mf54xAhNz2cKof+JiV/N+E2awgb8V8ooK8+G8JYu9d9L/86O0kOwWLmhTo4Rb5PkACH
         phN79TU5PtaGs7t00tRzyTRMcs7BKfOlvQMLHCo6boFf6O3kmKSsatENbLRO3Fq7oDDC
         jmAUbrEI2Wrehl8akvpVpfLjhOZttOzF4692ie1OPT75EFL11OH8HjT6aXnKktHa5CEd
         ZvRNQJtd0N0f7DGEU6B2iumGH6V96TXkUj2Sv3J1J+qMJ2iSzrSfsajpDyTV2p5u0UzF
         BYvg==
X-Gm-Message-State: AOJu0Yw/y871A8/j4KLviquZjMFGLLNh4wKVNEM5yh3dL9aTYRuWaW4f
	oi+aQWs3t85BabaiRC+qlVurAYfW//7GNIcEUPoQwsYLU1VqrSjnIGAWV3/dGstu6fOFBuowRPj
	tz7Vb+mZ58Ra83w==
X-Google-Smtp-Source: AGHT+IHmogGzsX9mjrOUn8Ny9K7H71dH/B3u0x+6YXO76QczAeRH2Kkvav8Kmqt4tB1Azg8tSHIMnIZYgppN084=
X-Received: from pgjc18.prod.google.com ([2002:a63:d152:0:b0:af3:27c:5603])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:2592:b0:1f5:8678:183d with SMTP id adf61e73a8af0-2010460355fmr27010355637.14.1744084759643;
 Mon, 07 Apr 2025 20:59:19 -0700 (PDT)
Date: Tue,  8 Apr 2025 03:57:24 +0000
In-Reply-To: <20250408035833.844821-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408035833.844821-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408035833.844821-5-guanyulin@google.com>
Subject: [PATCH v11 4/4] usb: host: enable USB offload during system sleep
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, gargaditya08@live.com, kekrby@gmail.com, 
	jeff.johnson@oss.qualcomm.com, elder@kernel.org, quic_zijuhu@quicinc.com, 
	ben@decadent.org.uk
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Sharing a USB controller with another entity via xhci-sideband driver
creates power management complexities. To prevent the USB controller
from being inadvertently deactivated while in use by the other entity, a
usage-count based mechanism is implemented. This allows the system to
manage power effectively, ensuring the controller remains available
whenever needed.
In order to maintain full functionality of an offloaded USB devices,
several changes are made within the suspend flow of such devices:
- skip usb_suspend_device() so that the port/hub are still active for
  USB transfers via offloaded path.
- not suspending the endpoints which are used by USB interfaces marked
  with needs_remote_wakeup. Namely, skip usb_suspend_interface() and
  usb_hcd_flush_endpoint() on associated USB interfaces. This reserves a
  pending interrupt urb during system suspend for handling the interrupt
  transfer, which is necessary since remote wakeup doesn't apply in the
  offloaded USB devices when controller is still active.
- not flushing the endpoints of actively offloaded USB devices. Given
  that the USB devices is used by another entity, unilaterally flush the
  endpoint might lead to unexpected behavior on another entity.
- not suspending the xhci controller. This is done by skipping the
  suspend/resume callbacks in the xhci platform driver.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/core/driver.c    | 43 +++++++++++++++++++++++++++++++-----
 drivers/usb/host/xhci-plat.c | 19 ++++++++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 include/linux/usb.h          |  2 ++
 4 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 316526a05250..59b33e5e9a87 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1420,11 +1420,25 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 			udev->state == USB_STATE_SUSPENDED)
 		goto done;
 
+	if (msg.event == PM_EVENT_SUSPEND && usb_offload_check(udev)) {
+		dev_dbg(&udev->dev, "device offload active, skip suspend.\n");
+		udev->offload_at_suspend = 1;
+	}
+
 	/* Suspend all the interfaces and then udev itself */
 	if (udev->actconfig) {
 		n = udev->actconfig->desc.bNumInterfaces;
 		for (i = n - 1; i >= 0; --i) {
 			intf = udev->actconfig->interface[i];
+			/*
+			 * Don't suspend interfaces with remote wakeup while the controller is
+			 * active. This preserves pending interrupt urbs, allowing interrupt
+			 * events to be handled during system suspend.
+			 */
+			if (udev->offload_at_suspend && intf->needs_remote_wakeup) {
+				dev_dbg(&intf->dev, "active interface on offloaded devices\n");
+				continue;
+			}
 			status = usb_suspend_interface(udev, intf, msg);
 
 			/* Ignore errors during system sleep transitions */
@@ -1435,7 +1449,8 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 		}
 	}
 	if (status == 0) {
-		status = usb_suspend_device(udev, msg);
+		if (!udev->offload_at_suspend)
+			status = usb_suspend_device(udev, msg);
 
 		/*
 		 * Ignore errors from non-root-hub devices during
@@ -1480,9 +1495,11 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 	 */
 	} else {
 		udev->can_submit = 0;
-		for (i = 0; i < 16; ++i) {
-			usb_hcd_flush_endpoint(udev, udev->ep_out[i]);
-			usb_hcd_flush_endpoint(udev, udev->ep_in[i]);
+		if (!udev->offload_at_suspend) {
+			for (i = 0; i < 16; ++i) {
+				usb_hcd_flush_endpoint(udev, udev->ep_out[i]);
+				usb_hcd_flush_endpoint(udev, udev->ep_in[i]);
+			}
 		}
 	}
 
@@ -1524,17 +1541,31 @@ static int usb_resume_both(struct usb_device *udev, pm_message_t msg)
 	udev->can_submit = 1;
 
 	/* Resume the device */
-	if (udev->state == USB_STATE_SUSPENDED || udev->reset_resume)
-		status = usb_resume_device(udev, msg);
+	if (udev->state == USB_STATE_SUSPENDED || udev->reset_resume) {
+		if (!udev->offload_at_suspend)
+			status = usb_resume_device(udev, msg);
+		else
+			dev_dbg(&udev->dev, "device offload active, skip resume.\n");
+	}
 
 	/* Resume the interfaces */
 	if (status == 0 && udev->actconfig) {
 		for (i = 0; i < udev->actconfig->desc.bNumInterfaces; i++) {
 			intf = udev->actconfig->interface[i];
+			/*
+			 * Interfaces with remote wakeup aren't suspended while the controller is
+			 * active. This preserves pending interrupt urbs, allowing interrupt
+			 * events to be handled during system suspend.
+			 */
+			if (udev->offload_at_suspend && intf->needs_remote_wakeup) {
+				dev_dbg(&intf->dev, "active interface on offloaded devices\n");
+				continue;
+			}
 			usb_resume_interface(udev, intf, msg,
 					udev->reset_resume);
 		}
 	}
+	udev->offload_at_suspend = 0;
 	usb_mark_last_busy(udev);
 
  done:
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 9843d3ad5cf4..598f1b974347 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -20,6 +20,7 @@
 #include <linux/acpi.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
+#include <linux/usb/xhci-sideband.h>
 
 #include "xhci.h"
 #include "xhci-plat.h"
@@ -483,6 +484,15 @@ static int xhci_plat_suspend_common(struct device *dev)
 
 static int xhci_plat_suspend(struct device *dev)
 {
+	struct usb_hcd	*hcd = dev_get_drvdata(dev);
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+
+	if (xhci_sideband_check(hcd)) {
+		priv->sideband_at_suspend = 1;
+		dev_dbg(dev, "sideband instance active, skip suspend.\n");
+		return 0;
+	}
+
 	return xhci_plat_suspend_common(dev);
 }
 
@@ -535,6 +545,15 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 
 static int xhci_plat_resume(struct device *dev)
 {
+	struct usb_hcd	*hcd = dev_get_drvdata(dev);
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+
+	if (priv->sideband_at_suspend) {
+		priv->sideband_at_suspend = 0;
+		dev_dbg(dev, "sideband instance active, skip resume.\n");
+		return 0;
+	}
+
 	return xhci_plat_resume_common(dev, false);
 }
 
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index fe4f95e690fa..cd07b22adc60 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -15,6 +15,7 @@ struct usb_hcd;
 struct xhci_plat_priv {
 	const char *firmware_name;
 	unsigned long long quirks;
+	unsigned sideband_at_suspend:1;
 	bool power_lost;
 	void (*plat_start)(struct usb_hcd *);
 	int (*init_quirk)(struct usb_hcd *);
diff --git a/include/linux/usb.h b/include/linux/usb.h
index f3a4064c729c..bc3a84870907 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -648,6 +648,7 @@ struct usb3_lpm_parameters {
  *	Will be used as wValue for SetIsochDelay requests.
  * @use_generic_driver: ask driver core to reprobe using the generic driver.
  * @offload_usage: number of offload activities happening on this usb device.
+ * @offload_at_suspend: offload activities during suspend is enabled.
  *
  * Notes:
  * Usbcore drivers should not set usbdev->state directly.  Instead use
@@ -736,6 +737,7 @@ struct usb_device {
 	unsigned use_generic_driver:1;
 
 	refcount_t offload_usage;
+	unsigned offload_at_suspend:1;
 };
 
 #define to_usb_device(__dev)	container_of_const(__dev, struct usb_device, dev)
-- 
2.49.0.504.g3bcea36a83-goog



Return-Path: <linux-usb+bounces-19156-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C709FA06C94
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 04:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAB7F164F7C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 03:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17ECB18B470;
	Thu,  9 Jan 2025 03:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k43qo/Me"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B4B1607A4
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 03:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736395023; cv=none; b=uiUuUSehUQbuNalG3n/4Zxtclv33hrEtCWSzRrqKNi+LO3TTZ5UdZaqQTIMMyFSl5zR3chsLr0VN4Ohpcux8USrHZ+nYAKy8Q9usYxpgpAGTwRpSGG7x+F1HlYGBnEmWitIQaZGpwJIX5gYDXB0CJKQZ2ShB6BoQJhyrbwyi1Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736395023; c=relaxed/simple;
	bh=zIu3mkFQEdRuVFyLlkBColU3jo3Y6o5V9YwSIWBJAHE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pnKawxmu2/Su+e0W3BdgnOpsd9Xr/+5d+o0o4B725/nUFR8VlMhT5vwnRtXU0ffNQ7RlymYN+qNGr7/6k4aVoxZ+AxgP4KtwnH42yGaZVGJctI0BTkhCbOMQMapG5DTWQbh0WJjZMk1a65a0gLkZGAaUg1B3VH0nEGEMTElejdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k43qo/Me; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2162f80040aso7245045ad.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2025 19:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736395021; x=1736999821; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ddchxYBmHDxGkGbNYTXj4haAP604kWKrrwtl9P00xoU=;
        b=k43qo/Me6u7m1QhLuNUUiTaYjgbN30os2k8FmGAYtZ0Ku5bEPu7oKig8PCGFbxEl2A
         vtZvNcWA8OPNVEHjsOEOK8ga3k0dnVDgSJX1xQEIEoZsrVxkPyYachAfFdxZzEi1N8Tw
         KHtVkFEnTPsqDuWcaqqT995aK3O17HCXO3yzsJotiJdpZhbVz3RJVwRbeaXIC1NSM+Lh
         zkrHYQHcAx1WzmioSCz1uU6VUy1L1qABk5yg4hUuLBtCWaJCVRjWd6Agb7wRFyC+OV7Y
         FIPUmzwdfK68d717l+gYmVP8rYtV3hFs4bJXAZzpNpj9KRyB5vVjF5TRfwBdibQX5n3G
         +nRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736395021; x=1736999821;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddchxYBmHDxGkGbNYTXj4haAP604kWKrrwtl9P00xoU=;
        b=X8dJfG5zwKOkVmgzRQA0G9uEmJBuVnOuXMjRB+alJs+qh79LE6iLK+b7qegtVQ5FDy
         Wuk9v2xpIOYoN1ychIEVmsNB9acXCI+E7FCQBbI85N2AOF5xZQsrLdmKXiKB8POW8K6E
         RAekPC8U2Y5zh/iDSvfyHyigRC9OyJj5ijGnV5b5CAEotkQ5um/bDcPuwsspgQdSFr4A
         dPp06ycwp4SjSLpEGxagWqVrc0w7+YZ5eatmYJCeSlIkPUEOI24N/WLkWVELotFZVgJP
         az0lOm1C1pYKKo9rWEkeQrnOa7zxTNbEAmRGkdu3+cg+/VCah6xuyJtogMO2h+11eZPP
         J/LQ==
X-Gm-Message-State: AOJu0YyroqE7hGyfFO76R19w+1uPNCT2MoGEMfi3mGOoQw98gBjGz0Th
	v158JOVZ4Sf/1ieht2mPOTQEg+g6VhLYUJSjVgx38iPzw7PkwA4KL4LjkPFQ6h5y2Nv5SZ6gWhW
	2Zc8O6wjZgaNa5g==
X-Google-Smtp-Source: AGHT+IGMQpT2N2xu3uiFZIpo9M4OReVfIW/xSsKSBRe77zdn+GWUb+mcChBtX/TWTXDKSxdHdWl/a8tX+zwnSmI=
X-Received: from plry6.prod.google.com ([2002:a17:902:b486:b0:216:5808:bc6f])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ecc7:b0:216:2259:a4bd with SMTP id d9443c01a7336-21a83fda87cmr73619255ad.52.1736395021215;
 Wed, 08 Jan 2025 19:57:01 -0800 (PST)
Date: Thu,  9 Jan 2025 03:55:09 +0000
In-Reply-To: <20250109035605.1486717-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109035605.1486717-1-guanyulin@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109035605.1486717-6-guanyulin@google.com>
Subject: [PATCH v7 5/5] usb: host: enable USB offload during system sleep
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
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
- not flushing the endpoints which are used by USB interfaces marked
  with needs_remote_wakeup. Namely, skip usb_suspend_interface() and
  usb_hcd_flush_endpoint() on associated USB interfaces. This reserves a
  pending interrupt urb during system suspend for handling the interrupt
  transfer, which is necessary since remote wakeup doesn't apply in the
  offloaded USB devices when controller is still active.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/core/driver.c         | 37 ++++++++++++++++++++++++++-----
 drivers/usb/core/endpoint.c       |  8 -------
 drivers/usb/dwc3/core.c           | 28 +++++++++++++++++++++++
 drivers/usb/dwc3/core.h           |  1 +
 drivers/usb/host/xhci-plat.c      | 14 ++++++++++++
 include/linux/usb.h               |  8 ++++++-
 include/linux/usb/hcd.h           |  7 ++++++
 sound/usb/qcom/qc_audio_offload.c |  3 +++
 8 files changed, 91 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 01f6287cf73f..06f9809e2d92 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1413,19 +1413,32 @@ static int usb_resume_interface(struct usb_device *udev,
  */
 static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 {
-	int			status = 0;
-	int			i = 0, n = 0;
-	struct usb_interface	*intf;
+	int			 status = 0;
+	int			 i = 0, n = 0;
+	bool			 offload = false;
+	struct usb_interface	 *intf;
+	struct usb_host_endpoint *ep;
 
 	if (udev->state == USB_STATE_NOTATTACHED ||
 			udev->state == USB_STATE_SUSPENDED)
 		goto done;
 
+#ifdef CONFIG_USB_XHCI_SIDEBAND
+	if (msg.event == PM_EVENT_SUSPEND && usb_offload_check(udev)) {
+		dev_dbg(&udev->dev, "device offload active.\n");
+		offload = true;
+	}
+#endif
+
 	/* Suspend all the interfaces and then udev itself */
 	if (udev->actconfig) {
 		n = udev->actconfig->desc.bNumInterfaces;
 		for (i = n - 1; i >= 0; --i) {
 			intf = udev->actconfig->interface[i];
+			if (offload && intf->needs_remote_wakeup) {
+				dev_dbg(&intf->dev, "interface stays active on an offloaded device\n");
+				continue;
+			}
 			status = usb_suspend_interface(udev, intf, msg);
 
 			/* Ignore errors during system sleep transitions */
@@ -1436,7 +1449,8 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 		}
 	}
 	if (status == 0) {
-		status = usb_suspend_device(udev, msg);
+		if (!offload)
+			status = usb_suspend_device(udev, msg);
 
 		/*
 		 * Ignore errors from non-root-hub devices during
@@ -1482,8 +1496,19 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 	} else {
 		udev->can_submit = 0;
 		for (i = 0; i < 16; ++i) {
-			usb_hcd_flush_endpoint(udev, udev->ep_out[i]);
-			usb_hcd_flush_endpoint(udev, udev->ep_in[i]);
+			if (udev->ep_out[i]) {
+				ep = udev->ep_out[i];
+				intf = to_usb_interface(ep->ep_dev->dev.parent);
+				if (!(offload && intf->needs_remote_wakeup))
+					usb_hcd_flush_endpoint(udev, ep);
+			}
+
+			if (udev->ep_in[i]) {
+				ep = udev->ep_in[i];
+				intf = to_usb_interface(ep->ep_dev->dev.parent);
+				if (!(offload && intf->needs_remote_wakeup))
+					usb_hcd_flush_endpoint(udev, ep);
+			}
 		}
 	}
 
diff --git a/drivers/usb/core/endpoint.c b/drivers/usb/core/endpoint.c
index e48399401608..658ef39ebcd1 100644
--- a/drivers/usb/core/endpoint.c
+++ b/drivers/usb/core/endpoint.c
@@ -18,14 +18,6 @@
 #include <linux/usb.h>
 #include "usb.h"
 
-struct ep_device {
-	struct usb_endpoint_descriptor *desc;
-	struct usb_device *udev;
-	struct device dev;
-};
-#define to_ep_device(_dev) \
-	container_of(_dev, struct ep_device, dev)
-
 struct ep_attribute {
 	struct attribute attr;
 	ssize_t (*show)(struct usb_device *,
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 0735881d4650..793fbc030fc4 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2602,8 +2602,22 @@ static int dwc3_runtime_idle(struct device *dev)
 static int dwc3_suspend(struct device *dev)
 {
 	struct dwc3	*dwc = dev_get_drvdata(dev);
+#ifdef CONFIG_USB_XHCI_SIDEBAND
+	struct platform_device *xhci = dwc->xhci;
+	struct usb_hcd  *hcd;
+#endif
 	int		ret;
 
+#ifdef CONFIG_USB_XHCI_SIDEBAND
+	if (xhci) {
+		hcd = dev_get_drvdata(&xhci->dev);
+		if (xhci_sideband_check(hcd)) {
+			dev_dbg(dev, "sideband instance active.\n");
+			return 0;
+		}
+	}
+#endif
+
 	ret = dwc3_suspend_common(dwc, PMSG_SUSPEND);
 	if (ret)
 		return ret;
@@ -2616,8 +2630,22 @@ static int dwc3_suspend(struct device *dev)
 static int dwc3_resume(struct device *dev)
 {
 	struct dwc3	*dwc = dev_get_drvdata(dev);
+#ifdef CONFIG_USB_XHCI_SIDEBAND
+	struct platform_device *xhci = dwc->xhci;
+	struct usb_hcd  *hcd;
+#endif
 	int		ret = 0;
 
+#ifdef CONFIG_USB_XHCI_SIDEBAND
+	if (xhci) {
+		hcd = dev_get_drvdata(&xhci->dev);
+		if (xhci_sideband_check(hcd)) {
+			dev_dbg(dev, "sideband instance active.\n");
+			return 0;
+		}
+	}
+#endif
+
 	pinctrl_pm_select_default_state(dev);
 
 	pm_runtime_disable(dev);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 0b6a07202609..57c3e768cdac 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -26,6 +26,7 @@
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 #include <linux/usb/otg.h>
+#include <linux/usb/hcd.h>
 #include <linux/usb/role.h>
 #include <linux/ulpi/interface.h>
 
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index b676d4dbcec1..9e01450328d7 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -456,6 +456,13 @@ static int xhci_plat_suspend_common(struct device *dev, struct pm_message pmsg)
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	int ret;
 
+#ifdef CONFIG_USB_XHCI_SIDEBAND
+	if (pmsg.event == PM_EVENT_SUSPEND && xhci_sideband_check(hcd)) {
+		dev_dbg(dev, "sideband instance active.\n");
+		return 0;
+	}
+#endif
+
 	if (pm_runtime_suspended(dev))
 		pm_runtime_resume(dev);
 
@@ -499,6 +506,13 @@ static int xhci_plat_resume_common(struct device *dev, struct pm_message pmsg)
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	int ret;
 
+#ifdef CONFIG_USB_XHCI_SIDEBAND
+	if (pmsg.event == PM_EVENT_RESUME && xhci_sideband_check(hcd)) {
+		dev_dbg(dev, "sideband instance active.\n");
+		return 0;
+	}
+#endif
+
 	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
 		ret = clk_prepare_enable(xhci->clk);
 		if (ret)
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 9b3f630e763e..c4ff11ad14d5 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -44,7 +44,13 @@ struct usb_driver;
  * Devices may also have class-specific or vendor-specific descriptors.
  */
 
-struct ep_device;
+struct ep_device {
+	struct usb_endpoint_descriptor *desc;
+	struct usb_device *udev;
+	struct device dev;
+};
+#define to_ep_device(_dev) \
+	container_of(_dev, struct ep_device, dev)
 
 /**
  * struct usb_host_endpoint - host-side endpoint descriptor and queue
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index ac95e7c89df5..a9577da6ecff 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -766,6 +766,13 @@ extern struct rw_semaphore ehci_cf_port_reset_rwsem;
 #define USB_EHCI_LOADED		2
 extern unsigned long usb_hcds_loaded;
 
+#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND)
+extern bool xhci_sideband_check(struct usb_hcd *hcd);
+#else
+static inline bool xhci_sideband_check(struct usb_hcd *hcd)
+{ return false; }
+#endif
+
 #endif /* __KERNEL__ */
 
 #endif /* __USB_CORE_HCD_H */
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 7dd7e51109df..7928df8df075 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1619,8 +1619,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 			mutex_lock(&chip->mutex);
 			subs->opened = 0;
 			mutex_unlock(&chip->mutex);
+		} else {
+			xhci_sideband_get(uadev[pcm_card_num].si);
 		}
 	} else {
+		xhci_sideband_put(uadev[pcm_card_num].si);
 		info = &uadev[pcm_card_num].info[info_idx];
 		if (info->data_ep_pipe) {
 			ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
-- 
2.47.1.613.gc27f4b7a9f-goog



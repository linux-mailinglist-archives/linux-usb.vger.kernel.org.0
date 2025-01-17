Return-Path: <linux-usb+bounces-19502-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA90A15244
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 15:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99FF47A5E49
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 14:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3202B19E7E2;
	Fri, 17 Jan 2025 14:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mmLi2qKb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D8194C75
	for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 14:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737125599; cv=none; b=u9vdFyu/Q3V6hPrbZROJ+mel0UhxHjyygpU7piVCbqKhcwZHF5Kvu+PWBmQcQ8FfMSLnLrQNabEzQIrmr5mRak5X2g0szJUDUrEEXz77HuQKSNOp+YK1yxgVjQQ4WL8czkopwR+4QbeZqv95TZ6apl3mXBa2j05QsnCglFpuZwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737125599; c=relaxed/simple;
	bh=P3zdn3McJmsyzpYTZJuOTPL2OEq/l5AWCoOxkslRlp4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JanmvB4BE+6Lpt7qDNCkbO/JzaRSfeAAXYPJD85oWKObLFROxGIxFNVjhYdjzZ7aTO/DBNCVzZYRrGGDXxXJGlJtyKk8W6l2NrNB03xnYRMlGSu8Ukr2JC7GVKXQkCNLVx7bUxO365wYd7Vlkwwoam4NCRKREz6xkCi6eRT2+b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mmLi2qKb; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2166855029eso45169455ad.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 06:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737125597; x=1737730397; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GVR6FxEUaufqkmZpxlHK16x/t28tR59Z3ucl0Vcwuwc=;
        b=mmLi2qKbjBLuo0uRRxIRvJbhRtWIY59FcDDIEE4mD3gUPucyA/HL9CDhxdeNE4hJf4
         Txc6CfR3Rdy9e/PI6F1CgGa45oTxat8g9cRtdhL/wXBOI5PhdNOFafAyjManF0JBL6ll
         quuhG4tel7XYINKHB4DuNlmFz616wFGSL3tHvJhtfXtx387wIHh5I6yHCAAB1Ys5tOWQ
         wp7azUDrx5+ksjPcDnxUabioiOnaQOQBbVYKy+oxFvDr4YfZbY0ZDI7UCzjufy3gfuoN
         epThwwsDcj+oqd6lEDEfLqI3Zj97b+x4lS2zZvEuGT0ZMUYcUuoOwkW1V6gz+apzHNTp
         eknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737125597; x=1737730397;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVR6FxEUaufqkmZpxlHK16x/t28tR59Z3ucl0Vcwuwc=;
        b=Vjo3ofLWY5uLRGMsWXBpfL2ve2JRZuJzHXRFz35zDs31nhWhkHBN7VhWjFCulV+Ees
         uDLarcTWCDuKmuYbiJeytnroLvkegKWEpTQx6VImfnho2GcrRXOMv/b9u8KJykPg+QDS
         YXv6PaFbJJ2QFC+3iUf9lrxxKWOLKcEM9lBQL8SJKLelPZSqN16nV2Aiq1qYXEYAMkc9
         6t2dvRJh6jOzsPZq6T5ebTXx2wHE7r8UlAZfSX0bEodscarrlh4LzoBL2wPOVsN6GWJx
         ZhaLqteNA3AFUMBq7n6TSOBbtinUgf7bjYgwk2TBf/hdlMFbLPmuazOyFAR5qbB6wHst
         aN8g==
X-Gm-Message-State: AOJu0YwMsjE98bf7VtcX0tG9f79Nbsj8n01AGbCEQOJndPqssZdxooug
	406dLcVCz8lvxWzqACxDXkbOEUM5JRGMHkzr125vajGMcWPHHPnljk+X+di05PnX+vcu2KaMGqB
	RcdRqX0u0bQEKrg==
X-Google-Smtp-Source: AGHT+IHU0PJBV4WLgiNVl/lj+GZxzVPMi//fbFeWdYI4fPfpzpbB4C1mX87Gu/0lPXmaCBbD0ytJpHqKH7Ml7pM=
X-Received: from pgvn10.prod.google.com ([2002:a65:63ca:0:b0:837:acbb:873a])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ec85:b0:216:4e9f:4ebe with SMTP id d9443c01a7336-21c355cca2bmr48727045ad.42.1737125597465;
 Fri, 17 Jan 2025 06:53:17 -0800 (PST)
Date: Fri, 17 Jan 2025 14:48:05 +0000
In-Reply-To: <20250117145145.3093352-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250117145145.3093352-1-guanyulin@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117145145.3093352-6-guanyulin@google.com>
Subject: [PATCH v9 5/5] usb: host: enable USB offload during system sleep
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
- not suspending the endpoints which are used by USB interfaces marked
  with needs_remote_wakeup. Namely, skip usb_suspend_interface() and
  usb_hcd_flush_endpoint() on associated USB interfaces. This reserves a
  pending interrupt urb during system suspend for handling the interrupt
  transfer, which is necessary since remote wakeup doesn't apply in the
  offloaded USB devices when controller is still active.
- not flushing the endpoints of actively offloaded USB devices. Given
  that the USB devices is used by another entity, unilaterally flush the
  endpoint might lead to unexpected behavior on another entity.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/core/driver.c         | 23 +++++++++++++++++++----
 drivers/usb/core/endpoint.c       |  8 --------
 drivers/usb/dwc3/core.c           | 28 ++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h           |  1 +
 drivers/usb/host/xhci-plat.c      | 14 ++++++++++++++
 include/linux/usb.h               |  8 +++++++-
 include/linux/usb/hcd.h           |  7 +++++++
 sound/usb/qcom/qc_audio_offload.c |  3 +++
 8 files changed, 79 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 1bbf9592724f..f8d3b50c188a 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1415,17 +1415,29 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 {
 	int			status = 0;
 	int			i = 0, n = 0;
+	bool			offload = false;
 	struct usb_interface	*intf;
 
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
@@ -1436,7 +1448,8 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 		}
 	}
 	if (status == 0) {
-		status = usb_suspend_device(udev, msg);
+		if (!offload)
+			status = usb_suspend_device(udev, msg);
 
 		/*
 		 * Ignore errors from non-root-hub devices during
@@ -1481,9 +1494,11 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 	 */
 	} else {
 		udev->can_submit = 0;
-		for (i = 0; i < 16; ++i) {
-			usb_hcd_flush_endpoint(udev, udev->ep_out[i]);
-			usb_hcd_flush_endpoint(udev, udev->ep_in[i]);
+		if (!offload) {
+			for (i = 0; i < 16; ++i) {
+				usb_hcd_flush_endpoint(udev, udev->ep_out[i]);
+				usb_hcd_flush_endpoint(udev, udev->ep_in[i]);
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
index 7dd7e51109df..d201b1ad33b1 100644
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
2.48.0.rc2.279.g1de40edade-goog



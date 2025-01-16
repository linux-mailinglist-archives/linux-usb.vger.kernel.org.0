Return-Path: <linux-usb+bounces-19412-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D11A13B63
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 14:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49A69165C99
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 13:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1039F1DE8BC;
	Thu, 16 Jan 2025 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F29hdy05"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D431E22BADE
	for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 13:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737035692; cv=none; b=SAhc5f4/blJouTeTyiRcLi1p4w6DMR6AABzhXl4bZcoXfpR96i5YfNuR6U1cIuBgd1WP0eVeMvE4QKHcgwAkBbNQa0u9kXBei1HnRxi1NrqfImd4RQXbvz+3rlnvHA4rtBxxvv1T1B6hIin16Bz32IdeABPZ+vrOHlAzurB68h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737035692; c=relaxed/simple;
	bh=tUjefOwafsseucnbiLWYgdphgCgIdur/lXiNIX80kgA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GUG8pdSPK1IJoWHS6GCW+tGFWzomVtc/zRFa5IeRoY6mg/QT8CNNkc9SlGDPooeqe344/G/XbTlRG/TLRx6MB0lp44KQaKdShBpW8oK7Itoh/q1423wRHrhaALP90fAxoXHfsirmxh8lbAg7oaKiVZh2/FFY+OGQIo8aa6r/bew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F29hdy05; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef9864e006so2933408a91.2
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 05:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737035690; x=1737640490; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwn6iGbuRtN04xqe3vFVe3ONk5MpqAVXvEfWYNrWPPA=;
        b=F29hdy05He1V6yoHwziHSpbs2fPe92c3lfopFnJm4i5Uhs1WjOYIOPnuZepEKLWoxo
         un1CcCUNfKkSOATXYhsb1Krx/lqqWz+5p7dZzCusz4QeWGwNMjZs61iohK/zZqermGkL
         0HAwxPEWXuOjOpKdc7+PJrhQSMhkBKML12Hrbfmxl5jpi1sciPaq10kq6eGOQEGMCFhM
         2OYfnnsS6NRL4yTh/SLosmtLom6YBAYvAt/bgTyA+wZ8EWXvTy0scIvcGuO5IPJTKxKH
         TEURnDaqOIv93St4EVcHtrqXQshtOJtb09/DLgiWOpFVz31viGFJ410AlPFOtkkAKFEs
         zYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737035690; x=1737640490;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwn6iGbuRtN04xqe3vFVe3ONk5MpqAVXvEfWYNrWPPA=;
        b=lQSayK4W0YUhjyUEeyscnrfdYXz0wNzInoKyxbFtsexXyf4NyzvzCWBc8MbtDnNwrC
         MYtp+6k4O6IYhIqwoUDe/0yL4IkHT00Suqs4VVqTknVPsn8ACfTOKinkjEDxYHxQb4c8
         2ieEkHQgQN5GpMnWg2NgfjxwS72pCbqSb6YshEZwrLzmBF0bcwdeCWKr96YGvQ8tiLM+
         vK2Vg6CtSd+Gdaxeu7PjS6Y+5wH36tAHznwyZE/QS3V9WfWE1bKcBHv5QG1QH14OfpcT
         McvO9wqVVr+B3ZVxkvXV/O1rfaUFD5ajjUIcj0d21iUzvaarw4EbIUABvE7ie7wcKM9y
         OB3A==
X-Gm-Message-State: AOJu0Yyhpcl0xwPy/5wFJZuCCX8Xzz+x8YYm4E0rl0nNdEtc4TU63aju
	rDafzYTJREGE/gCvSIASre1WwDewfCZ33lBSmWNU+2IC52WCBiZGTDcTEt0zRb+hE8/vmINtgNH
	QeRiMw8cvkeo0+w==
X-Google-Smtp-Source: AGHT+IHSbpnc4Yeh5feaJxP2xbzgigNdCiHt0WowqTGKRkjIvnXACFCzzbUW7yHLOkc/HSqYiUU3VDtfmNeAGIg=
X-Received: from pjbpt8.prod.google.com ([2002:a17:90b:3d08:b0:2ef:95f4:4619])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:274a:b0:2ee:7862:1b10 with SMTP id 98e67ed59e1d1-2f548f2a149mr50723470a91.11.1737035690360;
 Thu, 16 Jan 2025 05:54:50 -0800 (PST)
Date: Thu, 16 Jan 2025 13:50:17 +0000
In-Reply-To: <20250116135358.2335615-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250116135358.2335615-1-guanyulin@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250116135358.2335615-6-guanyulin@google.com>
Subject: [PATCH v8 5/5] usb: host: enable USB offload during system sleep
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
 drivers/usb/core/driver.c         | 29 ++++++++++++++++++++++-------
 drivers/usb/core/endpoint.c       |  8 --------
 drivers/usb/dwc3/core.c           | 28 ++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h           |  1 +
 drivers/usb/host/xhci-plat.c      | 14 ++++++++++++++
 include/linux/usb.h               |  8 +++++++-
 include/linux/usb/hcd.h           |  7 +++++++
 sound/usb/qcom/qc_audio_offload.c |  3 +++
 8 files changed, 82 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 1bbf9592724f..6441742869ff 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1413,19 +1413,31 @@ static int usb_resume_interface(struct usb_device *udev,
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



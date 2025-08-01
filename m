Return-Path: <linux-usb+bounces-26303-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B62B17B7A
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 05:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2272F5A00AE
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 03:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE3A1A2632;
	Fri,  1 Aug 2025 03:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UZZupN0A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD76319C542
	for <linux-usb@vger.kernel.org>; Fri,  1 Aug 2025 03:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754019659; cv=none; b=Mf3O+K6YQ2K5wgCBJLPztVWGM3JjI9sS97cZY2MPd3PCo9FHzdLeNTSGQncZIBwV+5KSXqmFW1idrTpXeaSwQER66o7xQUPpohqL99BnpS9rc928QE3klA/sEgRgf2UzQem4yNMsYlwloLrt9cvdywmTLd10b1xoQgoh0YhfpJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754019659; c=relaxed/simple;
	bh=teS/+aZOK08uAjWXkV1PKRDhG6i0pRZR3Pq9zRsGilU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XhwYbYJpoRUoY48quZk+7H7Q1MOcYG6kuUYvrJt/8jmEP8FkUgl4+ePFwDJGAYnFGRFBeWubPYrAQYex0pRo28iiqbRiZAPEV+e78ruAvwHP6DnSzLU8jZtIz7+nHi5O72CTKoEjZFjzu+ewdloI/GsbPjTRWwIRFzinSzdw0Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UZZupN0A; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-764072aca31so931626b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 20:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754019657; x=1754624457; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fEKyx7rEaL9ClT6i1Uqn92+E8d8b0N4HGm0M5DzW4vU=;
        b=UZZupN0AlQXxonEBsYn+QwUh76oQBDGb+k/ZaHuplGeVdSEFVDhYlfs+u2pkR4kNjX
         Zj9cCgr+rrUsT4gpqLRiNOt82q4xjtQdHEl+2rWUmJymKaDiXP/BUMmjtAt5MiLphmW/
         TKORzZobJ1kQByrYbi3h7YETHzw/3R8GuzGmM/+du+wjQ2YZMWH+Gs1FcH1LtLDzro4k
         80okH9mD9M6RAK/Rnd/CKSWhkO31UAQfqhM6Sp40/JVoR4P5kFLp211cIQ2rk6BkP+DZ
         Khd3AYSQ3gOIdsZ1AtSZQUB03qmcPB9Am6TuTm0iQjSLSij0leZqP/VnjhTjxeUSpgg/
         RRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754019657; x=1754624457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEKyx7rEaL9ClT6i1Uqn92+E8d8b0N4HGm0M5DzW4vU=;
        b=AoehvIPmyNl3in8ap4c0iSQ2BZM1CMKuCV6SBJHLdjrpsiUWWCVUSXi8uTQo7b8PTy
         CQmBFSJU6GsiwR1/U2iv/nQxcRnjSeJfHl9Q361Ck1Jq5LzkcGSg0ruxfl5VpvlWf3ta
         LHFZoUyvTqajCFfVn6DTHSBoLPXRcYTTJ8PmkCDVB8MhMo2TSUJnB5/2Jhm8bJtetodR
         DXgIRTaAooFscjS2PcHu5At/ioJ1pI5NxMKPbj/LjlyJ0O1ENUUxltt5PgSBCRHYDrxW
         ZsvqvJ/dxu8cgLzVnY1kOZVn3wG8K4uWOc2+cGdfElvgR2OMfPUMsVEVBbwHYihchyma
         6rKw==
X-Gm-Message-State: AOJu0Yy0ofa7E60iC0VgtWFBrmWsK9GcBXXlD+8nYMlH4zum3Bd24g5N
	VSS2t/X6LkkvjnJV25gTxzhfbaQai1A6WkWEAl4uBfyq+0d6f6v8datgq0m1+qnDi2k5pFN3Pws
	mDeIBQ1tWYM8D2HJABA==
X-Google-Smtp-Source: AGHT+IEUckZdgPpJBQcMD5oGM/FPiKa0Egdq8QTlH3cbIYwPC/r7pHST0Q+N93A0qNgQM2flPniCR9h/FZJnJRk=
X-Received: from pfck16-n1.prod.google.com ([2002:a05:6a00:a050:10b0:748:fa5b:4163])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a95:b0:748:ed51:1305 with SMTP id d2e1a72fcca58-76ab0a23c9amr14806735b3a.5.1754019657171;
 Thu, 31 Jul 2025 20:40:57 -0700 (PDT)
Date: Fri,  1 Aug 2025 03:39:33 +0000
In-Reply-To: <20250801034004.3314737-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250801034004.3314737-1-guanyulin@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250801034004.3314737-5-guanyulin@google.com>
Subject: [PATCH v15 4/4] usb: host: enable USB offload during system sleep
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, hannelotta@gmail.com, 
	zijun.hu@oss.qualcomm.com, xu.yang_2@nxp.com, stern@rowland.harvard.edu, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	dh10.jung@samsung.com
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
 drivers/usb/core/driver.c    | 50 +++++++++++++++++++++++++++++++-----
 drivers/usb/host/xhci-plat.c | 19 ++++++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 3 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index c3177034b779..275c0fd573d4 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1420,11 +1420,28 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 			udev->state == USB_STATE_SUSPENDED)
 		goto done;
 
+	if (msg.event == PM_EVENT_SUSPEND && usb_offload_check(udev)) {
+		dev_dbg(&udev->dev, "device offloaded, skip suspend.\n");
+		udev->offload_at_suspend = 1;
+	}
+
 	/* Suspend all the interfaces and then udev itself */
 	if (udev->actconfig) {
 		n = udev->actconfig->desc.bNumInterfaces;
 		for (i = n - 1; i >= 0; --i) {
 			intf = udev->actconfig->interface[i];
+			/*
+			 * Don't suspend interfaces with remote wakeup while
+			 * the controller is active. This preserves pending
+			 * interrupt urbs, allowing interrupt events to be
+			 * handled during system suspend.
+			 */
+			if (udev->offload_at_suspend &&
+			    intf->needs_remote_wakeup) {
+				dev_dbg(&intf->dev,
+					"device offloaded, skip suspend.\n");
+				continue;
+			}
 			status = usb_suspend_interface(udev, intf, msg);
 
 			/* Ignore errors during system sleep transitions */
@@ -1435,7 +1452,8 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 		}
 	}
 	if (status == 0) {
-		status = usb_suspend_device(udev, msg);
+		if (!udev->offload_at_suspend)
+			status = usb_suspend_device(udev, msg);
 
 		/*
 		 * Ignore errors from non-root-hub devices during
@@ -1480,9 +1498,11 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
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
 
@@ -1524,17 +1544,35 @@ static int usb_resume_both(struct usb_device *udev, pm_message_t msg)
 	udev->can_submit = 1;
 
 	/* Resume the device */
-	if (udev->state == USB_STATE_SUSPENDED || udev->reset_resume)
-		status = usb_resume_device(udev, msg);
+	if (udev->state == USB_STATE_SUSPENDED || udev->reset_resume) {
+		if (!udev->offload_at_suspend)
+			status = usb_resume_device(udev, msg);
+		else
+			dev_dbg(&udev->dev,
+				"device offloaded, skip resume.\n");
+	}
 
 	/* Resume the interfaces */
 	if (status == 0 && udev->actconfig) {
 		for (i = 0; i < udev->actconfig->desc.bNumInterfaces; i++) {
 			intf = udev->actconfig->interface[i];
+			/*
+			 * Interfaces with remote wakeup aren't suspended
+			 * while the controller is active. This preserves
+			 * pending interrupt urbs, allowing interrupt events
+			 * to be handled during system suspend.
+			 */
+			if (udev->offload_at_suspend &&
+			    intf->needs_remote_wakeup) {
+				dev_dbg(&intf->dev,
+					"device offloaded, skip resume.\n");
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
index df2e942ad5f7..3a56d8f94519 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -20,6 +20,7 @@
 #include <linux/acpi.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
+#include <linux/usb/xhci-sideband.h>
 
 #include "xhci.h"
 #include "xhci-plat.h"
@@ -484,6 +485,15 @@ static int xhci_plat_suspend_common(struct device *dev)
 
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
 
@@ -536,6 +546,15 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 
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
index fe4f95e690fa..2b32a93d2b76 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -16,6 +16,7 @@ struct xhci_plat_priv {
 	const char *firmware_name;
 	unsigned long long quirks;
 	bool power_lost;
+	unsigned sideband_at_suspend:1;
 	void (*plat_start)(struct usb_hcd *);
 	int (*init_quirk)(struct usb_hcd *);
 	int (*suspend_quirk)(struct usb_hcd *);
-- 
2.50.1.565.gc32cd1483b-goog



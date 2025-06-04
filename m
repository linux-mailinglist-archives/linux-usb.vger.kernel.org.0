Return-Path: <linux-usb+bounces-24487-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC57ACD9B4
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 10:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 243AF3A5695
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 08:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3ACB28C022;
	Wed,  4 Jun 2025 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z4Djtc7F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59F228BAB8
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 08:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025537; cv=none; b=B01NYpU27gHpA4u7Rs/uqEzoJRGW53/z8pJSP2ctK3VoN52tp1guc25rhk6XzGJJCoIkVkGUtmHcinG/hBQAEBVHQpHPD5j6QYcDxJIsSHvCp6r7Ehnfgxtg67pwCErVVOAtx10rJZwde4Bc99r57tdJw88+3nWGckfcHaFYSV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025537; c=relaxed/simple;
	bh=yX3t/dCpCtr5555ro4UndY8sNQPP4ux82f0hb5SqNvs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ajz06BeUO8bJHmJjakzdF9RpnbVmEAiez7Ro9i7srVv9hOZ0EtxbfBmxZLHVjINRKkOWF2rapAwZWh65y2mOGF0+zoe86owr6DfDv7P4SQTQGGWFaDoQ+QIxakwIOLQhxC+l4bCGCXAQCRmmK7MSXjkDn3h8HFVfH2ID0hAH6Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z4Djtc7F; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31315426f13so299853a91.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Jun 2025 01:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749025535; x=1749630335; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4XL89hn3edGr5/C3sJ6fxWWUscalAVpNktAagGHIzjk=;
        b=Z4Djtc7FOBy9qd2qW1et4yzovqWu//ynpQ4Wecgam5FWKjt+EfEaadcrFN8nnES5pU
         MhDjUE7rRBZWSQkTnPyQMbas5Tl8ahXsyYPdRw6vtkFRwF34pJCv+NoTdtbIJidRlV+3
         GtjUzzrRM2FpwVPsqixnkFhB4XtOdE8XOJBR+4db8LRneTce3m8JdjuouXH5Lu9n8EMe
         XKIraQzmHQ/RmpXY68CFFLPZi0qIxLhj68JkLi9aovm8JWT5jKIPtqbxANhB+EGAvI4G
         Zc/bClJY3Dpf7hLx3+rW+N/fi0tPhkG1qe9t8jSvF9JOW2GsWuPBTSKgQSBe8srkoeaJ
         2qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025535; x=1749630335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4XL89hn3edGr5/C3sJ6fxWWUscalAVpNktAagGHIzjk=;
        b=utUk1ksfaNUzRIFo9+YUjf2CJStbXKAaGThjgfTtAyYUf6TKoKz1wBex70SEp6Zn/o
         r3J4/2Kb8Z6eDfFj2q5gnmk057GKEt5Ud2F6r+wSDDRIcvdLfeGFKx3rOTLuE9+pP3Ij
         ORoRJAGtujnaPsSTKRu88+EcRT1IoCy1K+/sWBvBs901TRwyQMLFV0vI21qDBcuY61N1
         qKzL0FUfain1Sf4umMuzeCNIwypFnYA893jaXsbVuC/V4M3yGxc7lMS1VsXwpwQdqga4
         i8OWgOJqPW0/XTsLA8MWpCrTGU8i04LUoWgH+IVLH5M97qSDE9PPKkiCPXYQG1yXABiH
         zekw==
X-Gm-Message-State: AOJu0YxDYykTUaCj53zUlO5kw7/JJPswlazMGh9/y1uC+WiWU8OOww3g
	I5gQzqcJ+oA4GiSwZYbf0sToQM+8s+qL2ObZllA4FQer5oSL3/UlEEB6z55byCnjxShus3iP7zG
	y6m2qXvG0OtG3gM4LLA==
X-Google-Smtp-Source: AGHT+IGUIm/2m0kobXXwkRvujWW+QAGgYDsbL7UPZxfPqk00rry03tOVKFtPT3BpJtlUSrlbXyF1K9f0kAzEszo=
X-Received: from pjbpt3.prod.google.com ([2002:a17:90b:3d03:b0:311:d264:6f5d])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:46:b0:311:c1ec:7d0a with SMTP id 98e67ed59e1d1-3130cdad279mr2907670a91.25.1749025534980;
 Wed, 04 Jun 2025 01:25:34 -0700 (PDT)
Date: Wed,  4 Jun 2025 08:23:10 +0000
In-Reply-To: <20250604082449.2029156-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604082449.2029156-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250604082449.2029156-5-guanyulin@google.com>
Subject: [PATCH v14 4/4] usb: host: enable USB offload during system sleep
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	sumit.garg@kernel.org
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
index 460d4dde5994..d46bac81d600 100644
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
2.49.0.1204.g71687c7c1d-goog



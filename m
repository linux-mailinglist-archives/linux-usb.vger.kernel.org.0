Return-Path: <linux-usb+bounces-24355-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98CAC6542
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 11:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6109C1896B02
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 09:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA29276056;
	Wed, 28 May 2025 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hMet6rKD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C2E274654
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 09:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423369; cv=none; b=tXgv88Yu53Mfw+dIvxNiCFcFoKUYZhXmaqFStLtqfq97QmtwstqMuOFvX2cO6tuuT3Y9OjwW40JGxqTxXZVBp3MTxyvfiBISZDIrt3TVXHBj0U7VcUZ9eZg0pGp+z7ikRgcxOl1ZpIClsm5tibpgIik8YDylFR8JTQnLz71ie9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423369; c=relaxed/simple;
	bh=jrMgYnui/1hVK+NOX5Q9Qlx3CZm/zQKpCUr+Qb1NX1U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IIj1BXbukSCGIEaJq5lzzvudlKREe2dtGq1HsdkxmWL16UY6LT7FEY8W6ObCFzU1oibYHWgM4Ve+VgPcGo521jyI8WbrazKwftaKV79Q6jxAwmSM3SVBCa3bfVn1PWN8N6Qehga7AgntO9Ru7dVNuUNYVk8Lv2Yn9YiCSoiydWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hMet6rKD; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2c0cbf9fddso2779021a12.3
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 02:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748423367; x=1749028167; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/SiziDgdhNeZTL9A0KOfLtmGGL2LYblCSJ9A9F+7hHo=;
        b=hMet6rKDQp02StRyefZt204NNzuJTySC0kS+4gDTz/L3Fkpaid8lPtnm8pwoyaRSGH
         mXRn4lMGICDH9JtcgtuEjDSTHkW7Omp6raXGERATKLqmP4avsGVoHBWOavsArPOZAzDN
         piRUT/p5HZVEZN4UO0lPFQ8tGd3iejSTK2GANayC0jaamFWuurwUFec/GhJRrhB8aOkH
         3OAQ++irqNkV3ahEi5ATo7OgxbC55iZ6BDhfhqsRtguASu0JA2/rpjKgtvF3aJEVJ/GA
         pVDRTbiEfdhnCrlPtOf7FSYX3h17+sOv/JsjJhcyvEq9fOOCeHzTvA/Sb5Ux8DInpXKg
         /LyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748423367; x=1749028167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/SiziDgdhNeZTL9A0KOfLtmGGL2LYblCSJ9A9F+7hHo=;
        b=Nff0XVJDrlfBW1GNCONjuxxcH1en4CsxyweRPyKMwK/dANZFX1DxpQ6ivkwgoU4WnU
         EaVkR5nAJKGxlpKs0CImsPC2lekWSqaUjxRaQkowkljPAUpfGZA60vMySFqDuvAjSZx5
         HDaegy41PWeRbpthrV8B6yIYojcN+eaB8F6AMl+g/NzRoflVbicRTXYtKQIID0si8ZpS
         juQIPFNfEnA3W9nPxZc9K7VnMpMkX36xy0nIpyRkkyDS1cdIFZrWyPOYidLJkJ2H6vpX
         +aV/JMGDyjSF3WGgbg+AXqsZwI7Qf06h8IMTpe/K10o+CalQPOloRuY3D2g54VRaFueQ
         ou6w==
X-Gm-Message-State: AOJu0Yx/8ypO4F6zCE+Wc/FcGhkt7v5P/NH7rYk2ARXzT783R9IBPVtx
	6l870YkOrm6iC3TxDLRVgdRJj/hrTjO2ITzqPhtUhpeF3o6NRru3LN1nfTC50w1rHgWbpAq0yLS
	nveONzYyJlWuVw1u4BA==
X-Google-Smtp-Source: AGHT+IGvGoiywFWqdw4XJjxAetPAW/GhM6SbBtnJ9W3r2UvhsnuVYFnszlWmq+mdtc9aesIlyy/EHaQ3B5KWm8Q=
X-Received: from pgbdl13.prod.google.com ([2002:a05:6a02:d0d:b0:b2c:45e5:996d])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:b85:b0:216:1c88:df46 with SMTP id adf61e73a8af0-2188bf2c994mr25447975637.0.1748423366730;
 Wed, 28 May 2025 02:09:26 -0700 (PDT)
Date: Wed, 28 May 2025 09:04:09 +0000
In-Reply-To: <20250528090849.2095085-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250528090849.2095085-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250528090849.2095085-5-guanyulin@google.com>
Subject: [PATCH v13 4/4] usb: host: enable USB offload during system sleep
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org
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
index 0690619454fe..9670c10f4ade 100644
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
2.49.0.1164.gab81da1b16-goog



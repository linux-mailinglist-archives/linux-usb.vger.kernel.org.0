Return-Path: <linux-usb+bounces-24486-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2623ACD9B2
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 10:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E909B3A452B
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 08:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D914D28C5B6;
	Wed,  4 Jun 2025 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ptZIDVdf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB41D28C5A5
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 08:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025531; cv=none; b=nJIkAt0r7Zh+eHiymkhgUQSZHRbUIVoBadqAccJHP062L1xBm0CP8+PhlYQD1jWl+25PoW1XCt/4WZGJmFiRdBe5Rsx79yyq6pci0Upd2X/nX+jLpmDJaeFaMJQ8FDZ5RSR7Z28ugZVmJatztKHl4KNaTV+IZCxxn6mQ+6H+Q4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025531; c=relaxed/simple;
	bh=LqCjgT0o86qpz1bAfVx/xUUv0oZr65BY+HYAir72dNQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KefAVFi5n826f7jA15FQnzbKcIpy+cW/koea/TQ4hY6UmhdRAZ3Fk7c+ut/9ArARhEHYGqPjR3lYLAqkdjHgwdbHb3CFG+Ot2eHzQfdjJArmzVJZQztKybYwDmRNjWYidEBLDC9nwWCAGngnu9A5/ssO2nhixnddWdi5JpxHJS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ptZIDVdf; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30ea0e890ccso6367087a91.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Jun 2025 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749025528; x=1749630328; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vr9BR5zFeEkJuH9gfqHRpAFxp+Is7OurxJ3CD5N0N2g=;
        b=ptZIDVdfRgsgGARt90NEW8rAx5bbNt61BFn9UkZ4vrJlOGUIJShQVUNUirT8BpKGiL
         budvSdC80P3MsApNJykRQUO+RkO08r8yXLCZ1kxs9uXfNMheTSjHsWhHKgwq3woHfmMv
         2q5Hrw/5w7ah964zMj5R5pN82m23pOBh2sPuHivn5rU8w/CbJYq8eu6lysGxrMOSeusd
         yYJjSHPR0uw+5DgPoJCQY94HFCl3HqBryt9dOH6eePPCwoqHb98PlQf/T1Inlklj954p
         WbSsr01QOmqABUnI+Y1iie4YfLMO0mPJgZMI5xMeYIJ5sZiKi6CXTTle0hE8EPf/lD4k
         ytSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025528; x=1749630328;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vr9BR5zFeEkJuH9gfqHRpAFxp+Is7OurxJ3CD5N0N2g=;
        b=pJ3lTCRU+UvMkZw0gkSVui7+4P403TGiC80kq+ipmfUT/Kv+S2ZOhIaQdF+0C7tYmK
         ugpM8mUDblcJAw8ql9R0vh0Z64574NHNig9C2yFGKCJn7B5gOqD/RfhLjU2GKDjNrgxI
         ak0qpH/nZhsvnpFHGtloSwCYYvHdhzxXQdYOODoxT0pRauZNrGuC2R1IjRL/CqM59PTD
         KZzM4rpY0EZ4ND66PGu8iMuN1gsko8M4p3zL/WCEM9iy45sa3kYMb6Or1/Ze8JJ3WsT9
         4jvm7SJPEB4cYbbvpkrP3y6CPW6SBK3m7TRMjF0svp/pTdtoLir3rCu6ZliDp4d7sOgx
         R8WA==
X-Gm-Message-State: AOJu0YyKfygT9SGDRQPt9CRYiQlHojkvtAaSEiiU12CBnQqpUZWFDzTZ
	RKn5mNt/Mk3RX/9JsjraUcFX+HwqCG4jYVk24GJUa0GbgIzGs//4l/v7kVHHqVVn4LJeaNJ9DaF
	WvHydXBsd/jqNnI0mdA==
X-Google-Smtp-Source: AGHT+IHvWo1hnryqNLx7asfo8xGvTcYhV1b2+9enCYyP41vg0S5xWofxTjdyel4IF4lGoSrUsedQdrBouszQOsA=
X-Received: from pjbnb5.prod.google.com ([2002:a17:90b:35c5:b0:312:1900:72e2])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:278f:b0:311:b0ec:1360 with SMTP id 98e67ed59e1d1-3130cd680a6mr3008711a91.29.1749025528036;
 Wed, 04 Jun 2025 01:25:28 -0700 (PDT)
Date: Wed,  4 Jun 2025 08:23:09 +0000
In-Reply-To: <20250604082449.2029156-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604082449.2029156-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250604082449.2029156-4-guanyulin@google.com>
Subject: [PATCH v14 3/4] xhci: sideband: add api to trace sideband usage
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	sumit.garg@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

The existing sideband driver only registers sidebands without tracking
their active usage. To address this, sideband will now record its active
usage when it creates/removes interrupters. In addition, a new api is
introduced to provide a means for other dirvers to fetch sideband
activity information on a USB host controller.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/host/Kconfig          | 11 +++++++++
 drivers/usb/host/xhci-sideband.c  | 38 +++++++++++++++++++++++++++++++
 include/linux/usb/xhci-sideband.h |  9 ++++++++
 3 files changed, 58 insertions(+)

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
diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index d49f9886dd84..15d72c23c0e0 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -266,6 +266,33 @@ xhci_sideband_get_event_buffer(struct xhci_sideband *sb)
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
 
+#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
+/**
+ * xhci_sideband_check - check the existence of active sidebands
+ * @hcd: the host controller driver associated with the target host controller
+ *
+ * Allow other drivers, such as usb controller driver, to check if there are
+ * any sideband activity on the host controller. This information could be used
+ * for power management or other forms of resource management. The caller should
+ * ensure downstream usb devices are all either suspended or marked as
+ * "offload_at_suspend" to ensure the correctness of the return value.
+ *
+ * Returns true on any active sideband existence, false otherwise.
+ */
+bool xhci_sideband_check(struct usb_hcd *hcd)
+{
+	struct usb_device *udev = hcd->self.root_hub;
+	bool active;
+
+	usb_lock_device(udev);
+	active = usb_offload_check(udev);
+	usb_unlock_device(udev);
+
+	return active;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_check);
+#endif /* IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND) */
+
 /**
  * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
  * @sb: sideband instance for this usb device
@@ -286,6 +313,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 				 bool ip_autoclear, u32 imod_interval, int intr_num)
 {
 	int ret = 0;
+	struct usb_device *udev;
 
 	if (!sb || !sb->xhci)
 		return -ENODEV;
@@ -304,6 +332,9 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 		goto out;
 	}
 
+	udev = sb->vdev->udev;
+	ret = usb_offload_get(udev);
+
 	sb->ir->ip_autoclear = ip_autoclear;
 
 out:
@@ -323,6 +354,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
 void
 xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
 {
+	struct usb_device *udev;
+
 	if (!sb || !sb->ir)
 		return;
 
@@ -330,6 +363,11 @@ xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
 	xhci_remove_secondary_interrupter(xhci_to_hcd(sb->xhci), sb->ir);
 
 	sb->ir = NULL;
+	udev = sb->vdev->udev;
+
+	if (udev->state != USB_STATE_NOTATTACHED)
+		usb_offload_put(udev);
+
 	mutex_unlock(&sb->mutex);
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_remove_interrupter);
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 45288c392f6e..5174cc5afc98 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -11,6 +11,7 @@
 
 #include <linux/scatterlist.h>
 #include <linux/usb.h>
+#include <linux/usb/hcd.h>
 
 #define	EP_CTX_PER_DEV		31	/* FIXME defined twice, from xhci.h */
 
@@ -83,6 +84,14 @@ xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
 				  struct usb_host_endpoint *host_ep);
 struct sg_table *
 xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
+
+#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
+bool xhci_sideband_check(struct usb_hcd *hcd);
+#else
+static inline bool xhci_sideband_check(struct usb_hcd *hcd)
+{ return false; }
+#endif /* IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND) */
+
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 				 bool ip_autoclear, u32 imod_interval, int intr_num);
-- 
2.49.0.1204.g71687c7c1d-goog



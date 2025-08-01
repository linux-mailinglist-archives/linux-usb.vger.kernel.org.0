Return-Path: <linux-usb+bounces-26302-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69958B17B78
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 05:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01F963B8C82
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 03:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7989F19D884;
	Fri,  1 Aug 2025 03:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mr2Gxn/k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2DD1917CD
	for <linux-usb@vger.kernel.org>; Fri,  1 Aug 2025 03:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754019654; cv=none; b=ju4dHbUcm8Yvt1arU+cIGU+n9ayKtc/yVaDzRN937AnBVt59wzzHrippdYVc51Mj6CNY7pc1bdE2D3vTId4kf6mHZAVRedojB2ZjmYrxJSBw7t1LzneIN9kqnyeXKTRwDe0O1jIw93WDP1N31jax3u3RacPctvjqmFnpldahMhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754019654; c=relaxed/simple;
	bh=0EsSSWp2StcoMyvDXKJJNPW/yPBt1h550IehLxYVt3E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MkYl1GyNwkeGL8yDcK0eij3WdxOJhEjfIPm8ySkuv/ygWbiY1kdkQH64eU/62j98flkZfQBc4Ab+mLF1ikgwg9ist2GHwHm3kWIJyCGKNWgTcX744PuHhfYICczMYXdbz1Ceo2Zprw4xQIHPekZuN6IWR4ZBsiDNY+X8dSDkWTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mr2Gxn/k; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b42218e4a59so928004a12.0
        for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 20:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754019652; x=1754624452; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u52hHJ9rEIBAEk6jD+UXhZlTW31ESJk3DGssR2+OtF8=;
        b=mr2Gxn/kXHZ6zZgOTUgW63UAV480rvN7zwkUlQrnlm+HytNDliV9dFRErsnbkPh6c4
         /Y47+T8W2UiALnwJyM+F658w4pGh/J1pWHO82xJThN3phrs1CSS+cdLrDJ0nItEfBQUU
         ft9EaboHAH4GB+N4v9plN+Orx5x4VyLnKj1II4mxpXVdy7UoPfGtZQJe2w4toE+/phDk
         GGLov1TNBIPkMGalb8gjYAJNyCyeAvpOVbmDnEn4+6gJsoXW5vXpYnk1B5kexpRqJ6Oa
         O88NqFRnBYPzUgUXp7S6F8Xyks6aoUfEbN669S2zkqIU6Sj2yoJ4/C4ZG/X7vfWRp/l6
         6QXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754019652; x=1754624452;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u52hHJ9rEIBAEk6jD+UXhZlTW31ESJk3DGssR2+OtF8=;
        b=rFde0EsCuaiNU6dEH/nkgnqhn1SqwCFMtN3dKr1EDWrm9+y7SnKekhQOWYd7t3t9VT
         suhf/bOOeQDVNjevNLtNPX/iMsbV1vFS+/5pNea5RIJW8HbA4c273xB0k+yFofxeokHn
         I160U+LH20HwQILwLazhoUUCmKco010QkXcZFVHms1r8AzeDwRh/+ZF6eji/j4IkuVF7
         A7BJJBljkkQgVxCwLJ93JitokQEH/U3zQs3p3bZ3b1+NX8Sw2iw/a/3gNE/Eo2FJUq7u
         WQOGa5XyLwcCDeKDRniopPAQaiiht2QrclEK0w8n3pCOVbKtwFplfgPc7hosHP04/ezK
         ITIA==
X-Gm-Message-State: AOJu0YxR+O+3R8c62V7u+moJESvfTCS6XpogTauDYkrCigUych7B0106
	5DWjy4fzVbWK9C8nm6czOnX52SMfQ0Sa7kWAcJ0JxB9sRKhkwixT7uPT9YUoAR1qbf9gue+xcrZ
	uYPXXQPOQxvVho5FpcA==
X-Google-Smtp-Source: AGHT+IG9NseSYCHS4701vA745klXIXlscOCwfDHjui1CQjUPYEUOllMfnUKeDKdUYJzmE2Ho6fuqhz8N6jzk76U=
X-Received: from pfst15.prod.google.com ([2002:aa7:8f8f:0:b0:749:1e51:d39a])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:94c8:b0:236:1d50:5b9c with SMTP id adf61e73a8af0-23dc0dca35emr13808948637.12.1754019651753;
 Thu, 31 Jul 2025 20:40:51 -0700 (PDT)
Date: Fri,  1 Aug 2025 03:39:32 +0000
In-Reply-To: <20250801034004.3314737-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250801034004.3314737-1-guanyulin@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250801034004.3314737-4-guanyulin@google.com>
Subject: [PATCH v15 3/4] xhci: sideband: add api to trace sideband usage
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, hannelotta@gmail.com, 
	zijun.hu@oss.qualcomm.com, xu.yang_2@nxp.com, stern@rowland.harvard.edu, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	dh10.jung@samsung.com
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
2.50.1.565.gc32cd1483b-goog



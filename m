Return-Path: <linux-usb+bounces-22726-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86032A7F36A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 06:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA9D7179DF6
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 03:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC2025F988;
	Tue,  8 Apr 2025 03:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aVpXUwiQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC13025F969
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 03:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744084754; cv=none; b=Va4oiRhewxiWvZ4qOYiKzWbuGMNOpPLFVvy/5E/e3q4CSg0XNXwOfUXAYvFrht+9MpjGdFO1wbGlVj/NGPecKfFebBIauDnX4zYTeZjQTreMCJZj4kM2yBXnTM2w52Qaohm82s/aVgC2FSj78W+arnUUKZ2JmFW4KK5BpuK8aL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744084754; c=relaxed/simple;
	bh=/wmwzEeZuyPe4wA2TVYRVkkTxWQx1D+8tMoAscunngA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pj4phv/QH7q671zMNx+6yvnH0kCFhhkUwxMs0Fy53VglAI3GLnPW8VpmQaa5bcITtU+hMVo0Js0j4y50cIKPlfJxuV07csmJZn6a76AbZzkxny0gbgkWmq6+ZNLgbWd9VAfh7RfSMdPAwnhO8Q67wYX//XvzvsxPIvR5MAKXmPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aVpXUwiQ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-225429696a9so73315555ad.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Apr 2025 20:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744084752; x=1744689552; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0tVzRCkzl6BKtBB0KhFs5d331UTfXX8A8KLdCOv4By0=;
        b=aVpXUwiQ792ThSF9NKIHXs95d1vJpdzdE3uQuiIFpN+RHGZQqNDG839ClV5kRwSyw5
         zWhBgNY0EDavd4/dbDTyN6bkWbTecQ/leJQxultyDyjajJUnh5dPZAC/hCwUQw0yIHOP
         ak+5vVwNfJ7oGfwCk4Uai5InULffUsHsXn8HyGErK9cA8gIm7S7jqwqQJSK3GAe3b2zA
         1FkaGhEQdNeV3bpltBN8/MtuM8wOlnengaNVKUBXXKUYXsXsQ6XZNFZ0PBx0wrQ5REzM
         J+Dudq9XhgKde/0cEBwmovVjOIFqiLwG+NxV9cg/cQrgZSwuYbTAO8t6rANhiWoqu97i
         DQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744084752; x=1744689552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0tVzRCkzl6BKtBB0KhFs5d331UTfXX8A8KLdCOv4By0=;
        b=QPPotsnuupjTFFRVN8mOO92B7ZAVCgYgmSfrtUEe+SY6AH9TI1hIrwIAR1oeqwhwfg
         FjgjKcFoiWNkalrjFmiUWSiq0s9Z8BBCTbsVVhnx0O5X2ZYXpBsS1I4fadBPyCishFMD
         169HQo3JpjClh4rPq6tqr0g4TQSva51UNRmNs1nRbx5rmDZREPEO7JINSakcQIqf0qMr
         CqHbLpAS0Yl32MTVq1Bk0z22X1gVYTlblKjDOLDVXJKLGTiCao+fl+9GCqMXkmU0VjH0
         TCqSZcnuE0RN6lEFeFvxtd+2MRjYprp6gHip++yOVRty+pXSoDNU/IC9G8ntJbiC6NiV
         fGWw==
X-Gm-Message-State: AOJu0YyRbAb0zpsVJiYhMDz8yYtM7SdKe+8AYEDgp3I8Cw7jKb86Du/F
	Z88Ix9h3RVMLX8ry5C2mK1sBYeKnXshrt0bx7USwnwGUusTCyUAUZ//ZER3wZg2Aet7Zxausofw
	Ph7nLTAtILqHeTg==
X-Google-Smtp-Source: AGHT+IH1fBzgv/Nf+REbL9Jf7WRAwyoUupvMjS7dwTTYCPMY9IV2BeRaIZrKEOX8zQS0505iQZfF+B5H7ASuAPg=
X-Received: from plpj21.prod.google.com ([2002:a17:903:3d95:b0:226:342c:5750])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d4c2:b0:21f:74ec:1ff0 with SMTP id d9443c01a7336-22a8a0a3892mr158530955ad.32.1744084751912;
 Mon, 07 Apr 2025 20:59:11 -0700 (PDT)
Date: Tue,  8 Apr 2025 03:57:23 +0000
In-Reply-To: <20250408035833.844821-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408035833.844821-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408035833.844821-4-guanyulin@google.com>
Subject: [PATCH v11 3/4] xhci: sideband: add api to trace sideband usage
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, gargaditya08@live.com, kekrby@gmail.com, 
	jeff.johnson@oss.qualcomm.com, elder@kernel.org, quic_zijuhu@quicinc.com, 
	ben@decadent.org.uk
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
 drivers/usb/host/xhci-sideband.c  | 43 +++++++++++++++++++++++++++++++
 include/linux/usb/xhci-sideband.h |  9 +++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index d49f9886dd84..67f31b0ec726 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -266,6 +266,31 @@ xhci_sideband_get_event_buffer(struct xhci_sideband *sb)
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
 
+#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
+/**
+ * xhci_sideband_check - check the existence of active sidebands
+ * @hcd: the host controller driver associated with the target host controller
+ *
+ * Allow other drivers, such as usb controller driver, to check if there are
+ * any sideband activity on the host controller. This information could be used
+ * for power management or other forms of resource management.
+ *
+ * Returns true on any active sideband existence, false otherwise.
+ */
+bool xhci_sideband_check(struct usb_hcd *hcd)
+{
+	struct usb_device *udev = hcd->self.root_hub;
+	bool active;
+
+	device_lock(&udev->dev);
+	active = usb_offload_check(udev);
+	device_unlock(&udev->dev);
+
+	return active;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_check);
+#endif /* IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND) */
+
 /**
  * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
  * @sb: sideband instance for this usb device
@@ -286,6 +311,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 				 bool ip_autoclear, u32 imod_interval, int intr_num)
 {
 	int ret = 0;
+	struct usb_device *udev;
 
 	if (!sb || !sb->xhci)
 		return -ENODEV;
@@ -304,6 +330,11 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 		goto out;
 	}
 
+	udev = sb->vdev->udev;
+	device_lock(&udev->dev);
+	ret = usb_offload_get(udev);
+	device_unlock(&udev->dev);
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
 
@@ -330,6 +363,16 @@ xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
 	xhci_remove_secondary_interrupter(xhci_to_hcd(sb->xhci), sb->ir);
 
 	sb->ir = NULL;
+	udev = sb->vdev->udev;
+
+	if (udev->state == USB_STATE_NOTATTACHED) {
+		usb_offload_put(udev);
+	} else {
+		device_lock(&udev->dev);
+		usb_offload_put(udev);
+		device_unlock(&udev->dev);
+	}
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
2.49.0.504.g3bcea36a83-goog



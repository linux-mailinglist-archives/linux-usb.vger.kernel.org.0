Return-Path: <linux-usb+bounces-23152-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4910CA906F4
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBCB93B3DC8
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 14:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0ED1EFFB4;
	Wed, 16 Apr 2025 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BzLzS4At"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86501FDA8C
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814997; cv=none; b=ZqIlaf28JvFo3JcxyYmPz5yVmVYhjD+fumI9E9lDHr9b+zvVSSfLv6+WBkXh8q9DB4gX+TuCVUnFlWhEXAwS9XjkHYMvei9eDeHo7riMxKbDC1muVkjtvmiQSk3ZsmEZm3EAMSUsnDR18JuJIocnbZfjfVO4rg9mOIZtaYHbtFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814997; c=relaxed/simple;
	bh=T2vPsaEuwx8PfRvxsYfCewBk5NKPJPyBtTxI/ez7vEw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nRAIkHq/mvSwlOnoWJbP4kpai5JAycyNg/1xnuhX+W1oq3zKwmbfN9eQAJOJwljYTQzwiMcNKwDuMs6yxI4285iuec7clUWS2VvRuyxO/J5hk10tZxnGRF0HAxQmSaPTfvO3+ojcWcduTHgetlMGPjehZB4mFunnNo8JECJAHq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BzLzS4At; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-306b590faaeso5595380a91.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 07:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744814995; x=1745419795; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=65zsaMyb5cxxAQpoirenuK9YWVfgo8pyw/N+IrnZdgQ=;
        b=BzLzS4AtaGPLDByfbKeP/tKel1qZXM1Vyl9xFzwEqe46ihj7P7hV+Y+x0iIYy0LyXX
         poadQvvKg/FUFLQNMsj8C9jx09jn0atgDHUmklFKrWqxNmxDlVjlQeGzPUgwdCnT9Xg1
         GAowvtUhazqB7/rEGmTtXtaO9tfXZ5KNV8SnRvmKgGQlQOrNPBAZ9USqwAshOZyV8lym
         YU+kTOgXJGIBve88rhPblitTWDdV6TEtr312eXIs/PUEYeAOelaoFJO+Acjr7wCle9xZ
         6cNA4XNORyzCshgLoQXzpOuGzZMFYUrOIeAyxXvJaCbpBLL6EYaqFz5HBjMlVps48d4w
         AM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744814995; x=1745419795;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65zsaMyb5cxxAQpoirenuK9YWVfgo8pyw/N+IrnZdgQ=;
        b=sgxAivFGue+Q9D2wQDhD2H7R+y+DGDZYvkuWAIH5WPK7mCunVFdLgqNoeJEC8CpSs0
         CnxQtQ4ijnnSnUS4FwiY9ZIqvBPBPkJ+3EjdklFxqzFft5+SvtAcV+BtSofkVb7l6LFx
         QHQWvkiOSJF97D6QWJSZ2tnRAp95qaXJkt1or0pJZmok8CBdgytDIuDtsuWqiFnwbN82
         nojvcgaOE3EiJccwwSBmlkAx5PgiJQMSmklFDB7MJ+xYgfV/77UD46ljjiVEWNNkjXNI
         170hJptU7EEht84Q9c1IFtpS73teGmSa/UkoWfICIS6Mng24xYQN5BmDAXAZixq6J4r0
         9NFw==
X-Gm-Message-State: AOJu0YxWVp+elXSgcB2h6eh+VdXCuDOWo9LnntQpGXL9UUP2AibTHXJ3
	9v0m6Jxcaue8Cl5QWC9+sm0wWHLejx9SZ99w3eBSB7jxLTFN6rC7Nxm7qBpDo2rF3S21Kls+jqr
	utz12kscbEm7k4A==
X-Google-Smtp-Source: AGHT+IFkW15HV2K1v8lyXTXQkds0p5oOqdfhXN2k3Gs1ekSwRfK5md5o0PcHVRQg9zRBPcSgZDyaajTrWZEtTu8=
X-Received: from pjbqc16.prod.google.com ([2002:a17:90b:2890:b0:2ff:8471:8e53])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:570f:b0:2ea:3f34:f18f with SMTP id 98e67ed59e1d1-30863f2fb9dmr3051598a91.19.1744814994992;
 Wed, 16 Apr 2025 07:49:54 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:43:03 +0000
In-Reply-To: <20250416144917.16822-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416144917.16822-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416144917.16822-4-guanyulin@google.com>
Subject: [PATCH v12 3/4] xhci: sideband: add api to trace sideband usage
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, sumit.garg@kernel.org, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com
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
2.49.0.604.gff1f9ca942-goog



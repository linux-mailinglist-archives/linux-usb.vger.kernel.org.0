Return-Path: <linux-usb+bounces-19155-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CA2A06C90
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 04:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A926018899F1
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 03:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673C21898E9;
	Thu,  9 Jan 2025 03:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gao4ejgX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480BE188CA9
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 03:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736395018; cv=none; b=J0yuUWDnsq4wojwBpQDGKKInJVWzSsYvtZGv2YXv2l5Bw0rCJKzGZIZSWfr5svdqQMzWAw43Ku5b54Ca/uNxx4hewbOyf2W4V6xobW+5otCOa+LBneeLI0ahkvksD08CVoYRbXZfAEf77IRdGzhjLKVdRYl45rQ5Jhdz2fpcsjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736395018; c=relaxed/simple;
	bh=faUlm+0/aqfwj/ZyUJRA6KayiX/ZHmaYLZuAWi+8Tt8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PelxkPeu0vWz2KhetgYmRfW2Op/U66gNJt6vcF6WLyLpwDIURdRmDXjh/bmAn1LPn7DX+yH0QxcvnO9SD5yxFgLqTEfV8MJxAZsggrcOPfIUgOltMFggpvnB836v2qMgmRWX1ZrMyDrBRxCk7IlwL3K1+C2Ak4SNEnJXfQLOidA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gao4ejgX; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21648ddd461so10082045ad.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2025 19:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736395015; x=1736999815; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yq1k1+crakqu6xGV6adPZX7kzIgk4M719hbmyURwKps=;
        b=gao4ejgXK8SeUr0S/m8BAosG1o07awuEi5pj9H44I9Z0v1FWtkhp6h6vV0du/I48yH
         D5lK6T6rU+i7vNipGt7okEONq5Z2OUXst0Y0WXlGSkBEoo9rRR0j+1qBBrmzuXJz9/yA
         r5/RhfE56PaWkySKC+emJUwOc+tjByzqTkgm6PdJYr7GF2kWexsbWV7Z+Msw2QRaWMqY
         BU6rBWG4WOCtZAazaSBxPkzQStMXRUfoj+ewteDBGGZmBSdkpNHaTZ1TbnwhvFMXcRwP
         fnOBV14hrlX3ilYn9KiX32z7l00VU7DiLzZfvjkDmYCsauPwmE9biAnnlYIfPMGL/tL+
         GkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736395015; x=1736999815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yq1k1+crakqu6xGV6adPZX7kzIgk4M719hbmyURwKps=;
        b=QiK75Ws/B+UcOwNpoJo85jxnwz2Q1G5TbjOZFvy2lQm2bJRWb1u+GpZ3HoZ0mbW2W0
         gq1JG4Q/AiRndzZoIOUi5u0QZgvhGmCS7MVGTE+4oR9WjhKWJMMu+jbGoqe5HYovfj2t
         vM45vwJoE/ytNGyqi8DVrS6L58gq8SatY+YSvoGDuwRU1HHBHmFZaERUw2z2ymAO33dJ
         EGPN+NA6f9CanYQmPiCLk3sdY2GVrzv6hSLujaysMdRD7vF+Xr3iE3fejdTW9JQLVS0U
         AfQr3c5w5cZvdAaR+KD+BPdSaCZNAYiZSd+5UD7k63P2sZ2PdYXfiw91vPrSJYjwwhUf
         BsnQ==
X-Gm-Message-State: AOJu0YxPpEAoolkefis5KVwPHy1docKp/5S6hQ1CANOYaAEFdAT651ug
	0iEviebpkR7XDeWS8YHSxrnONaIjwEDG8gpm0fK6JTGanET+prwuJ2/dd55gXYLEVFDfEq0DTmH
	3Ne0VOWJLj7OgBw==
X-Google-Smtp-Source: AGHT+IG+uiVZJFTFW1Pc7BABtMZ+mTFebYnx6zwKTzfzwanRWkoXb+6jWySyhgbUQv+K78k1W2dmItnKFD09gYo=
X-Received: from plblc11.prod.google.com ([2002:a17:902:fa8b:b0:216:248e:8fab])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e843:b0:215:a3fb:b4d6 with SMTP id d9443c01a7336-21a83f3f50dmr83119925ad.8.1736395015667;
 Wed, 08 Jan 2025 19:56:55 -0800 (PST)
Date: Thu,  9 Jan 2025 03:55:08 +0000
In-Reply-To: <20250109035605.1486717-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109035605.1486717-1-guanyulin@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109035605.1486717-5-guanyulin@google.com>
Subject: [PATCH v7 4/5] xhci: sideband: add api to trace sideband usage
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

The existing sideband driver only registers sidebands without tracking
their active usage. To address this, new apis are introduced to:
- mark sideband usage: record the sideband usage information in the USB
  device driver.
- query sideband status: provide a means for other drivers to fetch
  sideband activity information on a USB host controller.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/host/xhci-sideband.c  | 82 +++++++++++++++++++++++++++++++
 include/linux/usb/xhci-sideband.h |  6 +++
 2 files changed, 88 insertions(+)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index ffa6f1b825ff..d4931315dcf4 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -358,6 +358,88 @@ xhci_sideband_interrupter_id(struct xhci_sideband *sb)
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
 
+/**
+ * xhci_sideband_get - record a new active sideband instance
+ * @sb: sideband instance for this usb device
+ *
+ * An active sideband indicates that another entity is currently using the host
+ * controller. Inform the usb_device associated with this sideband instance via
+ * usb_offload_get(). This allows the corresponding drivers to dynamically
+ * adjust power management actions based on current sideband activities.
+ *
+ * Returns 0 on success, negative error otherwise.
+ */
+int xhci_sideband_get(struct xhci_sideband *sb)
+{
+	struct usb_device *udev;
+	struct usb_hcd *hcd;
+	int ret = 0;
+
+	if (!sb || !sb->xhci)
+		return -ENODEV;
+
+	hcd = xhci_to_hcd(sb->xhci);
+	udev = sb->vdev->udev;
+	device_lock(&udev->dev);
+	ret = usb_offload_get(udev);
+	device_unlock(&udev->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_get);
+
+/**
+ * xhci_sideband_put - record a deactivated sideband instance
+ * @sb: sideband instance for this usb device
+ *
+ * The inverse operation of xhci_sideband_get, which informs the associated
+ * usb_device via usb_offload_put(). This allows the corresponding drivers to
+ * dynamically adjust power management actions based on sideband activities.
+ *
+ * Returns 0 on success, negative error otherwise.
+ */
+int xhci_sideband_put(struct xhci_sideband *sb)
+{
+	struct usb_device *udev;
+	struct usb_hcd *hcd;
+	int ret = 0;
+
+	if (!sb || !sb->xhci)
+		return -ENODEV;
+
+	hcd = xhci_to_hcd(sb->xhci);
+	udev = sb->vdev->udev;
+	device_lock(&udev->dev);
+	ret = usb_offload_put(udev);
+	device_unlock(&udev->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_put);
+
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
+
 /**
  * xhci_sideband_register - register a sideband for a usb device
  * @intf: usb interface associated with the sideband device
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 72aa17eb068d..6de1d9c161a1 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -11,6 +11,7 @@
 
 #include <linux/scatterlist.h>
 #include <linux/usb.h>
+#include <linux/usb/hcd.h>
 
 #define	EP_CTX_PER_DEV		31	/* FIXME defined twice, from xhci.h */
 
@@ -82,6 +83,11 @@ xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
 				  struct usb_host_endpoint *host_ep);
 struct sg_table *
 xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
+
+int xhci_sideband_get(struct xhci_sideband *sb);
+int xhci_sideband_put(struct xhci_sideband *sb);
+bool xhci_sideband_check(struct usb_hcd *hcd);
+
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 				 bool ip_autoclear, u32 imod_interval, int intr_num);
-- 
2.47.1.613.gc27f4b7a9f-goog



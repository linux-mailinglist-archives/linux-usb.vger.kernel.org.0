Return-Path: <linux-usb+bounces-19501-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F01DA1523A
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 15:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82A433AE553
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 14:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C24E19D065;
	Fri, 17 Jan 2025 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u3b3+Pr2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFA5194A66
	for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737125592; cv=none; b=lDDhWxBJKeBrWtn/IgixmdDtruzcpvdHEBm3yq9HjIkEzZJgPaWmeb0dEeuJ63Yl+f0ju0TMTZH911S1spYv1XJZkB8nLJp8wxVteKaPNPRJYXqnO+A5FXoRYzDewWnUDcGzLrPCIvXPLtYH26rtSMVYh70P6gbEE1vz0+fMbjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737125592; c=relaxed/simple;
	bh=44d/KNFe8ozkeaq7IQ5Sv9h6dT0hWOgYDawnmRWXc0k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CzTLHZCtLMf8S4D5dazx6gJlWEw9ChX85Q7z+XscEWr7KMUrQMZG2UtyV7XLa7PTvttJN23hPB/CLZhYJOrjsV8Mx8Nu0t8RyeJ2AUpzrrCzs/XPfX7zfRXpWVAw9eg5H72kDgEKgBv27XjrqNjDE07+k/T0a93lwRqjk3B5lEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u3b3+Pr2; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef775ec883so4107364a91.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 06:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737125590; x=1737730390; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NYrUzWw505HeBsvBgwJ+7hL3A+NEhIeuEpkKA+DPI1o=;
        b=u3b3+Pr2ZTQUAs7YPDSpICjdj3S2TuLh6h/zraNvmpohA7BmiwRxi03ck7QJkb1YZY
         87rAEoICUDWIU5Eg4mUoaCgyFIzfTAbmdELACG1EFeZ4kDvjs6ftLqQfeG5+GbWJVpqc
         +SFK4UXpVpKH9P/WwyQi8kH6sKVEdYcN0wzz4PSUj/pQcZFMHtmfXzL76yUBeNLHYp8/
         ExU6bJXEqcat+1UXDQ3sBp9IsSNOa0ghu0zAQ+FPo7P2lgL6NdFQeHyonEw1rqbkqlK1
         l1q8AoJgMZH4IWes1LaMMe8OZ5FixQ1MHim8c/jvP1OgIAbuUhvJJ1UcE3652Q0fLlq3
         Eqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737125590; x=1737730390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYrUzWw505HeBsvBgwJ+7hL3A+NEhIeuEpkKA+DPI1o=;
        b=dvIMv6ZKFTR6QzR0m79edtm3IipjEvD6ktoe2nzkk6AyzFmbVf2kO3xlZfPZykqa3p
         V7UFIhJwlAIn8ZVnhvvIyKQ+7JDRgjmkuqbsrW6XxII9XMjWHg7RT4TXEdO1C/XnYejm
         pFaVb00FhtN38eK5ukxLz1/MoC5y3XfaBN90CDhtpWrHp9UdTg6bvqlJphM4gcCSvwBz
         VL7fqSFTaQd20QlZuP6+8R7gu32KSNICjzWqx3LohSWJQsbMnCihlcjHnbpP6FSvAhc6
         im3pT+RNiSzxnPPOQAnPNiC2aSxq0Go1DgmKI0ladpi2PWsr/zK1sCOC0vSwvaqI76hp
         XJPw==
X-Gm-Message-State: AOJu0Yx7XrJfFd033runhG+sVR+DEUKEEI6idxNKB5L9xFapRZVYn9nh
	59FsfuQ9rsM8OsS8UMN8ZLzdBoIr5f2gs8d8E0u3N5kwAbmafXQaa1GsYuuCttn3K/U98mChSj/
	2FY8UowNyTmS25A==
X-Google-Smtp-Source: AGHT+IFt+bRNV23OgMCgSntbifLFt0TVJJs9kgJ82JMJ1FwsFDPqFHRvqkDif03QQ9NgDHVTiNXi5XUv9Wd/pcM=
X-Received: from pjz16.prod.google.com ([2002:a17:90b:56d0:b0:2ea:931d:7ced])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5146:b0:2ee:c04a:4281 with SMTP id 98e67ed59e1d1-2f782c6579dmr3876073a91.6.1737125589990;
 Fri, 17 Jan 2025 06:53:09 -0800 (PST)
Date: Fri, 17 Jan 2025 14:48:04 +0000
In-Reply-To: <20250117145145.3093352-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250117145145.3093352-1-guanyulin@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117145145.3093352-5-guanyulin@google.com>
Subject: [PATCH v9 4/5] xhci: sideband: add api to trace sideband usage
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
2.48.0.rc2.279.g1de40edade-goog



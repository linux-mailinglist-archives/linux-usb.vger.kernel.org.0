Return-Path: <linux-usb+bounces-30213-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9CBC40E3E
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 17:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0785A4F4639
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 16:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15253203BA;
	Fri,  7 Nov 2025 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKMzkvl/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BFC2BD5B9
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762532925; cv=none; b=ql0iEFQBlXOU9jLNQFKQnan64L86fzDpEhvYkEMkSImkjItCZqER55jnc/VuDMHA1YNIFxHwYDyCV60vEceBt9kjmP2nLJkH+eBgRhzyqF8Wy3WzSmu5xuOJSbjQdbEYOQvLnSi32svKMEvZao3LWOww5DIwpTzV9SpYZcRujxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762532925; c=relaxed/simple;
	bh=h4dM4cwoFB/GIycVngPrZ5B268BxLdCZRninHxy20QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TkMtWGNLvnR6uvMedo9UQDUNsprjS5nB5LZDVqo9A/hqnftmpcGH1oOooPZiBY1D76xsj/2FUEvhq4dg6azb6q/lQ7d8VGbAmveXOqbCkwNoZRlrQrHU9jgI9w1uVn8QO/tybwmUsvvFXFrosnx4MkvoLUOxqE60uPJtAFRnw+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKMzkvl/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762532922; x=1794068922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h4dM4cwoFB/GIycVngPrZ5B268BxLdCZRninHxy20QU=;
  b=fKMzkvl/zmaILNX4ibpEVhrMB5Qstw//Zetb36eAshZ5CQOmV610l9Pr
   K/GeXWQ9h18EWByOURIWjUm0vpp0eR7NH7mxqQbohiDioXQpdug5iT8FY
   9zeCjqU9finrhe3C8ObAqWsv+AxhO4Fhlyqk+5veZccno5H0jRSw0iP+K
   kXFWkgtEIWK6YbfMBgJYwMoFXBlwdGbGJfIddcJvIKoaAAzxWr/qz0r3A
   XDwxo3t1V/TLS2q2SmI6+AWSCK98R1iGmnsmMFvlyapNRzh7+UiIDwEIr
   FnoNgzB6EKctvJi/GiWeh9jas2/j6RNbiGCp/dJxJ2mP+kRBUrTwG0DST
   w==;
X-CSE-ConnectionGUID: rImVvADpRnWfnyBb30kHEw==
X-CSE-MsgGUID: 2I0X6GR9TMOxCil6Q7wVig==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="74979462"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="74979462"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 08:28:41 -0800
X-CSE-ConnectionGUID: C66UzGBPTBGXduFtJBD+oA==
X-CSE-MsgGUID: 5T1S//KbSmuekMUDgu54GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="187328939"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.61])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 08:28:40 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Subject: [PATCH 3/3] xhci: sideband: Fix race condition in sideband unregister
Date: Fri,  7 Nov 2025 18:28:18 +0200
Message-ID: <20251107162819.1362579-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107162819.1362579-1-mathias.nyman@linux.intel.com>
References: <20251107162819.1362579-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Uttkarsh Aggarwal observed a kernel panic during sideband un-register
and found it was caused by a race condition between sideband unregister,
and creating sideband interrupters.
The issue occurrs when thread T1 runs uaudio_disconnect() and released
sb->xhci via sideband_unregister, while thread T2 simultaneously accessed
the now-NULL sb->xhci in xhci_sideband_create_interrupter() resulting in
a crash.

Ensure new endpoints or interrupter can't be added to a sidenband after
xhci_sideband_unregister() cleared the existing ones, and unlocked the
sideband mutex.
Reorganize code so that mutex is only taken and released once in
xhci_sideband_unregister(), and clear sb->vdev while mutex is taken.

Use mutex guards to reduce human unlock errors in code

Refuse to add endpoints or interrupter if sb->vdev is not set.
sb->vdev is set when sideband is created and registered.

Reported-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Closes: https://lore.kernel.org/linux-usb/20251028080043.27760-1-uttkarsh.aggarwal@oss.qualcomm.com
Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secondary interrupter entity")
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-sideband.c | 102 ++++++++++++++++++-------------
 1 file changed, 58 insertions(+), 44 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index e771a476fef2..a85f62a73313 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -73,9 +73,12 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 	return NULL;
 }
 
+/* Caller must hold sb->mutex */
 static void
 __xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *ep)
 {
+	lockdep_assert_held(&sb->mutex);
+
 	/*
 	 * Issue a stop endpoint command when an endpoint is removed.
 	 * The stop ep cmd handler will handle the ring cleanup.
@@ -86,6 +89,25 @@ __xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *e
 	sb->eps[ep->ep_index] = NULL;
 }
 
+/* Caller must hold sb->mutex */
+static void
+__xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
+{
+	struct usb_device *udev;
+
+	lockdep_assert_held(&sb->mutex);
+
+	if (!sb->ir)
+		return;
+
+	xhci_remove_secondary_interrupter(xhci_to_hcd(sb->xhci), sb->ir);
+	sb->ir = NULL;
+	udev = sb->vdev->udev;
+
+	if (udev->state != USB_STATE_NOTATTACHED)
+		usb_offload_put(udev);
+}
+
 /* sideband api functions */
 
 /**
@@ -131,14 +153,16 @@ xhci_sideband_add_endpoint(struct xhci_sideband *sb,
 	struct xhci_virt_ep *ep;
 	unsigned int ep_index;
 
-	mutex_lock(&sb->mutex);
+	guard(mutex)(&sb->mutex);
+
+	if (!sb->vdev)
+		return -ENODEV;
+
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 	ep = &sb->vdev->eps[ep_index];
 
-	if (ep->ep_state & EP_HAS_STREAMS) {
-		mutex_unlock(&sb->mutex);
+	if (ep->ep_state & EP_HAS_STREAMS)
 		return -EINVAL;
-	}
 
 	/*
 	 * Note, we don't know the DMA mask of the audio DSP device, if its
@@ -148,14 +172,11 @@ xhci_sideband_add_endpoint(struct xhci_sideband *sb,
 	 * and let this function add the endpoint and allocate the ring buffer
 	 * with the smallest common DMA mask
 	 */
-	if (sb->eps[ep_index] || ep->sideband) {
-		mutex_unlock(&sb->mutex);
+	if (sb->eps[ep_index] || ep->sideband)
 		return -EBUSY;
-	}
 
 	ep->sideband = sb;
 	sb->eps[ep_index] = ep;
-	mutex_unlock(&sb->mutex);
 
 	return 0;
 }
@@ -180,18 +201,16 @@ xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
 	struct xhci_virt_ep *ep;
 	unsigned int ep_index;
 
-	mutex_lock(&sb->mutex);
+	guard(mutex)(&sb->mutex);
+
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 	ep = sb->eps[ep_index];
 
-	if (!ep || !ep->sideband || ep->sideband != sb) {
-		mutex_unlock(&sb->mutex);
+	if (!ep || !ep->sideband || ep->sideband != sb)
 		return -ENODEV;
-	}
 
 	__xhci_sideband_remove_endpoint(sb, ep);
 	xhci_initialize_ring_info(ep->ring);
-	mutex_unlock(&sb->mutex);
 
 	return 0;
 }
@@ -316,28 +335,25 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 	if (!sb || !sb->xhci)
 		return -ENODEV;
 
-	mutex_lock(&sb->mutex);
-	if (sb->ir) {
-		ret = -EBUSY;
-		goto out;
-	}
+	guard(mutex)(&sb->mutex);
+
+	if (!sb->vdev)
+		return -ENODEV;
+
+	if (sb->ir)
+		return -EBUSY;
 
 	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
 						   num_seg, imod_interval,
 						   intr_num);
-	if (!sb->ir) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!sb->ir)
+		return -ENOMEM;
 
 	udev = sb->vdev->udev;
 	ret = usb_offload_get(udev);
 
 	sb->ir->ip_autoclear = ip_autoclear;
 
-out:
-	mutex_unlock(&sb->mutex);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
@@ -352,21 +368,12 @@ EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
 void
 xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
 {
-	struct usb_device *udev;
-
-	if (!sb || !sb->ir)
+	if (!sb)
 		return;
 
-	mutex_lock(&sb->mutex);
-	xhci_remove_secondary_interrupter(xhci_to_hcd(sb->xhci), sb->ir);
-
-	sb->ir = NULL;
-	udev = sb->vdev->udev;
+	guard(mutex)(&sb->mutex);
 
-	if (udev->state != USB_STATE_NOTATTACHED)
-		usb_offload_put(udev);
-
-	mutex_unlock(&sb->mutex);
+	__xhci_sideband_remove_interrupter(sb);
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_remove_interrupter);
 
@@ -465,6 +472,7 @@ EXPORT_SYMBOL_GPL(xhci_sideband_register);
 void
 xhci_sideband_unregister(struct xhci_sideband *sb)
 {
+	struct xhci_virt_device *vdev;
 	struct xhci_hcd *xhci;
 	int i;
 
@@ -473,17 +481,23 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
 
 	xhci = sb->xhci;
 
-	mutex_lock(&sb->mutex);
-	for (i = 0; i < EP_CTX_PER_DEV; i++)
-		if (sb->eps[i])
-			__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
-	mutex_unlock(&sb->mutex);
+	scoped_guard(mutex, &sb->mutex) {
+		vdev = sb->vdev;
+		if (!vdev)
+			return;
+
+		for (i = 0; i < EP_CTX_PER_DEV; i++)
+			if (sb->eps[i])
+				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
 
-	xhci_sideband_remove_interrupter(sb);
+		__xhci_sideband_remove_interrupter(sb);
+
+		sb->vdev = NULL;
+	}
 
 	spin_lock_irq(&xhci->lock);
 	sb->xhci = NULL;
-	sb->vdev->sideband = NULL;
+	vdev->sideband = NULL;
 	spin_unlock_irq(&xhci->lock);
 
 	kfree(sb);
-- 
2.43.0



Return-Path: <linux-usb+bounces-35868-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJDBFcluzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35868-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 162C9389B5A
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF5E93128322
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029F02877DA;
	Thu,  2 Apr 2026 13:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JluqOWP3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8F02D5432
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135836; cv=none; b=jg6KEbZhhDZE4hu2ZU5XRilHNB7KUe8tLYTwFvJ1WP2p2419PlORM7FPXhnpCKhedmM6gcRpslsAjjGhcSa6Dkyty5lC0MUlNdxsxFm5boS/8jW7uOpGzcgMUhnPXFiCQPAMhCJnRqzWbCEUK9kUKHHYMsdu840RHGVRLiFR8js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135836; c=relaxed/simple;
	bh=YMHAcQevLE4y4OD0YLA1XQfJmZx3sPpC6oKNsAKJbp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xw4jUczRV3jp7+N0qBOmEtPp32LMatNJkFS3Fu0YAK9K/oTjK+NaEqHCoSg3lMFSbZ1pPH9OqtYEl+gBdIRSgkatnk4MvzHJspmu4RkKQXY7d0laIyDDOqRqmRZfJ2VAnVa0OTymUzHgGqD72ItGCgedkGQz0u5zJslqt5mxxWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JluqOWP3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135836; x=1806671836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YMHAcQevLE4y4OD0YLA1XQfJmZx3sPpC6oKNsAKJbp0=;
  b=JluqOWP34bzvTVRKmt23hnhzb8Qy7YYkRDVEK8oc9P61OcxCtlPDGIKF
   zFoqap1dH6L/cK+q2TBF+fzMac5HPdLZDQpDDXxShTbmFxW+cp5iOc94B
   Mo91hKEqIgWRQ/Pw1SC/1SP7frlgbEWsN8vKxIkMEOo19/k37zfFHveBt
   kYnrlKMx2Xa608r/53MvE6xglURv1KwnnZojFAsUQThLBzH6/WrQF4J1K
   pcrKObrtxLXqHUgEcTn8l3xkybTN0wyU26M52+vNnMH4GAswVJi4yjvAh
   +52m4IVRcnvv7RRWU2CzhcGFYmqzBfdgILVV1NMhcuVHJe2mMWSmheyMy
   g==;
X-CSE-ConnectionGUID: ZB+ZsTKwSo6uuo/fccWBtQ==
X-CSE-MsgGUID: xJ7KFhHsQaaAbFmDwHqm0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650807"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650807"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:15 -0700
X-CSE-ConnectionGUID: JcbItaTHRE+nVGd46br0Og==
X-CSE-MsgGUID: fmnARSGhQSelWxDCSDOUVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241487"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:14 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/25] usb: xhci: Fix debugfs bandwidth reporting
Date: Thu,  2 Apr 2026 16:13:20 +0300
Message-ID: <20260402131342.2628648-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
References: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35868-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 162C9389B5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Michal Pecio <michal.pecio@gmail.com>

Replace kernel USB speed numbers with xHCI protocol IDs expected by HW.
They are numerically equal up to high speed, but instead of SuperSpeed
we were querying SuperSpeed+.

Gen1 hardware rejects such commands with TRB Error, which resulted in
zero available bandwidth being shown.

While at that, report failures properly. No attempt made at "tunneling"
all possible comp codes through errno, debugfs users may inspect the
result through event-ring/trbs.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c | 10 +++++++---
 drivers/usb/host/xhci.c         |  9 ++++++++-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index ade178ab34a7..d07276192256 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -700,6 +700,10 @@ static int xhci_port_bw_show(struct xhci_hcd *xhci, u8 dev_speed,
 		seq_printf(s, "port[%d] available bw: %d%%.\n", i,
 				ctx->bytes[i]);
 err_out:
+	if (ret == -EIO) {
+		seq_puts(s, "Get Port Bandwidth failed\n");
+		ret = 0;
+	}
 	pm_runtime_put_sync(dev);
 	xhci_free_port_bw_ctx(xhci, ctx);
 	return ret;
@@ -710,7 +714,7 @@ static int xhci_ss_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, USB_SPEED_SUPER, s);
+	ret = xhci_port_bw_show(xhci, DEV_PORT_SPEED(XDEV_SS), s);
 	return ret;
 }
 
@@ -719,7 +723,7 @@ static int xhci_hs_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, USB_SPEED_HIGH, s);
+	ret = xhci_port_bw_show(xhci, DEV_PORT_SPEED(XDEV_HS), s);
 	return ret;
 }
 
@@ -728,7 +732,7 @@ static int xhci_fs_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, USB_SPEED_FULL, s);
+	ret = xhci_port_bw_show(xhci, DEV_PORT_SPEED(XDEV_FS), s);
 	return ret;
 }
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ef6d8662adec..eb6927779b1e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3201,7 +3201,12 @@ void xhci_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 }
 EXPORT_SYMBOL_GPL(xhci_reset_bandwidth);
 
-/* Get the available bandwidth of the ports under the xhci roothub */
+/*
+ * Get the available bandwidth of the ports under the xhci roothub.
+ * EIO means the command failed: command not implemented or unsupported
+ * speed (TRB Error), some ASMedia complete with Parameter Error when
+ * querying the root hub (slot_id = 0), or other error or timeout.
+ */
 int xhci_get_port_bandwidth(struct xhci_hcd *xhci, struct xhci_container_ctx *ctx,
 			    u8 dev_speed)
 {
@@ -3230,6 +3235,8 @@ int xhci_get_port_bandwidth(struct xhci_hcd *xhci, struct xhci_container_ctx *ct
 	spin_unlock_irqrestore(&xhci->lock, flags);
 
 	wait_for_completion(cmd->completion);
+	if (cmd->status != COMP_SUCCESS)
+		ret = -EIO;
 err_out:
 	kfree(cmd->completion);
 	kfree(cmd);
-- 
2.43.0



Return-Path: <linux-usb+bounces-35876-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLh+BrRszmmpngYAu9opvQ
	(envelope-from <linux-usb+bounces-35876-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:18:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2029D389898
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB8503047510
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FB82F3C3D;
	Thu,  2 Apr 2026 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8YkjYQ9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022F12D8DDB
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135851; cv=none; b=cIDuOI1O2PBEfG1x3PIdqfv8Bsr8j3bQZD9ufBFyW+2lvju4yuy/6v/MUNK9t/chJlVp/hj4qMnG2d8lL/rNAUH8Gy238MPJG05K7ZzkjQv9aNJCxYpK7Uvd//XBf73AeNFn6eb4gcvnqJS1YocjNv4HknR9ur63Mo/4nUKzVU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135851; c=relaxed/simple;
	bh=vxLq6tgmDW3jTkeVusLASJtq9McLYLeNBdrOiFHi7HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRui8S0czuQm7AvAHGFsiUZGfbyejNi7TjB9d6S5jJfmFo634C9PlIpIqrnAQqZuAM2vhqKGaLFelHjWpJOJ9Xxc+TJJZSLzLQNg4Q4ncQN0lq4ooLz55INQvZFWu7xMZ4wzSoC61t1rzoBxNcKVmBhxZxNHtZRsPFnqhX+4GOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8YkjYQ9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135850; x=1806671850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vxLq6tgmDW3jTkeVusLASJtq9McLYLeNBdrOiFHi7HU=;
  b=j8YkjYQ9hEV7VjPLBBsGhNTy5oM5lF1LmAYIXyLxsYlGd4328P5aqfCr
   sF4VgeEzYX22rHMkhSey83K1FBCPG0ERQYlEIiB5Rq4SEJpKvzN20VrXk
   CchLm7G0ULM2VkpOQUT6Ip5zYv74tDsx1LoFeHngPps2OU0Zh10YKPBir
   SmRod2/PVvFKjl6sj6u9qSzAd6+ZbEZAGgIRhT4FvdGTrpJZsgPYg+SyV
   IT3WSwPyNREAo0nlfQMMSc/Yzerl980GIWkScy2Knb0L+kRmxT124FLJ4
   /sMc/m3keS/bCbp5aJIZm1a1VEn/JnAB1i6uOYHC+rMW8DSgtdBM62Ndh
   w==;
X-CSE-ConnectionGUID: 9ujHZ8LPQHeMeqzGGzor3Q==
X-CSE-MsgGUID: XWxMhOp5R7mSeVTBYDYQvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650857"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650857"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:30 -0700
X-CSE-ConnectionGUID: QG+t8XjXTwO+KCIifPi72A==
X-CSE-MsgGUID: qS4KwtrXSwmKNzi9zZKPJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241530"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:29 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/25] usb: xhci: improve debug messages during suspend
Date: Thu,  2 Apr 2026 16:13:28 +0300
Message-ID: <20260402131342.2628648-12-mathias.nyman@linux.intel.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35876-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2029D389898
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Improve debug output for suspend failures, particularly when the controller
handshake does not complete. This will become important as upcoming patches
significantly rework the resume path, making more detailed suspend-side
messages valuable for debugging.

Add an explicit check of the Save/Restore Error (SRE) flag after a
successful Save State (CSS) operation. The xHCI specification
(note in section 4.23.2) states:

 "After a Save or Restore State operation completes, the
  Save/Restore Error (SRE) flag in USBSTS should be checked to
  ensure the operation completed successfully."

Currently, the SRE error is only observed and warning is printed.
This patch does not introduce deeper error handling, as the correct
response is unclear and changes to suspend behavior may risk regressions
once the resume path is updated.

Additionally, simplify and clean up the suspend USBSTS CSS/SSS
handling code, improving readability and quirk handling for AMD
SNPS xHC controllers that occasionally do not clear the SSS bit.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 65 +++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 9e2e2c2ed0e0..2c573aad4464 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -957,11 +957,11 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
  */
 int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 {
-	int			rc = 0;
+	int			err;
 	unsigned int		delay = XHCI_MAX_HALT_USEC * 2;
 	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
 	u32			command;
-	u32			res;
+	u32			usbsts;
 
 	if (!hcd->state)
 		return 0;
@@ -1007,11 +1007,10 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 	/* Some chips from Fresco Logic need an extraordinary delay */
 	delay *= (xhci->quirks & XHCI_SLOW_SUSPEND) ? 10 : 1;
 
-	if (xhci_handshake(&xhci->op_regs->status,
-		      STS_HALT, STS_HALT, delay)) {
-		xhci_warn(xhci, "WARN: xHC CMD_RUN timeout\n");
-		spin_unlock_irq(&xhci->lock);
-		return -ETIMEDOUT;
+	err = xhci_handshake(&xhci->op_regs->status, STS_HALT, STS_HALT, delay);
+	if (err) {
+		xhci_warn(xhci, "Clearing Run/Stop bit failed %d\n", err);
+		goto handshake_error;
 	}
 	xhci_clear_command_ring(xhci);
 
@@ -1022,28 +1021,34 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 	command = readl(&xhci->op_regs->command);
 	command |= CMD_CSS;
 	writel(command, &xhci->op_regs->command);
+
+	err = xhci_handshake(&xhci->op_regs->status, STS_SAVE, 0, 20 * USEC_PER_MSEC);
+	usbsts = readl(&xhci->op_regs->status);
 	xhci->broken_suspend = 0;
-	if (xhci_handshake(&xhci->op_regs->status,
-				STS_SAVE, 0, 20 * 1000)) {
-	/*
-	 * AMD SNPS xHC 3.0 occasionally does not clear the
-	 * SSS bit of USBSTS and when driver tries to poll
-	 * to see if the xHC clears BIT(8) which never happens
-	 * and driver assumes that controller is not responding
-	 * and times out. To workaround this, its good to check
-	 * if SRE and HCE bits are not set (as per xhci
-	 * Section 5.4.2) and bypass the timeout.
-	 */
-		res = readl(&xhci->op_regs->status);
-		if ((xhci->quirks & XHCI_SNPS_BROKEN_SUSPEND) &&
-		    (((res & STS_SRE) == 0) &&
-				((res & STS_HCE) == 0))) {
-			xhci->broken_suspend = 1;
-		} else {
-			xhci_warn(xhci, "WARN: xHC save state timeout\n");
-			spin_unlock_irq(&xhci->lock);
-			return -ETIMEDOUT;
+	if (err) {
+		/*
+		 * AMD SNPS xHC 3.0 occasionally does not clear the
+		 * SSS bit of USBSTS and when driver tries to poll
+		 * to see if the xHC clears BIT(8) which never happens
+		 * and driver assumes that controller is not responding
+		 * and times out. To workaround this, its good to check
+		 * if SRE and HCE bits are not set (as per xhci
+		 * Section 5.4.2) and bypass the timeout.
+		 */
+		if (!(xhci->quirks & XHCI_SNPS_BROKEN_SUSPEND)) {
+			xhci_warn(xhci, "Controller Save State failed %d\n", err);
+			goto handshake_error;
+		}
+
+		if (usbsts & (STS_SRE | STS_HCE)) {
+			xhci_warn(xhci, "Controller Save State failed, USBSTS 0x%08x\n", usbsts);
+			goto handshake_error;
 		}
+
+		xhci_dbg(xhci, "SNPS broken suspend, save state unreliable\n");
+		xhci->broken_suspend = 1;
+	} else if (usbsts & STS_SRE) {
+		xhci_warn(xhci, "Suspend Save Error (SRE), USBSTS 0x%08x\n", usbsts);
 	}
 	spin_unlock_irq(&xhci->lock);
 
@@ -1059,7 +1064,11 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 				__func__);
 	}
 
-	return rc;
+	return 0;
+
+handshake_error:
+	spin_unlock_irq(&xhci->lock);
+	return -ETIMEDOUT;
 }
 EXPORT_SYMBOL_GPL(xhci_suspend);
 
-- 
2.43.0



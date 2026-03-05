Return-Path: <linux-usb+bounces-34106-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCYXKZiZqWm7AgEAu9opvQ
	(envelope-from <linux-usb+bounces-34106-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A48213F17
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33BC83187AB8
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E103AA187;
	Thu,  5 Mar 2026 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5/98yH/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A313A961F
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722140; cv=none; b=SoHgYOlTPPwTJydylnLUvaclFGJZmiWDOOEEb0vwKIRpe1wai2TyG6tYIAZLz4V8arSHvbBm+V0XSphPdsnPYSbr+HoMC/40IQPLeT8kolG3P0plHaJMLkBO+NpjkSp8TJXvq3C+QzoXacaKiOgSnNTRtBFv9paPzUM6VIeZhb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722140; c=relaxed/simple;
	bh=c4Sl8WkGofDsD/mkS98QQ+04k8Aioto99ccpohtPyBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gm8gCIppO70/jyQ+Ep+h7QD5lJVkck/bunlrHip/IFWGhs/NqlIhpbJwr0DfdMcOqxKgFyYdTKZEhlI8AlY/nCsfNBnOC9gqISJrEIJNBDTM8cpKQgo+u5Xf0ZCynN0x4uArCOUoVg+6hcAzM+pIk+2/TPNEzdTdZ84pZg3bj+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5/98yH/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722139; x=1804258139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c4Sl8WkGofDsD/mkS98QQ+04k8Aioto99ccpohtPyBY=;
  b=U5/98yH/fGM6PVwrDbyYc6NtrVccM+Xrd01LY9+pHJLab1pW3Z1IluGY
   EDFa0MQwR6QWp+5/KlSD1Lqan+KZwhEwaUJXtwP1VGmF8id/Vhcge5F42
   3++W32xu/RNDs9ZbuTMT6B9DUyfieun+BmF9tbU4WjTUujA360b6IeCPX
   I0gICf3ntzej492V7B7q//MKAmfahgXJ6hdMk4wE/eVI8qpOjAkAzRYRA
   kZEQiuJ1ieEvejDw84GT9VxB8yDHSKLiCQVi/cOSaWsw/dv8O+1UupTQf
   TtgW8wV6xf7LidCfEYrEubNzlqlmsKQvLGqmM0gpd8AmXKW0EAQ/ED7ML
   A==;
X-CSE-ConnectionGUID: +s8p32RBT8iOohq5CptMAA==
X-CSE-MsgGUID: raBc+UMiRDySV9T6k5LuJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77411864"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="77411864"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:48:58 -0800
X-CSE-ConnectionGUID: 8a5WLevwRDK95r1gmlWzLA==
X-CSE-MsgGUID: SX0ulQrwTm6FEnw+jMQ9VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218659795"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2026 06:48:56 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 276739B; Thu, 05 Mar 2026 15:48:56 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Thinh.Nguyen@synopsys.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH 08/12] usb: xhci: improve debug messages during suspend
Date: Thu,  5 Mar 2026 15:48:20 +0100
Message-ID: <20260305144824.3264408-9-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
References: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 34A48213F17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34106-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

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
---
 drivers/usb/host/xhci.c | 65 +++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0c2239b5b805..b22f10cfbe7b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -950,11 +950,11 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
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
@@ -1000,11 +1000,10 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
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
 
@@ -1015,28 +1014,34 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
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
 		}
+
+		if (usbsts & (STS_SRE | STS_HCE)) {
+			xhci_warn(xhci, "Controller Save State failed, USBSTS 0x%08x\n", usbsts);
+			goto handshake_error;
+		}
+
+		xhci_dbg(xhci, "SNPS broken suspend, save state unreliable\n");
+		xhci->broken_suspend = 1;
+	} else if (usbsts & STS_SRE) {
+		xhci_warn(xhci, "Suspend Save Error (SRE), USBSTS 0x%08x\n", usbsts);
 	}
 	spin_unlock_irq(&xhci->lock);
 
@@ -1052,7 +1057,11 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
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
2.50.1



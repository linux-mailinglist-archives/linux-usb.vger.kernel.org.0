Return-Path: <linux-usb+bounces-35558-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNYhLE98xmnwKgUAu9opvQ
	(envelope-from <linux-usb+bounces-35558-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:47:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 879A4344858
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA63531231F2
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D8B242D62;
	Fri, 27 Mar 2026 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bykOYxrN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B085129BDAD
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615282; cv=none; b=YjFraKnsTzo6mhmVZ2RCWn7yteYwiogyV9Z4XDDUPorxS1J4z443MkAj7S8OInMlRZRXWb+aDum+TxJ4khxx0yse7orfTzetgrwQ9sr+d8Zfcc/ljFfWYYuu+TLXKfdaFg+SvS/NJ6M4NFzFmWIzgHgAr7mFagw0sKs38YLYHtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615282; c=relaxed/simple;
	bh=qoM0rXYGD0PuVHQ3I4/ofdhnIO9NFcufI9dUqx2JmJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Abc/OpEGBIrB6+h1c87YYct3euXwfeA1Zu1fcIo75PiVPx/3kH0K2EjHWYrckC+Y9fUUWqdfDvvdLjXjnr3tzSUt3/cutjL777tpZoMm+YUPqL1HRptBQpeZ690+/qYYJyfffMlxOtvknjd2GyD11u36D0pdcpcuQmec4erdjTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bykOYxrN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774615281; x=1806151281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qoM0rXYGD0PuVHQ3I4/ofdhnIO9NFcufI9dUqx2JmJY=;
  b=bykOYxrN2SaajBcs7xvXhOxoWDGTbcem3qRxVDY3Lr3DHScLLhnewFEH
   S5kq3L9mruVxaU0imUPOFLqS0lEy4WJ7nNd4iqulsnfCKQ22l+ALXcpOu
   2N00NVHJsE9q3jYW4PfAAYeQ/6KtbLrNND15BZb8sOFZwIyemDggmDms/
   u1BdOu208aZ5h1O4uDWQdx7U8dOjhc2hq1W7xcYlQLDpOfMal8o/J0CC8
   nCJ7BumMaZ8Ix3PIk1kwxjQyEznZYYXquJNfAIWA6ohoivyqi1DcLYz3g
   aDsoo/Z46W0t+MozBh0q+1NRL0hNMKR14YvdyVp/9cztPqrtU6LHog4Y0
   Q==;
X-CSE-ConnectionGUID: zyWE7LX5TbGAN6v/EvmNZQ==
X-CSE-MsgGUID: 4yYnW5gCS0miBeVGglPQ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87160630"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="87160630"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:41:21 -0700
X-CSE-ConnectionGUID: oqout4H1R1GnXLo7pFi/8A==
X-CSE-MsgGUID: j6COQ4U2Tp2SauRuVsPYhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248347704"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 27 Mar 2026 05:41:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 4E50E9B; Fri, 27 Mar 2026 13:41:18 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 8/9] usb: xhci: improve debug messages during suspend
Date: Fri, 27 Mar 2026 13:34:39 +0100
Message-ID: <20260327123441.806564-9-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35558-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 879A4344858
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 658419eb6827..232e6143ac4b 100644
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
2.50.1



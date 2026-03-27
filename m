Return-Path: <linux-usb+bounces-35551-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J1aIjN7xmmxKwUAu9opvQ
	(envelope-from <linux-usb+bounces-35551-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:42:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E33A934478A
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0254B302B21A
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229CE2C0F78;
	Fri, 27 Mar 2026 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxzWXtBZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4426213C918
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615278; cv=none; b=pT80AELuvjrOfOq0QRKcA5BHBLNAomwMvL9fJR11mAf4oVs0jVVhW1FQUCLbAcwqOVFR62Yd3my0E/ciHMgoWm/oa8nJHlMlxkn3QtmzVbiMavE2CBSeTNiang1mKdxnpxnt1eh4HUwuo3firOkaRUWxow5xbPPjuDJjw3Lu6Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615278; c=relaxed/simple;
	bh=AkqDQbEdsXJINCi/E9JaB25gxpoBhfA4ZaGolwPWlLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rN4RIoQaBD1FO2xSyzb1c2vmnvTCWEtLV3XDba1cQX0n1hrDmQAL66lMGsO/3hOFDKZAGk6juFHoJaIKoUEs3GSfBQjWPteLZ79G3sKsxAiO1W7GQe6n0vbQrkgwFtnIrRx5G1UPovuHKenoN1hrwkx22j54WruuhW/WjO1gcd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxzWXtBZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774615277; x=1806151277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AkqDQbEdsXJINCi/E9JaB25gxpoBhfA4ZaGolwPWlLA=;
  b=nxzWXtBZ5F+vyJSj1JHiXwlvfy0gvlK5qA2fzEP4xQyN9cnltamBfErh
   WXIdoTRsn41vx4Xn6vQcdGSlyfDKTG3XtqZYwo8FgCwTBiUzY20DkWy9/
   V3T3gRo/kercgpZMreXCPZ7Jwrw95bR0rm66dzVHozQTcEXvuEGmKlfyW
   p1npoZ28Ut11axKN1A2e1X7+iiWAukiQMhmMRNFaHDMajcaL/x9yR/rd/
   /E/j1TPHY4Gf7HaBCT37pvrgGBtyvwFMgL6HHVWyPEScscUrO89XvJdGE
   vSQ09XyMJNK5ifMAaAHpCrh5TWXF1p6rNAgJ55HTRXnatRXE6hATwHUqp
   w==;
X-CSE-ConnectionGUID: Rcr1s4IiSyWn6PKb1Ukt8g==
X-CSE-MsgGUID: WZKHnt8gTHW2rmBkkqC6xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79287709"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="79287709"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:41:17 -0700
X-CSE-ConnectionGUID: nYVLGqhNRoi07tTFCtRL8w==
X-CSE-MsgGUID: 2RPpDcjYQnK1miecW1lBOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="230076175"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 05:41:15 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 5523898; Fri, 27 Mar 2026 13:41:14 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH 1/9] usb: xhci: simplify CMRT initialization logic
Date: Fri, 27 Mar 2026 13:34:32 +0100
Message-ID: <20260327123441.806564-2-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com,intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35551-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: E33A934478A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function compliance_mode_recovery_timer_init() is called from
xhci_init() because the Compliance Mode Recovery Timer (CMRT) must be set
up before xhci_run() when the xhci driver is re-initialized.

To handle this case, the boolean flag 'comp_timer_running' was introduced
to track whether xhci_run() had already been called, ensuring that
xhci_resume() would not invoke compliance_mode_recovery_timer_init()
a second time.

This can be simplified by moving the 'done' label in xhci_resume() to
after the compliance_mode_recovery_timer_init() call. With this change,
the timer initialization runs only when the xhci driver has not been
re-initialized, making the 'comp_timer_running' flag unnecessary and
allowing it to be removed.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ef6d8662adec..810905b824d3 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1084,7 +1084,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 	u32			command, temp = 0;
 	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
 	int			retval = 0;
-	bool			comp_timer_running = false;
 	bool			pending_portevent = false;
 	bool			suspended_usb3_devs = false;
 
@@ -1196,7 +1195,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		retval = xhci_init(hcd);
 		if (retval)
 			return retval;
-		comp_timer_running = true;
 
 		xhci_dbg(xhci, "Start the primary HCD\n");
 		retval = xhci_run(hcd);
@@ -1265,16 +1263,16 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 			usb_hcd_resume_root_hub(hcd);
 		}
 	}
-done:
+
 	/*
 	 * If system is subject to the Quirk, Compliance Mode Timer needs to
 	 * be re-initialized Always after a system resume. Ports are subject
 	 * to suffer the Compliance Mode issue again. It doesn't matter if
 	 * ports have entered previously to U0 before system's suspension.
 	 */
-	if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) && !comp_timer_running)
+	if (xhci->quirks & XHCI_COMP_MODE_QUIRK)
 		compliance_mode_recovery_timer_init(xhci);
-
+done:
 	if (xhci->quirks & XHCI_ASMEDIA_MODIFY_FLOWCONTROL)
 		usb_asmedia_modifyflowcontrol(to_pci_dev(hcd->self.controller));
 
-- 
2.50.1



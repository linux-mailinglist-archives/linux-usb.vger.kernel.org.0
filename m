Return-Path: <linux-usb+bounces-34943-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO5PGp9ruWmvEQIAu9opvQ
	(envelope-from <linux-usb+bounces-34943-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:56:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB4A2AC799
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 158AC3037255
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115B73E275B;
	Tue, 17 Mar 2026 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjQMgpu9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA82318B9B
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759372; cv=none; b=QXdexas6RH6CqESvQDC5C/C3kmxMHBt0mvOlizJMwoYV2ya3MWXK6K1FTn+hIY7W73MsrN0MHJCpb3WeXYNJk8xkpK/EK6zlAcCCU/smcPVzRKQbCT6zhYmVd2gFTpW+IdoFRCTgU8TVAUjcQDNr9ycd/SQ5mVJ4nQdhhZjh7vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759372; c=relaxed/simple;
	bh=AkqDQbEdsXJINCi/E9JaB25gxpoBhfA4ZaGolwPWlLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JcdmeTM9YyuRJIEf6GhWHM1TCyCMohTn69AK+mZE5GVOpbGXXxJs9+fX3W5Nnni7BgTiwhr17DC80f90ryS9eP2owoAoeO8Al/f9FrAicvAmmkcrGZXoehKLDNXFCS/po4Xaqn0yhmXxPjwnjlQWII+X40KGO2PV7mdsWPPepAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjQMgpu9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773759371; x=1805295371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AkqDQbEdsXJINCi/E9JaB25gxpoBhfA4ZaGolwPWlLA=;
  b=OjQMgpu9pS8wVoXGvqIHmgSZOnVjGn/gkvUVraj8/VvBTq5tVUQdiysW
   Y+CY4dIyBrM+NP/Fo78bGz4j0NyEDVIRyoDAd3CF1YkR2FkHYpa4PNQ+C
   Y6ek2bvAwDAenPaHw5LzdM8LzgXKklow4KHEWzVX8RJR3r1ZvRYOBOBdc
   TQ4mORoKZARe/KUyU+peRjJ0pKenAJyXH5i9N3l4mT/X++tIj9V5UQhDI
   SMo6ra+V9994JPzhcXsgId13/6Gs/zMKHk53xlVRHUwQtdaaU4FmL3i/a
   ol4VO7PfBMUSKhxTMAgq+hkg1D7Jxg//7WDepKajcStXL5INV3WxjXnU4
   A==;
X-CSE-ConnectionGUID: SOPLYZ3IT6ywwLY0Q2eX6A==
X-CSE-MsgGUID: UhchmMPSQB+W3waPby6zbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85491164"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85491164"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 07:56:11 -0700
X-CSE-ConnectionGUID: YodZbSwtR2S3zx/MYI7viA==
X-CSE-MsgGUID: usKAzxyrS4+BaDgHN4Kfkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="219394904"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 17 Mar 2026 07:56:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 7235199; Tue, 17 Mar 2026 15:56:08 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [RFC PATCH v2 1/9] usb: xhci: simplify CMRT initialization logic
Date: Tue, 17 Mar 2026 15:55:36 +0100
Message-ID: <20260317145544.2076387-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317145544.2076387-1-niklas.neronin@linux.intel.com>
References: <20260317145544.2076387-1-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com,intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34943-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0FB4A2AC799
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



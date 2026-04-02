Return-Path: <linux-usb+bounces-35869-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLarGphvzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35869-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:31:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C017F389C36
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA4EF30EF4B1
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56F82DCBEC;
	Thu,  2 Apr 2026 13:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbgf9+Py"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2542D9ECB
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135838; cv=none; b=ep+V0TWyt/PoOSlI8wqru1k9G8LUCbhIDEQwWQ4KJL3q7s50aeQ2cvpRCT9wmV3JlkhSByBkH6RyCp5SSuTzKnft5DFVwRcZoMGUscCB2KiHwWcnIDcmjGJSmLoVgCthSRSbLMEPYO+jjg51sSOYXV0s2BT+ouCkAdrjSGDhxho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135838; c=relaxed/simple;
	bh=1MdqpstDYGe46B78S2TAgbR0XeWNwFRy34NaUrbjaVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q089hQgvCCi/cbeL1ySbQa4eH6FOZF+vNzRl8q7xxi5f9aQWBTsISEkB30UzEGklG73Ry89giOpHF6uEKJpQ8GJuzUGNE4EsYKW3Il9AQsE1/Cu00L3uAXQAE8OrqBLu3w7jAmRNgp1HfgDO967lrMOE3OawNw8HUnbfAZ61aCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbgf9+Py; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135837; x=1806671837;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1MdqpstDYGe46B78S2TAgbR0XeWNwFRy34NaUrbjaVI=;
  b=nbgf9+Py2rhYm7d4FGVSJZSdOCVygs8dt7tc9oK9aGdLHMnL2RWhEfxv
   qLAEGbwUxPs0Ngwjfcv6gNrksJ1vKRp5ErMmHw9uj2kmOyvf6c2y4Qy8y
   kif5qysUyCQd5Yl+hqQvcU9GBcG1zVWrr0k3vC2VwybqVQQWm9gnH+wEb
   GW1rgd/3xN1OAxKYKDrTUmKOGgVKmwbNsD8avuMvZer+c53LZGmBt/Uno
   Jrn9RgAAl6qiSfB48ydApgLIO/c4AOgj38qisvmJGnKIhRCi60hisGpQI
   Tvtgt52HNGRMgSjks69hQbkM17NmnpvFhnM2T9Y0zjHgEU08mbpsx1Mia
   Q==;
X-CSE-ConnectionGUID: 76FTiRydRPeU9RZHn0r18g==
X-CSE-MsgGUID: U9EWw06MS36q7lahMtkw4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650815"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650815"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:17 -0700
X-CSE-ConnectionGUID: fuvPW9qXTiKf6DEGJ211kA==
X-CSE-MsgGUID: ctbTVmDKT6mI0dW1RXqdMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241494"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:16 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/25] usb: xhci: simplify CMRT initialization logic
Date: Thu,  2 Apr 2026 16:13:21 +0300
Message-ID: <20260402131342.2628648-5-mathias.nyman@linux.intel.com>
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35869-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: C017F389C36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index eb6927779b1e..8e0b6a673868 100644
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
2.43.0



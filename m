Return-Path: <linux-usb+bounces-34099-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC4ZO6mZqWm7AgEAu9opvQ
	(envelope-from <linux-usb+bounces-34099-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92B213F4C
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4A20311671B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A666331207;
	Thu,  5 Mar 2026 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHW6fDxz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803893A874C
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722137; cv=none; b=qgdQ1BivoxuxsSETphx7taX/lgyIP/K+fFvL3ZBWblz9tgFao1uifCPDA3g1Y8gv3xNlC8FUIcT8vcvW9KrAl82uEsUEgZP96ARciH6ZwZyWmPSK+X/SabfSjNexqA/LctKDHeUK2GD/lWAsybrRnytrYtPhpvdl+44qYl1kMMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722137; c=relaxed/simple;
	bh=y4ycorD+AYKter9oiiSrIhYrzTu0JS6a9e4vrBzyhDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dmp0Uu6AMUqII9nawzaQzCih8VBw3m6tW0hLHrAXwTfNmnFb6Rm8EjiKRE3a+h603UFH4Otu4+td525UDC/7iDeQIDyXNnLZA8lOWlvzo9p3MjD2zStRBXqQvwGvCmooDv2BJZSnPLd+hKPiLTlztCzDKtxH0E3qcOarAXFh2WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHW6fDxz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722137; x=1804258137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y4ycorD+AYKter9oiiSrIhYrzTu0JS6a9e4vrBzyhDM=;
  b=SHW6fDxzKluL6LbJfDxoAGWQhQX4CgI8DzCiYeBAgvJIvtfK/WFNUW0j
   E0RKN+IhvotTnNmPh9b/FGHl8JfUQqgQ76EFdXwg3cFrcImKYRS+FU8/z
   fh65IMInagm9EmHlfoBo2TqRbg8wXNASQahHBSFY/TucdT6T6TnNGbjzw
   vgXB45M2yyD+wkFrUCwQZa0JBI5vVXPaa+z4MDfZrh5wnr7Cto+6MuIUQ
   e1/sYVwr/ToCBBXGHg09J+6Uzs9/l+IRMYe+le0wwAgmY8sJsPxrMDz7w
   xob67d1g2cS76VYTYqoEV00tHlEt+WzzftQNjCuyFYeyayx1NuZ+sBJIL
   Q==;
X-CSE-ConnectionGUID: dVRaWG+hQAaq4B08x1OaBw==
X-CSE-MsgGUID: 1SFnviw9QDWD8K+uSjM0jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77411843"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="77411843"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:48:53 -0800
X-CSE-ConnectionGUID: LX81jI8SRKyj+mHlSHLGZg==
X-CSE-MsgGUID: za4P9YEyT3mX5V1yMikNNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218659787"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2026 06:48:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 5E84D98; Thu, 05 Mar 2026 15:48:50 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Thinh.Nguyen@synopsys.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [RFC PATCH 01/12] usb: xhci: simplify CMRT initialization logic
Date: Thu,  5 Mar 2026 15:48:13 +0100
Message-ID: <20260305144824.3264408-2-niklas.neronin@linux.intel.com>
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
X-Rspamd-Queue-Id: 5D92B213F4C
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
	TAGGED_FROM(0.00)[bounces-34099-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

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
index b3ba16b9718c..fa3627dbe9a3 100644
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



Return-Path: <linux-usb+bounces-30562-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63041C63E25
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 12:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 0465C2450D
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 11:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578F7329E7B;
	Mon, 17 Nov 2025 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPT6vnRz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381C326D5F
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379820; cv=none; b=ci2Dap6uzhmGm1nJfdpQdINfH5yAEpuUWdPVxl0c4C97IPLUrR19op+BnzvDnkq1fY7m/NFlvf3iA/B+U6cqrwK+VyHcJCK5iIVhYLb7B0OrtHQzyo6rkyF84eBD2Up+A+q6Mp+/D9eOZs9IuNh7nJ0BuKNuOt3f5nSL7mmq6Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379820; c=relaxed/simple;
	bh=5j628EGBQZaiq/m4BbrgwNNN3QRfxhrMARMyeBQNGvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+YFDfAtKukY4lP/VRkUAqJBjALxQdlPQ8zyfTjvWAqlYGHjobAyxIYKqBfEqE+6EkGjIK0SdciJOnwle7LBcdXezpaoEJTmLpc+nlemIPM3VzqsQoivTFiGtb0xJfTOSQTh846xrSLqvH/A1zNoxB8ppOyUhSwjpjEpDqiKEEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPT6vnRz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763379819; x=1794915819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5j628EGBQZaiq/m4BbrgwNNN3QRfxhrMARMyeBQNGvM=;
  b=NPT6vnRzbLvcYbYLdgpHR4CklIF+dQLvRqYlE537igiG5mB5fPLK06LC
   hJs/ED1e+7XZLozuIwRMvYe/fG/TqvBVh3v5FxugfMDMs6sm3MsNc1mNj
   JT/4/4GHqzspA35nppTyMNwPpcCpiDI6UD3sQ8gruGxmWqzdop7+7gWuP
   REMnamxrs6VV3Vv5miStt2pQuIRma//lpov0J3QcCdRrHYtF4IrDHb1KH
   yqdn5ZX6mC2ct3k7JXKICVZu4g3P59t5Iw2+qZi8jp0sMdpn/AfeQi462
   NhVbzuhT5AeM5pCG0jlrPIlhqiG84NejAzi+va7ZzW6llhs2Abzp6Kjd6
   w==;
X-CSE-ConnectionGUID: tSAUQALZRjqEolUgt23PoA==
X-CSE-MsgGUID: /GMj202oS+iCXV98FH22sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="76726923"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="76726923"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:43:38 -0800
X-CSE-ConnectionGUID: daChGJMHS0m+a087TOIdMg==
X-CSE-MsgGUID: cJ5/4KheRsqnwEeoc5bZMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="189729280"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2025 03:43:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 7A03E98; Mon, 17 Nov 2025 12:43:36 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH 3/9] usb: xhci: simplify CMRT initialization logic
Date: Mon, 17 Nov 2025 12:42:35 +0100
Message-ID: <20251117114242.3507856-4-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
References: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/usb/host/xhci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 2f64268cee5e..281b17760416 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1077,7 +1077,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 	u32			command, temp = 0;
 	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
 	int			retval = 0;
-	bool			comp_timer_running = false;
 	bool			pending_portevent = false;
 	bool			suspended_usb3_devs = false;
 
@@ -1193,7 +1192,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		retval = xhci_init(hcd);
 		if (retval)
 			return retval;
-		comp_timer_running = true;
 
 		xhci_dbg(xhci, "Start the primary HCD\n");
 		retval = xhci_run(hcd);
@@ -1262,16 +1260,16 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
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



Return-Path: <linux-usb+bounces-34103-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEBqA66ZqWm7AgEAu9opvQ
	(envelope-from <linux-usb+bounces-34103-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A8213F53
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 624F2314BB77
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7953A9639;
	Thu,  5 Mar 2026 14:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUbzMqqo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62913A7F50
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722139; cv=none; b=M19+XfWeTOWtIL7S8Cc8YGcEkpZyf2tmruXVxH5nlU0yPBmnq5SUhaASgeUDR7IuiGFDLanWPUGLakyBbNZr/4WD+/5WKOaciJdXSeyk/WykWE2eqQFuCo/8MLhMbFmNtm23guewexOaWj4pdUhjbroj0uqkmk8xvxf9h+p/GHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722139; c=relaxed/simple;
	bh=oNvzEsppsPXk6ycyW/DVSc2tqEt3jRqIg/OYCqQbKUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dESbqnCx6M/PlM+Ei6gq7G3EGYopBSB4H5nHO2kSotKTzY6vDJIdywvnFo5vBvWfX3Jm8zn/jHA3fUAq7gxdYyT4JqLQqe7bywxXirHEkhcSSxcRAI3UDdDPQPhzIJ3hSG8lKeka4cTFnSvTG5cYrGnmvp3LO/PryRizQy7dHc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUbzMqqo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722138; x=1804258138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oNvzEsppsPXk6ycyW/DVSc2tqEt3jRqIg/OYCqQbKUI=;
  b=mUbzMqqoVbz4SHx81ONsj+YP473jy6pzhHIZ1Hsx8IyBTWjJFRz8qcCI
   AwKcpBe1b6ZoDT3rkkqWXU1ZUkVLX/nftpeKg/be+izvATMiElWq4HeO2
   rdjdmOWrYOfjEMTDippwWaASU0WdXEb3TAYvPa17i4cVKgtqBSMiWMGM1
   eDrFJdQUWpe9y8YEB2So32uG14pFuXVizAGUN8ukyYArhUDDkXnJICEV9
   s8yJrNZMZBqdP6bNAht8qMV/f2vWyD9ryjkImSdLTspQ2Dn0IXZyR8QB7
   GgSh5CU492WYa2xvciy2R9ih5UOovBQbqlbcJHlys25HbvvYqGdhUuV8M
   Q==;
X-CSE-ConnectionGUID: on0wyKpsSBy6nHXxHlpP0A==
X-CSE-MsgGUID: v7IBJHmTSAKp5XMGeVpNvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77411848"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="77411848"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:48:54 -0800
X-CSE-ConnectionGUID: h5v27OQISc+Tv+hjTAvhpA==
X-CSE-MsgGUID: qGPNlAJeSbqq83v/Cejq0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218659790"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2026 06:48:52 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 50F0C99; Thu, 05 Mar 2026 15:48:51 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Thinh.Nguyen@synopsys.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [RFC PATCH 02/12] usb: xhci: relocate Restore/Controller error check
Date: Thu,  5 Mar 2026 15:48:14 +0100
Message-ID: <20260305144824.3264408-3-niklas.neronin@linux.intel.com>
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
X-Rspamd-Queue-Id: 617A8213F53
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34103-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

A Restore Error or Host Controller Error indicates that the host controller
failed to resume after suspend. In such cases, the xhci driver is fully
re-initialized, similar to a post-hibernation scenario.

The existing error check is only relevant when 'power_lost' is false.
If 'power_lost' is true, a Restore or Controller error has no effect:
no warning is printed and the 'power_lost' state remains unchanged.

Move the entire error check into the if '!power_lost' condition
to make this dependency explicit and simplify the resume logic.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index fa3627dbe9a3..a288f59c604c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1140,16 +1140,13 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 			spin_unlock_irq(&xhci->lock);
 			return -ETIMEDOUT;
 		}
-	}
 
-	temp = readl(&xhci->op_regs->status);
-
-	/* re-initialize the HC on Restore Error, or Host Controller Error */
-	if ((temp & (STS_SRE | STS_HCE)) &&
-	    !(xhci->xhc_state & XHCI_STATE_REMOVING)) {
-		if (!power_lost)
+		/* re-initialize the HC on Restore Error, or Host Controller Error */
+		temp = readl(&xhci->op_regs->status);
+		if ((temp & (STS_SRE | STS_HCE)) && !(xhci->xhc_state & XHCI_STATE_REMOVING)) {
 			xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
-		power_lost = true;
+			power_lost = true;
+		}
 	}
 
 	if (power_lost) {
-- 
2.50.1



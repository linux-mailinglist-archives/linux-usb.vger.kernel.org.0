Return-Path: <linux-usb+bounces-35870-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHT0HnFszmmpngYAu9opvQ
	(envelope-from <linux-usb+bounces-35870-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:17:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 749E438985B
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17EC1302FF89
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40292DEA7B;
	Thu,  2 Apr 2026 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nd9fGLkY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E2B2DE6F1
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135840; cv=none; b=jYdy777i31x32SGyDpadjyX0pDTtRwXuoWvRfhMcvJP0V6a06yo5sXh/uhpuFH731EANpTjjxWlCVwbW6PTWkMtIerQidVsYDQLrEkmD4LLG3+cqFPkkbQF1BOPR2NuBa9kHjCbX4cxX/E1D0Lzu0eFbi+FkUiD1876sUMTS7+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135840; c=relaxed/simple;
	bh=GyG5XIwwS1LUoZDBURYE9oakDPhrT0t9I7bJJRvJg9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwptQR73wzHq992sw418A7rXF41KOPzI2Kv8E2mPv4llouHt4fkN/pCUAh+RAHwrqy9LXsSZEIHUVqrNm5W4rsx0mns3eOrf1l/TC95MTCQdgc7cYHmH3nZcPdxdLF4z3OrN5bVZEy9f+Nr9XtM7YYdmgHe4aZNhXzRbKWmWNoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nd9fGLkY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135839; x=1806671839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GyG5XIwwS1LUoZDBURYE9oakDPhrT0t9I7bJJRvJg9Y=;
  b=nd9fGLkYxfaaqDiBzCRdT3pr8EX4VdHzxKfyZw69MAhtzsvk1xXgsdea
   VoogRyQd+VxfelxHVSEVQKHO0PZRkKjFcc0PDHT2dHqNLVhUEyzoSBcwJ
   0fcpBfGoROm5czF8Lf2chcK7iybMmeIBQhvobCuk6PQukakFhQNYArrbV
   0xV2KIJgmI/N1Vdfl0IJiBQbE3IBRlZoBjMHmYa7xAtQ/vCooxNRsgaKJ
   TadBtUDGl3/l6R87uapncqhl4JpMfJjCFa51+fsT6BzWEUHOMtx0N6bjL
   wnWxFt0QzaQ8aQAmyVIg8wMCG8R032XTZoDmOnExhJkgFyTzNP54im+SN
   Q==;
X-CSE-ConnectionGUID: e05sSJf1TrC7R97q2hXmmA==
X-CSE-MsgGUID: E2T5liroRDae7BLYLreQoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650822"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650822"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:19 -0700
X-CSE-ConnectionGUID: ZQpBxslxSiG3lVtVo01HuQ==
X-CSE-MsgGUID: DBywN/SKQ/OetkkITpblcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241503"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:18 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/25] usb: xhci: relocate Restore/Controller error check
Date: Thu,  2 Apr 2026 16:13:22 +0300
Message-ID: <20260402131342.2628648-6-mathias.nyman@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35870-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 749E438985B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 8e0b6a673868..fdd3a19b7c9c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1140,16 +1140,13 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 			spin_unlock_irq(&xhci->lock);
 			return -ETIMEDOUT;
 		}
-	}
-
-	temp = readl(&xhci->op_regs->status);
 
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
2.43.0



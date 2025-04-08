Return-Path: <linux-usb+bounces-22741-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2967A803C3
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 14:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 626BE7A8999
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 12:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F949264FB0;
	Tue,  8 Apr 2025 11:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDTDcqOG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424CC267F67
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 11:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113587; cv=none; b=Wn+eHJNSyZG4D+LLtYJbPbW/UNCCuLOlJwg0589q4du+bLZPNJsZJOLvDH40ffHnRFmwB5KB0EKm1b3MMLRw0lT7OC5DFfAmVQZ+p7qFtR2NB27Md/zcfZ/mZH8HKZJQUwp8ACiKR+N+EW+78oQiJqD8G7hbMAVAAPUOuz9wS+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113587; c=relaxed/simple;
	bh=lUN3tSnDDA0VVndcko/E0ki/sm2/4RMztD5pnZ/Chs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0ihTlWSFHdPJTcuu1oW8vBZmKy3yHT8YPQ/52E0B3wYGm/0XCWA+uGZ+fI0M0nFBx5swYEb3+Dn+1tsYH26m/Pi2da+1u90y5Q3i+XNBcAO5AdyVkaqbt+TSnG3TXnOMN6gAsH0iVhrauxPef1r6n1Q+T/sfv+7G1cBd7K0dig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDTDcqOG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744113586; x=1775649586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lUN3tSnDDA0VVndcko/E0ki/sm2/4RMztD5pnZ/Chs0=;
  b=XDTDcqOGywGhWaQJLxiFesIPkPOCr6js7kB5G7V3QeB501whE2/f4EY3
   MpLYnMGXf8pKbGLfIEz8Im06t56exoV4f9jVwMuximzlqsf+bLJQbHXwY
   HszJXBDSMY15Ageefd8EbT+VHx1s4wXzXqfCSBNvc4DS1q1oNKCaCNZZs
   e5HNYKOAMpfZRlDPe4bzJ9P3LXiFzgxOyhTIFhO7jmRJGagWVeT8BAhqW
   YAc7rEhiLn0LbrFkRNfOdheXFZVpIY58bZeTo2ftFU8DntKUgziHyLGeO
   Cvxs3YqnXLh8Is/peZAJF/rhUGdq7+k+6ouuS5K0DvOQLRnAHhkAm9DlP
   g==;
X-CSE-ConnectionGUID: 5PwysLYxRzCO9RVTwmk+PA==
X-CSE-MsgGUID: tAIMCHrgQy6IA7GFqoJxzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45676457"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45676457"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:59:45 -0700
X-CSE-ConnectionGUID: nqNyP6p6SSq4/GGxiZyYyA==
X-CSE-MsgGUID: Bj1m2zgPQKGiAuAeD8lQpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="151428036"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 04:59:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 0CC87398; Tue, 08 Apr 2025 14:59:42 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/9] usb: xhci: set requested IMODI to the closest supported value
Date: Tue,  8 Apr 2025 14:57:44 +0300
Message-ID: <20250408115752.1344901-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
References: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function configures the Interrupt Moderation Interval (IMODI) via bits
15:0 in the Interrupt Moderation Register. The IMODI value is specified in
increments of 250 nanoseconds. For instance, an IMODI register value of 16
corresponds to 4000 nanoseconds, resulting in an interrupt every ~1ms.

Currently, the function fails when a requested IMODI value is too large,
only logging a warning message for secondary interrupters. Prevent this by
automatically adjusting the IMODI value to the nearest supported value.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 5 +----
 drivers/usb/host/xhci.c     | 7 +++++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d698095fc88d..ebbf5f039902 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2359,10 +2359,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 		return NULL;
 	}
 
-	err = xhci_set_interrupter_moderation(ir, imod_interval);
-	if (err)
-		xhci_warn(xhci, "Failed to set interrupter %d moderation to %uns\n",
-			  i, imod_interval);
+	xhci_set_interrupter_moderation(ir, imod_interval);
 
 	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
 		 i, xhci->max_interrupters);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0452b8d65832..7a8c545b78b7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -354,12 +354,15 @@ int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
 {
 	u32 imod;
 
-	if (!ir || !ir->ir_set || imod_interval > U16_MAX * 250)
+	if (!ir || !ir->ir_set)
 		return -EINVAL;
 
+	/* IMODI value in IMOD register is in 250ns increments */
+	imod_interval = umin(imod_interval / 250, ER_IRQ_INTERVAL_MASK);
+
 	imod = readl(&ir->ir_set->irq_control);
 	imod &= ~ER_IRQ_INTERVAL_MASK;
-	imod |= (imod_interval / 250) & ER_IRQ_INTERVAL_MASK;
+	imod |= imod_interval;
 	writel(imod, &ir->ir_set->irq_control);
 
 	return 0;
-- 
2.47.2



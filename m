Return-Path: <linux-usb+bounces-30565-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BBFC63E88
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 12:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9A494355B68
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 11:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414DE32AABA;
	Mon, 17 Nov 2025 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2p3sQzV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D287932A3F5
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379823; cv=none; b=drOXp2b8MLMyDfn9CyJrj+saLoEVKTSNbep2+Up8Ut4QgKUsOjjP7qyzOqrjvo5udU+PRnf9TDHVeDEhcKdIoo3j5G/1tan2gzeEntFRVD2lKkIOEKjppJMp03KobTMHulD++pcNxXdvKnMv1AG4tWBcuFSSPJVgy6WUQwbtJ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379823; c=relaxed/simple;
	bh=d8B59xocvi6w04N/e7djCCQF9psRBdBbcpmGr2tMQtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIeXE7jTQP7cgVafY1uxUCpMgGntiBuwe65dwP/FDZkHw48dqzaJENa97xZfYb7Zy4PWJsmgmM+7YhzdNWfIXnwIcVkBenV0ZLqjrK7WDSCrqvZYnjoqSDIkOupbWB6i6OpYU12GVFUyjcNvwEVDlgHYCOqjjkkn+4Up3WzpxOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2p3sQzV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763379821; x=1794915821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d8B59xocvi6w04N/e7djCCQF9psRBdBbcpmGr2tMQtw=;
  b=M2p3sQzVWd53piDaIVOHm1/4VVQbIk7+LlIMFQR3eHXvOQ2QO05+Z2KT
   wa11C3ku6872a9HpJOgDCdnfGUUXgYTJ1+0Tk3vygT4JevLLKt/1lVqn4
   hSA2ki8tbtHg0QEqbl3qHgEcs3XI6XtrUwS2fTF2s0hiBlGEuTISw8h+h
   hIsafu5Zb7gzGtM7RZ+5qXPcgbKbpnRR1c2iGc+pPgo6kuE2pk5R9Tpg6
   UK0+1UhS+e5oi7tO0MFhmsVzsRsy1/sNsWm6iSvITlO9bS/UM8CFBcZn3
   iA5wIzrF8gD8DG4h1Akt6D9pbYJ3g15DzIxJigd3LWflgu9NkWqMR7Y2Z
   w==;
X-CSE-ConnectionGUID: X9Xdi1e2TQ+A3Wvo1iEyqQ==
X-CSE-MsgGUID: p79nqOLqTTmfXEqlB95UQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="76726931"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="76726931"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:43:40 -0800
X-CSE-ConnectionGUID: 1DvY75nuTuqzHZcdf0Wg7Q==
X-CSE-MsgGUID: zpaNsGQ2QkKlcah21+sHag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="189729287"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2025 03:43:39 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 5551F96; Mon, 17 Nov 2025 12:43:38 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH 5/9] usb: xhci: relocate Restore/Controller error check
Date: Mon, 17 Nov 2025 12:42:37 +0100
Message-ID: <20251117114242.3507856-6-niklas.neronin@linux.intel.com>
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

A Restore Error or Host Controller Error indicates that the host controller
failed to resume after suspend. In such cases, the xhci driver is fully
re-initialized, similar to a post-hibernation scenario.

The existing error check is only relevant when 'power_lost' is false.
If 'power_lost' is true, a Restore or Controller error has no effect:
no warning is printed and the 'power_lost' state remains unchanged.

Move the entire error check into the if '!power_lost' condition
to make this dependency explicit and simplify the resume logic.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/usb/host/xhci.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e36a1be265c5..e8856f6bafc6 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1133,16 +1133,13 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
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



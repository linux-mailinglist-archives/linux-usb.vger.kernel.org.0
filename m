Return-Path: <linux-usb+bounces-1913-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE03E7CF54E
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C27F0B21333
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5C21F93E;
	Thu, 19 Oct 2023 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8+AlHX8"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A91D1945E
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1183F119
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711315; x=1729247315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Aep8QaGw3/uQwqSAyeemvA+g34C5jgJ4Evo/ImrnXm8=;
  b=V8+AlHX8hucvymTIciNCRkORRF0F+TahQJkSDt1veawZeWm/ujPm9jfJ
   Nt/9rxWqvHd/88H3hT4qqsMAYKnvrmdBjbB3y0pC3NiO8lRA5/pMMkTw5
   248z2q3A/DPf7ruXlB2h/fGY/XXQbPGwQOOFVdYHJ7/nUfodIj7n6a2nA
   7Q9Kox/OfpJX7brqsqb2Ys/wlIj74o+bdm5SX97twPeDs4YSVlj0x2hWA
   riZQLZoovaeEnvhzup6h/6CUrwtEBFXXNTx59o/4ROh8v/XtNVWckzebv
   v6/uZaBnj+NJ9k5Nfr8OdiMAYRC5pNJVMwJH28RV+9Hn8LTnZMNSL6MO0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075972"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075972"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557918"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557918"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:32 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 18/19] usb: host: xhci-plat: fix possible kernel oops while resuming
Date: Thu, 19 Oct 2023 13:29:23 +0300
Message-Id: <20231019102924.2797346-19-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
References: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sergey Shtylyov <s.shtylyov@omp.ru>

If this driver enables the xHC clocks while resuming from sleep, it calls
clk_prepare_enable() without checking for errors and blithely goes on to
read/write the xHC's registers -- which, with the xHC not being clocked,
at least on ARM32 usually causes an imprecise external abort exceptions
which cause kernel oops.  Currently, the chips for which the driver does
the clock dance on suspend/resume seem to be the Broadcom STB SoCs, based
on ARM32 CPUs, as it seems...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: 8bd954c56197 ("usb: host: xhci-plat: suspend and resume clocks")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-plat.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 28218c8f1837..b93161374293 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -458,23 +458,38 @@ static int __maybe_unused xhci_plat_resume(struct device *dev)
 	int ret;
 
 	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
-		clk_prepare_enable(xhci->clk);
-		clk_prepare_enable(xhci->reg_clk);
+		ret = clk_prepare_enable(xhci->clk);
+		if (ret)
+			return ret;
+
+		ret = clk_prepare_enable(xhci->reg_clk);
+		if (ret) {
+			clk_disable_unprepare(xhci->clk);
+			return ret;
+		}
 	}
 
 	ret = xhci_priv_resume_quirk(hcd);
 	if (ret)
-		return ret;
+		goto disable_clks;
 
 	ret = xhci_resume(xhci, PMSG_RESUME);
 	if (ret)
-		return ret;
+		goto disable_clks;
 
 	pm_runtime_disable(dev);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
 	return 0;
+
+disable_clks:
+	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
+		clk_disable_unprepare(xhci->clk);
+		clk_disable_unprepare(xhci->reg_clk);
+	}
+
+	return ret;
 }
 
 static int __maybe_unused xhci_plat_runtime_suspend(struct device *dev)
-- 
2.25.1



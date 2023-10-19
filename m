Return-Path: <linux-usb+bounces-1912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E43A47CF54B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21AB61C208E1
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8982D18B0E;
	Thu, 19 Oct 2023 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/v9kM/+"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B9E19442
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9629A123
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711313; x=1729247313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O+eqjy77xqWBF6M40iaI33OYHsn0w0OwSPLiSiVAKjE=;
  b=X/v9kM/+KG1t+XeJEUa2Lx9RqFG06YUoxm3nxY+CCnkSk2lf2HaaSorl
   sAYM17KS2mMMZyUXsJP7YwG5gbG3g/Ages9Q6vesskQh7mLHkC4/9GWY4
   g/mambhRthGtiG0dQsH7mt1QX1Iusqwtqk3y8oK9j43zmGrXg8vPMjkTf
   PyUf1LGXwvzdHsyek8JIsphEozVR6RBS2AriWCU7zdnNoc/pVwejUw76l
   nE182qtKQ2hWpD6mgml501hVhlnzVTHgi6e302Xzkrfh1sNIHx12oNfDH
   lKw/XtHZATdjnQMbAuCEC1bgFd8CN5DP+2Sr1bn1ziDD4gaYaRYO7dyNX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075958"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075958"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557889"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557889"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:30 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 17/19] usb: xhci: Implement xhci_handshake_check_state() helper
Date: Thu, 19 Oct 2023 13:29:22 +0300
Message-Id: <20231019102924.2797346-18-mathias.nyman@linux.intel.com>
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

From: Udipto Goswami <quic_ugoswami@quicinc.com>

In some situations where xhci removal happens parallel to xhci_handshake,
we encounter a scenario where the xhci_handshake can't succeed, and it
polls until timeout.

If xhci_handshake runs until timeout it can on some platforms result in
a long wait which might lead to a watchdog timeout.

Add a helper that checks xhci status during the handshake, and exits if
set state is entered. Use this helper in places where xhci_handshake is
called unlocked and has a long timeout. For example  xhci command timeout
and xhci reset.

[commit message and code comment rewording -Mathias]

Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c |  5 +++--
 drivers/usb/host/xhci.c      | 26 +++++++++++++++++++++++++-
 drivers/usb/host/xhci.h      |  2 ++
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 73057f01e4aa..f3b5e6345858 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -450,8 +450,9 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
 	 * and try to recover a -ETIMEDOUT with a host controller reset.
 	 */
-	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
-			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
+	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->cmd_ring,
+			CMD_RING_RUNNING, 0, 5 * 1000 * 1000,
+			XHCI_STATE_REMOVING);
 	if (ret < 0) {
 		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
 		xhci_halt(xhci);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 68920cb96044..119cbe2a3d65 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -81,6 +81,29 @@ int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
 	return ret;
 }
 
+/*
+ * xhci_handshake_check_state - same as xhci_handshake but takes an additional
+ * exit_state parameter, and bails out with an error immediately when xhc_state
+ * has exit_state flag set.
+ */
+int xhci_handshake_check_state(struct xhci_hcd *xhci, void __iomem *ptr,
+		u32 mask, u32 done, int usec, unsigned int exit_state)
+{
+	u32	result;
+	int	ret;
+
+	ret = readl_poll_timeout_atomic(ptr, result,
+				(result & mask) == done ||
+				result == U32_MAX ||
+				xhci->xhc_state & exit_state,
+				1, usec);
+
+	if (result == U32_MAX || xhci->xhc_state & exit_state)
+		return -ENODEV;
+
+	return ret;
+}
+
 /*
  * Disable interrupts and begin the xHCI halting process.
  */
@@ -201,7 +224,8 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
 	if (xhci->quirks & XHCI_INTEL_HOST)
 		udelay(1000);
 
-	ret = xhci_handshake(&xhci->op_regs->command, CMD_RESET, 0, timeout_us);
+	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->command,
+				CMD_RESET, 0, timeout_us, XHCI_STATE_REMOVING);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 813d55468c00..5768ce804caa 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2084,6 +2084,8 @@ void xhci_free_container_ctx(struct xhci_hcd *xhci,
 /* xHCI host controller glue */
 typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
 int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us);
+int xhci_handshake_check_state(struct xhci_hcd *xhci, void __iomem *ptr,
+		u32 mask, u32 done, int usec, unsigned int exit_state);
 void xhci_quiesce(struct xhci_hcd *xhci);
 int xhci_halt(struct xhci_hcd *xhci);
 int xhci_start(struct xhci_hcd *xhci);
-- 
2.25.1



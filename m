Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29DF626FDF9
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 15:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgIRNOi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 09:14:38 -0400
Received: from mga09.intel.com ([134.134.136.24]:46076 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgIRNOi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Sep 2020 09:14:38 -0400
IronPort-SDR: ig+Q+s7FMlUoM8tFd7nFIPylDOfMsJNodKHulCbvZjU5BHwE0k/XVYLdFiIKUaOZdxcBCLbzCa
 tCKCJjJsUydA==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="160849967"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="160849967"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 06:14:37 -0700
IronPort-SDR: GMcRzRAIM2sYi2zRKE03961rS1iG5Zr1EIY0ocwh6oTNzxUPx6AJKomanMjNPavc8Io0Br9qIa
 AQ2+pBETEe/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="508871204"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2020 06:14:35 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/10] usb: xhci: omit duplicate actions when suspending a runtime suspended host.
Date:   Fri, 18 Sep 2020 16:17:49 +0300
Message-Id: <20200918131752.16488-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
References: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

If the xhci-plat.c is the platform driver, after the runtime pm is
enabled, the xhci_suspend is called if nothing is connected on
the port. When the system goes to suspend, it will call xhci_suspend again
if USB wakeup is enabled.

Since the runtime suspend wakeup setting is not always the same as
system suspend wakeup setting, eg, at runtime suspend we always need
wakeup if the controller is in low power mode; but at system suspend,
we may not need wakeup. So, we move the judgement after changing
wakeup setting.

[commit message rewording -Mathias]
Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index f4cedcaee14b..4cfb95104c26 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -982,12 +982,15 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 			xhci->shared_hcd->state != HC_STATE_SUSPENDED)
 		return -EINVAL;
 
-	xhci_dbc_suspend(xhci);
-
 	/* Clear root port wake on bits if wakeup not allowed. */
 	if (!do_wakeup)
 		xhci_disable_port_wake_on_bits(xhci);
 
+	if (!HCD_HW_ACCESSIBLE(hcd))
+		return 0;
+
+	xhci_dbc_suspend(xhci);
+
 	/* Don't poll the roothubs on bus suspend. */
 	xhci_dbg(xhci, "%s: stopping port polling.\n", __func__);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
-- 
2.17.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28EEC523FE4
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 00:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348516AbiEKWDx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 18:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348462AbiEKWDx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 18:03:53 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDC015FEC
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 15:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652306631; x=1683842631;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BNOKr12a4X5iFq9Wvh5DvfE5Fh+2crYS7tM+WzTOlOk=;
  b=XiAO7fPVnn6EKWvM+we7RWXxyjRiezEzF8osFrYpLajf9Mh3JFtLIudu
   Q3XsWwtI3dcKCmHjGRcejJEXo0iWUUHpnY1d0ak4IhFZatDsF8+3nrnvb
   lITgYt6XMIhMpANIcNgqGtpB12IdP88gANHNP6UU21kulbDRzaWXWTZm2
   CJXXXQvyBHpZ0aV+mgKCNOzVDr6QctlcmaE6fgPLWEcIYyOc7fv1gl+xQ
   jU7lI3dQ15JHr7ebpsdURsNo+syJe2FhSRk36wYunXWwXNJaGtpI29fMt
   SykR3tVWo/ABg8Fd6hZMDfLdDaEQTZuu0QGJ7t81KwggqLpEKbwlQa4Pc
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="330427465"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="330427465"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 15:03:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="542496257"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2022 15:03:50 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 8/9] xhci: Remove quirk for over 10 year old evaluation hardware
Date:   Thu, 12 May 2022 01:04:49 +0300
Message-Id: <20220511220450.85367-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511220450.85367-1-mathias.nyman@linux.intel.com>
References: <20220511220450.85367-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The XHCI_RESET_EP_QUIRK was added in 2009 to support prototype xHC
hardware from Fresco Logic that needed an additional configure endpoint
command after a reset endpoint.

That hardware should not have made it to the market.
Now, 13 years later its about time we get rid of it.

quirk was added in commit ac9d8fe7c6a8 ("USB: xhci: Add quirk for Fresco
Logic xHCI hardware.")

Print a debug message about the removed quirk if against all odds we run
into this controller.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c  |  3 +--
 drivers/usb/host/xhci-ring.c | 37 +++++-------------------------------
 drivers/usb/host/xhci.h      |  2 +-
 3 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index d7e0e6ebf080..49ba94de7459 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -129,8 +129,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 				pdev->revision == 0x0) {
 			xhci->quirks |= XHCI_RESET_EP_QUIRK;
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
-				"QUIRK: Fresco Logic xHC needs configure"
-				" endpoint cmd after reset endpoint");
+				"XHCI_RESET_EP_QUIRK for this evaluation HW is deprecated");
 		}
 		if (pdev->device == PCI_DEVICE_ID_FRESCO_LOGIC_PDK &&
 				pdev->revision == 0x4) {
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 373e0e152854..46d0b9ad6f74 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1426,8 +1426,6 @@ static void xhci_handle_cmd_reset_ep(struct xhci_hcd *xhci, int slot_id,
 	/* Cleanup cancelled TDs as ep is stopped. May queue a Set TR Deq cmd */
 	xhci_invalidate_cancelled_tds(ep);
 
-	if (xhci->quirks & XHCI_RESET_EP_QUIRK)
-		xhci_dbg(xhci, "Note: Removed workaround to queue config ep for this hw");
 	/* Clear our internal halted state */
 	ep->ep_state &= ~EP_HALTED;
 
@@ -1471,17 +1469,13 @@ static void xhci_handle_cmd_config_ep(struct xhci_hcd *xhci, int slot_id,
 	struct xhci_input_control_ctx *ctrl_ctx;
 	struct xhci_ep_ctx *ep_ctx;
 	unsigned int ep_index;
-	unsigned int ep_state;
-	u32 add_flags, drop_flags;
+	u32 add_flags;
 
 	/*
-	 * Configure endpoint commands can come from the USB core
-	 * configuration or alt setting changes, or because the HW
-	 * needed an extra configure endpoint command after a reset
-	 * endpoint command or streams were being configured.
-	 * If the command was for a halted endpoint, the xHCI driver
-	 * is not waiting on the configure endpoint command.
+	 * Configure endpoint commands can come from the USB core configuration
+	 * or alt setting changes, or when streams were being configured.
 	 */
+
 	virt_dev = xhci->devs[slot_id];
 	if (!virt_dev)
 		return;
@@ -1492,34 +1486,13 @@ static void xhci_handle_cmd_config_ep(struct xhci_hcd *xhci, int slot_id,
 	}
 
 	add_flags = le32_to_cpu(ctrl_ctx->add_flags);
-	drop_flags = le32_to_cpu(ctrl_ctx->drop_flags);
+
 	/* Input ctx add_flags are the endpoint index plus one */
 	ep_index = xhci_last_valid_endpoint(add_flags) - 1;
 
 	ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->out_ctx, ep_index);
 	trace_xhci_handle_cmd_config_ep(ep_ctx);
 
-	/* A usb_set_interface() call directly after clearing a halted
-	 * condition may race on this quirky hardware.  Not worth
-	 * worrying about, since this is prototype hardware.  Not sure
-	 * if this will work for streams, but streams support was
-	 * untested on this prototype.
-	 */
-	if (xhci->quirks & XHCI_RESET_EP_QUIRK &&
-			ep_index != (unsigned int) -1 &&
-			add_flags - SLOT_FLAG == drop_flags) {
-		ep_state = virt_dev->eps[ep_index].ep_state;
-		if (!(ep_state & EP_HALTED))
-			return;
-		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
-				"Completed config ep cmd - "
-				"last ep index = %d, state = %d",
-				ep_index, ep_state);
-		/* Clear internal halted state and restart ring(s) */
-		virt_dev->eps[ep_index].ep_state &= ~EP_HALTED;
-		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
-		return;
-	}
 	return;
 }
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 1e3ef8d01567..0bd76c94a4b1 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1846,7 +1846,7 @@ struct xhci_hcd {
 #define XHCI_STATE_REMOVING	(1 << 2)
 	unsigned long long	quirks;
 #define	XHCI_LINK_TRB_QUIRK	BIT_ULL(0)
-#define XHCI_RESET_EP_QUIRK	BIT_ULL(1)
+#define XHCI_RESET_EP_QUIRK	BIT_ULL(1) /* Deprecated */
 #define XHCI_NEC_HOST		BIT_ULL(2)
 #define XHCI_AMD_PLL_FIX	BIT_ULL(3)
 #define XHCI_SPURIOUS_SUCCESS	BIT_ULL(4)
-- 
2.25.1


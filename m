Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 700A96BED3C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjCQPqQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjCQPqP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:15 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5B4B1A43
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067973; x=1710603973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=04xTDRIqEUcVFTgx98CR1B2K0kYoai94Bi9bXrZF484=;
  b=jicQVsfUH5FLSv46LejsXq2LG0xCChSV7m4Wf/F6GzglfVgWYHP7wzk2
   TvjXx2FKPqu3qZ1IhCAmJ1J6YP7zE/fFp1njO+pp7a4KPkZiCGIs9amuc
   ITn6CM2y+WwDBDo68bYFCjUL6S7wkzsCTFD9nr2zyXqnjgORMBQIlzGDJ
   gfJyw+IGtGdSLyO8kNH+raerEbEEqYte8j5Of0cYHi3y1A+dHIu9rEv8V
   kWxgWyxss2jQ19glz5hxxoAGys3n6bwvl7i87GVq6R6yHhnR9qg9NENDc
   7AME9h3/nWFhmHLeCqw6Fkr9dek9R/IGPFU2PZkY55klQZ5iL+DeWB9jQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309803"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309803"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630312003"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630312003"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:11 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/14] xhci: mem: Join string literals back
Date:   Fri, 17 Mar 2023 17:47:08 +0200
Message-Id: <20230317154715.535523-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230317154715.535523-1-mathias.nyman@linux.intel.com>
References: <20230317154715.535523-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

For easy grepping on debug purposes join string literals back in
the messages.

No functional change.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 67ac02d177b5..7e106bd804ca 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -607,8 +607,7 @@ struct xhci_stream_info *xhci_alloc_stream_info(struct xhci_hcd *xhci,
 	int ret;
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 
-	xhci_dbg(xhci, "Allocating %u streams and %u "
-			"stream context array entries.\n",
+	xhci_dbg(xhci, "Allocating %u streams and %u stream context array entries.\n",
 			num_streams, num_stream_ctxs);
 	if (xhci->cmd_ring_reserved_trbs == MAX_RSVD_CMD_TRBS) {
 		xhci_dbg(xhci, "Command ring has no reserved TRBs available\n");
@@ -1950,8 +1949,7 @@ static void xhci_set_hc_event_deq(struct xhci_hcd *xhci, struct xhci_interrupter
 	deq = xhci_trb_virt_to_dma(ir->event_ring->deq_seg,
 			ir->event_ring->dequeue);
 	if (!deq)
-		xhci_warn(xhci, "WARN something wrong with SW event ring "
-				"dequeue ptr.\n");
+		xhci_warn(xhci, "WARN something wrong with SW event ring dequeue ptr.\n");
 	/* Update HC event ring dequeue pointer */
 	temp = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
 	temp &= ERST_PTR_MASK;
@@ -1960,8 +1958,7 @@ static void xhci_set_hc_event_deq(struct xhci_hcd *xhci, struct xhci_interrupter
 	 */
 	temp &= ~ERST_EHB;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"// Write event ring dequeue pointer, "
-			"preserving EHB bit");
+		       "// Write event ring dequeue pointer, preserving EHB bit");
 	xhci_write_64(xhci, ((u64) deq & (u64) ~ERST_PTR_MASK) | temp,
 			&ir->ir_set->erst_dequeue);
 }
@@ -1994,8 +1991,7 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 	} else if (major_revision <= 0x02) {
 		rhub = &xhci->usb2_rhub;
 	} else {
-		xhci_warn(xhci, "Ignoring unknown port speed, "
-				"Ext Cap %p, revision = 0x%x\n",
+		xhci_warn(xhci, "Ignoring unknown port speed, Ext Cap %p, revision = 0x%x\n",
 				addr, major_revision);
 		/* Ignoring port protocol we can't understand. FIXME */
 		return;
@@ -2010,9 +2006,8 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 	port_offset = XHCI_EXT_PORT_OFF(temp);
 	port_count = XHCI_EXT_PORT_COUNT(temp);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Ext Cap %p, port offset = %u, "
-			"count = %u, revision = 0x%x",
-			addr, port_offset, port_count, major_revision);
+		       "Ext Cap %p, port offset = %u, count = %u, revision = 0x%x",
+		       addr, port_offset, port_count, major_revision);
 	/* Port count includes the current port offset */
 	if (port_offset == 0 || (port_offset + port_count - 1) > num_ports)
 		/* WTF? "Valid values are ‘1’ to MaxPorts" */
@@ -2069,10 +2064,8 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 		struct xhci_port *hw_port = &xhci->hw_ports[i];
 		/* Duplicate entry.  Ignore the port if the revisions differ. */
 		if (hw_port->rhub) {
-			xhci_warn(xhci, "Duplicate port entry, Ext Cap %p,"
-					" port %u\n", addr, i);
-			xhci_warn(xhci, "Port was marked as USB %u, "
-					"duplicated as USB %u\n",
+			xhci_warn(xhci, "Duplicate port entry, Ext Cap %p, port %u\n", addr, i);
+			xhci_warn(xhci, "Port was marked as USB %u, duplicated as USB %u\n",
 					hw_port->rhub->maj_rev, major_revision);
 			/* Only adjust the roothub port counts if we haven't
 			 * found a similar duplicate.
@@ -2411,8 +2404,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	val = readl(&xhci->cap_regs->db_off);
 	val &= DBOFF_MASK;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"// Doorbell array is located at offset 0x%x"
-			" from cap regs base addr", val);
+		       "// Doorbell array is located at offset 0x%x from cap regs base addr",
+		       val);
 	xhci->dba = (void __iomem *) xhci->cap_regs + val;
 	/* Set ir_set to interrupt register set 0 */
 
-- 
2.25.1


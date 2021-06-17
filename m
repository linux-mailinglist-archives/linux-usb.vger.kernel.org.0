Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9334B3AB6C4
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 17:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbhFQPDz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 11:03:55 -0400
Received: from mga04.intel.com ([192.55.52.120]:23962 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232964AbhFQPDx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Jun 2021 11:03:53 -0400
IronPort-SDR: 0uUOEHKw3/c5RrZ4SuXdrqNFpbBY3xXvjRXaIg1MFU9HGNwU6Rsey3YAohPo1g1rhwOnM1uE01
 mlkrTkg13gRQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="204557459"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="204557459"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 08:01:45 -0700
IronPort-SDR: h7pnAAPleQ2VSFCJP6jzzml/5H02gMnoW8ObGss22lrkxZIMfdIZEAP9CdwsQC5ENwdEzPyh4N
 a7RE4BEbMqSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="479490848"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2021 08:01:44 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/4] xhci: Add adaptive interrupt rate for isoch TRBs with XHCI_AVOID_BEI quirk
Date:   Thu, 17 Jun 2021 18:03:52 +0300
Message-Id: <20210617150354.1512157-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617150354.1512157-1-mathias.nyman@linux.intel.com>
References: <20210617150354.1512157-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Save a bit of power by not interrupting so often by default if
XHCI_AVOID_BEI quirk is set.

In normal cases the xhci driver will only generate an interrupt on the last
isochronous TRB of an URB. In a common UVC webcam usecase there are 32 TRBs
per URB.

if AVOID_BEI flag is set then xhci driver will force an interrupt every 8th
isoc TRB to make sure the event ring doesn't get too full.

This is however way too frequent in common single webcam use cases, causing
1000 interrupts/sec and thus poor powermanagement performance.

Instead start with interrupting every 32 isoc TRB, and halve it in case
event ring becomes half-full. Stop halving when reaching a rate of every
8th trb.

This is a one way solution. If interrupt rate is increased it will stay
high until driver is reloaded. The highest rate is the same as the old
default rate.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  | 2 ++
 drivers/usb/host/xhci-ring.c | 7 ++++++-
 drivers/usb/host/xhci.h      | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index f66815fe8482..2f6da35e7977 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2547,6 +2547,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Wrote ERST address to ir_set 0.");
 
+	xhci->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
+
 	/*
 	 * XXX: Might need to set the Interrupter Moderation Register to
 	 * something other than the default (~1ms minimum between interrupts).
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 6acd2329e08d..8fea44bbc266 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3076,6 +3076,11 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		if (event_loop++ < TRBS_PER_SEGMENT / 2)
 			continue;
 		xhci_update_erst_dequeue(xhci, event_ring_deq);
+
+		/* ring is half-full, force isoc trbs to interrupt more often */
+		if (xhci->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
+			xhci->isoc_bei_interval = xhci->isoc_bei_interval / 2;
+
 		event_loop = 0;
 	}
 
@@ -3956,7 +3961,7 @@ static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i)
 	 * generate an event at least every 8th TD to clear the event ring
 	 */
 	if (i && xhci->quirks & XHCI_AVOID_BEI)
-		return !!(i % 8);
+		return !!(i % xhci->isoc_bei_interval);
 
 	return true;
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 85ba326806ab..5ba01d5ccab8 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1526,6 +1526,12 @@ static inline const char *xhci_trb_type_string(u8 type)
 #define TRB_BUFF_LEN_UP_TO_BOUNDARY(addr)	(TRB_MAX_BUFF_SIZE - \
 					(addr & (TRB_MAX_BUFF_SIZE - 1)))
 #define MAX_SOFT_RETRY		3
+/*
+ * Limits of consecutive isoc trbs that can Block Event Interrupt (BEI) if
+ * XHCI_AVOID_BEI quirk is in use.
+ */
+#define AVOID_BEI_INTERVAL_MIN	8
+#define AVOID_BEI_INTERVAL_MAX	32
 
 struct xhci_segment {
 	union xhci_trb		*trbs;
@@ -1768,6 +1774,7 @@ struct xhci_hcd {
 	u8		isoc_threshold;
 	/* imod_interval in ns (I * 250ns) */
 	u32		imod_interval;
+	u32		isoc_bei_interval;
 	int		event_ring_max;
 	/* 4KB min, 128MB max */
 	int		page_size;
-- 
2.25.1


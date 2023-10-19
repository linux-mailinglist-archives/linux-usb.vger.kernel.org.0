Return-Path: <linux-usb+bounces-1900-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207DF7CF52F
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD216281F28
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C611946B;
	Thu, 19 Oct 2023 10:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTc9+4qj"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D06946691
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13306FA
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711290; x=1729247290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=80iOZ3/elHAF0tGqjoPXKssEihuwnWygCXqSbP7OxH0=;
  b=LTc9+4qj6yCaloioFV8BrTtn82C+idQlNJf5MqNiwJ8ds2NqQi4EJ6L0
   Rn5gQQRnU02zTclxlh9HqsSzDcLFfbxOE6e5AQ2U0RkaPQhVXbodE3DLC
   ZQRx/BU2CeFL2r6E0uj950WXG0tudLKxesIpr6EB2ypyoIAJXuBuXJ/oM
   P9jC17/z/lU3/vndpAHXws8WgBE59eh8ef0hzMve3zQeVCAufXvxP5tmx
   ZDU0AZQFEt0H5LAFU/4Mc5WU6QaHOcZuT55kEYf0dd8ysGuQsW+C7R30w
   rTHUuqT7FcbrkHVpN6off0b42XcoxyR3RFdJX6jsUVUf8n5OTZ7AWI6UB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075809"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075809"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557570"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557570"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:07 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Lukas Wunner <lukas@wunner.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/19] xhci: Use more than one Event Ring segment
Date: Thu, 19 Oct 2023 13:29:10 +0300
Message-Id: <20231019102924.2797346-6-mathias.nyman@linux.intel.com>
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

From: Jonathan Bell <jonathan@raspberrypi.com>

Users have reported log spam created by "Event Ring Full" xHC event
TRBs.  These are caused by interrupt latency in conjunction with a very
busy set of devices on the bus.  The errors are benign, but throughput
will suffer as the xHC will pause processing of transfers until the
Event Ring is drained by the kernel.

Commit dc0ffbea5729 ("usb: host: xhci: update event ring dequeue pointer
on purpose") mitigated the issue by advancing the Event Ring Dequeue
Pointer already after half a segment has been processed.  Nevertheless,
providing a larger Event Ring would be useful to cope with load peaks.

Expand the number of event TRB slots available by increasing the number
of Event Ring segments in the ERST.

Controllers have a hardware-defined limit as to the number of ERST
entries they can process, but with up to 32k it can be excessively high
(sec 5.3.4).  So cap the actual number at 2 (configurable through the
ERST_MAX_SEGS macro), which seems like a reasonable quantity.  It is
supported by any xHC because the limit in the HCSPARAMS2 register is
defined as a power of 2.  Renesas uPD720201 and VIA VL805 controllers
do not support more than 2 ERST entries.

An alternative to increasing the number of Event Ring segments would be
an increase of the segment size.  But that requires allocating multiple
contiguous pages, which may be impossible if memory is fragmented.

Signed-off-by: Jonathan Bell <jonathan@raspberrypi.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 10 +++++++---
 drivers/usb/host/xhci.h     |  5 +++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 17c9942010c8..a8a8fc2cc4a5 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2235,14 +2235,18 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	struct xhci_interrupter *ir;
+	unsigned int num_segs;
 	int ret;
 
 	ir = kzalloc_node(sizeof(*ir), flags, dev_to_node(dev));
 	if (!ir)
 		return NULL;
 
-	ir->event_ring = xhci_ring_alloc(xhci, ERST_NUM_SEGS, 1, TYPE_EVENT,
-					0, flags);
+	num_segs = min_t(unsigned int, 1 << HCS_ERST_MAX(xhci->hcs_params2),
+			 ERST_MAX_SEGS);
+
+	ir->event_ring = xhci_ring_alloc(xhci, num_segs, 1, TYPE_EVENT, 0,
+					 flags);
 	if (!ir->event_ring) {
 		xhci_warn(xhci, "Failed to allocate interrupter event ring\n");
 		kfree(ir);
@@ -2278,7 +2282,7 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 	/* set ERST count with the number of entries in the segment table */
 	erst_size = readl(&ir->ir_set->erst_size);
 	erst_size &= ERST_SIZE_MASK;
-	erst_size |= ERST_NUM_SEGS;
+	erst_size |= ir->event_ring->num_segs;
 	writel(erst_size, &ir->ir_set->erst_size);
 
 	erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 5ddca9280ec3..41820fd97c00 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1647,8 +1647,9 @@ struct urb_priv {
  * Each segment table entry is 4*32bits long.  1K seems like an ok size:
  * (1K bytes * 8bytes/bit) / (4*32 bits) = 64 segment entries in the table,
  * meaning 64 ring segments.
- * Initial allocated size of the ERST, in number of entries */
-#define	ERST_NUM_SEGS	1
+ * Reasonable limit for number of Event Ring segments (spec allows 32k)
+ */
+#define	ERST_MAX_SEGS	2
 /* Poll every 60 seconds */
 #define	POLL_TIMEOUT	60
 /* Stop endpoint command timeout (secs) for URB cancellation watchdog timer */
-- 
2.25.1



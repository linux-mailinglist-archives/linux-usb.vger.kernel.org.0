Return-Path: <linux-usb+bounces-9896-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A00E8B5AB3
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C425287835
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBBE7641B;
	Mon, 29 Apr 2024 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SN3zN6pd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536D876402
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399263; cv=none; b=Y15vOPlNm9aMx8xqbStGGqQgqPSJtfJibcPUYz3Zn8+Zo+QeIi+GqR8PcwC2shAkABR6toqhsEtypT4RLN00gJZ/3w6Y3TU4nowKCdPp4CPBHLr1u5wa9ncpBov/x5Ian91YwdcKN8CE5atrpP+z7t3WVMdn5ndG4XEjh9tGdCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399263; c=relaxed/simple;
	bh=9caxdvmsgFGTSe0fqdsl+P2W9t2tew2KcLKI7d68k4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i7xRoMSzV9iOZfhf1ECwyJUDSb47JbleLthyYMVTk3f49n1s5H1756gKUOwc70FiXvlB027HoWMy6/S2uBTNkspvx5q6E+KnZG60nicFZFXztyIpYeLlS4Y0BiSVXb+kF/HKEkElVCuj6tYbnwsKJxtjQEwr/Dgk6gWsaevUFkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SN3zN6pd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399262; x=1745935262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9caxdvmsgFGTSe0fqdsl+P2W9t2tew2KcLKI7d68k4U=;
  b=SN3zN6pdKYLGSwUSbt+U4OQMQqgm5ej0SX+mV5+6BupiWmqQVjVhp/vz
   gf6BgCejFbJWRckmQXPeaH0Pfgr8ET6d+hf//L1Px42zgoDAxWiIJVox5
   +2Jo33GqLlS8cI2Ap0iiUMRjoXKd3wfcgAbjL3du2OTBT79TSzVY7Acur
   rE5LmvkBDAyh6+x8Mo9M0X3QivVftE9mCe4dN1RZioqJKP55If0JbvukA
   mgzAVu2DUaKUB84MRizAAsNSx61aIlLcKjjpbCR75A9UfxWA9JhDNSg3l
   kYywEPcn6JBVxXoRLYjXp1CdKC33YVHY7hFZDnORFHegLo3LJFpyD71Qg
   A==;
X-CSE-ConnectionGUID: kwn+sb5nRV6Xc3YoyEFYVw==
X-CSE-MsgGUID: WhMd+x6yRGSrhl+dHeir2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911396"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911396"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:01 -0700
X-CSE-ConnectionGUID: mFVdWyGNT6aCIEm+Gi3Img==
X-CSE-MsgGUID: sbqnhGr5TbOvJcX8Xx9JWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521687"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:00:59 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/18] usb: xhci: check if 'requested segments' exceeds ERST capacity
Date: Mon, 29 Apr 2024 17:02:30 +0300
Message-Id: <20240429140245.3955523-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
References: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Check if requested segments ('segs' or 'ERST_DEFAULT_SEGS') exceeds the
maximum amount ERST supports.

When 'segs' is '0', 'ERST_DEFAULT_SEGS' is used instead. But both values
may not exceed ERST max.

Macro 'ERST_MAX_SEGS' is renamed to 'ERST_DEFAULT_SEGS'. The new name
better represents the macros, which is the number of Event Ring segments
to allocate, when the amount is not specified.

Additionally, rename and change xhci_create_secondary_interrupter()'s
argument 'int num_segs' to 'unsigned int segs'. This makes it the same
as its counter part in xhci_alloc_interrupter().

Fixes: c99b38c41234 ("xhci: add support to allocate several interrupters")
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 22 +++++++++++-----------
 drivers/usb/host/xhci.h     |  6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7ff2ff29b48e..1a16b44506da 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2259,24 +2259,24 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 }
 
 static struct xhci_interrupter *
-xhci_alloc_interrupter(struct xhci_hcd *xhci, int segs, gfp_t flags)
+xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	struct xhci_interrupter *ir;
-	unsigned int num_segs = segs;
+	unsigned int max_segs;
 	int ret;
 
+	if (!segs)
+		segs = ERST_DEFAULT_SEGS;
+
+	max_segs = BIT(HCS_ERST_MAX(xhci->hcs_params2));
+	segs = min(segs, max_segs);
+
 	ir = kzalloc_node(sizeof(*ir), flags, dev_to_node(dev));
 	if (!ir)
 		return NULL;
 
-	/* number of ring segments should be greater than 0 */
-	if (segs <= 0)
-		num_segs = min_t(unsigned int, 1 << HCS_ERST_MAX(xhci->hcs_params2),
-			 ERST_MAX_SEGS);
-
-	ir->event_ring = xhci_ring_alloc(xhci, num_segs, 1, TYPE_EVENT, 0,
-					 flags);
+	ir->event_ring = xhci_ring_alloc(xhci, segs, 1, TYPE_EVENT, 0, flags);
 	if (!ir->event_ring) {
 		xhci_warn(xhci, "Failed to allocate interrupter event ring\n");
 		kfree(ir);
@@ -2334,7 +2334,7 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 }
 
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg)
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
@@ -2344,7 +2344,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg)
 	if (!xhci->interrupters || xhci->max_interrupters <= 1)
 		return NULL;
 
-	ir = xhci_alloc_interrupter(xhci, num_seg, GFP_KERNEL);
+	ir = xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
 	if (!ir)
 		return NULL;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 1c9519205330..8a3ae5049d1c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1392,8 +1392,8 @@ struct urb_priv {
 	struct	xhci_td	td[] __counted_by(num_tds);
 };
 
-/* Reasonable limit for number of Event Ring segments (spec allows 32k) */
-#define	ERST_MAX_SEGS	2
+/* Number of Event Ring segments to allocate, when amount is not specified. (spec allows 32k) */
+#define	ERST_DEFAULT_SEGS	2
 /* Poll every 60 seconds */
 #define	POLL_TIMEOUT	60
 /* Stop endpoint command timeout (secs) for URB cancellation watchdog timer */
@@ -1831,7 +1831,7 @@ struct xhci_container_ctx *xhci_alloc_container_ctx(struct xhci_hcd *xhci,
 void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg);
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 
-- 
2.25.1



Return-Path: <linux-usb+bounces-160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 912BA7A20FF
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 16:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 497472831F4
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 14:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5198E11726;
	Fri, 15 Sep 2023 14:30:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDC411CAF
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 14:30:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A042D51;
	Fri, 15 Sep 2023 07:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694788192; x=1726324192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0ide3LOGeSX/B+vTfryAk8Wp8gp5a+c2QV6Y6fkhxhw=;
  b=V63K8mLQ6C3xucWH7rB+AVVrf39S33OzYPe6+hzQrbqOtnxTWgv85l84
   OP/pLZxuWfTJzTjQhAy1zSf5AxX232ly2d2l+YQi7Fo1TZU2AqJy3VpCX
   Oo+qM0x3t4v8UoL8urE2UOF6Yq9DyA8/MXWerIN4o7kWMgismtM5Gii/W
   IfJrf47r33uWWeRgcWL4eOGy+SBmx7UMC5acuUJmoONt7gcsBUiRGwaLK
   bBDWw6tdrLP+UtoEx6uaOxHfM3RIiWvwKtPKP1TGg/eK2+WW8uVTgfUiY
   swkdzcwsdmULz9QRVbBlfoaGjrm7g8uARAysIttJQ+4GIn0D1cua8SrW+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="378171601"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="378171601"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 07:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="888252658"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="888252658"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 15 Sep 2023 07:29:15 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	stable@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/4] usb: xhci: xhci-ring: Use sysdev for mapping bounce buffer
Date: Fri, 15 Sep 2023 17:31:05 +0300
Message-Id: <20230915143108.1532163-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915143108.1532163-1-mathias.nyman@linux.intel.com>
References: <20230915143108.1532163-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Wesley Cheng <quic_wcheng@quicinc.com>

As mentioned in:
  commit 474ed23a6257 ("xhci: align the last trb before link if it is
easily splittable.")

A bounce buffer is utilized for ensuring that transfers that span across
ring segments are aligned to the EP's max packet size.  However, the device
that is used to map the DMA buffer to is currently using the XHCI HCD,
which does not carry any DMA operations in certain configrations.
Migration to using the sysdev entry was introduced for DWC3 based
implementations where the IOMMU operations are present.

Replace the reference to the controller device to sysdev instead.  This
allows the bounce buffer to be properly mapped to any implementations that
have an IOMMU involved.

cc: <stable@vger.kernel.org>
Fixes: 4c39d4b949d3 ("usb: xhci: use bus->sysdev for DMA configuration")
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1dde53f6eb31..98389b568633 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -798,7 +798,7 @@ static void xhci_giveback_urb_in_irq(struct xhci_hcd *xhci,
 static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
 		struct xhci_ring *ring, struct xhci_td *td)
 {
-	struct device *dev = xhci_to_hcd(xhci)->self.controller;
+	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	struct xhci_segment *seg = td->bounce_seg;
 	struct urb *urb = td->urb;
 	size_t len;
@@ -3469,7 +3469,7 @@ static u32 xhci_td_remainder(struct xhci_hcd *xhci, int transferred,
 static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
 			 u32 *trb_buff_len, struct xhci_segment *seg)
 {
-	struct device *dev = xhci_to_hcd(xhci)->self.controller;
+	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	unsigned int unalign;
 	unsigned int max_pkt;
 	u32 new_buff_len;
-- 
2.25.1



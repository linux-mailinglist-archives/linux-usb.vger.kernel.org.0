Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1E9688109
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 16:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231829AbjBBPFh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 10:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbjBBPFg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 10:05:36 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4747929E3D
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 07:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350302; x=1706886302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RQkoSU0SaCTBTfBj0nN4UWy1JmEroj8xiZzeWLkZURo=;
  b=DDFhs5VCPmjSlpW3se0aJ1Cx80pc/qmI7pDwMSWarksVbVFGnutkbwck
   C0cQsvTW4laJhROCP0YTAzLttN04YZURu4EsHifcHNNXWfhVFDDLh01n7
   jbsdYCf15Ogx9K+LC+Yq5YuFDSIUiXViV21B3rxTBYhJcaexREnG0DNMP
   XA9T4B40NdQn+dSIiBEhzLsZ8Pi71pXi6bn+ivJLmILC1hOVakcf/0bxB
   ZVCqQoViwgrv7kPDzG9B+uBcMtQnkG7JxNvHD+tTUa7IoG32Khtrjm7am
   9S35L3laxOidhwvxCPpVoIh8PRY8rzyhWCiBO3auF5l5TMZczIN2PfvL1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327113942"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327113942"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:03:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728905638"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="728905638"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 07:03:49 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/11] xhci: fix event ring segment table related masks and variables in header
Date:   Thu,  2 Feb 2023 17:04:55 +0200
Message-Id: <20230202150505.618915-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202150505.618915-1-mathias.nyman@linux.intel.com>
References: <20230202150505.618915-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

xHC controller can supports up to 1024 interrupters.
To fit these change the max_interrupters varable from u8 to u16.

Add a separate mask for the reserve and preserve bits [5:0] in the erst
base register and use it instead of the ERST_PRT_MASK.
ERSR_PTR_MASK [3:0] is intended for masking bits in the
event ring dequeue pointer register.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 4 ++--
 drivers/usb/host/xhci.h     | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 81ca2bc1f0be..679befa97c7a 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2529,8 +2529,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 			"// Set ERST base address for ir_set 0 = 0x%llx",
 			(unsigned long long)xhci->erst.erst_dma_addr);
 	val_64 = xhci_read_64(xhci, &xhci->ir_set->erst_base);
-	val_64 &= ERST_PTR_MASK;
-	val_64 |= (xhci->erst.erst_dma_addr & (u64) ~ERST_PTR_MASK);
+	val_64 &= ERST_BASE_RSVDP;
+	val_64 |= (xhci->erst.erst_dma_addr & (u64) ~ERST_BASE_RSVDP);
 	xhci_write_64(xhci, val_64, &xhci->ir_set->erst_base);
 
 	/* Set the event ring dequeue address */
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 7547037b57bf..0dd92f9089fe 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -513,6 +513,9 @@ struct xhci_intr_reg {
 /* Preserve bits 16:31 of erst_size */
 #define	ERST_SIZE_MASK		(0xffff << 16)
 
+/* erst_base bitmasks */
+#define ERST_BASE_RSVDP		(0x3f)
+
 /* erst_dequeue bitmasks */
 /* Dequeue ERST Segment Index (DESI) - Segment number (or alias)
  * where the current dequeue pointer lies.  This is an optional HW hint.
@@ -1774,7 +1777,7 @@ struct xhci_hcd {
 	u8		sbrn;
 	u16		hci_version;
 	u8		max_slots;
-	u8		max_interrupters;
+	u16		max_interrupters;
 	u8		max_ports;
 	u8		isoc_threshold;
 	/* imod_interval in ns (I * 250ns) */
-- 
2.25.1


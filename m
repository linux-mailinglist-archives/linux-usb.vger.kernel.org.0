Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC1A056200
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 08:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfFZGGE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 02:06:04 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:12014 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfFZGGE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jun 2019 02:06:04 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d130b4e0000>; Tue, 25 Jun 2019 23:06:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 25 Jun 2019 23:06:03 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 25 Jun 2019 23:06:03 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Jun
 2019 06:06:03 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Jun
 2019 06:06:03 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 26 Jun 2019 06:06:03 +0000
Received: from henryl-nb2.nvidia.com (Not Verified[10.19.108.180]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d130b4a0002>; Tue, 25 Jun 2019 23:06:03 -0700
From:   Henry Lin <henryl@nvidia.com>
To:     <mathias.nyman@intel.com>
CC:     <linux-usb@vger.kernel.org>, <henryl@nvidia.com>,
        <paulius.zaleckas@gmail.com>
Subject: [PATCH] xhci: fix wrong WARN messages for bounce buffer
Date:   Wed, 26 Jun 2019 14:05:25 +0800
Message-ID: <1561529125-7118-1-git-send-email-henryl@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561529166; bh=jDbYanfGpze0dJLYiSbSpnidFiQy7yyvH/+g+cc6Feo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=FO3Sm6m8svWcO8pqiWQMNWnXVt78E72FMgAaB5iIFC4GAnjnlDEsr9vO0y5HMXrfs
         c7XAtgYV3aQOJE0R0sFAOTOtBi1KJvN0Kh6/fplDpySVbyWLvWCentDkJ+xwQUToc4
         ozNWrch6b+ywoqwShW/FzkFJxDVf7R07mqs5vodZL1oQw8772A8zrM33+PqS/ZApDl
         zGfciDbquXzsWmnk/SDBw8udS1EqtZlXByX3r0TL0kXDqrPZhhBDyd9MBbb0JWjUMJ
         xng+5usyjUcJgzl3qVv56h1Sts+zt/lFPi9Sr7gPbQ1nb8KHC8sJ41EbGErlJWtShx
         cZyq924UVdlFg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This change fixes below wrong warning messages:

[  173.473153] xhci-hcd xhci-hcd.0.auto: WARN Wrong bounce buffer write length: 1024 != 990
[  173.530633] xhci-hcd xhci-hcd.0.auto: WARN Wrong bounce buffer write length: 490 != 1014
[  173.541598] xhci-hcd xhci-hcd.0.auto: WARN Wrong bounce buffer write length: 490 != 1024
[  173.619507] xhci-hcd xhci-hcd.0.auto: WARN Wrong bounce buffer write length: 1024 != 490
[  173.631982] xhci-hcd xhci-hcd.0.auto: WARN Wrong bounce buffer write length: 1024 != 490
[  173.654629] xhci-hcd xhci-hcd.0.auto: WARN Wrong bounce buffer write length: 108 != 1024
[  173.750209] xhci-hcd xhci-hcd.0.auto: WARN Wrong bounce buffer write length: 1024 != 108

Signed-off-by: Henry Lin <henryl@nvidia.com>
---
 drivers/usb/host/xhci-ring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 121782e..aa7231f 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3177,10 +3177,10 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
 	if (usb_urb_dir_out(urb)) {
 		len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
 				   seg->bounce_buf, new_buff_len, enqd_len);
-		if (len != seg->bounce_len)
+		if (len != new_buff_len)
 			xhci_warn(xhci,
 				"WARN Wrong bounce buffer write length: %zu != %d\n",
-				len, seg->bounce_len);
+				len, new_buff_len);
 		seg->bounce_dma = dma_map_single(dev, seg->bounce_buf,
 						 max_pkt, DMA_TO_DEVICE);
 	} else {
-- 
2.7.4


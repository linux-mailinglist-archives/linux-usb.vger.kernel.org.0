Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC31AB215
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2019 07:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392368AbfIFFhi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Sep 2019 01:37:38 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15232 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392346AbfIFFhh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Sep 2019 01:37:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d71f0a40000>; Thu, 05 Sep 2019 22:37:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 05 Sep 2019 22:37:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 05 Sep 2019 22:37:37 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Sep
 2019 05:37:37 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Sep
 2019 05:37:36 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 6 Sep 2019 05:37:36 +0000
Received: from ubuntu.localdomain (Not Verified[10.19.108.201]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d71f09f0003>; Thu, 05 Sep 2019 22:37:36 -0700
From:   Rick Tseng <rtseng@nvidia.com>
To:     <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Rick Tseng <rtseng@nvidia.com>
Subject: [PATCH v2] usb: host: xhci: wait CNR when doing xhci resume
Date:   Fri, 6 Sep 2019 13:36:58 +0800
Message-ID: <1567748218-6656-1-git-send-email-rtseng@nvidia.com>
X-Mailer: git-send-email 2.1.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567748260; bh=LLeg7x7J4LWqF38DzwzUQGltfIBa8E9zlDyCH0Bcgu4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=kIkUatHuj8XSztK1YHsBBp2WMBEofFoLgAYjZwJhbHTgT/x7lgtUnOpIxfb4+hLtM
         wMG6KpQUTCpBns8XAS/Y+2b4WsWvnandcHB9kkI52CMdtUkvvs5a8hjM6mDEefdV6q
         q3GtWuBbmCv1yR4fethzzRi4i+lzwjK8nPMT180V87wWCTQKhWRRMEpe+LD/Q2SlsD
         5FYxWfY4dHDcgjBwRFUzyLKtxhj0kntd6UqEINTCYf95rv1lQssmgqG+D4IPY+SpuW
         8K019c8/lGZ16h57P7258U+gKQiZWcctITDVq6mi+7vnHQaL3I0VN36sfNfhVuAab8
         j4/4iAeq3Y9Pg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

NVIDIA 3.1 xHCI card would lose power when moving power state into D3Cold.
Thus we need to wait CNR bit to clear when xhci resmue as xhci init.

Signed-off-by: Rick Tseng <rtseng@nvidia.com>
---
 drivers/usb/host/xhci.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 03d1e55..6c7102c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1108,6 +1108,15 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		hibernated = true;
 
 	if (!hibernated) {
+		/* Some xHC would lose power during suspend, so wait for
+		 * controller ready from resume as xHC init.
+		 */
+		if (xhci_handshake(&xhci->op_regs->status,
+				   STS_CNR, 0, 10 * 1000 * 1000)) {
+			xhci_warn(xhci, "WARN: xHC timeout for CNR clear\n");
+			spin_unlock_irq(&xhci->lock);
+			return -ETIMEDOUT;
+		}
 		/* step 1: restore register */
 		xhci_restore_registers(xhci);
 		/* step 2: initialize command ring buffer */
-- 
2.1.4


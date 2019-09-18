Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8010CB6088
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 11:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbfIRJlg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 05:41:36 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12226 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728204AbfIRJlg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Sep 2019 05:41:36 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d81fbd50000>; Wed, 18 Sep 2019 02:41:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 18 Sep 2019 02:41:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 18 Sep 2019 02:41:36 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 09:41:35 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 18 Sep 2019 09:41:35 +0000
Received: from ubuntu.localdomain (Not Verified[10.19.108.201]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d81fbce0002>; Wed, 18 Sep 2019 02:41:35 -0700
From:   Rick Tseng <rtseng@nvidia.com>
To:     <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Rick Tseng <rtseng@nvidia.com>
Subject: [PATCH v3] usb: host: xhci: wait CNR when doing xhci resume
Date:   Wed, 18 Sep 2019 17:41:31 +0800
Message-ID: <1568799691-3853-1-git-send-email-rtseng@nvidia.com>
X-Mailer: git-send-email 2.1.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568799701; bh=YVCXoY/5erWhGQeDOBD792sFQk/d10PMykICyf6aC0s=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=FM09mWTBKQ9r2tXltqm0m55Zk+EbgV2thcFH3HNVdMzUaNJL8yK3CgiNMPHBKEQ9o
         NPVB/f4DUpwUFVzu0KfoSPeFM7qPZ1o275S+5CAiuGpzfP6cLAG34B3FssFeBCdi48
         W+ZOU2962ca9s2qOlvZVxXlK3UEodlCZ7qrkrau6WAENaCL5QruJSigWlF29avHJCJ
         htZCPdig5DfJi9PUrwTNGwLDjAd83Mv6ke6h6PY1zmOgy2jvl4CkmU2bbcNQlAp+kP
         sIhgeiAvQh1g7CfyH6z2BkTD6fa5AKx4k0unCdTp0qlsbQHUHH4axiM1oaQKXpSbrd
         pkhxWZ4OEDOaw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

NVIDIA 3.1 xHCI card would lose power when moving power state into D3Cold.
Thus we need to wait CNR bit to clear when xhci resmue as xhci init.

Signed-off-by: Rick Tseng <rtseng@nvidia.com>
---
 drivers/usb/host/xhci.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 03d1e55..aee1fc5 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1108,6 +1108,17 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		hibernated = true;
 
 	if (!hibernated) {
+		/* Some xHC would lose power during suspend, so wait for
+		 * controller ready from resume as xHC init.
+		 */
+		retval = xhci_handshake(&xhci->op_regs->status,
+					STS_CNR, 0, 10 * 1000 * 1000);
+		if (retval) {
+			xhci_warn(xhci, "Controller not ready at resume %d\n",
+				  retval);
+			spin_unlock_irq(&xhci->lock);
+			return retval;
+		}
 		/* step 1: restore register */
 		xhci_restore_registers(xhci);
 		/* step 2: initialize command ring buffer */
-- 
2.1.4


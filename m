Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4EF1EDB13
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jun 2020 04:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgFDCLq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 22:11:46 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:54436 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726047AbgFDCLq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jun 2020 22:11:46 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 529A09A2739ADED1CCDB;
        Thu,  4 Jun 2020 10:11:44 +0800 (CST)
Received: from huawei.com (10.67.165.24) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Thu, 4 Jun 2020
 10:11:37 +0800
From:   Longfang Liu <liulongfang@huawei.com>
To:     <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <kong.kongxinwei@hisilicon.com>,
        <huangdaode@huawei.com>, <yisen.zhuang@huawei.com>
Subject: [PATCH v2] USB: ehci: reopen solution for Synopsys HC bug
Date:   Thu, 4 Jun 2020 10:11:18 +0800
Message-ID: <1591236678-36009-1-git-send-email-liulongfang@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A Synopsys USB2.0 core used in Huawei Kunpeng920 SoC has a bug which
might cause the host controller not issuing ping.

Bug description:
After indicating an Interrupt on Async Advance, the software uses the
doorbell mechanism to delete the Next Link queue head of the last
executed queue head. At this time, the host controller still references
the removed queue head(the queue head is NULL). NULL reference causes
the host controller to lose the USB device.

Solution:
After deleting the Next Link queue head, the software can write one of the
valid queue head addresses to the ASYNCLISTADDR register to allow
the host controller to get the valid queue head.

There are detailed instructions and solutions in this patch:
commit 2f7ac6c19997 ("USB: ehci: add workaround for Synopsys HC bug")

Signed-off-by: Longfang Liu <liulongfang@huawei.com>
---

Changes in V2:
- updated comment message

 drivers/usb/host/ehci-pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
index 1a48ab1..7ff2cbd 100644
--- a/drivers/usb/host/ehci-pci.c
+++ b/drivers/usb/host/ehci-pci.c
@@ -216,6 +216,13 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
 		ehci_info(ehci, "applying MosChip frame-index workaround\n");
 		ehci->frame_index_bug = 1;
 		break;
+	case PCI_VENDOR_ID_HUAWEI:
+		/* Synopsys HC bug */
+		if (pdev->device == 0xa239) {
+			ehci_info(ehci, "applying Synopsys HC workaround\n");
+			ehci->has_synopsys_hc_bug = 1;
+		}
+		break;
 	}
 
 	/* optional debug port, normally in the first BAR */
-- 
2.8.1


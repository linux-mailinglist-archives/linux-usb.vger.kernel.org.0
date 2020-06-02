Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990331EB608
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 08:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgFBGxW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 02:53:22 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5327 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725835AbgFBGxW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jun 2020 02:53:22 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 5F9B2C7CCC84A14AB94D;
        Tue,  2 Jun 2020 14:53:18 +0800 (CST)
Received: from huawei.com (10.67.165.24) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Tue, 2 Jun 2020
 14:53:09 +0800
From:   Longfang Liu <liulongfang@huawei.com>
To:     <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <kong.kongxinwei@hisilicon.com>,
        <huangdaode@huawei.com>, <yisen.zhuang@huawei.com>
Subject: [PATCH v2] USB: ehci: reopen solution for Synopsys HC bug
Date:   Tue, 2 Jun 2020 14:52:52 +0800
Message-ID: <1591080772-45562-1-git-send-email-liulongfang@huawei.com>
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

The detailed description and solution:
Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=2f7ac6c199978d0a0e407a12534201aa675a6482

Signed-off-by: Longfang Liu <liulongfang@huawei.com>
Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>
---

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


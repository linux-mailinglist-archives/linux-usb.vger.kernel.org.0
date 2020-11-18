Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D222B74E5
	for <lists+linux-usb@lfdr.de>; Wed, 18 Nov 2020 04:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbgKRDh6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Nov 2020 22:37:58 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7638 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgKRDh6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Nov 2020 22:37:58 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CbT5x6GDsz15JqS;
        Wed, 18 Nov 2020 11:37:41 +0800 (CST)
Received: from huawei.com (10.67.165.24) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Wed, 18 Nov 2020
 11:37:47 +0800
From:   Longfang Liu <liulongfang@huawei.com>
To:     <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <yisen.zhuang@huawei.com>,
        <tanxiaofei@huawei.com>
Subject: [RFC PATCH] USB: xhci: Enable HCE event reset function
Date:   Wed, 18 Nov 2020 11:36:13 +0800
Message-ID: <1605670573-949-1-git-send-email-liulongfang@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The HCE(Host Controller Error) event has been defined in
the XHCI driver but has not been used. If we want to use
the HCE event to reset the controller, can we implement
it in the interrupt function as follows:

xhci_irq()
    |----xhci_halt()
    |----xhci_shutdown()
    |----xhci_start()
    |----xhci_run()

Signed-off-by: Longfang Liu <liulongfang@huawei.com>
---
 drivers/usb/host/xhci-ring.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 2c255d0..87b3a40 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2857,6 +2857,16 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		goto out;
 	}
 
+	if (status & STS_HCE) {
+		xhci_warn(xhci, "WARNING: Host Controller Error\n");
+		xhci_halt(xhci);
+		xhci_shutdown(hcd);
+		xhci_start(xhci);
+		xhci_run(hcd);
+		ret = IRQ_HANDLED;
+		goto out;
+	}
+
 	/*
 	 * Clear the op reg interrupt status first,
 	 * so we can receive interrupts from other MSI-X interrupters.
-- 
2.8.1


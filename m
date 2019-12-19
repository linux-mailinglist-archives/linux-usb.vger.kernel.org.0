Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 534BD1264E1
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2019 15:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfLSOeb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Dec 2019 09:34:31 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8154 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726701AbfLSOeb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Dec 2019 09:34:31 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id BF39BA5643C43FECAB3D;
        Thu, 19 Dec 2019 22:34:18 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Thu, 19 Dec 2019 22:34:09 +0800
From:   Chen Zhou <chenzhou10@huawei.com>
To:     <mathias.nyman@linux.intel.com>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <chenzhou10@huawei.com>
Subject: [PATCH] usb: xhci: fix unused function warning
Date:   Thu, 19 Dec 2019 22:30:50 +0800
Message-ID: <20191219143050.86205-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

xhci_pci_shutdown() function is no longer called outside of the
CONFIG_PM #ifdef section, causing a harmless warning:

drivers/usb/host/xhci-pci.c:524:13: warning: ‘xhci_pci_shutdown’ defined but not used [-Wunused-function]
 static void xhci_pci_shutdown(struct usb_hcd *hcd)

This moves the function into the #ifdef to get a clean build again.

Fixes: f2c710f7dca8 ("usb: xhci: only set D3hot for pci device")
Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/usb/host/xhci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 2907fe4..4917c5b 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -519,7 +519,6 @@ static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
 	retval = xhci_resume(xhci, hibernated);
 	return retval;
 }
-#endif /* CONFIG_PM */
 
 static void xhci_pci_shutdown(struct usb_hcd *hcd)
 {
@@ -532,6 +531,7 @@ static void xhci_pci_shutdown(struct usb_hcd *hcd)
 	if (xhci->quirks & XHCI_SPURIOUS_WAKEUP)
 		pci_set_power_state(pdev, PCI_D3hot);
 }
+#endif /* CONFIG_PM */
 
 /*-------------------------------------------------------------------------*/
 
-- 
2.7.4


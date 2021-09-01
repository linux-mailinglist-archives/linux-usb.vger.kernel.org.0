Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D77B3FD201
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 05:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241862AbhIADu0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Aug 2021 23:50:26 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:1590 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241638AbhIADuZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Aug 2021 23:50:25 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1813U73P045171;
        Wed, 1 Sep 2021 11:30:07 +0800 (GMT-8)
        (envelope-from neal_liu@aspeedtech.com)
Received: from NealLiu-PC01.aspeed.com (192.168.2.78) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 11:49:08 +0800
From:   neal_liu <neal_liu@aspeedtech.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tony Prisk <linux@prisktech.co.nz>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <neal_liu@aspeedtech.com>, Tao Ren <rentao.bupt@gmail.com>,
        <BMC-SW@aspeedtech.com>
Subject: [PATCH v2] usb: ehci: handshake CMD_RUN instead of STS_HALT
Date:   Wed, 1 Sep 2021 11:50:41 +0800
Message-ID: <20210901035041.10810-1-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.78]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1813U73P045171
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Retitle.

For Aspeed, HCHalted status depends on not only Run/Stop but also
ASS/PSS status.
Handshake CMD_RUN on startup instead.

Signed-off-by: neal_liu <neal_liu@aspeedtech.com>
---
 drivers/usb/host/ehci-hcd.c      | 11 ++++++++++-
 drivers/usb/host/ehci-platform.c |  6 ++++++
 drivers/usb/host/ehci.h          |  1 +
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 10b0365f3439..01c022e46aa2 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -634,7 +634,16 @@ static int ehci_run (struct usb_hcd *hcd)
 	/* Wait until HC become operational */
 	ehci_readl(ehci, &ehci->regs->command);	/* unblock posted writes */
 	msleep(5);
-	rc = ehci_handshake(ehci, &ehci->regs->status, STS_HALT, 0, 100 * 1000);
+
+	/* For Aspeed, STS_HALT also depends on ASS/PSS status.
+	 * Skip this check on startup.
+	 */
+	if (ehci->is_aspeed)
+		rc = ehci_handshake(ehci, &ehci->regs->command, CMD_RUN,
+				    1, 100 * 1000);
+	else
+		rc = ehci_handshake(ehci, &ehci->regs->status, STS_HALT,
+				    0, 100 * 1000);
 
 	up_write(&ehci_cf_port_reset_rwsem);
 
diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index c70f2d0b4aaf..c3dc906274d9 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -297,6 +297,12 @@ static int ehci_platform_probe(struct platform_device *dev)
 					  "has-transaction-translator"))
 			hcd->has_tt = 1;
 
+		if (of_device_is_compatible(dev->dev.of_node,
+					    "aspeed,ast2500-ehci") ||
+		    of_device_is_compatible(dev->dev.of_node,
+					    "aspeed,ast2600-ehci"))
+			ehci->is_aspeed = 1;
+
 		if (soc_device_match(quirk_poll_match))
 			priv->quirk_poll = true;
 
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index 80bb823aa9fe..fdd073cc053b 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -219,6 +219,7 @@ struct ehci_hcd {			/* one per controller */
 	unsigned		need_oc_pp_cycle:1; /* MPC834X port power */
 	unsigned		imx28_write_fix:1; /* For Freescale i.MX28 */
 	unsigned		spurious_oc:1;
+	unsigned		is_aspeed:1;
 
 	/* required for usb32 quirk */
 	#define OHCI_CTRL_HCFS          (3 << 6)
-- 
2.17.1


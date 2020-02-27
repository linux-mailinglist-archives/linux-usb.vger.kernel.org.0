Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4CD171534
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 11:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgB0KmU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 05:42:20 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44965 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728729AbgB0KmU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 05:42:20 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7GcR-0003f6-Ay; Thu, 27 Feb 2020 11:42:15 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7GcP-0004nj-5g; Thu, 27 Feb 2020 11:42:13 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Peter.Chen@nxp.com, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, linux-imx@nxp.com, stern@rowland.harvard.edu,
        jun.li@freescale.com
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 1/3] USB: ehci-hub: let port_power() override the ehci_port_power()
Date:   Thu, 27 Feb 2020 11:42:10 +0100
Message-Id: <20200227104212.12562-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227104212.12562-1-m.felsch@pengutronix.de>
References: <20200227104212.12562-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit 11a7e5940514 ("usb: ehci: add ehci_port_power interface")
drivers can add a port_power() override callback. Currently the
ChipIdea host driver is the only one using the callback to support gpio
controlled vbus enable/disable. Then commit 6adb9b7b5fb6 ("usb: chipidea:
add a flag for turn on vbus early for host") and commit 659459174188
("usb: chipidea: host: turn on vbus before add hcd if early vbus on is
required") adding a workaround to address the current core behaviour.
Since that the gpio based port-power is broken which was the only
use-case for this callback.

We should let the override callback override the core behaviour to avoid
adding local workarounds needed to address the core behaviour.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/host/ehci-hub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index ce0eaf7d7c12..12b8c9055ab3 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -1338,13 +1338,13 @@ static int ehci_port_power(struct ehci_hcd *ehci, int portnum, bool enable)
 	u32 __iomem *status_reg = &ehci->regs->port_status[portnum];
 	u32 temp = ehci_readl(ehci, status_reg) & ~PORT_RWC_BITS;
 
+	if (hcd->driver->port_power)
+		return hcd->driver->port_power(hcd, portnum, enable);
+
 	if (enable)
 		ehci_writel(ehci, temp | PORT_POWER, status_reg);
 	else
 		ehci_writel(ehci, temp & ~PORT_POWER, status_reg);
 
-	if (hcd->driver->port_power)
-		hcd->driver->port_power(hcd, portnum, enable);
-
 	return 0;
 }
-- 
2.20.1


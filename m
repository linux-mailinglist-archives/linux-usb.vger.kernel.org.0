Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4857C0CD
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2019 14:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbfGaMLz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Jul 2019 08:11:55 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:35385 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfGaMLz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Jul 2019 08:11:55 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 217C71C0002;
        Wed, 31 Jul 2019 12:11:52 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RESEND PATCH] usb: host: xhci-plat: Prevent an abnormally restrictive PHY init skipping
Date:   Wed, 31 Jul 2019 14:11:50 +0200
Message-Id: <20190731121150.2253-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the past, USB PHY handling has been moved in the HCD core. Some
host controller drivers needing more control of the PHYs, they have
been granted the freedom to handle themselves the PHY states and to
prevent the HCD core to do so in commit 4e88d4c08301 ("usb: add a flag
to skip PHY initialization to struct usb_hcd"). With this change, any
USB host controller could set the hcd->skip_phy_initialization flag so
that the HCD core would just skip the PHY initialization sequence.

However, in the USB subsystem, there are currently two entirely
different forms of PHY: one is called 'usb_phy' and is
USB-subsystem-wide, while there is also the generic and kernel-wide
'phy' from the (recent) generic PHY framework.

When the commit above was introduced, both type of PHYs where handled
by the HCD core.

Later, commit bc40f5341741 ("USB: core: hcd: drop support for legacy
phys") removed the support for the former type of PHYs in the HCD
core. These 'usb_phy' are still present though, but managed from the
controller drivers only. Hence, setting the
hcd->skip_phy_initialization flag just because a 'usb_phy' is
initialized by a controller driver is a non-sense.

For instance on Armada CP110, a 'usb_phy' is there to enable the power
supply to the USB host, while there is also a COMPHY block providing
SERDES lanes configuration that is referenced as a PHY from the common
PHY framework.

Right now, users of the xhci-plat.c driver either use a 'usb_phy' only
and do not care about the attempt of generic PHY initialization within
the HCD core (as there is none); or they use a single 'phy' and the
code flow does not pass through the block setting
hcd->skip_phy_initialization anyway.

While there is not users of both PHY types at the same time, drop this
limitation from the xhci-plat.c driver. Note that the tegra driver
probably has the same limitation and could definitely benefit from a
similar change.

Cc: Johan Hovold <johan@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---

Hello Greg, I am resending this patch as I think it got lost. Just
added Acked-by tag from Martin.

Cheers,
Miquèl

 drivers/usb/host/xhci-plat.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 998241f5fce3..a1e5ce484bf8 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -307,7 +307,6 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		ret = usb_phy_init(hcd->usb_phy);
 		if (ret)
 			goto put_usb3_hcd;
-		hcd->skip_phy_initialization = 1;
 	}
 
 	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
-- 
2.20.1


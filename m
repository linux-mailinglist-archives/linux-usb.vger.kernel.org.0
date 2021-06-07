Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE7D739D747
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 10:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhFGI3i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 04:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbhFGI32 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 04:29:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39659C0613A2
        for <linux-usb@vger.kernel.org>; Mon,  7 Jun 2021 01:27:37 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lqAbc-0004fJ-3X; Mon, 07 Jun 2021 10:27:32 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lqAbb-0006ob-Cm; Mon, 07 Jun 2021 10:27:31 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH net-next v2 8/8] usbnet: run unbind() before unregister_netdev()
Date:   Mon,  7 Jun 2021 10:27:27 +0200
Message-Id: <20210607082727.26045-9-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210607082727.26045-1-o.rempel@pengutronix.de>
References: <20210607082727.26045-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

unbind() is the proper place to disconnect PHY, but it will fail if
netdev is already unregistered.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/usb/usbnet.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index ecf62849f4c1..57a5a025255c 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -1597,6 +1597,9 @@ void usbnet_disconnect (struct usb_interface *intf)
 		   xdev->bus->bus_name, xdev->devpath,
 		   dev->driver_info->description);
 
+	if (dev->driver_info->unbind)
+		dev->driver_info->unbind(dev, intf);
+
 	net = dev->net;
 	unregister_netdev (net);
 
@@ -1604,9 +1607,6 @@ void usbnet_disconnect (struct usb_interface *intf)
 
 	usb_scuttle_anchored_urbs(&dev->deferred);
 
-	if (dev->driver_info->unbind)
-		dev->driver_info->unbind (dev, intf);
-
 	usb_kill_urb(dev->interrupt);
 	usb_free_urb(dev->interrupt);
 	kfree(dev->padding_pkt);
-- 
2.29.2


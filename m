Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A52B5110BD
	for <lists+linux-usb@lfdr.de>; Wed, 27 Apr 2022 07:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357932AbiD0GAw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Apr 2022 02:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357916AbiD0GAv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Apr 2022 02:00:51 -0400
X-Greylist: delayed 490 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 26 Apr 2022 22:57:41 PDT
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4792DD57;
        Tue, 26 Apr 2022 22:57:41 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by mailout1.hostsharing.net (Postfix) with ESMTPS id DBB1110057928;
        Wed, 27 Apr 2022 07:57:39 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id AA58E61ABA99;
        Wed, 27 Apr 2022 07:57:39 +0200 (CEST)
X-Mailbox-Line: From ca65428c57c0b15ead00c92decb9b4a01a0fa81f Mon Sep 17 00:00:00 2001
Message-Id: <ca65428c57c0b15ead00c92decb9b4a01a0fa81f.1651037513.git.lukas@wunner.de>
In-Reply-To: <cover.1651037513.git.lukas@wunner.de>
References: <cover.1651037513.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Wed, 27 Apr 2022 07:48:01 +0200
Subject: [PATCH net-next 1/7] usbnet: Run unregister_netdev() before unbind()
 again
To:     Steve Glendinning <steve.glendinning@shawell.net>,
        UNGLinuxDriver@microchip.com, Oliver Neukum <oneukum@suse.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        Andre Edich <andre.edich@microchip.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Martyn Welch <martyn.welch@collabora.com>,
        Gabriel Hojda <ghojda@yo2urs.ro>,
        Christoph Fritz <chf.fritz@googlemail.com>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Russell King <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 2c9d6c2b871d ("usbnet: run unbind() before unregister_netdev()")
sought to fix a use-after-free on disconnect of USB Ethernet adapters.

It turns out that a different fix is necessary to address the issue:
https://lore.kernel.org/netdev/18b3541e5372bc9b9fc733d422f4e698c089077c.1650177997.git.lukas@wunner.de/

So the commit was not necessary.

The commit made binding and unbinding of USB Ethernet asymmetrical:
Before, usbnet_probe() first invoked the ->bind() callback and then
register_netdev().  usbnet_disconnect() mirrored that by first invoking
unregister_netdev() and then ->unbind().

Since the commit, the order in usbnet_disconnect() is reversed and no
longer mirrors usbnet_probe().

One consequence is that a PHY disconnected (and stopped) in ->unbind()
is afterwards stopped once more by unregister_netdev() as it closes the
netdev before unregistering.  That necessitates a contortion in ->stop()
because the PHY may only be stopped if it hasn't already been
disconnected.

Reverting the commit allows making the call to phy_stop() unconditional
in ->stop().

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Martyn Welch <martyn.welch@collabora.com>
Cc: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/usb/asix_devices.c | 6 +-----
 drivers/net/usb/smsc95xx.c     | 3 +--
 drivers/net/usb/usbnet.c       | 6 +++---
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/net/usb/asix_devices.c b/drivers/net/usb/asix_devices.c
index 38e47a93fb83..5b5eb630c4b7 100644
--- a/drivers/net/usb/asix_devices.c
+++ b/drivers/net/usb/asix_devices.c
@@ -795,11 +795,7 @@ static int ax88772_stop(struct usbnet *dev)
 {
 	struct asix_common_private *priv = dev->driver_priv;
 
-	/* On unplugged USB, we will get MDIO communication errors and the
-	 * PHY will be set in to PHY_HALTED state.
-	 */
-	if (priv->phydev->state != PHY_HALTED)
-		phy_stop(priv->phydev);
+	phy_stop(priv->phydev);
 
 	return 0;
 }
diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 4ef61f6b85df..edf0492ad489 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -1243,8 +1243,7 @@ static int smsc95xx_start_phy(struct usbnet *dev)
 
 static int smsc95xx_stop(struct usbnet *dev)
 {
-	if (dev->net->phydev)
-		phy_stop(dev->net->phydev);
+	phy_stop(dev->net->phydev);
 
 	return 0;
 }
diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 9a6450f796dc..36b24ec11650 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -1616,9 +1616,6 @@ void usbnet_disconnect (struct usb_interface *intf)
 		   xdev->bus->bus_name, xdev->devpath,
 		   dev->driver_info->description);
 
-	if (dev->driver_info->unbind)
-		dev->driver_info->unbind(dev, intf);
-
 	net = dev->net;
 	unregister_netdev (net);
 
@@ -1626,6 +1623,9 @@ void usbnet_disconnect (struct usb_interface *intf)
 
 	usb_scuttle_anchored_urbs(&dev->deferred);
 
+	if (dev->driver_info->unbind)
+		dev->driver_info->unbind(dev, intf);
+
 	usb_kill_urb(dev->interrupt);
 	usb_free_urb(dev->interrupt);
 	kfree(dev->padding_pkt);
-- 
2.35.2


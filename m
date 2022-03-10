Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E81024D4621
	for <lists+linux-usb@lfdr.de>; Thu, 10 Mar 2022 12:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241771AbiCJLps (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Mar 2022 06:45:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241723AbiCJLpq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Mar 2022 06:45:46 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CA224F2D
        for <linux-usb@vger.kernel.org>; Thu, 10 Mar 2022 03:44:45 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1nSHDh-0001NQ-34; Thu, 10 Mar 2022 12:44:37 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1nSHDf-00EXY3-E0; Thu, 10 Mar 2022 12:44:35 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, paskripkin@gmail.com
Subject: [PATCH net-next v1 3/4] net: usb: asix: make use of mdiobus_get_phy and phy_connect_direct
Date:   Thu, 10 Mar 2022 12:44:33 +0100
Message-Id: <20220310114434.3465481-3-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220310114434.3465481-1-o.rempel@pengutronix.de>
References: <20220310114434.3465481-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In most cases we use own mdio bus, there is no need to create and store
string for the PHY address.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/usb/asix.h         |  1 -
 drivers/net/usb/asix_devices.c | 19 ++++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/usb/asix.h b/drivers/net/usb/asix.h
index 691f37f45238..072760d76a72 100644
--- a/drivers/net/usb/asix.h
+++ b/drivers/net/usb/asix.h
@@ -184,7 +184,6 @@ struct asix_common_private {
 	struct mii_bus *mdio;
 	struct phy_device *phydev;
 	u16 phy_addr;
-	char phy_name[20];
 	bool embd_phy;
 	u8 chipcode;
 };
diff --git a/drivers/net/usb/asix_devices.c b/drivers/net/usb/asix_devices.c
index 34622c1adacf..fb617eb551bb 100644
--- a/drivers/net/usb/asix_devices.c
+++ b/drivers/net/usb/asix_devices.c
@@ -661,15 +661,16 @@ static int ax88772_init_phy(struct usbnet *dev)
 	struct asix_common_private *priv = dev->driver_priv;
 	int ret;
 
-	snprintf(priv->phy_name, sizeof(priv->phy_name), PHY_ID_FMT,
-		 priv->mdio->id, priv->phy_addr);
-
-	priv->phydev = phy_connect(dev->net, priv->phy_name, &asix_adjust_link,
-				   PHY_INTERFACE_MODE_INTERNAL);
-	if (IS_ERR(priv->phydev)) {
-		netdev_err(dev->net, "Could not connect to PHY device %s\n",
-			   priv->phy_name);
-		ret = PTR_ERR(priv->phydev);
+	priv->phydev = mdiobus_get_phy(priv->mdio, priv->phy_addr);
+	if (!priv->phydev) {
+		netdev_err(dev->net, "Could not find PHY\n");
+		return -ENODEV;
+	}
+
+	ret = phy_connect_direct(dev->net, priv->phydev, &asix_adjust_link,
+				 PHY_INTERFACE_MODE_INTERNAL);
+	if (ret) {
+		netdev_err(dev->net, "Could not connect PHY\n");
 		return ret;
 	}
 
-- 
2.30.2


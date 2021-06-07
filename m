Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC54939D742
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 10:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhFGI3e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 04:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbhFGI31 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 04:29:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B48C061280
        for <linux-usb@vger.kernel.org>; Mon,  7 Jun 2021 01:27:36 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lqAbb-0004fG-QX; Mon, 07 Jun 2021 10:27:31 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lqAbb-0006oA-A2; Mon, 07 Jun 2021 10:27:31 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH net-next v2 5/8] net: usb: asix: ax88772: add generic selftest support
Date:   Mon,  7 Jun 2021 10:27:24 +0200
Message-Id: <20210607082727.26045-6-o.rempel@pengutronix.de>
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

With working phylib support we are able now to use generic selftests.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/usb/Kconfig        |  1 +
 drivers/net/usb/asix.h         |  1 +
 drivers/net/usb/asix_devices.c | 23 +++++++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
index 6f7be47974f6..4c5d69732a7e 100644
--- a/drivers/net/usb/Kconfig
+++ b/drivers/net/usb/Kconfig
@@ -165,6 +165,7 @@ config USB_NET_AX8817X
 	select CRC32
 	select PHYLIB
 	select AX88796B_PHY
+	imply NET_SELFTESTS
 	default y
 	help
 	  This option adds support for ASIX AX88xxx based USB 2.0
diff --git a/drivers/net/usb/asix.h b/drivers/net/usb/asix.h
index 2122d302e643..e1994a246122 100644
--- a/drivers/net/usb/asix.h
+++ b/drivers/net/usb/asix.h
@@ -26,6 +26,7 @@
 #include <linux/slab.h>
 #include <linux/if_vlan.h>
 #include <linux/phy.h>
+#include <net/selftests.h>
 
 #define DRIVER_VERSION "22-Dec-2011"
 #define DRIVER_NAME "asix"
diff --git a/drivers/net/usb/asix_devices.c b/drivers/net/usb/asix_devices.c
index e4cd85e38edd..57dafb3262d9 100644
--- a/drivers/net/usb/asix_devices.c
+++ b/drivers/net/usb/asix_devices.c
@@ -283,6 +283,26 @@ static int ax88172_bind(struct usbnet *dev, struct usb_interface *intf)
 	return ret;
 }
 
+static void ax88772_ethtool_get_strings(struct net_device *netdev, u32 sset,
+					u8 *data)
+{
+	switch (sset) {
+	case ETH_SS_TEST:
+		net_selftest_get_strings(data);
+		break;
+	}
+}
+
+static int ax88772_ethtool_get_sset_count(struct net_device *ndev, int sset)
+{
+	switch (sset) {
+	case ETH_SS_TEST:
+		return net_selftest_get_count();
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static const struct ethtool_ops ax88772_ethtool_ops = {
 	.get_drvinfo		= asix_get_drvinfo,
 	.get_link		= usbnet_get_link,
@@ -296,6 +316,9 @@ static const struct ethtool_ops ax88772_ethtool_ops = {
 	.nway_reset		= phy_ethtool_nway_reset,
 	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
 	.set_link_ksettings	= phy_ethtool_set_link_ksettings,
+	.self_test		= net_selftest,
+	.get_strings		= ax88772_ethtool_get_strings,
+	.get_sset_count		= ax88772_ethtool_get_sset_count,
 };
 
 static int ax88772_reset(struct usbnet *dev)
-- 
2.29.2


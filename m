Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0189A2FEAE8
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jan 2021 13:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731450AbhAUM7V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 07:59:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:59710 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731513AbhAUM6a (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Jan 2021 07:58:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1611233861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rpSmmM4Ww3dVAgfCjQxyw/nfT9rcJuPpuglcsZtKGRM=;
        b=nmM0/TkvOLNbz2BgrX87hjXLQVBWtcUREmMhk4mOukL80HQ2A+ebtFLTVpobAOchS80CV5
        XxGls7321R3+pitoAkKVt0mw5r/ucyvhFCc1GfzEVZnTh7ozOKl5DvdV59U2oZhn5Qpol7
        nR6YvLegQaqmwnNaNBWw+M6VMTnNRa0=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6FC9BADC4;
        Thu, 21 Jan 2021 12:57:41 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     hayeswang@realtek.com, grundler@chromium.org, davem@davemloft.net,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>, Roland Dreier <roland@kernel.org>
Subject: [PATCHv2 1/3] usbnet: specify naming of usbnet_set/get_link_ksettings
Date:   Thu, 21 Jan 2021 13:57:29 +0100
Message-Id: <20210121125731.19425-2-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121125731.19425-1-oneukum@suse.com>
References: <20210121125731.19425-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The old generic functions assume that the devices includes
an MDIO interface. This is true only for genuine ethernet.
Devices with a higher level of abstraction or based on different
technologies do not have it. So in preparation for
supporting that, we rename the old functions to something specific.

v2: adjusted to recent changes

Signed-off-by : Oliver Neukum <oneukum@suse.com>
Tested-by: Roland Dreier <roland@kernel.org>
---
 drivers/net/usb/asix_devices.c | 12 ++++++------
 drivers/net/usb/cdc_ncm.c      |  4 ++--
 drivers/net/usb/dm9601.c       |  4 ++--
 drivers/net/usb/mcs7830.c      |  4 ++--
 drivers/net/usb/sierra_net.c   |  4 ++--
 drivers/net/usb/smsc75xx.c     |  4 ++--
 drivers/net/usb/sr9700.c       |  4 ++--
 drivers/net/usb/sr9800.c       |  4 ++--
 drivers/net/usb/usbnet.c       | 15 +++++++++------
 include/linux/usb/usbnet.h     |  4 ++--
 10 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/net/usb/asix_devices.c b/drivers/net/usb/asix_devices.c
index 6e13d8165852..f5006890873d 100644
--- a/drivers/net/usb/asix_devices.c
+++ b/drivers/net/usb/asix_devices.c
@@ -125,8 +125,8 @@ static const struct ethtool_ops ax88172_ethtool_ops = {
 	.get_eeprom		= asix_get_eeprom,
 	.set_eeprom		= asix_set_eeprom,
 	.nway_reset		= usbnet_nway_reset,
-	.get_link_ksettings	= usbnet_get_link_ksettings,
-	.set_link_ksettings	= usbnet_set_link_ksettings,
+	.get_link_ksettings	= usbnet_get_link_ksettings_mdio,
+	.set_link_ksettings	= usbnet_set_link_ksettings_mdio,
 };
 
 static void ax88172_set_multicast(struct net_device *net)
@@ -291,8 +291,8 @@ static const struct ethtool_ops ax88772_ethtool_ops = {
 	.get_eeprom		= asix_get_eeprom,
 	.set_eeprom		= asix_set_eeprom,
 	.nway_reset		= usbnet_nway_reset,
-	.get_link_ksettings	= usbnet_get_link_ksettings,
-	.set_link_ksettings	= usbnet_set_link_ksettings,
+	.get_link_ksettings	= usbnet_get_link_ksettings_mdio,
+	.set_link_ksettings	= usbnet_set_link_ksettings_mdio,
 };
 
 static int ax88772_link_reset(struct usbnet *dev)
@@ -782,8 +782,8 @@ static const struct ethtool_ops ax88178_ethtool_ops = {
 	.get_eeprom		= asix_get_eeprom,
 	.set_eeprom		= asix_set_eeprom,
 	.nway_reset		= usbnet_nway_reset,
-	.get_link_ksettings	= usbnet_get_link_ksettings,
-	.set_link_ksettings	= usbnet_set_link_ksettings,
+	.get_link_ksettings	= usbnet_get_link_ksettings_mdio,
+	.set_link_ksettings	= usbnet_set_link_ksettings_mdio,
 };
 
 static int marvell_phy_init(struct usbnet *dev)
diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 291e76d32abe..04174704bf7c 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -142,8 +142,8 @@ static const struct ethtool_ops cdc_ncm_ethtool_ops = {
 	.get_sset_count    = cdc_ncm_get_sset_count,
 	.get_strings       = cdc_ncm_get_strings,
 	.get_ethtool_stats = cdc_ncm_get_ethtool_stats,
-	.get_link_ksettings      = usbnet_get_link_ksettings,
-	.set_link_ksettings      = usbnet_set_link_ksettings,
+	.get_link_ksettings      = usbnet_get_link_ksettings_mdio,
+	.set_link_ksettings      = usbnet_set_link_ksettings_mdio,
 };
 
 static u32 cdc_ncm_check_rx_max(struct usbnet *dev, u32 new_rx)
diff --git a/drivers/net/usb/dm9601.c b/drivers/net/usb/dm9601.c
index b5d2ac55a874..9065aa13540b 100644
--- a/drivers/net/usb/dm9601.c
+++ b/drivers/net/usb/dm9601.c
@@ -282,8 +282,8 @@ static const struct ethtool_ops dm9601_ethtool_ops = {
 	.get_eeprom_len	= dm9601_get_eeprom_len,
 	.get_eeprom	= dm9601_get_eeprom,
 	.nway_reset	= usbnet_nway_reset,
-	.get_link_ksettings	= usbnet_get_link_ksettings,
-	.set_link_ksettings	= usbnet_set_link_ksettings,
+	.get_link_ksettings	= usbnet_get_link_ksettings_mdio,
+	.set_link_ksettings	= usbnet_set_link_ksettings_mdio,
 };
 
 static void dm9601_set_multicast(struct net_device *net)
diff --git a/drivers/net/usb/mcs7830.c b/drivers/net/usb/mcs7830.c
index fc512b780d15..c52f52b1e619 100644
--- a/drivers/net/usb/mcs7830.c
+++ b/drivers/net/usb/mcs7830.c
@@ -452,8 +452,8 @@ static const struct ethtool_ops mcs7830_ethtool_ops = {
 	.get_msglevel		= usbnet_get_msglevel,
 	.set_msglevel		= usbnet_set_msglevel,
 	.nway_reset		= usbnet_nway_reset,
-	.get_link_ksettings	= usbnet_get_link_ksettings,
-	.set_link_ksettings	= usbnet_set_link_ksettings,
+	.get_link_ksettings	= usbnet_get_link_ksettings_mdio,
+	.set_link_ksettings	= usbnet_set_link_ksettings_mdio,
 };
 
 static const struct net_device_ops mcs7830_netdev_ops = {
diff --git a/drivers/net/usb/sierra_net.c b/drivers/net/usb/sierra_net.c
index 55a244eca5ca..cbab5c9f19b8 100644
--- a/drivers/net/usb/sierra_net.c
+++ b/drivers/net/usb/sierra_net.c
@@ -629,8 +629,8 @@ static const struct ethtool_ops sierra_net_ethtool_ops = {
 	.get_msglevel = usbnet_get_msglevel,
 	.set_msglevel = usbnet_set_msglevel,
 	.nway_reset = usbnet_nway_reset,
-	.get_link_ksettings = usbnet_get_link_ksettings,
-	.set_link_ksettings = usbnet_set_link_ksettings,
+	.get_link_ksettings = usbnet_get_link_ksettings_mdio,
+	.set_link_ksettings = usbnet_set_link_ksettings_mdio,
 };
 
 static int sierra_net_get_fw_attr(struct usbnet *dev, u16 *datap)
diff --git a/drivers/net/usb/smsc75xx.c b/drivers/net/usb/smsc75xx.c
index 4353b370249f..e4c6c7f3c69b 100644
--- a/drivers/net/usb/smsc75xx.c
+++ b/drivers/net/usb/smsc75xx.c
@@ -741,8 +741,8 @@ static const struct ethtool_ops smsc75xx_ethtool_ops = {
 	.set_eeprom	= smsc75xx_ethtool_set_eeprom,
 	.get_wol	= smsc75xx_ethtool_get_wol,
 	.set_wol	= smsc75xx_ethtool_set_wol,
-	.get_link_ksettings	= usbnet_get_link_ksettings,
-	.set_link_ksettings	= usbnet_set_link_ksettings,
+	.get_link_ksettings	= usbnet_get_link_ksettings_mdio,
+	.set_link_ksettings	= usbnet_set_link_ksettings_mdio,
 };
 
 static int smsc75xx_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
diff --git a/drivers/net/usb/sr9700.c b/drivers/net/usb/sr9700.c
index 878557ad03ad..e552ab95ced2 100644
--- a/drivers/net/usb/sr9700.c
+++ b/drivers/net/usb/sr9700.c
@@ -250,8 +250,8 @@ static const struct ethtool_ops sr9700_ethtool_ops = {
 	.get_eeprom_len	= sr9700_get_eeprom_len,
 	.get_eeprom	= sr9700_get_eeprom,
 	.nway_reset	= usbnet_nway_reset,
-	.get_link_ksettings	= usbnet_get_link_ksettings,
-	.set_link_ksettings	= usbnet_set_link_ksettings,
+	.get_link_ksettings	= usbnet_get_link_ksettings_mdio,
+	.set_link_ksettings	= usbnet_set_link_ksettings_mdio,
 };
 
 static void sr9700_set_multicast(struct net_device *netdev)
diff --git a/drivers/net/usb/sr9800.c b/drivers/net/usb/sr9800.c
index da56735d7755..b466d53047c5 100644
--- a/drivers/net/usb/sr9800.c
+++ b/drivers/net/usb/sr9800.c
@@ -527,8 +527,8 @@ static const struct ethtool_ops sr9800_ethtool_ops = {
 	.get_eeprom_len	= sr_get_eeprom_len,
 	.get_eeprom	= sr_get_eeprom,
 	.nway_reset	= usbnet_nway_reset,
-	.get_link_ksettings	= usbnet_get_link_ksettings,
-	.set_link_ksettings	= usbnet_set_link_ksettings,
+	.get_link_ksettings	= usbnet_get_link_ksettings_mdio,
+	.set_link_ksettings	= usbnet_set_link_ksettings_mdio,
 };
 
 static int sr9800_link_reset(struct usbnet *dev)
diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 1447da1d5729..e2ca88259b05 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -944,7 +944,10 @@ EXPORT_SYMBOL_GPL(usbnet_open);
  * they'll probably want to use this base set.
  */
 
-int usbnet_get_link_ksettings(struct net_device *net,
+/* These methods are written on the assumption that the device
+ * uses MII
+ */
+int usbnet_get_link_ksettings_mdio(struct net_device *net,
 			      struct ethtool_link_ksettings *cmd)
 {
 	struct usbnet *dev = netdev_priv(net);
@@ -956,9 +959,9 @@ int usbnet_get_link_ksettings(struct net_device *net,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(usbnet_get_link_ksettings);
+EXPORT_SYMBOL_GPL(usbnet_get_link_ksettings_mdio);
 
-int usbnet_set_link_ksettings(struct net_device *net,
+int usbnet_set_link_ksettings_mdio(struct net_device *net,
 			      const struct ethtool_link_ksettings *cmd)
 {
 	struct usbnet *dev = netdev_priv(net);
@@ -978,7 +981,7 @@ int usbnet_set_link_ksettings(struct net_device *net,
 
 	return retval;
 }
-EXPORT_SYMBOL_GPL(usbnet_set_link_ksettings);
+EXPORT_SYMBOL_GPL(usbnet_set_link_ksettings_mdio);
 
 u32 usbnet_get_link (struct net_device *net)
 {
@@ -1043,8 +1046,8 @@ static const struct ethtool_ops usbnet_ethtool_ops = {
 	.get_msglevel		= usbnet_get_msglevel,
 	.set_msglevel		= usbnet_set_msglevel,
 	.get_ts_info		= ethtool_op_get_ts_info,
-	.get_link_ksettings	= usbnet_get_link_ksettings,
-	.set_link_ksettings	= usbnet_set_link_ksettings,
+	.get_link_ksettings	= usbnet_get_link_ksettings_mdio,
+	.set_link_ksettings	= usbnet_set_link_ksettings_mdio,
 };
 
 /*-------------------------------------------------------------------------*/
diff --git a/include/linux/usb/usbnet.h b/include/linux/usb/usbnet.h
index cfbfd6fe01df..fd65b7a5ee15 100644
--- a/include/linux/usb/usbnet.h
+++ b/include/linux/usb/usbnet.h
@@ -267,9 +267,9 @@ extern void usbnet_pause_rx(struct usbnet *);
 extern void usbnet_resume_rx(struct usbnet *);
 extern void usbnet_purge_paused_rxq(struct usbnet *);
 
-extern int usbnet_get_link_ksettings(struct net_device *net,
+extern int usbnet_get_link_ksettings_mdio(struct net_device *net,
 				     struct ethtool_link_ksettings *cmd);
-extern int usbnet_set_link_ksettings(struct net_device *net,
+extern int usbnet_set_link_ksettings_mdio(struct net_device *net,
 				     const struct ethtool_link_ksettings *cmd);
 extern u32 usbnet_get_link(struct net_device *net);
 extern u32 usbnet_get_msglevel(struct net_device *);
-- 
2.26.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7473F697A
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 21:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbhHXTFH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 15:05:07 -0400
Received: from common.maple.relay.mailchannels.net ([23.83.214.38]:32365 "EHLO
        common.maple.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231745AbhHXTFH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Aug 2021 15:05:07 -0400
X-Greylist: delayed 410 seconds by postgrey-1.27 at vger.kernel.org; Tue, 24 Aug 2021 15:04:57 EDT
X-Sender-Id: 9wt3zsp42r|x-authuser|john.efstathiades@pebblebay.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id A95986E0889;
        Tue, 24 Aug 2021 18:57:22 +0000 (UTC)
Received: from ares.krystal.co.uk (unknown [127.0.0.6])
        (Authenticated sender: 9wt3zsp42r)
        by relay.mailchannels.net (Postfix) with ESMTPA id D85F76E07CD;
        Tue, 24 Aug 2021 18:57:20 +0000 (UTC)
X-Sender-Id: 9wt3zsp42r|x-authuser|john.efstathiades@pebblebay.com
Received: from ares.krystal.co.uk (ares.krystal.co.uk [77.72.0.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
        by 100.112.147.70 (trex/6.4.3);
        Tue, 24 Aug 2021 18:57:22 +0000
X-MC-Relay: Bad
X-MailChannels-SenderId: 9wt3zsp42r|x-authuser|john.efstathiades@pebblebay.com
X-MailChannels-Auth-Id: 9wt3zsp42r
X-White-Harbor: 6b693d07422a2cd6_1629831442304_4011853794
X-MC-Loop-Signature: 1629831442304:3815336945
X-MC-Ingress-Time: 1629831442303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=pebblebay.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TFM+9g+rZht7Uajs3wpH1aVdx3KMy4F2dgLcw/cgJO0=; b=zhqR9malWLthRt+lHBGWtAccQM
        b2IE2UFXbl+lz4oBkZWRoSI10NKSf5F2AkOxXvyNAo+5+G40EVol20gviDXJvHtULumE0/ufRq1hG
        PMCPuJJa3ef4gz4xpy77dsoND+eIgbgHywXiM0vwjHunEqsjmcx9ixrB6dfDF84uTTF3/2lraeNFR
        aj26WhnkLFoNWRCTMm/yeNZ27MdMfc6Pk/e+KD4T0BAkyufwaoHMiE2uu/S+myi3XTTenHT7YikRt
        MVkMGE9fUNmn8tBFl61n04RUYxldNoqIIctpWwG2Xw0iSkV04r+YygDbyvJWkLh7b8lDWDcWUvqnB
        Hxq3I8Ew==;
Received: from cpc160185-warw19-2-0-cust743.3-2.cable.virginm.net ([82.21.62.232]:51816 helo=pbcl-dsk9.pebblebay.com)
        by ares.krystal.co.uk with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <john.efstathiades@pebblebay.com>)
        id 1mIbbr-00BQSi-TJ; Tue, 24 Aug 2021 19:57:18 +0100
From:   John Efstathiades <john.efstathiades@pebblebay.com>
Cc:     UNGLinuxDriver@microchip.com, woojung.huh@microchip.com,
        davem@davemloft.net, netdev@vger.kernel.org, kuba@kernel.org,
        linux-usb@vger.kernel.org, john.efstathiades@pebblebay.com
Subject: [PATCH net-next v2 05/10] lan78xx: Add missing return code checks
Date:   Tue, 24 Aug 2021 19:56:08 +0100
Message-Id: <20210824185613.49545-6-john.efstathiades@pebblebay.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824185613.49545-1-john.efstathiades@pebblebay.com>
References: <20210824185613.49545-1-john.efstathiades@pebblebay.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: john.efstathiades@pebblebay.com
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are many places in the driver where the return code from a
function call is captured but without a subsequent test of the
return code and appropriate action taken.

This patch adds the missing return code tests and action. In most
cases the action is an early exit from the calling function.

The function lan78xx_set_suspend() was also updated to make it
consistent with lan78xx_suspend().

Signed-off-by: John Efstathiades <john.efstathiades@pebblebay.com>
---
 drivers/net/usb/lan78xx.c | 399 +++++++++++++++++++++++++++++++-------
 1 file changed, 333 insertions(+), 66 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 746aeeaa9d6e..1909d6003453 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1173,7 +1173,7 @@ static int lan78xx_link_reset(struct lan78xx_net *dev)
 	/* clear LAN78xx interrupt status */
 	ret = lan78xx_write_reg(dev, INT_STS, INT_STS_PHY_INT_);
 	if (unlikely(ret < 0))
-		return -EIO;
+		return ret;
 
 	mutex_lock(&phydev->lock);
 	phy_read_status(phydev);
@@ -1186,11 +1186,11 @@ static int lan78xx_link_reset(struct lan78xx_net *dev)
 		/* reset MAC */
 		ret = lan78xx_read_reg(dev, MAC_CR, &buf);
 		if (unlikely(ret < 0))
-			return -EIO;
+			return ret;
 		buf |= MAC_CR_RST_;
 		ret = lan78xx_write_reg(dev, MAC_CR, buf);
 		if (unlikely(ret < 0))
-			return -EIO;
+			return ret;
 
 		del_timer(&dev->stat_monitor);
 	} else if (link && !dev->link_on) {
@@ -1202,18 +1202,30 @@ static int lan78xx_link_reset(struct lan78xx_net *dev)
 			if (ecmd.base.speed == 1000) {
 				/* disable U2 */
 				ret = lan78xx_read_reg(dev, USB_CFG1, &buf);
+				if (ret < 0)
+					return ret;
 				buf &= ~USB_CFG1_DEV_U2_INIT_EN_;
 				ret = lan78xx_write_reg(dev, USB_CFG1, buf);
+				if (ret < 0)
+					return ret;
 				/* enable U1 */
 				ret = lan78xx_read_reg(dev, USB_CFG1, &buf);
+				if (ret < 0)
+					return ret;
 				buf |= USB_CFG1_DEV_U1_INIT_EN_;
 				ret = lan78xx_write_reg(dev, USB_CFG1, buf);
+				if (ret < 0)
+					return ret;
 			} else {
 				/* enable U1 & U2 */
 				ret = lan78xx_read_reg(dev, USB_CFG1, &buf);
+				if (ret < 0)
+					return ret;
 				buf |= USB_CFG1_DEV_U2_INIT_EN_;
 				buf |= USB_CFG1_DEV_U1_INIT_EN_;
 				ret = lan78xx_write_reg(dev, USB_CFG1, buf);
+				if (ret < 0)
+					return ret;
 			}
 		}
 
@@ -1231,6 +1243,8 @@ static int lan78xx_link_reset(struct lan78xx_net *dev)
 
 		ret = lan78xx_update_flowcontrol(dev, ecmd.base.duplex, ladv,
 						 radv);
+		if (ret < 0)
+			return ret;
 
 		if (!timer_pending(&dev->stat_monitor)) {
 			dev->delta = 1;
@@ -1241,7 +1255,7 @@ static int lan78xx_link_reset(struct lan78xx_net *dev)
 		tasklet_schedule(&dev->bh);
 	}
 
-	return ret;
+	return 0;
 }
 
 /* some work can't be done in tasklets, so we use keventd
@@ -2460,23 +2474,33 @@ static void lan78xx_init_ltm(struct lan78xx_net *dev)
 static int lan78xx_reset(struct lan78xx_net *dev)
 {
 	struct lan78xx_priv *pdata = (struct lan78xx_priv *)(dev->data[0]);
-	u32 buf;
-	int ret = 0;
 	unsigned long timeout;
+	int ret;
+	u32 buf;
 	u8 sig;
 
 	ret = lan78xx_read_reg(dev, HW_CFG, &buf);
+	if (ret < 0)
+		return ret;
+
 	buf |= HW_CFG_LRST_;
+
 	ret = lan78xx_write_reg(dev, HW_CFG, buf);
+	if (ret < 0)
+		return ret;
 
 	timeout = jiffies + HZ;
 	do {
 		mdelay(1);
 		ret = lan78xx_read_reg(dev, HW_CFG, &buf);
+		if (ret < 0)
+			return ret;
+
 		if (time_after(jiffies, timeout)) {
 			netdev_warn(dev->net,
 				    "timeout on completion of LiteReset");
-			return -EIO;
+			ret = -ETIMEDOUT;
+			return ret;
 		}
 	} while (buf & HW_CFG_LRST_);
 
@@ -2484,13 +2508,22 @@ static int lan78xx_reset(struct lan78xx_net *dev)
 
 	/* save DEVID for later usage */
 	ret = lan78xx_read_reg(dev, ID_REV, &buf);
+	if (ret < 0)
+		return ret;
+
 	dev->chipid = (buf & ID_REV_CHIP_ID_MASK_) >> 16;
 	dev->chiprev = buf & ID_REV_CHIP_REV_MASK_;
 
 	/* Respond to the IN token with a NAK */
 	ret = lan78xx_read_reg(dev, USB_CFG0, &buf);
+	if (ret < 0)
+		return ret;
+
 	buf |= USB_CFG_BIR_;
+
 	ret = lan78xx_write_reg(dev, USB_CFG0, buf);
+	if (ret < 0)
+		return ret;
 
 	/* Init LTM */
 	lan78xx_init_ltm(dev);
@@ -2513,53 +2546,105 @@ static int lan78xx_reset(struct lan78xx_net *dev)
 	}
 
 	ret = lan78xx_write_reg(dev, BURST_CAP, buf);
+	if (ret < 0)
+		return ret;
+
 	ret = lan78xx_write_reg(dev, BULK_IN_DLY, DEFAULT_BULK_IN_DELAY);
+	if (ret < 0)
+		return ret;
 
 	ret = lan78xx_read_reg(dev, HW_CFG, &buf);
+	if (ret < 0)
+		return ret;
+
 	buf |= HW_CFG_MEF_;
+
 	ret = lan78xx_write_reg(dev, HW_CFG, buf);
+	if (ret < 0)
+		return ret;
 
 	ret = lan78xx_read_reg(dev, USB_CFG0, &buf);
+	if (ret < 0)
+		return ret;
+
 	buf |= USB_CFG_BCE_;
+
 	ret = lan78xx_write_reg(dev, USB_CFG0, buf);
+	if (ret < 0)
+		return ret;
 
 	/* set FIFO sizes */
 	buf = (MAX_RX_FIFO_SIZE - 512) / 512;
+
 	ret = lan78xx_write_reg(dev, FCT_RX_FIFO_END, buf);
+	if (ret < 0)
+		return ret;
 
 	buf = (MAX_TX_FIFO_SIZE - 512) / 512;
+
 	ret = lan78xx_write_reg(dev, FCT_TX_FIFO_END, buf);
+	if (ret < 0)
+		return ret;
 
 	ret = lan78xx_write_reg(dev, INT_STS, INT_STS_CLEAR_ALL_);
+	if (ret < 0)
+		return ret;
+
 	ret = lan78xx_write_reg(dev, FLOW, 0);
+	if (ret < 0)
+		return ret;
+
 	ret = lan78xx_write_reg(dev, FCT_FLOW, 0);
+	if (ret < 0)
+		return ret;
 
 	/* Don't need rfe_ctl_lock during initialisation */
 	ret = lan78xx_read_reg(dev, RFE_CTL, &pdata->rfe_ctl);
+	if (ret < 0)
+		return ret;
+
 	pdata->rfe_ctl |= RFE_CTL_BCAST_EN_ | RFE_CTL_DA_PERFECT_;
+
 	ret = lan78xx_write_reg(dev, RFE_CTL, pdata->rfe_ctl);
+	if (ret < 0)
+		return ret;
 
 	/* Enable or disable checksum offload engines */
-	lan78xx_set_features(dev->net, dev->net->features);
+	ret = lan78xx_set_features(dev->net, dev->net->features);
+	if (ret < 0)
+		return ret;
 
 	lan78xx_set_multicast(dev->net);
 
 	/* reset PHY */
 	ret = lan78xx_read_reg(dev, PMT_CTL, &buf);
+	if (ret < 0)
+		return ret;
+
 	buf |= PMT_CTL_PHY_RST_;
+
 	ret = lan78xx_write_reg(dev, PMT_CTL, buf);
+	if (ret < 0)
+		return ret;
 
 	timeout = jiffies + HZ;
 	do {
 		mdelay(1);
 		ret = lan78xx_read_reg(dev, PMT_CTL, &buf);
+		if (ret < 0)
+			return ret;
+
 		if (time_after(jiffies, timeout)) {
 			netdev_warn(dev->net, "timeout waiting for PHY Reset");
-			return -EIO;
+			ret = -ETIMEDOUT;
+			return ret;
 		}
 	} while ((buf & PMT_CTL_PHY_RST_) || !(buf & PMT_CTL_READY_));
 
 	ret = lan78xx_read_reg(dev, MAC_CR, &buf);
+	if (ret < 0)
+		return ret;
+
 	/* LAN7801 only has RGMII mode */
 	if (dev->chipid == ID_REV_CHIP_ID_7801_)
 		buf &= ~MAC_CR_GMII_EN_;
@@ -2573,25 +2658,53 @@ static int lan78xx_reset(struct lan78xx_net *dev)
 		}
 	}
 	ret = lan78xx_write_reg(dev, MAC_CR, buf);
+	if (ret < 0)
+		return ret;
 
 	ret = lan78xx_read_reg(dev, MAC_TX, &buf);
+	if (ret < 0)
+		return ret;
+
 	buf |= MAC_TX_TXEN_;
+
 	ret = lan78xx_write_reg(dev, MAC_TX, buf);
+	if (ret < 0)
+		return ret;
 
 	ret = lan78xx_read_reg(dev, FCT_TX_CTL, &buf);
+	if (ret < 0)
+		return ret;
+
 	buf |= FCT_TX_CTL_EN_;
+
 	ret = lan78xx_write_reg(dev, FCT_TX_CTL, buf);
+	if (ret < 0)
+		return ret;
 
 	ret = lan78xx_set_rx_max_frame_length(dev,
 					      dev->net->mtu + VLAN_ETH_HLEN);
+	if (ret < 0)
+		return ret;
 
 	ret = lan78xx_read_reg(dev, MAC_RX, &buf);
+	if (ret < 0)
+		return ret;
+
 	buf |= MAC_RX_RXEN_;
+
 	ret = lan78xx_write_reg(dev, MAC_RX, buf);
+	if (ret < 0)
+		return ret;
 
 	ret = lan78xx_read_reg(dev, FCT_RX_CTL, &buf);
+	if (ret < 0)
+		return ret;
+
 	buf |= FCT_RX_CTL_EN_;
+
 	ret = lan78xx_write_reg(dev, FCT_RX_CTL, buf);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
@@ -2629,7 +2742,7 @@ static int lan78xx_open(struct net_device *net)
 
 	ret = usb_autopm_get_interface(dev->intf);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	phy_start(net->phydev);
 
@@ -2657,7 +2770,6 @@ static int lan78xx_open(struct net_device *net)
 done:
 	usb_autopm_put_interface(dev->intf);
 
-out:
 	return ret;
 }
 
@@ -3806,35 +3918,62 @@ static u16 lan78xx_wakeframe_crc16(const u8 *buf, int len)
 
 static int lan78xx_set_suspend(struct lan78xx_net *dev, u32 wol)
 {
-	u32 buf;
-	int mask_index;
-	u16 crc;
-	u32 temp_wucsr;
-	u32 temp_pmt_ctl;
 	const u8 ipv4_multicast[3] = { 0x01, 0x00, 0x5E };
 	const u8 ipv6_multicast[3] = { 0x33, 0x33 };
 	const u8 arp_type[2] = { 0x08, 0x06 };
+	u32 temp_pmt_ctl;
+	int mask_index;
+	u32 temp_wucsr;
+	u32 buf;
+	u16 crc;
+	int ret;
+
+	ret = lan78xx_read_reg(dev, MAC_TX, &buf);
+	if (ret < 0)
+		return ret;
 
-	lan78xx_read_reg(dev, MAC_TX, &buf);
 	buf &= ~MAC_TX_TXEN_;
-	lan78xx_write_reg(dev, MAC_TX, buf);
-	lan78xx_read_reg(dev, MAC_RX, &buf);
+
+	ret = lan78xx_write_reg(dev, MAC_TX, buf);
+	if (ret < 0)
+		return ret;
+
+	ret = lan78xx_read_reg(dev, MAC_RX, &buf);
+	if (ret < 0)
+		return ret;
+
 	buf &= ~MAC_RX_RXEN_;
-	lan78xx_write_reg(dev, MAC_RX, buf);
 
-	lan78xx_write_reg(dev, WUCSR, 0);
-	lan78xx_write_reg(dev, WUCSR2, 0);
-	lan78xx_write_reg(dev, WK_SRC, 0xFFF1FF1FUL);
+	ret = lan78xx_write_reg(dev, MAC_RX, buf);
+	if (ret < 0)
+		return ret;
+
+	ret = lan78xx_write_reg(dev, WUCSR, 0);
+	if (ret < 0)
+		return ret;
+	ret = lan78xx_write_reg(dev, WUCSR2, 0);
+	if (ret < 0)
+		return ret;
+	ret = lan78xx_write_reg(dev, WK_SRC, 0xFFF1FF1FUL);
+	if (ret < 0)
+		return ret;
 
 	temp_wucsr = 0;
 
 	temp_pmt_ctl = 0;
-	lan78xx_read_reg(dev, PMT_CTL, &temp_pmt_ctl);
+
+	ret = lan78xx_read_reg(dev, PMT_CTL, &temp_pmt_ctl);
+	if (ret < 0)
+		return ret;
+
 	temp_pmt_ctl &= ~PMT_CTL_RES_CLR_WKP_EN_;
 	temp_pmt_ctl |= PMT_CTL_RES_CLR_WKP_STS_;
 
-	for (mask_index = 0; mask_index < NUM_OF_WUF_CFG; mask_index++)
-		lan78xx_write_reg(dev, WUF_CFG(mask_index), 0);
+	for (mask_index = 0; mask_index < NUM_OF_WUF_CFG; mask_index++) {
+		ret = lan78xx_write_reg(dev, WUF_CFG(mask_index), 0);
+		if (ret < 0)
+			return ret;
+	}
 
 	mask_index = 0;
 	if (wol & WAKE_PHY) {
@@ -3863,30 +4002,52 @@ static int lan78xx_set_suspend(struct lan78xx_net *dev, u32 wol)
 
 		/* set WUF_CFG & WUF_MASK for IPv4 Multicast */
 		crc = lan78xx_wakeframe_crc16(ipv4_multicast, 3);
-		lan78xx_write_reg(dev, WUF_CFG(mask_index),
-				  WUF_CFGX_EN_ |
-				  WUF_CFGX_TYPE_MCAST_ |
-				  (0 << WUF_CFGX_OFFSET_SHIFT_) |
-				  (crc & WUF_CFGX_CRC16_MASK_));
-
-		lan78xx_write_reg(dev, WUF_MASK0(mask_index), 7);
-		lan78xx_write_reg(dev, WUF_MASK1(mask_index), 0);
-		lan78xx_write_reg(dev, WUF_MASK2(mask_index), 0);
-		lan78xx_write_reg(dev, WUF_MASK3(mask_index), 0);
+		ret = lan78xx_write_reg(dev, WUF_CFG(mask_index),
+					WUF_CFGX_EN_ |
+					WUF_CFGX_TYPE_MCAST_ |
+					(0 << WUF_CFGX_OFFSET_SHIFT_) |
+					(crc & WUF_CFGX_CRC16_MASK_));
+		if (ret < 0)
+			return ret;
+
+		ret = lan78xx_write_reg(dev, WUF_MASK0(mask_index), 7);
+		if (ret < 0)
+			return ret;
+		ret = lan78xx_write_reg(dev, WUF_MASK1(mask_index), 0);
+		if (ret < 0)
+			return ret;
+		ret = lan78xx_write_reg(dev, WUF_MASK2(mask_index), 0);
+		if (ret < 0)
+			return ret;
+		ret = lan78xx_write_reg(dev, WUF_MASK3(mask_index), 0);
+		if (ret < 0)
+			return ret;
+
 		mask_index++;
 
 		/* for IPv6 Multicast */
 		crc = lan78xx_wakeframe_crc16(ipv6_multicast, 2);
-		lan78xx_write_reg(dev, WUF_CFG(mask_index),
-				  WUF_CFGX_EN_ |
-				  WUF_CFGX_TYPE_MCAST_ |
-				  (0 << WUF_CFGX_OFFSET_SHIFT_) |
-				  (crc & WUF_CFGX_CRC16_MASK_));
-
-		lan78xx_write_reg(dev, WUF_MASK0(mask_index), 3);
-		lan78xx_write_reg(dev, WUF_MASK1(mask_index), 0);
-		lan78xx_write_reg(dev, WUF_MASK2(mask_index), 0);
-		lan78xx_write_reg(dev, WUF_MASK3(mask_index), 0);
+		ret = lan78xx_write_reg(dev, WUF_CFG(mask_index),
+					WUF_CFGX_EN_ |
+					WUF_CFGX_TYPE_MCAST_ |
+					(0 << WUF_CFGX_OFFSET_SHIFT_) |
+					(crc & WUF_CFGX_CRC16_MASK_));
+		if (ret < 0)
+			return ret;
+
+		ret = lan78xx_write_reg(dev, WUF_MASK0(mask_index), 3);
+		if (ret < 0)
+			return ret;
+		ret = lan78xx_write_reg(dev, WUF_MASK1(mask_index), 0);
+		if (ret < 0)
+			return ret;
+		ret = lan78xx_write_reg(dev, WUF_MASK2(mask_index), 0);
+		if (ret < 0)
+			return ret;
+		ret = lan78xx_write_reg(dev, WUF_MASK3(mask_index), 0);
+		if (ret < 0)
+			return ret;
+
 		mask_index++;
 
 		temp_pmt_ctl |= PMT_CTL_WOL_EN_;
@@ -3907,16 +4068,27 @@ static int lan78xx_set_suspend(struct lan78xx_net *dev, u32 wol)
 		 * for packettype (offset 12,13) = ARP (0x0806)
 		 */
 		crc = lan78xx_wakeframe_crc16(arp_type, 2);
-		lan78xx_write_reg(dev, WUF_CFG(mask_index),
-				  WUF_CFGX_EN_ |
-				  WUF_CFGX_TYPE_ALL_ |
-				  (0 << WUF_CFGX_OFFSET_SHIFT_) |
-				  (crc & WUF_CFGX_CRC16_MASK_));
-
-		lan78xx_write_reg(dev, WUF_MASK0(mask_index), 0x3000);
-		lan78xx_write_reg(dev, WUF_MASK1(mask_index), 0);
-		lan78xx_write_reg(dev, WUF_MASK2(mask_index), 0);
-		lan78xx_write_reg(dev, WUF_MASK3(mask_index), 0);
+		ret = lan78xx_write_reg(dev, WUF_CFG(mask_index),
+					WUF_CFGX_EN_ |
+					WUF_CFGX_TYPE_ALL_ |
+					(0 << WUF_CFGX_OFFSET_SHIFT_) |
+					(crc & WUF_CFGX_CRC16_MASK_));
+		if (ret < 0)
+			return ret;
+
+		ret = lan78xx_write_reg(dev, WUF_MASK0(mask_index), 0x3000);
+		if (ret < 0)
+			return ret;
+		ret = lan78xx_write_reg(dev, WUF_MASK1(mask_index), 0);
+		if (ret < 0)
+			return ret;
+		ret = lan78xx_write_reg(dev, WUF_MASK2(mask_index), 0);
+		if (ret < 0)
+			return ret;
+		ret = lan78xx_write_reg(dev, WUF_MASK3(mask_index), 0);
+		if (ret < 0)
+			return ret;
+
 		mask_index++;
 
 		temp_pmt_ctl |= PMT_CTL_WOL_EN_;
@@ -3924,7 +4096,9 @@ static int lan78xx_set_suspend(struct lan78xx_net *dev, u32 wol)
 		temp_pmt_ctl |= PMT_CTL_SUS_MODE_0_;
 	}
 
-	lan78xx_write_reg(dev, WUCSR, temp_wucsr);
+	ret = lan78xx_write_reg(dev, WUCSR, temp_wucsr);
+	if (ret < 0)
+		return ret;
 
 	/* when multiple WOL bits are set */
 	if (hweight_long((unsigned long)wol) > 1) {
@@ -3932,16 +4106,30 @@ static int lan78xx_set_suspend(struct lan78xx_net *dev, u32 wol)
 		temp_pmt_ctl &= ~PMT_CTL_SUS_MODE_MASK_;
 		temp_pmt_ctl |= PMT_CTL_SUS_MODE_0_;
 	}
-	lan78xx_write_reg(dev, PMT_CTL, temp_pmt_ctl);
+	ret = lan78xx_write_reg(dev, PMT_CTL, temp_pmt_ctl);
+	if (ret < 0)
+		return ret;
 
 	/* clear WUPS */
-	lan78xx_read_reg(dev, PMT_CTL, &buf);
+	ret = lan78xx_read_reg(dev, PMT_CTL, &buf);
+	if (ret < 0)
+		return ret;
+
 	buf |= PMT_CTL_WUPS_MASK_;
-	lan78xx_write_reg(dev, PMT_CTL, buf);
+
+	ret = lan78xx_write_reg(dev, PMT_CTL, buf);
+	if (ret < 0)
+		return ret;
 
 	lan78xx_read_reg(dev, MAC_RX, &buf);
+	if (ret < 0)
+		return ret;
+
 	buf |= MAC_RX_RXEN_;
+
 	lan78xx_write_reg(dev, MAC_RX, buf);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
@@ -3949,7 +4137,6 @@ static int lan78xx_set_suspend(struct lan78xx_net *dev, u32 wol)
 static int lan78xx_suspend(struct usb_interface *intf, pm_message_t message)
 {
 	struct lan78xx_net *dev = usb_get_intfdata(intf);
-	struct lan78xx_priv *pdata = (struct lan78xx_priv *)(dev->data[0]);
 	u32 buf;
 	int ret;
 
@@ -3969,11 +4156,24 @@ static int lan78xx_suspend(struct usb_interface *intf, pm_message_t message)
 
 		/* stop TX & RX */
 		ret = lan78xx_read_reg(dev, MAC_TX, &buf);
+		if (ret < 0)
+			return ret;
+
 		buf &= ~MAC_TX_TXEN_;
+
 		ret = lan78xx_write_reg(dev, MAC_TX, buf);
+		if (ret < 0)
+			return ret;
+
 		ret = lan78xx_read_reg(dev, MAC_RX, &buf);
+		if (ret < 0)
+			return ret;
+
 		buf &= ~MAC_RX_RXEN_;
+
 		ret = lan78xx_write_reg(dev, MAC_RX, buf);
+		if (ret < 0)
+			return ret;
 
 		/* empty out the rx and queues */
 		netif_device_detach(dev->net);
@@ -3990,25 +4190,50 @@ static int lan78xx_suspend(struct usb_interface *intf, pm_message_t message)
 		if (PMSG_IS_AUTO(message)) {
 			/* auto suspend (selective suspend) */
 			ret = lan78xx_read_reg(dev, MAC_TX, &buf);
+			if (ret < 0)
+				return ret;
+
 			buf &= ~MAC_TX_TXEN_;
+
 			ret = lan78xx_write_reg(dev, MAC_TX, buf);
+			if (ret < 0)
+				return ret;
+
 			ret = lan78xx_read_reg(dev, MAC_RX, &buf);
+			if (ret < 0)
+				return ret;
+
 			buf &= ~MAC_RX_RXEN_;
+
 			ret = lan78xx_write_reg(dev, MAC_RX, buf);
+			if (ret < 0)
+				return ret;
 
 			ret = lan78xx_write_reg(dev, WUCSR, 0);
+			if (ret < 0)
+				return ret;
 			ret = lan78xx_write_reg(dev, WUCSR2, 0);
+			if (ret < 0)
+				return ret;
 			ret = lan78xx_write_reg(dev, WK_SRC, 0xFFF1FF1FUL);
+			if (ret < 0)
+				return ret;
 
 			/* set goodframe wakeup */
 			ret = lan78xx_read_reg(dev, WUCSR, &buf);
+			if (ret < 0)
+				return ret;
 
 			buf |= WUCSR_RFE_WAKE_EN_;
 			buf |= WUCSR_STORE_WAKE_;
 
 			ret = lan78xx_write_reg(dev, WUCSR, buf);
+			if (ret < 0)
+				return ret;
 
 			ret = lan78xx_read_reg(dev, PMT_CTL, &buf);
+			if (ret < 0)
+				return ret;
 
 			buf &= ~PMT_CTL_RES_CLR_WKP_EN_;
 			buf |= PMT_CTL_RES_CLR_WKP_STS_;
@@ -4019,18 +4244,36 @@ static int lan78xx_suspend(struct usb_interface *intf, pm_message_t message)
 			buf |= PMT_CTL_SUS_MODE_3_;
 
 			ret = lan78xx_write_reg(dev, PMT_CTL, buf);
+			if (ret < 0)
+				return ret;
 
 			ret = lan78xx_read_reg(dev, PMT_CTL, &buf);
+			if (ret < 0)
+				return ret;
 
 			buf |= PMT_CTL_WUPS_MASK_;
 
 			ret = lan78xx_write_reg(dev, PMT_CTL, buf);
+			if (ret < 0)
+				return ret;
 
 			ret = lan78xx_read_reg(dev, MAC_RX, &buf);
+			if (ret < 0)
+				return ret;
+
 			buf |= MAC_RX_RXEN_;
+
 			ret = lan78xx_write_reg(dev, MAC_RX, buf);
+			if (ret < 0)
+				return ret;
 		} else {
-			lan78xx_set_suspend(dev, pdata->wol);
+			struct lan78xx_priv *pdata;
+
+			pdata = (struct lan78xx_priv *)(dev->data[0]);
+
+			ret = lan78xx_set_suspend(dev, pdata->wol);
+			if (ret < 0)
+				return ret;
 		}
 	}
 
@@ -4055,8 +4298,11 @@ static int lan78xx_resume(struct usb_interface *intf)
 
 	if (!--dev->suspend_count) {
 		/* resume interrupt URBs */
-		if (dev->urb_intr && test_bit(EVENT_DEV_OPEN, &dev->flags))
-			usb_submit_urb(dev->urb_intr, GFP_NOIO);
+		if (dev->urb_intr && test_bit(EVENT_DEV_OPEN, &dev->flags)) {
+			ret = usb_submit_urb(dev->urb_intr, GFP_NOIO);
+			if (ret < 0)
+				return ret;
+		}
 
 		spin_lock_irq(&dev->txq.lock);
 		while ((res = usb_get_from_anchor(&dev->deferred))) {
@@ -4083,13 +4329,21 @@ static int lan78xx_resume(struct usb_interface *intf)
 	}
 
 	ret = lan78xx_write_reg(dev, WUCSR2, 0);
+	if (ret < 0)
+		return ret;
 	ret = lan78xx_write_reg(dev, WUCSR, 0);
+	if (ret < 0)
+		return ret;
 	ret = lan78xx_write_reg(dev, WK_SRC, 0xFFF1FF1FUL);
+	if (ret < 0)
+		return ret;
 
 	ret = lan78xx_write_reg(dev, WUCSR2, WUCSR2_NS_RCD_ |
 					     WUCSR2_ARP_RCD_ |
 					     WUCSR2_IPV6_TCPSYN_RCD_ |
 					     WUCSR2_IPV4_TCPSYN_RCD_);
+	if (ret < 0)
+		return ret;
 
 	ret = lan78xx_write_reg(dev, WUCSR, WUCSR_EEE_TX_WAKE_ |
 					    WUCSR_EEE_RX_WAKE_ |
@@ -4098,10 +4352,18 @@ static int lan78xx_resume(struct usb_interface *intf)
 					    WUCSR_WUFR_ |
 					    WUCSR_MPR_ |
 					    WUCSR_BCST_FR_);
+	if (ret < 0)
+		return ret;
 
 	ret = lan78xx_read_reg(dev, MAC_TX, &buf);
+	if (ret < 0)
+		return ret;
+
 	buf |= MAC_TX_TXEN_;
+
 	ret = lan78xx_write_reg(dev, MAC_TX, buf);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
@@ -4109,12 +4371,17 @@ static int lan78xx_resume(struct usb_interface *intf)
 static int lan78xx_reset_resume(struct usb_interface *intf)
 {
 	struct lan78xx_net *dev = usb_get_intfdata(intf);
+	int ret;
 
-	lan78xx_reset(dev);
+	ret = lan78xx_reset(dev);
+	if (ret < 0)
+		return ret;
 
 	phy_start(dev->net->phydev);
 
-	return lan78xx_resume(intf);
+	ret = lan78xx_resume(intf);
+
+	return ret;
 }
 
 static const struct usb_device_id products[] = {
-- 
2.25.1


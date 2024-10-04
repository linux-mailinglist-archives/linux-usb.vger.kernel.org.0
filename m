Return-Path: <linux-usb+bounces-15702-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C37E899035A
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 14:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 875342841A8
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 12:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFA720FAA8;
	Fri,  4 Oct 2024 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJPCktoO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B013720FA97;
	Fri,  4 Oct 2024 12:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728046483; cv=none; b=a//cDA1RhMuz2ukBvPD6GNnJtvxryolmDKZSDOPIICYkbrTNgut4vuxSbAcRpB+hSsknbeorseJxDqz2wjYrj8UGso6k3nl6FIb+1p6v8Xn8i4FUpYkZUv3d/1TmkcxKIwCSmRmVkCFEnP6sJ74bOaCg6wkU+scQ1xXH305ye2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728046483; c=relaxed/simple;
	bh=0U1a7ytQetwFDZmn1eRmqFKEgdBTT6oczK1GfeCK7js=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tHF7hrmW+aPdpuwKbkg1aa2Dt0ACSh/LLZBDPXpIyuXjb8v/IrNGc4TfgsYvop54hu5hLgWJ/WDbhFXaMGuc3YzrQn813n4Xoxj06Fij2X7ynm270fh3QyOACiFy/6Pvb6Yp3lhlbMX6MuWSN4/xFSIw3r4CloAkYd3eK6Pm4q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJPCktoO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37cfa129074so1550213f8f.1;
        Fri, 04 Oct 2024 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728046480; x=1728651280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tEtwbGJWzjjcwHlZhLNUe/4B9xrOLVa1OuIkllfknSA=;
        b=PJPCktoOi0tJ96sVtIgU50HeU1DyTDw0Je8BRPKtCnXusEYxMjiRd/NL1CFUD/ujjf
         D9g2BwtlqJZ6+gQRrU5S6i54mf4qCeoel0YU2LmPToq3AvnDusDzQiIBUV1lOrkUSSBb
         vY7Orc972BuMKLsjciOCybYk9afsRYVbSJWPyHKvLgvGHYzf6f5Lb5UQNL3DOt+Uy+j5
         SshE/UYtsBib/DhGBeMwbOYGfjqVM0JUK6wcWj1BpQW18Rx5wxdP9ckdtRsJ3wqXUgPM
         m64+BTt0UhUnC4KOGYH3u0QjJlBTjdViprGzTSd2nwYvPTacyH/OskVrNxynT11IIbZX
         WmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728046480; x=1728651280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEtwbGJWzjjcwHlZhLNUe/4B9xrOLVa1OuIkllfknSA=;
        b=hMqQkRSSPG8Na6ioCerP3Krcv2LGwqIoyNAXfRuFFV8mE+gM3J1XfOrdDldG0QE2Sz
         40+Asa3AyznaZCssdtlIujfKnaqbnwSzz2leT1Yjr6BRgjYUI6uGJorie0sLn6vzvFRF
         HsomjCYc7ejQT/BANoJTdPwusMRTLO2bWwIwNhxmwyrUs+iwf2aa/kcV2JzL0UlJsFpk
         l1eoXMyRukOi86r7lzvT8bGbN+XQCh6aBbQ0/vudbuYNgV3LTlDLtzS59Bhwfeg2xpra
         Jlo6f4qi0utv8us3E6AN1EjTzY9nWYBxQGf+CpLUbyLIYzJhFfGyLRRSpuF11UXziiLK
         ZT5A==
X-Forwarded-Encrypted: i=1; AJvYcCU4noyWMN3QFloAUq/jtrRMRl6MjCeZrWRO7IQcHkCb8u7Y5M/1YZkbsp44DW8X3XTz5LZkp4eYOyrdD94=@vger.kernel.org, AJvYcCUCT03fbFH+LcegexRmV9QimNRvrKs3MvtqPc2ie5/jUQUqJFmfRlbY9r9H2gn4OaItX8ojygq9GK0b@vger.kernel.org, AJvYcCV5DVgEpymajFuYqRPy6vUFl9o5BSmd956/jtRN0AO3twSFwzOAT3CyTD92X7iaZAMdS1EMd+tB@vger.kernel.org
X-Gm-Message-State: AOJu0YwzvEPzk9oYjRHEGKqwOrGY20ga9KS5DYcGv4mrph0X8n6ULf7J
	sZmkcARzKZ5h0ajx+2VwFy5kKr8wTqKMMK8CbS0s6DtJJBXlVH0r
X-Google-Smtp-Source: AGHT+IHnOdMJHl3HwzWhTEJvKpf3dSZq+Uhm0xsVKW24QNQcoxzFSUdXsLbFp0rh+KNccq0XMA8oEQ==
X-Received: by 2002:a05:6000:400b:b0:378:89be:1825 with SMTP id ffacd0b85a97d-37d0e8f4bcemr2132793f8f.49.1728046479785;
        Fri, 04 Oct 2024 05:54:39 -0700 (PDT)
Received: from ubuntu-20.04.myguest.virtualbox.org ([77.137.66.252])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42f86b4a371sm14936055e9.42.2024.10.04.05.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 05:54:39 -0700 (PDT)
From: Liel Harel <liel.harel@gmail.com>
To: Steve Glendinning <steve.glendinning@shawell.net>,
	UNGLinuxDriver@microchip.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: liel.harel@gmail.com
Subject: [PATCH v2] smsc95xx: Add implementation for set_pauseparam for enabling to pause RX path.
Date: Fri,  4 Oct 2024 15:54:30 +0300
Message-Id: <20241004125431.428657-1-liel.harel@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable userspace applications to pause RX path by IOCTL.
The function write to MAC control and status register for pausing RX path.

Signed-off-by: Liel Harel <liel.harel@gmail.com>
---
 drivers/net/usb/smsc95xx.c | 79 ++++++++++++++++++++++++++------------
 1 file changed, 55 insertions(+), 24 deletions(-)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 8e82184be..bc65cac47 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -137,7 +137,8 @@ static int __must_check smsc95xx_write_reg(struct usbnet *dev, u32 index,
 }
 
 /* Loop until the read is completed with timeout
- * called with phy_mutex held */
+ * called with phy_mutex held
+ */
 static int __must_check smsc95xx_phy_wait_not_busy(struct usbnet *dev)
 {
 	unsigned long start_time = jiffies;
@@ -470,7 +471,8 @@ static int __must_check smsc95xx_write_reg_async(struct usbnet *dev, u16 index,
 
 /* returns hash bit number for given MAC address
  * example:
- * 01 00 5E 00 00 01 -> returns bit number 31 */
+ * 01 00 5E 00 00 01 -> returns bit number 31
+ */
 static unsigned int smsc95xx_hash(char addr[ETH_ALEN])
 {
 	return (ether_crc(ETH_ALEN, addr) >> 26) & 0x3f;
@@ -772,6 +774,45 @@ static int smsc95xx_ethtool_get_sset_count(struct net_device *ndev, int sset)
 	}
 }
 
+/* Starts the Receive path */
+static int smsc95xx_start_rx_path(struct usbnet *dev)
+{
+	struct smsc95xx_priv *pdata = dev->driver_priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdata->mac_cr_lock, flags);
+	pdata->mac_cr |= MAC_CR_RXEN_;
+	spin_unlock_irqrestore(&pdata->mac_cr_lock, flags);
+
+	return smsc95xx_write_reg(dev, MAC_CR, pdata->mac_cr);
+}
+
+/* Stops the Receive path */
+static int smsc95xx_stop_rx_path(struct usbnet *dev)
+{
+	struct smsc95xx_priv *pdata = dev->driver_priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdata->mac_cr_lock, flags);
+	pdata->mac_cr &= ~MAC_CR_RXEN_;
+	spin_unlock_irqrestore(&pdata->mac_cr_lock, flags);
+
+	return smsc95xx_write_reg(dev, MAC_CR, pdata->mac_cr);
+}
+
+static int smsc95xx_ethtool_set_pauseparam(struct net_device *netdev,
+		struct ethtool_pauseparam *pause)
+{
+	struct usbnet *dev = netdev_priv(netdev);
+
+	if (!pause->tx_pause || !pause->autoneg)
+		return -EINVAL;
+
+	if (pause->rx_pause)
+		return smsc95xx_start_rx_path(dev);
+	return smsc95xx_stop_rx_path(dev);
+}
+
 static const struct ethtool_ops smsc95xx_ethtool_ops = {
 	.get_link	= smsc95xx_get_link,
 	.nway_reset	= phy_ethtool_nway_reset,
@@ -791,6 +832,7 @@ static const struct ethtool_ops smsc95xx_ethtool_ops = {
 	.self_test	= net_selftest,
 	.get_strings	= smsc95xx_ethtool_get_strings,
 	.get_sset_count	= smsc95xx_ethtool_get_sset_count,
+	.set_pauseparam = smsc95xx_ethtool_set_pauseparam,
 };
 
 static int smsc95xx_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
@@ -863,26 +905,13 @@ static int smsc95xx_start_tx_path(struct usbnet *dev)
 	return smsc95xx_write_reg(dev, TX_CFG, TX_CFG_ON_);
 }
 
-/* Starts the Receive path */
-static int smsc95xx_start_rx_path(struct usbnet *dev)
-{
-	struct smsc95xx_priv *pdata = dev->driver_priv;
-	unsigned long flags;
-
-	spin_lock_irqsave(&pdata->mac_cr_lock, flags);
-	pdata->mac_cr |= MAC_CR_RXEN_;
-	spin_unlock_irqrestore(&pdata->mac_cr_lock, flags);
-
-	return smsc95xx_write_reg(dev, MAC_CR, pdata->mac_cr);
-}
-
 static int smsc95xx_reset(struct usbnet *dev)
 {
 	struct smsc95xx_priv *pdata = dev->driver_priv;
 	u32 read_buf, burst_cap;
 	int ret = 0, timeout;
 
-	netif_dbg(dev, ifup, dev->net, "entering smsc95xx_reset\n");
+	netif_dbg(dev, ifup, dev->net, "entering %s\n", __func__);
 
 	ret = smsc95xx_write_reg(dev, HW_CFG, HW_CFG_LRST_);
 	if (ret < 0)
@@ -1065,7 +1094,7 @@ static int smsc95xx_reset(struct usbnet *dev)
 		return ret;
 	}
 
-	netif_dbg(dev, ifup, dev->net, "smsc95xx_reset, return 0\n");
+	netif_dbg(dev, ifup, dev->net, "%s, return 0\n", __func__);
 	return 0;
 }
 
@@ -1076,7 +1105,7 @@ static const struct net_device_ops smsc95xx_netdev_ops = {
 	.ndo_tx_timeout		= usbnet_tx_timeout,
 	.ndo_change_mtu		= usbnet_change_mtu,
 	.ndo_get_stats64	= dev_get_tstats64,
-	.ndo_set_mac_address 	= eth_mac_addr,
+	.ndo_set_mac_address = eth_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_eth_ioctl		= smsc95xx_ioctl,
 	.ndo_set_rx_mode	= smsc95xx_set_multicast,
@@ -1471,7 +1500,8 @@ static int smsc95xx_autosuspend(struct usbnet *dev, u32 link_up)
 		/* link is down so enter EDPD mode, but only if device can
 		 * reliably resume from it.  This check should be redundant
 		 * as current FEATURE_REMOTE_WAKEUP parts also support
-		 * FEATURE_PHY_NLP_CROSSOVER but it's included for clarity */
+		 * FEATURE_PHY_NLP_CROSSOVER but it's included for clarity
+		 */
 		if (!(pdata->features & FEATURE_PHY_NLP_CROSSOVER)) {
 			netdev_warn(dev->net, "EDPD not supported\n");
 			return -EBUSY;
@@ -1922,11 +1952,11 @@ static u32 smsc95xx_calc_csum_preamble(struct sk_buff *skb)
  */
 static bool smsc95xx_can_tx_checksum(struct sk_buff *skb)
 {
-       unsigned int len = skb->len - skb_checksum_start_offset(skb);
+	unsigned int len = skb->len - skb_checksum_start_offset(skb);
 
-       if (skb->len <= 45)
-	       return false;
-       return skb->csum_offset < (len - (4 + 1));
+	if (skb->len <= 45)
+		return false;
+	return skb->csum_offset < (len - (4 + 1));
 }
 
 static struct sk_buff *smsc95xx_tx_fixup(struct usbnet *dev,
@@ -1955,7 +1985,8 @@ static struct sk_buff *smsc95xx_tx_fixup(struct usbnet *dev,
 	if (csum) {
 		if (!smsc95xx_can_tx_checksum(skb)) {
 			/* workaround - hardware tx checksum does not work
-			 * properly with extremely small packets */
+			 * properly with extremely small packets
+			 */
 			long csstart = skb_checksum_start_offset(skb);
 			__wsum calc = csum_partial(skb->data + csstart,
 				skb->len - csstart, 0);
-- 
2.25.1



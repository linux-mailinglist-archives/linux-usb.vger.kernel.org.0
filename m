Return-Path: <linux-usb+bounces-6660-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED4859199
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 19:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 223B9B21C22
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 18:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC467F7C1;
	Sat, 17 Feb 2024 18:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2XxJKIdI"
X-Original-To: linux-usb@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E157E78C;
	Sat, 17 Feb 2024 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708193371; cv=none; b=b3UBvG38z3stanhRWmy4M7DjQZunrRtXSvVJo2LlUDIt2lcIELg+7JowyCAL3gRYz2cqk8tQA9+8vc2330/rGWDJED4qXwSxNGg2KV8IABYhUsT2scvRVEWFTAY+PGXXgtBSCohLXWwllMQZimGeCulTHG4WwKCdZooKjdf50ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708193371; c=relaxed/simple;
	bh=6WQbQolAq5WAPWukfrjltstk+z0qZj+AW55w271U/ic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tG9nXd2g0crrEv9K2rtdI6tvwhkxa5Cvh5KGTVaGqO2vlV4u9Tev8w4OiZIQ4wGExsko2vg2i7ME5GkmMPdFTGO4z5QKP3r8q5K5m7N0fWnlWET7ZodJZsV3zd19rqKbOt92ndaz6/R/eAvDyy+tF/b48rVBlKJe44y6hQ3ccEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=2XxJKIdI; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=N1CZYG16uNIIX1bzINMMJKicgWAqJc4xUccwHeGoHyI=; b=2X
	xJKIdIjACY4CXrdtGNuJ/4hgAiCHadwOA5QMtv8EWoBcbjZf5ykSBnAp2UcxUhgIW51R74mdxdYT1
	uYYpnxPb5GZSc+ig9AeIDIjKiRIjpkaexe7I3k7uKZYa7jjf7k7Sk3+LmbBdK9uFcFPyMd/yCDjEC
	DT0ShDFgWDeWUIU=;
Received: from c-76-156-36-110.hsd1.mn.comcast.net ([76.156.36.110] helo=thinkpad.home.lunn.ch)
	by vps0.lunn.ch with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rbP80-0084hf-3V; Sat, 17 Feb 2024 19:09:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 17 Feb 2024 12:08:25 -0600
Subject: [PATCH net-next v3 4/8] net: ethernet: ixgbe: Convert EEE to use
 linkmodes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240217-keee-u32-cleanup-v3-4-fcf6b62a0c7f@lunn.ch>
References: <20240217-keee-u32-cleanup-v3-0-fcf6b62a0c7f@lunn.ch>
In-Reply-To: <20240217-keee-u32-cleanup-v3-0-fcf6b62a0c7f@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Ariel Elior <aelior@marvell.com>, 
 Manish Chopra <manishc@marvell.com>, 
 Jesse Brandeburg <jesse.brandeburg@intel.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4488; i=andrew@lunn.ch;
 h=from:subject:message-id; bh=6WQbQolAq5WAPWukfrjltstk+z0qZj+AW55w271U/ic=;
 b=owEBbQKS/ZANAwAKAea/DcumaUyEAcsmYgBl0PY6xzJip9b+Ys/6/moZRoD886ziSVg1X2tSJ
 pFVf0xirFaJAjMEAAEKAB0WIQRh+xAly1MmORb54bfmvw3LpmlMhAUCZdD2OgAKCRDmvw3LpmlM
 hJxmEACLm8vGvPo7Z2FgLb7KH1kwL9wQZJthCGRy2NaPog/Oo76x3SaYUE+DDEPaYqB2JpACDT6
 Lg6euJv+rawMgEK7RUWZkc5w1bOe1GiXhVAa3BgV+XBA8YV+x7y6Qq3zt5ZTE0czZP+Ug+fB2kG
 FQmhGoc7Z5IK0/b/f3F1WWhf5Zda7UE6VTNBFOl88g+AIOCh3gWzMxElGl2KJgnq+1JpZSEy4gz
 HtwaiN6vS5yeC0q91rCB5/ymmm59lN2Lm58HWw/7ZZIvCWErZ4voCDAhzEzRrp2JXYNtvy6g6cP
 amXqfATLVlw8PnHn9ghuyhyTOV1Ptw8W7wxPq/BQayZ9oTt4YLrKdh/cGpYDm+ywJPl6xoSSQL0
 cBq4kBvyTiV+hCOVRwKKfZUHhNokXQ1o7b7UimYA+DHfb8o8WnNzX5kBsMoAKu8j96ZVmI3uEul
 lU+f9LhhpQJxcKrWaY44G+1VLdt1sDZopDsdOIwmZx6VdICHydiWxH9NTf7QUpLrjjEtGWBrXNz
 TqNuMVXEH76/aPjTtX01hAfQ2iZD8vG2lmm2iGm/Q4PVZH6T/EvFquz7hVHL1ETy5pSuhqdUhhS
 HpG9PKiIlg5YisUnNKz/vb2SNQx5YWETj41D5DjUuTEaNlWF/ulug6MnDYWpPKeG36ILn8kTdlC
 5PeNLrDqkY9huGQ==
X-Developer-Key: i=andrew@lunn.ch; a=openpgp;
 fpr=61FB1025CB53263916F9E1B7E6BF0DCBA6694C84

Convert the tables to make use of ETHTOOL link mode bits, rather than
the old u32 SUPPORTED speeds. Make use of the linkmode helps to set
bits and compare linkmodes. As a result, the _u32 members of keee are
no longer used, a step towards removing them.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c | 48 ++++++++++++------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
index b1e7338a4ed1..a0879f125146 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
@@ -3403,30 +3403,31 @@ static int ixgbe_get_module_eeprom(struct net_device *dev,
 
 static const struct {
 	ixgbe_link_speed mac_speed;
-	u32 supported;
+	u32 link_mode;
 } ixgbe_ls_map[] = {
-	{ IXGBE_LINK_SPEED_10_FULL, SUPPORTED_10baseT_Full },
-	{ IXGBE_LINK_SPEED_100_FULL, SUPPORTED_100baseT_Full },
-	{ IXGBE_LINK_SPEED_1GB_FULL, SUPPORTED_1000baseT_Full },
-	{ IXGBE_LINK_SPEED_2_5GB_FULL, SUPPORTED_2500baseX_Full },
-	{ IXGBE_LINK_SPEED_10GB_FULL, SUPPORTED_10000baseT_Full },
+	{ IXGBE_LINK_SPEED_10_FULL, ETHTOOL_LINK_MODE_10baseT_Full_BIT },
+	{ IXGBE_LINK_SPEED_100_FULL, ETHTOOL_LINK_MODE_100baseT_Full_BIT },
+	{ IXGBE_LINK_SPEED_1GB_FULL, ETHTOOL_LINK_MODE_1000baseT_Full_BIT },
+	{ IXGBE_LINK_SPEED_2_5GB_FULL, ETHTOOL_LINK_MODE_2500baseX_Full_BIT },
+	{ IXGBE_LINK_SPEED_10GB_FULL, ETHTOOL_LINK_MODE_10000baseT_Full_BIT },
 };
 
 static const struct {
 	u32 lp_advertised;
-	u32 mac_speed;
+	u32 link_mode;
 } ixgbe_lp_map[] = {
-	{ FW_PHY_ACT_UD_2_100M_TX_EEE, SUPPORTED_100baseT_Full },
-	{ FW_PHY_ACT_UD_2_1G_T_EEE, SUPPORTED_1000baseT_Full },
-	{ FW_PHY_ACT_UD_2_10G_T_EEE, SUPPORTED_10000baseT_Full },
-	{ FW_PHY_ACT_UD_2_1G_KX_EEE, SUPPORTED_1000baseKX_Full },
-	{ FW_PHY_ACT_UD_2_10G_KX4_EEE, SUPPORTED_10000baseKX4_Full },
-	{ FW_PHY_ACT_UD_2_10G_KR_EEE, SUPPORTED_10000baseKR_Full},
+	{ FW_PHY_ACT_UD_2_100M_TX_EEE, ETHTOOL_LINK_MODE_100baseT_Full_BIT },
+	{ FW_PHY_ACT_UD_2_1G_T_EEE, ETHTOOL_LINK_MODE_1000baseT_Full_BIT },
+	{ FW_PHY_ACT_UD_2_10G_T_EEE, ETHTOOL_LINK_MODE_10000baseT_Full_BIT },
+	{ FW_PHY_ACT_UD_2_1G_KX_EEE, ETHTOOL_LINK_MODE_1000baseKX_Full_BIT },
+	{ FW_PHY_ACT_UD_2_10G_KX4_EEE, ETHTOOL_LINK_MODE_10000baseKX4_Full_BIT },
+	{ FW_PHY_ACT_UD_2_10G_KR_EEE, ETHTOOL_LINK_MODE_10000baseKR_Full_BIT},
 };
 
 static int
 ixgbe_get_eee_fw(struct ixgbe_adapter *adapter, struct ethtool_keee *edata)
 {
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(common);
 	u32 info[FW_PHY_ACT_DATA_COUNT] = { 0 };
 	struct ixgbe_hw *hw = &adapter->hw;
 	int rc;
@@ -3436,28 +3437,29 @@ ixgbe_get_eee_fw(struct ixgbe_adapter *adapter, struct ethtool_keee *edata)
 	if (rc)
 		return rc;
 
-	edata->lp_advertised_u32 = 0;
 	for (i = 0; i < ARRAY_SIZE(ixgbe_lp_map); ++i) {
 		if (info[0] & ixgbe_lp_map[i].lp_advertised)
-			edata->lp_advertised_u32 |= ixgbe_lp_map[i].mac_speed;
+			linkmode_set_bit(ixgbe_lp_map[i].link_mode,
+					 edata->lp_advertised);
 	}
 
-	edata->supported_u32 = 0;
 	for (i = 0; i < ARRAY_SIZE(ixgbe_ls_map); ++i) {
 		if (hw->phy.eee_speeds_supported & ixgbe_ls_map[i].mac_speed)
-			edata->supported_u32 |= ixgbe_ls_map[i].supported;
+			linkmode_set_bit(ixgbe_lp_map[i].link_mode,
+					 edata->lp_advertised);
 	}
 
-	edata->advertised_u32 = 0;
 	for (i = 0; i < ARRAY_SIZE(ixgbe_ls_map); ++i) {
 		if (hw->phy.eee_speeds_advertised & ixgbe_ls_map[i].mac_speed)
-			edata->advertised_u32 |= ixgbe_ls_map[i].supported;
+			linkmode_set_bit(ixgbe_lp_map[i].link_mode,
+					 edata->advertised);
 	}
 
-	edata->eee_enabled = !!edata->advertised_u32;
+	edata->eee_enabled = !linkmode_empty(edata->advertised);
 	edata->tx_lpi_enabled = edata->eee_enabled;
-	if (edata->advertised_u32 & edata->lp_advertised_u32)
-		edata->eee_active = true;
+
+	linkmode_and(common, edata->advertised, edata->lp_advertised);
+	edata->eee_active = !linkmode_empty(common);
 
 	return 0;
 }
@@ -3504,7 +3506,7 @@ static int ixgbe_set_eee(struct net_device *netdev, struct ethtool_keee *edata)
 			return -EINVAL;
 		}
 
-		if (eee_data.advertised_u32 != edata->advertised_u32) {
+		if (!linkmode_equal(eee_data.advertised, edata->advertised)) {
 			e_err(drv,
 			      "Setting EEE advertised speeds is not supported\n");
 			return -EINVAL;

-- 
2.43.0



Return-Path: <linux-usb+bounces-1141-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1415E7B9E5E
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 16:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id BA10E28214B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 14:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A4827ECB;
	Thu,  5 Oct 2023 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OH0WFnQ1"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DB527725
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 14:04:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39F14EE9
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 07:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696514674; x=1728050674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kw3ZTI80qGcTRh/GhVex+CLwgJo17A110gMC0vtZPB0=;
  b=OH0WFnQ1HwNALIO2WMwEHhxEYYYOXQYTlYNeigL8TTLEM45fD0IuNyGm
   xalI1/6G5Qo7jSESL71BKcK5ZHvM3Uc3A/H7IO8QiYqD6HD3xRvfD/IVl
   tKB3+PNjlUTvvJMsOPEuJ1Sy7KVxCfag7Ew5MO4JXcBN1Y4nROsoTgqUw
   kOCYeAO5OYUZ29JdW9NV0LxtaSY9pCvogbiyI0unLIUwc8y9TN41/ZTkm
   i8pznlq90P+dhcQSFonUA24KtMh0t66Gv3G5Yc6jm2nVb/TMJgwcqmpso
   bWpffXcOU6ONx9KOVjwiIp3O81fM9VHzQI/7Urp6Ewuuzrcpe/igQYWt9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380732094"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="380732094"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:27:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="817511758"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="817511758"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 05 Oct 2023 02:27:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5005765E; Thu,  5 Oct 2023 12:27:30 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 09/10] thunderbolt: Add support for asymmetric link
Date: Thu,  5 Oct 2023 12:27:28 +0300
Message-Id: <20231005092729.3595447-10-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231005092729.3595447-1-mika.westerberg@linux.intel.com>
References: <20231005092729.3595447-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Gil Fine <gil.fine@linux.intel.com>

USB4 v2 spec defines a Gen 4 link that can operate as an aggregated
symmetric (80/80G) or asymmetric (120/40G). When the link is asymmetric,
the USB4 port on one side of the link operates with three TX lanes and
one RX lane, while the USB4 port on the opposite side of the link
operates with three RX lanes and one TX lane.

Add support for the asymmetric link and provide functions that can be
used to transition the link to asymmetric and back.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Co-developed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  | 294 +++++++++++++++++++++++++++++-----
 drivers/thunderbolt/tb.c      |  11 +-
 drivers/thunderbolt/tb.h      |  16 +-
 drivers/thunderbolt/tb_regs.h |   9 +-
 drivers/thunderbolt/usb4.c    | 106 ++++++++++++
 5 files changed, 381 insertions(+), 55 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index bd987935d9c9..1e15ffa79295 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -941,6 +941,22 @@ int tb_port_get_link_generation(struct tb_port *port)
 	}
 }
 
+static const char *width_name(enum tb_link_width width)
+{
+	switch (width) {
+	case TB_LINK_WIDTH_SINGLE:
+		return "symmetric, single lane";
+	case TB_LINK_WIDTH_DUAL:
+		return "symmetric, dual lanes";
+	case TB_LINK_WIDTH_ASYM_TX:
+		return "asymmetric, 3 transmitters, 1 receiver";
+	case TB_LINK_WIDTH_ASYM_RX:
+		return "asymmetric, 3 receivers, 1 transmitter";
+	default:
+		return "unknown";
+	}
+}
+
 /**
  * tb_port_get_link_width() - Get current link width
  * @port: Port to check (USB4 or CIO)
@@ -966,8 +982,15 @@ int tb_port_get_link_width(struct tb_port *port)
 		LANE_ADP_CS_1_CURRENT_WIDTH_SHIFT;
 }
 
-static bool tb_port_is_width_supported(struct tb_port *port,
-				       unsigned int width_mask)
+/**
+ * tb_port_width_supported() - Is the given link width supported
+ * @port: Port to check
+ * @width: Widths to check (bitmask)
+ *
+ * Can be called to any lane adapter. Checks if given @width is
+ * supported by the hardware and returns %true if it is.
+ */
+bool tb_port_width_supported(struct tb_port *port, unsigned int width)
 {
 	u32 phy, widths;
 	int ret;
@@ -975,15 +998,23 @@ static bool tb_port_is_width_supported(struct tb_port *port,
 	if (!port->cap_phy)
 		return false;
 
+	if (width & (TB_LINK_WIDTH_ASYM_TX | TB_LINK_WIDTH_ASYM_RX)) {
+		if (tb_port_get_link_generation(port) < 4 ||
+		    !usb4_port_asym_supported(port))
+			return false;
+	}
+
 	ret = tb_port_read(port, &phy, TB_CFG_PORT,
 			   port->cap_phy + LANE_ADP_CS_0, 1);
 	if (ret)
 		return false;
 
-	widths = (phy & LANE_ADP_CS_0_SUPPORTED_WIDTH_MASK) >>
-		LANE_ADP_CS_0_SUPPORTED_WIDTH_SHIFT;
-
-	return widths & width_mask;
+	/*
+	 * The field encoding is the same as &enum tb_link_width (which is
+	 * passed to @width).
+	 */
+	widths = FIELD_GET(LANE_ADP_CS_0_SUPPORTED_WIDTH_MASK, phy);
+	return widths & width;
 }
 
 /**
@@ -1018,10 +1049,18 @@ int tb_port_set_link_width(struct tb_port *port, enum tb_link_width width)
 		val |= LANE_ADP_CS_1_TARGET_WIDTH_SINGLE <<
 			LANE_ADP_CS_1_TARGET_WIDTH_SHIFT;
 		break;
+
 	case TB_LINK_WIDTH_DUAL:
+		if (tb_port_get_link_generation(port) >= 4)
+			return usb4_port_asym_set_link_width(port, width);
 		val |= LANE_ADP_CS_1_TARGET_WIDTH_DUAL <<
 			LANE_ADP_CS_1_TARGET_WIDTH_SHIFT;
 		break;
+
+	case TB_LINK_WIDTH_ASYM_TX:
+	case TB_LINK_WIDTH_ASYM_RX:
+		return usb4_port_asym_set_link_width(port, width);
+
 	default:
 		return -EINVAL;
 	}
@@ -1146,7 +1185,7 @@ void tb_port_lane_bonding_disable(struct tb_port *port)
 /**
  * tb_port_wait_for_link_width() - Wait until link reaches specific width
  * @port: Port to wait for
- * @width_mask: Expected link width mask
+ * @width: Expected link width (bitmask)
  * @timeout_msec: Timeout in ms how long to wait
  *
  * Should be used after both ends of the link have been bonded (or
@@ -1155,14 +1194,14 @@ void tb_port_lane_bonding_disable(struct tb_port *port)
  * within the given timeout, %0 if it did. Can be passed a mask of
  * expected widths and succeeds if any of the widths is reached.
  */
-int tb_port_wait_for_link_width(struct tb_port *port, unsigned int width_mask,
+int tb_port_wait_for_link_width(struct tb_port *port, unsigned int width,
 				int timeout_msec)
 {
 	ktime_t timeout = ktime_add_ms(ktime_get(), timeout_msec);
 	int ret;
 
 	/* Gen 4 link does not support single lane */
-	if ((width_mask & TB_LINK_WIDTH_SINGLE) &&
+	if ((width & TB_LINK_WIDTH_SINGLE) &&
 	    tb_port_get_link_generation(port) >= 4)
 		return -EOPNOTSUPP;
 
@@ -1176,7 +1215,7 @@ int tb_port_wait_for_link_width(struct tb_port *port, unsigned int width_mask,
 			 */
 			if (ret != -EACCES)
 				return ret;
-		} else if (ret & width_mask) {
+		} else if (ret & width) {
 			return 0;
 		}
 
@@ -2720,6 +2759,38 @@ static int tb_switch_update_link_attributes(struct tb_switch *sw)
 	return 0;
 }
 
+/* Must be called after tb_switch_update_link_attributes() */
+static void tb_switch_link_init(struct tb_switch *sw)
+{
+	struct tb_port *up, *down;
+	bool bonded;
+
+	if (!tb_route(sw) || tb_switch_is_icm(sw))
+		return;
+
+	tb_sw_dbg(sw, "current link speed %u.0 Gb/s\n", sw->link_speed);
+	tb_sw_dbg(sw, "current link width %s\n", width_name(sw->link_width));
+
+	bonded = sw->link_width >= TB_LINK_WIDTH_DUAL;
+
+	/*
+	 * Gen 4 links come up as bonded so update the port structures
+	 * accordingly.
+	 */
+	up = tb_upstream_port(sw);
+	down = tb_switch_downstream_port(sw);
+
+	up->bonded = bonded;
+	if (up->dual_link_port)
+		up->dual_link_port->bonded = bonded;
+	tb_port_update_credits(up);
+
+	down->bonded = bonded;
+	if (down->dual_link_port)
+		down->dual_link_port->bonded = bonded;
+	tb_port_update_credits(down);
+}
+
 /**
  * tb_switch_lane_bonding_enable() - Enable lane bonding
  * @sw: Switch to enable lane bonding
@@ -2728,24 +2799,20 @@ static int tb_switch_update_link_attributes(struct tb_switch *sw)
  * switch. If conditions are correct and both switches support the feature,
  * lanes are bonded. It is safe to call this to any switch.
  */
-int tb_switch_lane_bonding_enable(struct tb_switch *sw)
+static int tb_switch_lane_bonding_enable(struct tb_switch *sw)
 {
 	struct tb_port *up, *down;
-	u64 route = tb_route(sw);
-	unsigned int width_mask;
+	unsigned int width;
 	int ret;
 
-	if (!route)
-		return 0;
-
 	if (!tb_switch_lane_bonding_possible(sw))
 		return 0;
 
 	up = tb_upstream_port(sw);
 	down = tb_switch_downstream_port(sw);
 
-	if (!tb_port_is_width_supported(up, TB_LINK_WIDTH_DUAL) ||
-	    !tb_port_is_width_supported(down, TB_LINK_WIDTH_DUAL))
+	if (!tb_port_width_supported(up, TB_LINK_WIDTH_DUAL) ||
+	    !tb_port_width_supported(down, TB_LINK_WIDTH_DUAL))
 		return 0;
 
 	/*
@@ -2769,21 +2836,10 @@ int tb_switch_lane_bonding_enable(struct tb_switch *sw)
 	}
 
 	/* Any of the widths are all bonded */
-	width_mask = TB_LINK_WIDTH_DUAL | TB_LINK_WIDTH_ASYM_TX |
-		     TB_LINK_WIDTH_ASYM_RX;
+	width = TB_LINK_WIDTH_DUAL | TB_LINK_WIDTH_ASYM_TX |
+		TB_LINK_WIDTH_ASYM_RX;
 
-	ret = tb_port_wait_for_link_width(down, width_mask, 100);
-	if (ret) {
-		tb_port_warn(down, "timeout enabling lane bonding\n");
-		return ret;
-	}
-
-	tb_port_update_credits(down);
-	tb_port_update_credits(up);
-	tb_switch_update_link_attributes(sw);
-
-	tb_sw_dbg(sw, "lane bonding enabled\n");
-	return ret;
+	return tb_port_wait_for_link_width(down, width, 100);
 }
 
 /**
@@ -2793,20 +2849,27 @@ int tb_switch_lane_bonding_enable(struct tb_switch *sw)
  * Disables lane bonding between @sw and parent. This can be called even
  * if lanes were not bonded originally.
  */
-void tb_switch_lane_bonding_disable(struct tb_switch *sw)
+static int tb_switch_lane_bonding_disable(struct tb_switch *sw)
 {
 	struct tb_port *up, *down;
 	int ret;
 
-	if (!tb_route(sw))
-		return;
-
 	up = tb_upstream_port(sw);
 	if (!up->bonded)
-		return;
+		return 0;
 
-	down = tb_switch_downstream_port(sw);
+	/*
+	 * If the link is Gen 4 there is no way to switch the link to
+	 * two single lane links so avoid that here. Also don't bother
+	 * if the link is not up anymore (sw is unplugged).
+	 */
+	ret = tb_port_get_link_generation(up);
+	if (ret < 0)
+		return ret;
+	if (ret >= 4)
+		return -EOPNOTSUPP;
 
+	down = tb_switch_downstream_port(sw);
 	tb_port_lane_bonding_disable(up);
 	tb_port_lane_bonding_disable(down);
 
@@ -2814,15 +2877,160 @@ void tb_switch_lane_bonding_disable(struct tb_switch *sw)
 	 * It is fine if we get other errors as the router might have
 	 * been unplugged.
 	 */
-	ret = tb_port_wait_for_link_width(down, TB_LINK_WIDTH_SINGLE, 100);
-	if (ret == -ETIMEDOUT)
-		tb_sw_warn(sw, "timeout disabling lane bonding\n");
+	return tb_port_wait_for_link_width(down, TB_LINK_WIDTH_SINGLE, 100);
+}
+
+static int tb_switch_asym_enable(struct tb_switch *sw, enum tb_link_width width)
+{
+	struct tb_port *up, *down, *port;
+	enum tb_link_width down_width;
+	int ret;
+
+	up = tb_upstream_port(sw);
+	down = tb_switch_downstream_port(sw);
+
+	if (width == TB_LINK_WIDTH_ASYM_TX) {
+		down_width = TB_LINK_WIDTH_ASYM_RX;
+		port = down;
+	} else {
+		down_width = TB_LINK_WIDTH_ASYM_TX;
+		port = up;
+	}
+
+	ret = tb_port_set_link_width(up, width);
+	if (ret)
+		return ret;
+
+	ret = tb_port_set_link_width(down, down_width);
+	if (ret)
+		return ret;
+
+	/*
+	 * Initiate the change in the router that one of its TX lanes is
+	 * changing to RX but do so only if there is an actual change.
+	 */
+	if (sw->link_width != width) {
+		ret = usb4_port_asym_start(port);
+		if (ret)
+			return ret;
+
+		ret = tb_port_wait_for_link_width(up, width, 100);
+		if (ret)
+			return ret;
+	}
+
+	sw->link_width = width;
+	return 0;
+}
+
+static int tb_switch_asym_disable(struct tb_switch *sw)
+{
+	struct tb_port *up, *down;
+	int ret;
+
+	up = tb_upstream_port(sw);
+	down = tb_switch_downstream_port(sw);
+
+	ret = tb_port_set_link_width(up, TB_LINK_WIDTH_DUAL);
+	if (ret)
+		return ret;
+
+	ret = tb_port_set_link_width(down, TB_LINK_WIDTH_DUAL);
+	if (ret)
+		return ret;
+
+	/*
+	 * Initiate the change in the router that has three TX lanes and
+	 * is changing one of its TX lanes to RX but only if there is a
+	 * change in the link width.
+	 */
+	if (sw->link_width > TB_LINK_WIDTH_DUAL) {
+		if (sw->link_width == TB_LINK_WIDTH_ASYM_TX)
+			ret = usb4_port_asym_start(up);
+		else
+			ret = usb4_port_asym_start(down);
+		if (ret)
+			return ret;
+
+		ret = tb_port_wait_for_link_width(up, TB_LINK_WIDTH_DUAL, 100);
+		if (ret)
+			return ret;
+	}
+
+	sw->link_width = TB_LINK_WIDTH_DUAL;
+	return 0;
+}
+
+/**
+ * tb_switch_set_link_width() - Configure router link width
+ * @sw: Router to configure
+ * @width: The new link width
+ *
+ * Set device router link width to @width from router upstream port
+ * perspective. Supports also asymmetric links if the routers boths side
+ * of the link supports it.
+ *
+ * Does nothing for host router.
+ *
+ * Returns %0 in case of success, negative errno otherwise.
+ */
+int tb_switch_set_link_width(struct tb_switch *sw, enum tb_link_width width)
+{
+	struct tb_port *up, *down;
+	int ret = 0;
+
+	if (!tb_route(sw))
+		return 0;
+
+	up = tb_upstream_port(sw);
+	down = tb_switch_downstream_port(sw);
+
+	switch (width) {
+	case TB_LINK_WIDTH_SINGLE:
+		ret = tb_switch_lane_bonding_disable(sw);
+		break;
+
+	case TB_LINK_WIDTH_DUAL:
+		if (sw->link_width == TB_LINK_WIDTH_ASYM_TX ||
+		    sw->link_width == TB_LINK_WIDTH_ASYM_RX) {
+			ret = tb_switch_asym_disable(sw);
+			if (ret)
+				break;
+		}
+		ret = tb_switch_lane_bonding_enable(sw);
+		break;
+
+	case TB_LINK_WIDTH_ASYM_TX:
+	case TB_LINK_WIDTH_ASYM_RX:
+		ret = tb_switch_asym_enable(sw, width);
+		break;
+	}
+
+	switch (ret) {
+	case 0:
+		break;
+
+	case -ETIMEDOUT:
+		tb_sw_warn(sw, "timeout changing link width\n");
+		return ret;
+
+	case -ENOTCONN:
+	case -EOPNOTSUPP:
+	case -ENODEV:
+		return ret;
+
+	default:
+		tb_sw_dbg(sw, "failed to change link width: %d\n", ret);
+		return ret;
+	}
 
 	tb_port_update_credits(down);
 	tb_port_update_credits(up);
+
 	tb_switch_update_link_attributes(sw);
 
-	tb_sw_dbg(sw, "lane bonding disabled\n");
+	tb_sw_dbg(sw, "link width set to %s\n", width_name(width));
+	return ret;
 }
 
 /**
@@ -2982,6 +3190,8 @@ int tb_switch_add(struct tb_switch *sw)
 		if (ret)
 			return ret;
 
+		tb_switch_link_init(sw);
+
 		ret = tb_switch_clx_init(sw);
 		if (ret)
 			return ret;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 9efe0b1435e8..67c56337a4d2 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -985,7 +985,7 @@ static void tb_scan_port(struct tb_port *port)
 	}
 
 	/* Enable lane bonding if supported */
-	tb_switch_lane_bonding_enable(sw);
+	tb_switch_set_link_width(sw, TB_LINK_WIDTH_DUAL);
 	/* Set the link configured */
 	tb_switch_configure_link(sw);
 	/*
@@ -1103,7 +1103,8 @@ static void tb_free_unplugged_children(struct tb_switch *sw)
 			tb_retimer_remove_all(port);
 			tb_remove_dp_resources(port->remote->sw);
 			tb_switch_unconfigure_link(port->remote->sw);
-			tb_switch_lane_bonding_disable(port->remote->sw);
+			tb_switch_set_link_width(port->remote->sw,
+						 TB_LINK_WIDTH_SINGLE);
 			tb_switch_remove(port->remote->sw);
 			port->remote = NULL;
 			if (port->dual_link_port)
@@ -1721,7 +1722,8 @@ static void tb_handle_hotplug(struct work_struct *work)
 			tb_remove_dp_resources(port->remote->sw);
 			tb_switch_tmu_disable(port->remote->sw);
 			tb_switch_unconfigure_link(port->remote->sw);
-			tb_switch_lane_bonding_disable(port->remote->sw);
+			tb_switch_set_link_width(port->remote->sw,
+						 TB_LINK_WIDTH_SINGLE);
 			tb_switch_remove(port->remote->sw);
 			port->remote = NULL;
 			if (port->dual_link_port)
@@ -2205,7 +2207,8 @@ static void tb_restore_children(struct tb_switch *sw)
 			continue;
 
 		if (port->remote) {
-			tb_switch_lane_bonding_enable(port->remote->sw);
+			tb_switch_set_link_width(port->remote->sw,
+						 port->remote->sw->link_width);
 			tb_switch_configure_link(port->remote->sw);
 
 			tb_restore_children(port->remote->sw);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 80e28124f583..e299e53473ae 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -162,11 +162,6 @@ struct tb_switch_tmu {
  * switches) you need to have domain lock held.
  *
  * In USB4 terminology this structure represents a router.
- *
- * Note @link_width is not the same as whether link is bonded or not.
- * For Gen 4 links the link is also bonded when it is asymmetric. The
- * correct way to find out whether the link is bonded or not is to look
- * @bonded field of the upstream port.
  */
 struct tb_switch {
 	struct device dev;
@@ -967,8 +962,7 @@ static inline bool tb_switch_is_icm(const struct tb_switch *sw)
 	return !sw->config.enabled;
 }
 
-int tb_switch_lane_bonding_enable(struct tb_switch *sw);
-void tb_switch_lane_bonding_disable(struct tb_switch *sw);
+int tb_switch_set_link_width(struct tb_switch *sw, enum tb_link_width width);
 int tb_switch_configure_link(struct tb_switch *sw);
 void tb_switch_unconfigure_link(struct tb_switch *sw);
 
@@ -1100,10 +1094,11 @@ static inline bool tb_port_use_credit_allocation(const struct tb_port *port)
 int tb_port_get_link_speed(struct tb_port *port);
 int tb_port_get_link_generation(struct tb_port *port);
 int tb_port_get_link_width(struct tb_port *port);
+bool tb_port_width_supported(struct tb_port *port, unsigned int width);
 int tb_port_set_link_width(struct tb_port *port, enum tb_link_width width);
 int tb_port_lane_bonding_enable(struct tb_port *port);
 void tb_port_lane_bonding_disable(struct tb_port *port);
-int tb_port_wait_for_link_width(struct tb_port *port, unsigned int width_mask,
+int tb_port_wait_for_link_width(struct tb_port *port, unsigned int width,
 				int timeout_msec);
 int tb_port_update_credits(struct tb_port *port);
 
@@ -1297,6 +1292,11 @@ int usb4_port_router_online(struct tb_port *port);
 int usb4_port_enumerate_retimers(struct tb_port *port);
 bool usb4_port_clx_supported(struct tb_port *port);
 int usb4_port_margining_caps(struct tb_port *port, u32 *caps);
+
+bool usb4_port_asym_supported(struct tb_port *port);
+int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width);
+int usb4_port_asym_start(struct tb_port *port);
+
 int usb4_port_hw_margin(struct tb_port *port, unsigned int lanes,
 			unsigned int ber_level, bool timing, bool right_high,
 			u32 *results);
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index c14a1c3bc992..87e4795275fe 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -346,10 +346,14 @@ struct tb_regs_port_header {
 #define LANE_ADP_CS_1				0x01
 #define LANE_ADP_CS_1_TARGET_SPEED_MASK		GENMASK(3, 0)
 #define LANE_ADP_CS_1_TARGET_SPEED_GEN3		0xc
-#define LANE_ADP_CS_1_TARGET_WIDTH_MASK		GENMASK(9, 4)
+#define LANE_ADP_CS_1_TARGET_WIDTH_MASK		GENMASK(5, 4)
 #define LANE_ADP_CS_1_TARGET_WIDTH_SHIFT	4
 #define LANE_ADP_CS_1_TARGET_WIDTH_SINGLE	0x1
 #define LANE_ADP_CS_1_TARGET_WIDTH_DUAL		0x3
+#define LANE_ADP_CS_1_TARGET_WIDTH_ASYM_MASK	GENMASK(7, 6)
+#define LANE_ADP_CS_1_TARGET_WIDTH_ASYM_TX	0x1
+#define LANE_ADP_CS_1_TARGET_WIDTH_ASYM_RX	0x2
+#define LANE_ADP_CS_1_TARGET_WIDTH_ASYM_DUAL	0x0
 #define LANE_ADP_CS_1_CL0S_ENABLE		BIT(10)
 #define LANE_ADP_CS_1_CL1_ENABLE		BIT(11)
 #define LANE_ADP_CS_1_CL2_ENABLE		BIT(12)
@@ -382,12 +386,15 @@ struct tb_regs_port_header {
 #define PORT_CS_18_WOCS				BIT(16)
 #define PORT_CS_18_WODS				BIT(17)
 #define PORT_CS_18_WOU4S			BIT(18)
+#define PORT_CS_18_CSA				BIT(22)
+#define PORT_CS_18_TIP				BIT(24)
 #define PORT_CS_19				0x13
 #define PORT_CS_19_PC				BIT(3)
 #define PORT_CS_19_PID				BIT(4)
 #define PORT_CS_19_WOC				BIT(16)
 #define PORT_CS_19_WOD				BIT(17)
 #define PORT_CS_19_WOU4				BIT(18)
+#define PORT_CS_19_START_ASYM			BIT(24)
 
 /* Display Port adapter registers */
 #define ADP_DP_CS_0				0x00
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 86d6b7b5471b..4277733d0021 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1454,6 +1454,112 @@ bool usb4_port_clx_supported(struct tb_port *port)
 	return !!(val & PORT_CS_18_CPS);
 }
 
+/**
+ * usb4_port_asym_supported() - If the port supports asymmetric link
+ * @port: USB4 port
+ *
+ * Checks if the port and the cable supports asymmetric link and returns
+ * %true in that case.
+ */
+bool usb4_port_asym_supported(struct tb_port *port)
+{
+	u32 val;
+
+	if (!port->cap_usb4)
+		return false;
+
+	if (tb_port_read(port, &val, TB_CFG_PORT, port->cap_usb4 + PORT_CS_18, 1))
+		return false;
+
+	return !!(val & PORT_CS_18_CSA);
+}
+
+/**
+ * usb4_port_asym_set_link_width() - Set link width to asymmetric or symmetric
+ * @port: USB4 port
+ * @width: Asymmetric width to configure
+ *
+ * Sets USB4 port link width to @width. Can be called for widths where
+ * usb4_port_asym_width_supported() returned @true.
+ */
+int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width)
+{
+	u32 val;
+	int ret;
+
+	if (!port->cap_phy)
+		return -EINVAL;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_1, 1);
+	if (ret)
+		return ret;
+
+	val &= ~LANE_ADP_CS_1_TARGET_WIDTH_ASYM_MASK;
+	switch (width) {
+	case TB_LINK_WIDTH_DUAL:
+		val |= FIELD_PREP(LANE_ADP_CS_1_TARGET_WIDTH_ASYM_MASK,
+				  LANE_ADP_CS_1_TARGET_WIDTH_ASYM_DUAL);
+		break;
+	case TB_LINK_WIDTH_ASYM_TX:
+		val |= FIELD_PREP(LANE_ADP_CS_1_TARGET_WIDTH_ASYM_MASK,
+				  LANE_ADP_CS_1_TARGET_WIDTH_ASYM_TX);
+		break;
+	case TB_LINK_WIDTH_ASYM_RX:
+		val |= FIELD_PREP(LANE_ADP_CS_1_TARGET_WIDTH_ASYM_MASK,
+				  LANE_ADP_CS_1_TARGET_WIDTH_ASYM_RX);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_phy + LANE_ADP_CS_1, 1);
+}
+
+/**
+ * usb4_port_asym_start() - Start symmetry change and wait for completion
+ * @port: USB4 port
+ *
+ * Start symmetry change of the link to asymmetric or symmetric
+ * (according to what was previously set in tb_port_set_link_width().
+ * Wait for completion of the change.
+ *
+ * Returns %0 in case of success, %-ETIMEDOUT if case of timeout or
+ * a negative errno in case of a failure.
+ */
+int usb4_port_asym_start(struct tb_port *port)
+{
+	int ret;
+	u32 val;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_usb4 + PORT_CS_19, 1);
+	if (ret)
+		return ret;
+
+	val &= ~PORT_CS_19_START_ASYM;
+	val |= FIELD_PREP(PORT_CS_19_START_ASYM, 1);
+
+	ret = tb_port_write(port, &val, TB_CFG_PORT,
+			    port->cap_usb4 + PORT_CS_19, 1);
+	if (ret)
+		return ret;
+
+	/*
+	 * Wait for PORT_CS_19_START_ASYM to be 0. This means the USB4
+	 * port started the symmetry transition.
+	 */
+	ret = usb4_port_wait_for_bit(port, port->cap_usb4 + PORT_CS_19,
+				     PORT_CS_19_START_ASYM, 0, 1000);
+	if (ret)
+		return ret;
+
+	/* Then wait for the transtion to be completed */
+	return usb4_port_wait_for_bit(port, port->cap_usb4 + PORT_CS_18,
+				      PORT_CS_18_TIP, 0, 5000);
+}
+
 /**
  * usb4_port_margining_caps() - Read USB4 port marginig capabilities
  * @port: USB4 port
-- 
2.40.1



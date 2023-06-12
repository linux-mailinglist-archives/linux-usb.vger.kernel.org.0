Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46DAA72BB48
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234143AbjFLIxh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233914AbjFLIxD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:53:03 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34E51FDC
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559942; x=1718095942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EnTyw/k2Y3nmLDFlF2Dcyb9y3VfyDHHOatuSrh7rvlY=;
  b=hJSqiRpq9k8P5Wo/qNkkRGm+na8quno2Ib6DjCRPyOYKN6wSWu+rCBFt
   xZr20pYVDTVNB9m4skyOboQZRBf423bbNeF5fc0sLcczVecQ+VsZHK8/L
   A5NOEWA/hB5WMwyJ51vKpO42dH4kixNxgsL3g0ZL558+geWFjjyMmrn59
   EaXKIsxrOt2pWYtbokC8ATBR+S0J9TXIp9hfi3RhjfbXjVZtsbXNyGAGM
   r+x1YVhS/10lItz4bYYdPzkVRmhvvrScW0BREKwkuUCIx1WbKbHHIoU7i
   e4RmZCFSxmziWK172mK2ZyQj8XgW7tvNCR/tfag1YCi+cOAs2MiF2857c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627248"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627248"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247725"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247725"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 791C7677; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 04/20] thunderbolt: Add support for USB4 v2 80 Gb/s link
Date:   Mon, 12 Jun 2023 11:21:29 +0300
Message-Id: <20230612082145.62218-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
References: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Gil Fine <gil.fine@intel.com>

USB4 v2 bumps the per-lane speed up to 40 Gb/s. Also the lanes are
always bonded which gives 80 Gb/s symmetric link (and 120/40 Gb/s
asymmetric). This updates the speed and width of routers and XDomain
connections to support the Gen 4 link. For now we keep the link as is
even if it is already asymmetric.

While there make tb_port_set_link_width() static.

Signed-off-by: Gil Fine <gil.fine@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/dma_test.c |  10 +-
 drivers/thunderbolt/icm.c      |   6 +-
 drivers/thunderbolt/switch.c   | 185 +++++++++++++++++++++++----------
 drivers/thunderbolt/tb.c       |  38 ++++++-
 drivers/thunderbolt/tb.h       |  14 ++-
 drivers/thunderbolt/tb_regs.h  |   1 +
 drivers/thunderbolt/xdomain.c  |  82 ++++++++++++---
 include/linux/thunderbolt.h    |  18 +++-
 8 files changed, 266 insertions(+), 88 deletions(-)

diff --git a/drivers/thunderbolt/dma_test.c b/drivers/thunderbolt/dma_test.c
index 58496f889d03..39476fc48801 100644
--- a/drivers/thunderbolt/dma_test.c
+++ b/drivers/thunderbolt/dma_test.c
@@ -412,6 +412,7 @@ static void speed_get(const struct dma_test *dt, u64 *val)
 static int speed_validate(u64 val)
 {
 	switch (val) {
+	case 40:
 	case 20:
 	case 10:
 	case 0:
@@ -489,9 +490,12 @@ static void dma_test_check_errors(struct dma_test *dt, int ret)
 	if (!dt->error_code) {
 		if (dt->link_speed && dt->xd->link_speed != dt->link_speed) {
 			dt->error_code = DMA_TEST_SPEED_ERROR;
-		} else if (dt->link_width &&
-			   dt->xd->link_width != dt->link_width) {
-			dt->error_code = DMA_TEST_WIDTH_ERROR;
+		} else if (dt->link_width) {
+			const struct tb_xdomain *xd = dt->xd;
+
+			if ((dt->link_width == 1 && xd->link_width != TB_LINK_WIDTH_SINGLE) ||
+			    (dt->link_width == 2 && xd->link_width < TB_LINK_WIDTH_DUAL))
+				dt->error_code = DMA_TEST_WIDTH_ERROR;
 		} else if (dt->packets_to_send != dt->packets_sent ||
 			 dt->packets_to_receive != dt->packets_received ||
 			 dt->crc_errors || dt->buffer_overflow_errors) {
diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 05274caf1466..dbdcad8d73bf 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -850,7 +850,8 @@ icm_fr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr)
 		sw->security_level = security_level;
 		sw->boot = boot;
 		sw->link_speed = speed_gen3 ? 20 : 10;
-		sw->link_width = dual_lane ? 2 : 1;
+		sw->link_width = dual_lane ? TB_LINK_WIDTH_DUAL :
+					     TB_LINK_WIDTH_SINGLE;
 		sw->rpm = intel_vss_is_rtd3(pkg->ep_name, sizeof(pkg->ep_name));
 
 		if (add_switch(parent_sw, sw))
@@ -1272,7 +1273,8 @@ __icm_tr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr,
 		sw->security_level = security_level;
 		sw->boot = boot;
 		sw->link_speed = speed_gen3 ? 20 : 10;
-		sw->link_width = dual_lane ? 2 : 1;
+		sw->link_width = dual_lane ? TB_LINK_WIDTH_DUAL :
+					     TB_LINK_WIDTH_SINGLE;
 		sw->rpm = force_rtd3;
 		if (!sw->rpm)
 			sw->rpm = intel_vss_is_rtd3(pkg->ep_name,
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 3a1fc3e053f6..a0451218af2a 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -903,15 +903,23 @@ int tb_port_get_link_speed(struct tb_port *port)
 
 	speed = (val & LANE_ADP_CS_1_CURRENT_SPEED_MASK) >>
 		LANE_ADP_CS_1_CURRENT_SPEED_SHIFT;
-	return speed == LANE_ADP_CS_1_CURRENT_SPEED_GEN3 ? 20 : 10;
+
+	switch (speed) {
+	case LANE_ADP_CS_1_CURRENT_SPEED_GEN4:
+		return 40;
+	case LANE_ADP_CS_1_CURRENT_SPEED_GEN3:
+		return 20;
+	default:
+		return 10;
+	}
 }
 
 /**
  * tb_port_get_link_width() - Get current link width
  * @port: Port to check (USB4 or CIO)
  *
- * Returns link width. Return values can be 1 (Single-Lane), 2 (Dual-Lane)
- * or negative errno in case of failure.
+ * Returns link width. Return the link width as encoded in &enum
+ * tb_link_width or negative errno in case of failure.
  */
 int tb_port_get_link_width(struct tb_port *port)
 {
@@ -926,11 +934,13 @@ int tb_port_get_link_width(struct tb_port *port)
 	if (ret)
 		return ret;
 
+	/* Matches the values in enum tb_link_width */
 	return (val & LANE_ADP_CS_1_CURRENT_WIDTH_MASK) >>
 		LANE_ADP_CS_1_CURRENT_WIDTH_SHIFT;
 }
 
-static bool tb_port_is_width_supported(struct tb_port *port, int width)
+static bool tb_port_is_width_supported(struct tb_port *port,
+				       unsigned int width_mask)
 {
 	u32 phy, widths;
 	int ret;
@@ -946,20 +956,25 @@ static bool tb_port_is_width_supported(struct tb_port *port, int width)
 	widths = (phy & LANE_ADP_CS_0_SUPPORTED_WIDTH_MASK) >>
 		LANE_ADP_CS_0_SUPPORTED_WIDTH_SHIFT;
 
-	return !!(widths & width);
+	return widths & width_mask;
+}
+
+static bool is_gen4_link(struct tb_port *port)
+{
+	return tb_port_get_link_speed(port) > 20;
 }
 
 /**
  * tb_port_set_link_width() - Set target link width of the lane adapter
  * @port: Lane adapter
- * @width: Target link width (%1 or %2)
+ * @width: Target link width
  *
  * Sets the target link width of the lane adapter to @width. Does not
  * enable/disable lane bonding. For that call tb_port_set_lane_bonding().
  *
  * Return: %0 in case of success and negative errno in case of error
  */
-int tb_port_set_link_width(struct tb_port *port, unsigned int width)
+int tb_port_set_link_width(struct tb_port *port, enum tb_link_width width)
 {
 	u32 val;
 	int ret;
@@ -974,11 +989,14 @@ int tb_port_set_link_width(struct tb_port *port, unsigned int width)
 
 	val &= ~LANE_ADP_CS_1_TARGET_WIDTH_MASK;
 	switch (width) {
-	case 1:
+	case TB_LINK_WIDTH_SINGLE:
+		/* Gen 4 link cannot be single */
+		if (is_gen4_link(port))
+			return -EOPNOTSUPP;
 		val |= LANE_ADP_CS_1_TARGET_WIDTH_SINGLE <<
 			LANE_ADP_CS_1_TARGET_WIDTH_SHIFT;
 		break;
-	case 2:
+	case TB_LINK_WIDTH_DUAL:
 		val |= LANE_ADP_CS_1_TARGET_WIDTH_DUAL <<
 			LANE_ADP_CS_1_TARGET_WIDTH_SHIFT;
 		break;
@@ -1000,12 +1018,9 @@ int tb_port_set_link_width(struct tb_port *port, unsigned int width)
  * cases one should use tb_port_lane_bonding_enable() instead to enable
  * lane bonding.
  *
- * As a side effect sets @port->bonding accordingly (and does the same
- * for lane 1 too).
- *
  * Return: %0 in case of success and negative errno in case of error
  */
-int tb_port_set_lane_bonding(struct tb_port *port, bool bonding)
+static int tb_port_set_lane_bonding(struct tb_port *port, bool bonding)
 {
 	u32 val;
 	int ret;
@@ -1023,19 +1038,8 @@ int tb_port_set_lane_bonding(struct tb_port *port, bool bonding)
 	else
 		val &= ~LANE_ADP_CS_1_LB;
 
-	ret = tb_port_write(port, &val, TB_CFG_PORT,
-			    port->cap_phy + LANE_ADP_CS_1, 1);
-	if (ret)
-		return ret;
-
-	/*
-	 * When lane 0 bonding is set it will affect lane 1 too so
-	 * update both.
-	 */
-	port->bonded = bonding;
-	port->dual_link_port->bonded = bonding;
-
-	return 0;
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_phy + LANE_ADP_CS_1, 1);
 }
 
 /**
@@ -1052,36 +1056,52 @@ int tb_port_set_lane_bonding(struct tb_port *port, bool bonding)
  */
 int tb_port_lane_bonding_enable(struct tb_port *port)
 {
+	enum tb_link_width width;
 	int ret;
 
 	/*
 	 * Enable lane bonding for both links if not already enabled by
 	 * for example the boot firmware.
 	 */
-	ret = tb_port_get_link_width(port);
-	if (ret == 1) {
-		ret = tb_port_set_link_width(port, 2);
+	width = tb_port_get_link_width(port);
+	if (width == TB_LINK_WIDTH_SINGLE) {
+		ret = tb_port_set_link_width(port, TB_LINK_WIDTH_DUAL);
 		if (ret)
 			goto err_lane0;
 	}
 
-	ret = tb_port_get_link_width(port->dual_link_port);
-	if (ret == 1) {
-		ret = tb_port_set_link_width(port->dual_link_port, 2);
+	width = tb_port_get_link_width(port->dual_link_port);
+	if (width == TB_LINK_WIDTH_SINGLE) {
+		ret = tb_port_set_link_width(port->dual_link_port,
+					     TB_LINK_WIDTH_DUAL);
 		if (ret)
 			goto err_lane0;
 	}
 
-	ret = tb_port_set_lane_bonding(port, true);
-	if (ret)
-		goto err_lane1;
+	/*
+	 * Only set bonding if the link was not already bonded. This
+	 * avoids the lane adapter to re-enter bonding state.
+	 */
+	if (width == TB_LINK_WIDTH_SINGLE) {
+		ret = tb_port_set_lane_bonding(port, true);
+		if (ret)
+			goto err_lane1;
+	}
+
+	/*
+	 * When lane 0 bonding is set it will affect lane 1 too so
+	 * update both.
+	 */
+	port->bonded = true;
+	port->dual_link_port->bonded = true;
 
 	return 0;
 
 err_lane1:
-	tb_port_set_link_width(port->dual_link_port, 1);
+	tb_port_set_link_width(port->dual_link_port, TB_LINK_WIDTH_SINGLE);
 err_lane0:
-	tb_port_set_link_width(port, 1);
+	tb_port_set_link_width(port, TB_LINK_WIDTH_SINGLE);
+
 	return ret;
 }
 
@@ -1095,27 +1115,34 @@ int tb_port_lane_bonding_enable(struct tb_port *port)
 void tb_port_lane_bonding_disable(struct tb_port *port)
 {
 	tb_port_set_lane_bonding(port, false);
-	tb_port_set_link_width(port->dual_link_port, 1);
-	tb_port_set_link_width(port, 1);
+	tb_port_set_link_width(port->dual_link_port, TB_LINK_WIDTH_SINGLE);
+	tb_port_set_link_width(port, TB_LINK_WIDTH_SINGLE);
+	port->dual_link_port->bonded = false;
+	port->bonded = false;
 }
 
 /**
  * tb_port_wait_for_link_width() - Wait until link reaches specific width
  * @port: Port to wait for
- * @width: Expected link width (%1 or %2)
+ * @width_mask: Expected link width mask
  * @timeout_msec: Timeout in ms how long to wait
  *
  * Should be used after both ends of the link have been bonded (or
  * bonding has been disabled) to wait until the link actually reaches
- * the expected state. Returns %-ETIMEDOUT if the @width was not reached
- * within the given timeout, %0 if it did.
+ * the expected state. Returns %-ETIMEDOUT if the width was not reached
+ * within the given timeout, %0 if it did. Can be passed a mask of
+ * expected widths and succeeds if any of the widths is reached.
  */
-int tb_port_wait_for_link_width(struct tb_port *port, int width,
+int tb_port_wait_for_link_width(struct tb_port *port, unsigned int width_mask,
 				int timeout_msec)
 {
 	ktime_t timeout = ktime_add_ms(ktime_get(), timeout_msec);
 	int ret;
 
+	/* Gen 4 link does not support single lane */
+	if ((width_mask & TB_LINK_WIDTH_SINGLE) && is_gen4_link(port))
+		return -EOPNOTSUPP;
+
 	do {
 		ret = tb_port_get_link_width(port);
 		if (ret < 0) {
@@ -1126,7 +1153,7 @@ int tb_port_wait_for_link_width(struct tb_port *port, int width,
 			 */
 			if (ret != -EACCES)
 				return ret;
-		} else if (ret == width) {
+		} else if (ret & width_mask) {
 			return 0;
 		}
 
@@ -1778,20 +1805,57 @@ static ssize_t speed_show(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR(rx_speed, 0444, speed_show, NULL);
 static DEVICE_ATTR(tx_speed, 0444, speed_show, NULL);
 
-static ssize_t lanes_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
+static ssize_t rx_lanes_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
 {
 	struct tb_switch *sw = tb_to_switch(dev);
+	unsigned int width;
+
+	switch (sw->link_width) {
+	case TB_LINK_WIDTH_SINGLE:
+	case TB_LINK_WIDTH_ASYM_TX:
+		width = 1;
+		break;
+	case TB_LINK_WIDTH_DUAL:
+		width = 2;
+		break;
+	case TB_LINK_WIDTH_ASYM_RX:
+		width = 3;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
 
-	return sysfs_emit(buf, "%u\n", sw->link_width);
+	return sysfs_emit(buf, "%u\n", width);
 }
+static DEVICE_ATTR(rx_lanes, 0444, rx_lanes_show, NULL);
 
-/*
- * Currently link has same amount of lanes both directions (1 or 2) but
- * expose them separately to allow possible asymmetric links in the future.
- */
-static DEVICE_ATTR(rx_lanes, 0444, lanes_show, NULL);
-static DEVICE_ATTR(tx_lanes, 0444, lanes_show, NULL);
+static ssize_t tx_lanes_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct tb_switch *sw = tb_to_switch(dev);
+	unsigned int width;
+
+	switch (sw->link_width) {
+	case TB_LINK_WIDTH_SINGLE:
+	case TB_LINK_WIDTH_ASYM_RX:
+		width = 1;
+		break;
+	case TB_LINK_WIDTH_DUAL:
+		width = 2;
+		break;
+	case TB_LINK_WIDTH_ASYM_TX:
+		width = 3;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+
+	return sysfs_emit(buf, "%u\n", width);
+}
+static DEVICE_ATTR(tx_lanes, 0444, tx_lanes_show, NULL);
 
 static ssize_t nvm_authenticate_show(struct device *dev,
 	struct device_attribute *attr, char *buf)
@@ -2624,6 +2688,7 @@ int tb_switch_lane_bonding_enable(struct tb_switch *sw)
 {
 	struct tb_port *up, *down;
 	u64 route = tb_route(sw);
+	unsigned int width_mask;
 	int ret;
 
 	if (!route)
@@ -2635,8 +2700,8 @@ int tb_switch_lane_bonding_enable(struct tb_switch *sw)
 	up = tb_upstream_port(sw);
 	down = tb_switch_downstream_port(sw);
 
-	if (!tb_port_is_width_supported(up, 2) ||
-	    !tb_port_is_width_supported(down, 2))
+	if (!tb_port_is_width_supported(up, TB_LINK_WIDTH_DUAL) ||
+	    !tb_port_is_width_supported(down, TB_LINK_WIDTH_DUAL))
 		return 0;
 
 	ret = tb_port_lane_bonding_enable(up);
@@ -2652,7 +2717,11 @@ int tb_switch_lane_bonding_enable(struct tb_switch *sw)
 		return ret;
 	}
 
-	ret = tb_port_wait_for_link_width(down, 2, 100);
+	/* Any of the widths are all bonded */
+	width_mask = TB_LINK_WIDTH_DUAL | TB_LINK_WIDTH_ASYM_TX |
+		     TB_LINK_WIDTH_ASYM_RX;
+
+	ret = tb_port_wait_for_link_width(down, width_mask, 100);
 	if (ret) {
 		tb_port_warn(down, "timeout enabling lane bonding\n");
 		return ret;
@@ -2676,6 +2745,7 @@ int tb_switch_lane_bonding_enable(struct tb_switch *sw)
 void tb_switch_lane_bonding_disable(struct tb_switch *sw)
 {
 	struct tb_port *up, *down;
+	int ret;
 
 	if (!tb_route(sw))
 		return;
@@ -2693,7 +2763,8 @@ void tb_switch_lane_bonding_disable(struct tb_switch *sw)
 	 * It is fine if we get other errors as the router might have
 	 * been unplugged.
 	 */
-	if (tb_port_wait_for_link_width(down, 1, 100) == -ETIMEDOUT)
+	ret = tb_port_wait_for_link_width(down, TB_LINK_WIDTH_SINGLE, 100);
+	if (ret == -ETIMEDOUT)
 		tb_sw_warn(sw, "timeout disabling lane bonding\n");
 
 	tb_port_update_credits(down);
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index aa6e11589c28..440693f561a4 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -570,7 +570,8 @@ static int tb_available_bandwidth(struct tb *tb, struct tb_port *src_port,
 		usb3_consumed_down = 0;
 	}
 
-	*available_up = *available_down = 40000;
+	/* Maximum possible bandwidth asymmetric Gen 4 link is 120 Gb/s */
+	*available_up = *available_down = 120000;
 
 	/* Find the minimum available bandwidth over all links */
 	tb_for_each_port_on_path(src_port, dst_port, port) {
@@ -581,18 +582,45 @@ static int tb_available_bandwidth(struct tb *tb, struct tb_port *src_port,
 
 		if (tb_is_upstream_port(port)) {
 			link_speed = port->sw->link_speed;
+			/*
+			 * sw->link_width is from upstream perspective
+			 * so we use the opposite for downstream of the
+			 * host router.
+			 */
+			if (port->sw->link_width == TB_LINK_WIDTH_ASYM_TX) {
+				up_bw = link_speed * 3 * 1000;
+				down_bw = link_speed * 1 * 1000;
+			} else if (port->sw->link_width == TB_LINK_WIDTH_ASYM_RX) {
+				up_bw = link_speed * 1 * 1000;
+				down_bw = link_speed * 3 * 1000;
+			} else {
+				up_bw = link_speed * port->sw->link_width * 1000;
+				down_bw = up_bw;
+			}
 		} else {
 			link_speed = tb_port_get_link_speed(port);
 			if (link_speed < 0)
 				return link_speed;
-		}
 
-		link_width = port->bonded ? 2 : 1;
+			link_width = tb_port_get_link_width(port);
+			if (link_width < 0)
+				return link_width;
+
+			if (link_width == TB_LINK_WIDTH_ASYM_TX) {
+				up_bw = link_speed * 1 * 1000;
+				down_bw = link_speed * 3 * 1000;
+			} else if (link_width == TB_LINK_WIDTH_ASYM_RX) {
+				up_bw = link_speed * 3 * 1000;
+				down_bw = link_speed * 1 * 1000;
+			} else {
+				up_bw = link_speed * link_width * 1000;
+				down_bw = up_bw;
+			}
+		}
 
-		up_bw = link_speed * link_width * 1000; /* Mb/s */
 		/* Leave 10% guard band */
 		up_bw -= up_bw / 10;
-		down_bw = up_bw;
+		down_bw -= down_bw / 10;
 
 		tb_port_dbg(port, "link total bandwidth %d/%d Mb/s\n", up_bw,
 			    down_bw);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index bc91fcf5f430..845e851012e5 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -135,7 +135,7 @@ struct tb_switch_tmu {
  * @vendor_name: Name of the vendor (or %NULL if not known)
  * @device_name: Name of the device (or %NULL if not known)
  * @link_speed: Speed of the link in Gb/s
- * @link_width: Width of the link (1 or 2)
+ * @link_width: Width of the upstream facing link
  * @link_usb4: Upstream link is USB4
  * @generation: Switch Thunderbolt generation
  * @cap_plug_events: Offset to the plug events capability (%0 if not found)
@@ -173,6 +173,11 @@ struct tb_switch_tmu {
  * switches) you need to have domain lock held.
  *
  * In USB4 terminology this structure represents a router.
+ *
+ * Note @link_width is not the same as whether link is bonded or not.
+ * For Gen 4 links the link is also bonded when it is asymmetric. The
+ * correct way to find out whether the link is bonded or not is to look
+ * @bonded field of the upstream port.
  */
 struct tb_switch {
 	struct device dev;
@@ -188,7 +193,7 @@ struct tb_switch {
 	const char *vendor_name;
 	const char *device_name;
 	unsigned int link_speed;
-	unsigned int link_width;
+	enum tb_link_width link_width;
 	bool link_usb4;
 	unsigned int generation;
 	int cap_plug_events;
@@ -1050,11 +1055,10 @@ static inline bool tb_port_use_credit_allocation(const struct tb_port *port)
 
 int tb_port_get_link_speed(struct tb_port *port);
 int tb_port_get_link_width(struct tb_port *port);
-int tb_port_set_link_width(struct tb_port *port, unsigned int width);
-int tb_port_set_lane_bonding(struct tb_port *port, bool bonding);
+int tb_port_set_link_width(struct tb_port *port, enum tb_link_width width);
 int tb_port_lane_bonding_enable(struct tb_port *port);
 void tb_port_lane_bonding_disable(struct tb_port *port);
-int tb_port_wait_for_link_width(struct tb_port *port, int width,
+int tb_port_wait_for_link_width(struct tb_port *port, unsigned int width_mask,
 				int timeout_msec);
 int tb_port_update_credits(struct tb_port *port);
 
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 0716d6b7701a..69455eaf6351 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -346,6 +346,7 @@ struct tb_regs_port_header {
 #define LANE_ADP_CS_1_CURRENT_SPEED_SHIFT	16
 #define LANE_ADP_CS_1_CURRENT_SPEED_GEN2	0x8
 #define LANE_ADP_CS_1_CURRENT_SPEED_GEN3	0x4
+#define LANE_ADP_CS_1_CURRENT_SPEED_GEN4	0x2
 #define LANE_ADP_CS_1_CURRENT_WIDTH_MASK	GENMASK(25, 20)
 #define LANE_ADP_CS_1_CURRENT_WIDTH_SHIFT	20
 #define LANE_ADP_CS_1_PMS			BIT(30)
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 8389961b2d45..5b5566862318 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1290,13 +1290,16 @@ static int tb_xdomain_link_state_change(struct tb_xdomain *xd,
 
 static int tb_xdomain_bond_lanes_uuid_high(struct tb_xdomain *xd)
 {
+	unsigned int width, width_mask;
 	struct tb_port *port;
-	int ret, width;
+	int ret;
 
 	if (xd->target_link_width == LANE_ADP_CS_1_TARGET_WIDTH_SINGLE) {
-		width = 1;
+		width = TB_LINK_WIDTH_SINGLE;
+		width_mask = width;
 	} else if (xd->target_link_width == LANE_ADP_CS_1_TARGET_WIDTH_DUAL) {
-		width = 2;
+		width = TB_LINK_WIDTH_DUAL;
+		width_mask = width | TB_LINK_WIDTH_ASYM_TX | TB_LINK_WIDTH_ASYM_RX;
 	} else {
 		if (xd->state_retries-- > 0) {
 			dev_dbg(&xd->dev,
@@ -1328,15 +1331,16 @@ static int tb_xdomain_bond_lanes_uuid_high(struct tb_xdomain *xd)
 		return ret;
 	}
 
-	ret = tb_port_wait_for_link_width(port, width, XDOMAIN_BONDING_TIMEOUT);
+	ret = tb_port_wait_for_link_width(port, width_mask,
+					  XDOMAIN_BONDING_TIMEOUT);
 	if (ret) {
 		dev_warn(&xd->dev, "error waiting for link width to become %d\n",
-			 width);
+			 width_mask);
 		return ret;
 	}
 
-	port->bonded = width == 2;
-	port->dual_link_port->bonded = width == 2;
+	port->bonded = width > TB_LINK_WIDTH_SINGLE;
+	port->dual_link_port->bonded = width > TB_LINK_WIDTH_SINGLE;
 
 	tb_port_update_credits(port);
 	tb_xdomain_update_link_attributes(xd);
@@ -1735,16 +1739,57 @@ static ssize_t speed_show(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR(rx_speed, 0444, speed_show, NULL);
 static DEVICE_ATTR(tx_speed, 0444, speed_show, NULL);
 
-static ssize_t lanes_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
+static ssize_t rx_lanes_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
 {
 	struct tb_xdomain *xd = container_of(dev, struct tb_xdomain, dev);
+	unsigned int width;
 
-	return sysfs_emit(buf, "%u\n", xd->link_width);
+	switch (xd->link_width) {
+	case TB_LINK_WIDTH_SINGLE:
+	case TB_LINK_WIDTH_ASYM_RX:
+		width = 1;
+		break;
+	case TB_LINK_WIDTH_DUAL:
+		width = 2;
+		break;
+	case TB_LINK_WIDTH_ASYM_TX:
+		width = 3;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+
+	return sysfs_emit(buf, "%u\n", width);
 }
+static DEVICE_ATTR(rx_lanes, 0444, rx_lanes_show, NULL);
+
+static ssize_t tx_lanes_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct tb_xdomain *xd = container_of(dev, struct tb_xdomain, dev);
+	unsigned int width;
 
-static DEVICE_ATTR(rx_lanes, 0444, lanes_show, NULL);
-static DEVICE_ATTR(tx_lanes, 0444, lanes_show, NULL);
+	switch (xd->link_width) {
+	case TB_LINK_WIDTH_SINGLE:
+	case TB_LINK_WIDTH_ASYM_TX:
+		width = 1;
+		break;
+	case TB_LINK_WIDTH_DUAL:
+		width = 2;
+		break;
+	case TB_LINK_WIDTH_ASYM_RX:
+		width = 3;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+
+	return sysfs_emit(buf, "%u\n", width);
+}
+static DEVICE_ATTR(tx_lanes, 0444, tx_lanes_show, NULL);
 
 static struct attribute *xdomain_attrs[] = {
 	&dev_attr_device.attr,
@@ -1974,6 +2019,7 @@ void tb_xdomain_remove(struct tb_xdomain *xd)
  */
 int tb_xdomain_lane_bonding_enable(struct tb_xdomain *xd)
 {
+	unsigned int width_mask;
 	struct tb_port *port;
 	int ret;
 
@@ -1997,7 +2043,12 @@ int tb_xdomain_lane_bonding_enable(struct tb_xdomain *xd)
 		return ret;
 	}
 
-	ret = tb_port_wait_for_link_width(port, 2, XDOMAIN_BONDING_TIMEOUT);
+	/* Any of the widths are all bonded */
+	width_mask = TB_LINK_WIDTH_DUAL | TB_LINK_WIDTH_ASYM_TX |
+		     TB_LINK_WIDTH_ASYM_RX;
+
+	ret = tb_port_wait_for_link_width(port, width_mask,
+					  XDOMAIN_BONDING_TIMEOUT);
 	if (ret) {
 		tb_port_warn(port, "failed to enable lane bonding\n");
 		return ret;
@@ -2024,8 +2075,11 @@ void tb_xdomain_lane_bonding_disable(struct tb_xdomain *xd)
 
 	port = tb_xdomain_downstream_port(xd);
 	if (port->dual_link_port) {
+		int ret;
+
 		tb_port_lane_bonding_disable(port);
-		if (tb_port_wait_for_link_width(port, 1, 100) == -ETIMEDOUT)
+		ret = tb_port_wait_for_link_width(port, TB_LINK_WIDTH_SINGLE, 100);
+		if (ret == -ETIMEDOUT)
 			tb_port_warn(port, "timeout disabling lane bonding\n");
 		tb_port_disable(port->dual_link_port);
 		tb_port_update_credits(port);
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 90cd08ab2f5d..02333f47c994 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -171,6 +171,20 @@ struct tb_property *tb_property_get_next(struct tb_property_dir *dir,
 int tb_register_property_dir(const char *key, struct tb_property_dir *dir);
 void tb_unregister_property_dir(const char *key, struct tb_property_dir *dir);
 
+/**
+ * enum tb_link_width - Thunderbolt/USB4 link width
+ * @TB_LINK_WIDTH_SINGLE: Single lane link
+ * @TB_LINK_WIDTH_DUAL: Dual lane symmetric link
+ * @TB_LINK_WIDTH_ASYM_TX: Dual lane asymmetric Gen 4 link with 3 trasmitters
+ * @TB_LINK_WIDTH_ASYM_RX: Dual lane asymmetric Gen 4 link with 3 receivers
+ */
+enum tb_link_width {
+	TB_LINK_WIDTH_SINGLE = BIT(0),
+	TB_LINK_WIDTH_DUAL = BIT(1),
+	TB_LINK_WIDTH_ASYM_TX = BIT(2),
+	TB_LINK_WIDTH_ASYM_RX = BIT(3),
+};
+
 /**
  * struct tb_xdomain - Cross-domain (XDomain) connection
  * @dev: XDomain device
@@ -186,7 +200,7 @@ void tb_unregister_property_dir(const char *key, struct tb_property_dir *dir);
  * @vendor_name: Name of the vendor (or %NULL if not known)
  * @device_name: Name of the device (or %NULL if not known)
  * @link_speed: Speed of the link in Gb/s
- * @link_width: Width of the link (1 or 2)
+ * @link_width: Width of the downstream facing link
  * @link_usb4: Downstream link is USB4
  * @is_unplugged: The XDomain is unplugged
  * @needs_uuid: If the XDomain does not have @remote_uuid it will be
@@ -234,7 +248,7 @@ struct tb_xdomain {
 	const char *vendor_name;
 	const char *device_name;
 	unsigned int link_speed;
-	unsigned int link_width;
+	enum tb_link_width link_width;
 	bool link_usb4;
 	bool is_unplugged;
 	bool needs_uuid;
-- 
2.39.2


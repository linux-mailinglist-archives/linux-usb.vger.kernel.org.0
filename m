Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD0AF7147A9
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbjE2KEi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231916AbjE2KEf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:35 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99847C4
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354672; x=1716890672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=whWFz9RyW3TfeGp3ipNMG6t6fJqJGOQUaYiaDltuCyA=;
  b=j5R4JwWq+ANtacWYoKT3sygTRnMW7NqsNlNOpHSk0pFwXSvGene+n6Eg
   nmK4oSk9ZICpWHfTzaNOJ97koN8kgbYTd9+bwtQXC5koe6ILFqF5LiBfG
   rx7pwkRw6JZGfKxeir80LM44qc3z9TN7jIQ6yjM55inxOSssv7ftbCxQQ
   HiEN3kLew+WksaUuvF63mNEyFYR+KSmQ8A3HjoubinP9Anrc/XSMmOywM
   zQKOrLSe939MCgAjh+rCqFa1dhERFrxontcFut3UAP/KDyBRzyH9OOeIj
   bqGnTSJORV+94KUTE3ly4cT6sSV0Yds0f4JVC+EYJH1U4kPEsfDzRBDQS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684418"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684418"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518286"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518286"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C1B0D24F; Mon, 29 May 2023 13:04:25 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 01/20] thunderbolt: Introduce tb_switch_downstream_port()
Date:   Mon, 29 May 2023 13:04:06 +0300
Message-Id: <20230529100425.6125-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
References: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Gil Fine <gil.fine@intel.com>

Introduce tb_switch_downstream_port() helper function that returns the
downstream port of a parent switch that is connected to the upstream
port of specified switch. From now on, we use it all across the driver
where applicable.

While there fix a whitespace in comment and rename 'downstream' to
'down' to be consistent with the rest of the driver.

Signed-off-by: Gil Fine <gil.fine@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/acpi.c   |  5 ++---
 drivers/thunderbolt/icm.c    | 24 ++++++++++--------------
 drivers/thunderbolt/switch.c | 19 +++++++------------
 drivers/thunderbolt/tb.c     |  8 +++-----
 drivers/thunderbolt/tb.h     | 14 ++++++++++++++
 drivers/thunderbolt/tmu.c    | 29 +++++++++++++----------------
 drivers/thunderbolt/usb4.c   |  9 ++++-----
 7 files changed, 53 insertions(+), 55 deletions(-)

diff --git a/drivers/thunderbolt/acpi.c b/drivers/thunderbolt/acpi.c
index 3514bf65b7a4..38fefd0e5268 100644
--- a/drivers/thunderbolt/acpi.c
+++ b/drivers/thunderbolt/acpi.c
@@ -296,16 +296,15 @@ static bool tb_acpi_bus_match(struct device *dev)
 
 static struct acpi_device *tb_acpi_switch_find_companion(struct tb_switch *sw)
 {
+	struct tb_switch *parent_sw = tb_switch_parent(sw);
 	struct acpi_device *adev = NULL;
-	struct tb_switch *parent_sw;
 
 	/*
 	 * Device routers exists under the downstream facing USB4 port
 	 * of the parent router. Their _ADR is always 0.
 	 */
-	parent_sw = tb_switch_parent(sw);
 	if (parent_sw) {
-		struct tb_port *port = tb_port_at(tb_route(sw), parent_sw);
+		struct tb_port *port = tb_switch_downstream_port(sw);
 		struct acpi_device *port_adev;
 
 		port_adev = acpi_find_child_by_adr(ACPI_COMPANION(&parent_sw->dev),
diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 86521ebb2579..05274caf1466 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -644,13 +644,14 @@ static int add_switch(struct tb_switch *parent_sw, struct tb_switch *sw)
 	return ret;
 }
 
-static void update_switch(struct tb_switch *parent_sw, struct tb_switch *sw,
-			  u64 route, u8 connection_id, u8 connection_key,
-			  u8 link, u8 depth, bool boot)
+static void update_switch(struct tb_switch *sw, u64 route, u8 connection_id,
+			  u8 connection_key, u8 link, u8 depth, bool boot)
 {
+	struct tb_switch *parent_sw = tb_switch_parent(sw);
+
 	/* Disconnect from parent */
-	tb_port_at(tb_route(sw), parent_sw)->remote = NULL;
-	/* Re-connect via updated port*/
+	tb_switch_downstream_port(sw)->remote = NULL;
+	/* Re-connect via updated port */
 	tb_port_at(route, parent_sw)->remote = tb_upstream_port(sw);
 
 	/* Update with the new addressing information */
@@ -671,10 +672,7 @@ static void update_switch(struct tb_switch *parent_sw, struct tb_switch *sw,
 
 static void remove_switch(struct tb_switch *sw)
 {
-	struct tb_switch *parent_sw;
-
-	parent_sw = tb_to_switch(sw->dev.parent);
-	tb_port_at(tb_route(sw), parent_sw)->remote = NULL;
+	tb_switch_downstream_port(sw)->remote = NULL;
 	tb_switch_remove(sw);
 }
 
@@ -755,7 +753,6 @@ icm_fr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr)
 	if (sw) {
 		u8 phy_port, sw_phy_port;
 
-		parent_sw = tb_to_switch(sw->dev.parent);
 		sw_phy_port = tb_phy_port_from_link(sw->link);
 		phy_port = tb_phy_port_from_link(link);
 
@@ -785,7 +782,7 @@ icm_fr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr)
 				route = tb_route(sw);
 			}
 
-			update_switch(parent_sw, sw, route, pkg->connection_id,
+			update_switch(sw, route, pkg->connection_id,
 				      pkg->connection_key, link, depth, boot);
 			tb_switch_put(sw);
 			return;
@@ -1236,9 +1233,8 @@ __icm_tr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr,
 	if (sw) {
 		/* Update the switch if it is still in the same place */
 		if (tb_route(sw) == route && !!sw->authorized == authorized) {
-			parent_sw = tb_to_switch(sw->dev.parent);
-			update_switch(parent_sw, sw, route, pkg->connection_id,
-				      0, 0, 0, boot);
+			update_switch(sw, route, pkg->connection_id, 0, 0, 0,
+				      boot);
 			tb_switch_put(sw);
 			return;
 		}
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 51e86b5171c7..4f3d02c58c9e 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2754,7 +2754,6 @@ static int tb_switch_update_link_attributes(struct tb_switch *sw)
  */
 int tb_switch_lane_bonding_enable(struct tb_switch *sw)
 {
-	struct tb_switch *parent = tb_to_switch(sw->dev.parent);
 	struct tb_port *up, *down;
 	u64 route = tb_route(sw);
 	int ret;
@@ -2766,7 +2765,7 @@ int tb_switch_lane_bonding_enable(struct tb_switch *sw)
 		return 0;
 
 	up = tb_upstream_port(sw);
-	down = tb_port_at(route, parent);
+	down = tb_switch_downstream_port(sw);
 
 	if (!tb_port_is_width_supported(up, 2) ||
 	    !tb_port_is_width_supported(down, 2))
@@ -2808,7 +2807,6 @@ int tb_switch_lane_bonding_enable(struct tb_switch *sw)
  */
 void tb_switch_lane_bonding_disable(struct tb_switch *sw)
 {
-	struct tb_switch *parent = tb_to_switch(sw->dev.parent);
 	struct tb_port *up, *down;
 
 	if (!tb_route(sw))
@@ -2818,7 +2816,7 @@ void tb_switch_lane_bonding_disable(struct tb_switch *sw)
 	if (!up->bonded)
 		return;
 
-	down = tb_port_at(tb_route(sw), parent);
+	down = tb_switch_downstream_port(sw);
 
 	tb_port_lane_bonding_disable(up);
 	tb_port_lane_bonding_disable(down);
@@ -3476,7 +3474,6 @@ struct tb_port *tb_switch_find_port(struct tb_switch *sw,
 
 static int tb_switch_pm_secondary_resolve(struct tb_switch *sw)
 {
-	struct tb_switch *parent = tb_switch_parent(sw);
 	struct tb_port *up, *down;
 	int ret;
 
@@ -3484,7 +3481,7 @@ static int tb_switch_pm_secondary_resolve(struct tb_switch *sw)
 		return 0;
 
 	up = tb_upstream_port(sw);
-	down = tb_port_at(tb_route(sw), parent);
+	down = tb_switch_downstream_port(sw);
 	ret = tb_port_pm_secondary_enable(up);
 	if (ret)
 		return ret;
@@ -3494,7 +3491,6 @@ static int tb_switch_pm_secondary_resolve(struct tb_switch *sw)
 
 static int __tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
 {
-	struct tb_switch *parent = tb_switch_parent(sw);
 	bool up_clx_support, down_clx_support;
 	struct tb_port *up, *down;
 	int ret;
@@ -3510,7 +3506,7 @@ static int __tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
 		return 0;
 
 	/* Enable CLx only for first hop router (depth = 1) */
-	if (tb_route(parent))
+	if (tb_route(tb_switch_parent(sw)))
 		return 0;
 
 	ret = tb_switch_pm_secondary_resolve(sw);
@@ -3518,7 +3514,7 @@ static int __tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
 		return ret;
 
 	up = tb_upstream_port(sw);
-	down = tb_port_at(tb_route(sw), parent);
+	down = tb_switch_downstream_port(sw);
 
 	up_clx_support = tb_port_clx_supported(up, clx);
 	down_clx_support = tb_port_clx_supported(down, clx);
@@ -3594,7 +3590,6 @@ int tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
 
 static int __tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx)
 {
-	struct tb_switch *parent = tb_switch_parent(sw);
 	struct tb_port *up, *down;
 	int ret;
 
@@ -3609,11 +3604,11 @@ static int __tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx)
 		return 0;
 
 	/* Disable CLx only for first hop router (depth = 1) */
-	if (tb_route(parent))
+	if (tb_route(tb_switch_parent(sw)))
 		return 0;
 
 	up = tb_upstream_port(sw);
-	down = tb_port_at(tb_route(sw), parent);
+	down = tb_switch_downstream_port(sw);
 	ret = tb_port_clx_disable(up, clx);
 	if (ret)
 		return ret;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c1af712ca728..1ab3aa114a17 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -628,7 +628,7 @@ static int tb_tunnel_usb3(struct tb *tb, struct tb_switch *sw)
 	 * Look up available down port. Since we are chaining it should
 	 * be found right above this switch.
 	 */
-	port = tb_port_at(tb_route(sw), parent);
+	port = tb_switch_downstream_port(sw);
 	down = tb_find_usb3_down(parent, port);
 	if (!down)
 		return 0;
@@ -1378,7 +1378,6 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 {
 	struct tb_port *up, *down, *port;
 	struct tb_cm *tcm = tb_priv(tb);
-	struct tb_switch *parent_sw;
 	struct tb_tunnel *tunnel;
 
 	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
@@ -1389,9 +1388,8 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 	 * Look up available down port. Since we are chaining it should
 	 * be found right above this switch.
 	 */
-	parent_sw = tb_to_switch(sw->dev.parent);
-	port = tb_port_at(tb_route(sw), parent_sw);
-	down = tb_find_pcie_down(parent_sw, port);
+	port = tb_switch_downstream_port(sw);
+	down = tb_find_pcie_down(tb_switch_parent(sw), port);
 	if (!down)
 		return 0;
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index f7728c7acdda..beaeea679e10 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -857,6 +857,20 @@ static inline struct tb_switch *tb_switch_parent(struct tb_switch *sw)
 	return tb_to_switch(sw->dev.parent);
 }
 
+/**
+ * tb_switch_downstream_port() - Return downstream facing port of parent router
+ * @sw: Device router pointer
+ *
+ * Only call for device routers. Returns the downstream facing port of
+ * the parent router.
+ */
+static inline struct tb_port *tb_switch_downstream_port(struct tb_switch *sw)
+{
+	if (WARN_ON(!tb_route(sw)))
+		return NULL;
+	return tb_port_at(tb_route(sw), tb_switch_parent(sw));
+}
+
 static inline bool tb_switch_is_light_ridge(const struct tb_switch *sw)
 {
 	return sw->config.vendor_id == PCI_VENDOR_ID_INTEL &&
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 626aca3124b1..a46203b33c5f 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -398,11 +398,10 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 
 	if (tb_route(sw)) {
 		bool unidirectional = sw->tmu.unidirectional;
-		struct tb_switch *parent = tb_switch_parent(sw);
 		struct tb_port *down, *up;
 		int ret;
 
-		down = tb_port_at(tb_route(sw), parent);
+		down = tb_switch_downstream_port(sw);
 		up = tb_upstream_port(sw);
 		/*
 		 * In case of uni-directional time sync, TMU handshake is
@@ -442,10 +441,9 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 
 static void __tb_switch_tmu_off(struct tb_switch *sw, bool unidirectional)
 {
-	struct tb_switch *parent = tb_switch_parent(sw);
 	struct tb_port *down, *up;
 
-	down = tb_port_at(tb_route(sw), parent);
+	down = tb_switch_downstream_port(sw);
 	up = tb_upstream_port(sw);
 	/*
 	 * In case of any failure in one of the steps when setting
@@ -457,7 +455,8 @@ static void __tb_switch_tmu_off(struct tb_switch *sw, bool unidirectional)
 	tb_port_tmu_time_sync_disable(down);
 	tb_port_tmu_time_sync_disable(up);
 	if (unidirectional)
-		tb_switch_tmu_rate_write(parent, TB_SWITCH_TMU_RATE_OFF);
+		tb_switch_tmu_rate_write(tb_switch_parent(sw),
+					 TB_SWITCH_TMU_RATE_OFF);
 	else
 		tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
 
@@ -472,12 +471,11 @@ static void __tb_switch_tmu_off(struct tb_switch *sw, bool unidirectional)
  */
 static int __tb_switch_tmu_enable_bidirectional(struct tb_switch *sw)
 {
-	struct tb_switch *parent = tb_switch_parent(sw);
 	struct tb_port *up, *down;
 	int ret;
 
 	up = tb_upstream_port(sw);
-	down = tb_port_at(tb_route(sw), parent);
+	down = tb_switch_downstream_port(sw);
 
 	ret = tb_port_tmu_unidirectional_disable(up);
 	if (ret)
@@ -537,13 +535,13 @@ static int tb_switch_tmu_unidirectional_enable(struct tb_switch *sw)
  */
 static int __tb_switch_tmu_enable_unidirectional(struct tb_switch *sw)
 {
-	struct tb_switch *parent = tb_switch_parent(sw);
 	struct tb_port *up, *down;
 	int ret;
 
 	up = tb_upstream_port(sw);
-	down = tb_port_at(tb_route(sw), parent);
-	ret = tb_switch_tmu_rate_write(parent, sw->tmu.rate_request);
+	down = tb_switch_downstream_port(sw);
+	ret = tb_switch_tmu_rate_write(tb_switch_parent(sw),
+				       sw->tmu.rate_request);
 	if (ret)
 		return ret;
 
@@ -576,10 +574,9 @@ static int __tb_switch_tmu_enable_unidirectional(struct tb_switch *sw)
 
 static void __tb_switch_tmu_change_mode_prev(struct tb_switch *sw)
 {
-	struct tb_switch *parent = tb_switch_parent(sw);
 	struct tb_port *down, *up;
 
-	down = tb_port_at(tb_route(sw), parent);
+	down = tb_switch_downstream_port(sw);
 	up = tb_upstream_port(sw);
 	/*
 	 * In case of any failure in one of the steps when change mode,
@@ -589,7 +586,7 @@ static void __tb_switch_tmu_change_mode_prev(struct tb_switch *sw)
 	 */
 	tb_port_tmu_set_unidirectional(down, sw->tmu.unidirectional);
 	if (sw->tmu.unidirectional_request)
-		tb_switch_tmu_rate_write(parent, sw->tmu.rate);
+		tb_switch_tmu_rate_write(tb_switch_parent(sw), sw->tmu.rate);
 	else
 		tb_switch_tmu_rate_write(sw, sw->tmu.rate);
 
@@ -599,18 +596,18 @@ static void __tb_switch_tmu_change_mode_prev(struct tb_switch *sw)
 
 static int __tb_switch_tmu_change_mode(struct tb_switch *sw)
 {
-	struct tb_switch *parent = tb_switch_parent(sw);
 	struct tb_port *up, *down;
 	int ret;
 
 	up = tb_upstream_port(sw);
-	down = tb_port_at(tb_route(sw), parent);
+	down = tb_switch_downstream_port(sw);
 	ret = tb_port_tmu_set_unidirectional(down, sw->tmu.unidirectional_request);
 	if (ret)
 		goto out;
 
 	if (sw->tmu.unidirectional_request)
-		ret = tb_switch_tmu_rate_write(parent, sw->tmu.rate_request);
+		ret = tb_switch_tmu_rate_write(tb_switch_parent(sw),
+					       sw->tmu.rate_request);
 	else
 		ret = tb_switch_tmu_rate_write(sw, sw->tmu.rate_request);
 	if (ret)
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 485b6e430686..9f5a98347bee 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -234,8 +234,8 @@ static bool link_is_usb4(struct tb_port *port)
  */
 int usb4_switch_setup(struct tb_switch *sw)
 {
-	struct tb_port *downstream_port;
-	struct tb_switch *parent;
+	struct tb_switch *parent = tb_switch_parent(sw);
+	struct tb_port *down;
 	bool tbt3, xhci;
 	u32 val = 0;
 	int ret;
@@ -249,9 +249,8 @@ int usb4_switch_setup(struct tb_switch *sw)
 	if (ret)
 		return ret;
 
-	parent = tb_switch_parent(sw);
-	downstream_port = tb_port_at(tb_route(sw), parent);
-	sw->link_usb4 = link_is_usb4(downstream_port);
+	down = tb_switch_downstream_port(sw);
+	sw->link_usb4 = link_is_usb4(down);
 	tb_sw_dbg(sw, "link: %s\n", sw->link_usb4 ? "USB4" : "TBT");
 
 	xhci = val & ROUTER_CS_6_HCI;
-- 
2.39.2


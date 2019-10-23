Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F29FE18E9
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 13:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405034AbfJWLXL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 07:23:11 -0400
Received: from mga05.intel.com ([192.55.52.43]:63098 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404835AbfJWLWE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 07:22:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 04:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; 
   d="scan'208";a="223150877"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 23 Oct 2019 04:22:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6335A5AB; Wed, 23 Oct 2019 14:21:55 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mario.Limonciello@dell.com,
        Anthony Wong <anthony.wong@canonical.com>,
        Oliver Neukum <oneukum@suse.com>,
        Christian Kellner <ckellner@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/25] thunderbolt: Add support for lane bonding
Date:   Wed, 23 Oct 2019 14:21:39 +0300
Message-Id: <20191023112154.64235-11-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023112154.64235-1-mika.westerberg@linux.intel.com>
References: <20191023112154.64235-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Lane bonding allows aggregating two 10/20 Gb/s (depending on the
generation) lanes into a single 20/40 Gb/s bonded link. This allows
sharing the full bandwidth more efficiently. In order to establish lane
bonding we need to check that lane bonding is possible through link
controller and that both ends of the link actually supports 2x widths.
This also means that all the paths should be established through the
primary port so update tb_path_alloc() to handle this as well.

Lane bonding is supported starting from Falcon Ridge (2nd generation)
controllers.

We also expose the current speed and number of lanes under each device
except the host router following similar attribute naming than USB bus.
Expose speed and number of lanes for both directions to allow possibility
of asymmetric link in the future.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-thunderbolt         |  28 ++
 drivers/thunderbolt/icm.c                     |  12 +-
 drivers/thunderbolt/lc.c                      |  28 ++
 drivers/thunderbolt/path.c                    |  30 +-
 drivers/thunderbolt/switch.c                  | 288 ++++++++++++++++++
 drivers/thunderbolt/tb.c                      |  22 ++
 drivers/thunderbolt/tb.h                      |  10 +
 drivers/thunderbolt/tb_msgs.h                 |   2 +
 drivers/thunderbolt/tb_regs.h                 |  20 ++
 drivers/thunderbolt/tunnel.c                  |  19 +-
 10 files changed, 452 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
index b21fba14689b..30537ac33586 100644
--- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
@@ -104,6 +104,34 @@ Contact:	thunderbolt-software@lists.01.org
 Description:	This attribute contains name of this device extracted from
 		the device DROM.
 
+What:		/sys/bus/thunderbolt/devices/.../rx_speed
+Date:		Apr 2020
+KernelVersion:	5.6
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	This attribute reports the device RX speed per lane.
+		All RX lanes run at the same speed.
+
+What:		/sys/bus/thunderbolt/devices/.../rx_lanes
+Date:		Apr 2020
+KernelVersion:	5.6
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	This attribute reports number of RX lanes the device is
+		using simultaneusly through its upstream port.
+
+What:		/sys/bus/thunderbolt/devices/.../tx_speed
+Date:		Apr 2020
+KernelVersion:	5.6
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	This attribute reports the TX speed per lane.
+		All TX lanes run at the same speed.
+
+What:		/sys/bus/thunderbolt/devices/.../tx_lanes
+Date:		Apr 2020
+KernelVersion:	5.6
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	This attribute reports number of TX lanes the device is
+		using simultaneusly through its upstream port.
+
 What:		/sys/bus/thunderbolt/devices/.../vendor
 Date:		Sep 2017
 KernelVersion:	4.13
diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index d9caac77e08c..78480b782045 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -692,11 +692,11 @@ icm_fr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr)
 		(const struct icm_fr_event_device_connected *)hdr;
 	enum tb_security_level security_level;
 	struct tb_switch *sw, *parent_sw;
+	bool boot, dual_lane, speed_gen3;
 	struct icm *icm = tb_priv(tb);
 	bool authorized = false;
 	struct tb_xdomain *xd;
 	u8 link, depth;
-	bool boot;
 	u64 route;
 	int ret;
 
@@ -709,6 +709,8 @@ icm_fr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr)
 	security_level = (pkg->hdr.flags & ICM_FLAGS_SLEVEL_MASK) >>
 			 ICM_FLAGS_SLEVEL_SHIFT;
 	boot = pkg->link_info & ICM_LINK_INFO_BOOT;
+	dual_lane = pkg->hdr.flags & ICM_FLAGS_DUAL_LANE;
+	speed_gen3 = pkg->hdr.flags & ICM_FLAGS_SPEED_GEN3;
 
 	if (pkg->link_info & ICM_LINK_INFO_REJECTED) {
 		tb_info(tb, "switch at %u.%u was rejected by ICM firmware because topology limit exceeded\n",
@@ -817,6 +819,8 @@ icm_fr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr)
 		sw->authorized = authorized;
 		sw->security_level = security_level;
 		sw->boot = boot;
+		sw->link_speed = speed_gen3 ? 20 : 10;
+		sw->link_width = dual_lane ? 2 : 1;
 		sw->rpm = intel_vss_is_rtd3(pkg->ep_name, sizeof(pkg->ep_name));
 
 		if (add_switch(parent_sw, sw))
@@ -1152,10 +1156,10 @@ __icm_tr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr,
 {
 	const struct icm_tr_event_device_connected *pkg =
 		(const struct icm_tr_event_device_connected *)hdr;
+	bool authorized, boot, dual_lane, speed_gen3;
 	enum tb_security_level security_level;
 	struct tb_switch *sw, *parent_sw;
 	struct tb_xdomain *xd;
-	bool authorized, boot;
 	u64 route;
 
 	icm_postpone_rescan(tb);
@@ -1173,6 +1177,8 @@ __icm_tr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr,
 	security_level = (pkg->hdr.flags & ICM_FLAGS_SLEVEL_MASK) >>
 			 ICM_FLAGS_SLEVEL_SHIFT;
 	boot = pkg->link_info & ICM_LINK_INFO_BOOT;
+	dual_lane = pkg->hdr.flags & ICM_FLAGS_DUAL_LANE;
+	speed_gen3 = pkg->hdr.flags & ICM_FLAGS_SPEED_GEN3;
 
 	if (pkg->link_info & ICM_LINK_INFO_REJECTED) {
 		tb_info(tb, "switch at %llx was rejected by ICM firmware because topology limit exceeded\n",
@@ -1223,6 +1229,8 @@ __icm_tr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr,
 		sw->authorized = authorized;
 		sw->security_level = security_level;
 		sw->boot = boot;
+		sw->link_speed = speed_gen3 ? 20 : 10;
+		sw->link_width = dual_lane ? 2 : 1;
 		sw->rpm = force_rtd3;
 		if (!sw->rpm)
 			sw->rpm = intel_vss_is_rtd3(pkg->ep_name,
diff --git a/drivers/thunderbolt/lc.c b/drivers/thunderbolt/lc.c
index af38076088f6..df56523eb822 100644
--- a/drivers/thunderbolt/lc.c
+++ b/drivers/thunderbolt/lc.c
@@ -177,3 +177,31 @@ int tb_lc_set_sleep(struct tb_switch *sw)
 
 	return 0;
 }
+
+/**
+ * tb_lc_lane_bonding_possible() - Is lane bonding possible towards switch
+ * @sw: Switch to check
+ *
+ * Checks whether conditions for lane bonding from parent to @sw are
+ * possible.
+ */
+bool tb_lc_lane_bonding_possible(struct tb_switch *sw)
+{
+	struct tb_port *up;
+	int cap, ret;
+	u32 val;
+
+	if (sw->generation < 2)
+		return false;
+
+	up = tb_upstream_port(sw);
+	cap = find_port_lc_cap(up);
+	if (cap < 0)
+		return false;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, cap + TB_LC_PORT_ATTR, 1);
+	if (ret)
+		return false;
+
+	return !!(val & TB_LC_PORT_ATTR_BE);
+}
diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index afe5f8391ebf..6cf66597d5d8 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -220,7 +220,8 @@ struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
  * Creates path between two ports starting with given @src_hopid. Reserves
  * HopIDs for each port (they can be different from @src_hopid depending on
  * how many HopIDs each port already have reserved). If there are dual
- * links on the path, prioritizes using @link_nr.
+ * links on the path, prioritizes using @link_nr but takes into account
+ * that the lanes may be bonded.
  *
  * Return: Returns a tb_path on success or NULL on failure.
  */
@@ -259,7 +260,9 @@ struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
 		if (!in_port)
 			goto err;
 
-		if (in_port->dual_link_port && in_port->link_nr != link_nr)
+		/* When lanes are bonded primary link must be used */
+		if (!in_port->bonded && in_port->dual_link_port &&
+		    in_port->link_nr != link_nr)
 			in_port = in_port->dual_link_port;
 
 		ret = tb_port_alloc_in_hopid(in_port, in_hopid, in_hopid);
@@ -271,8 +274,27 @@ struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
 		if (!out_port)
 			goto err;
 
-		if (out_port->dual_link_port && out_port->link_nr != link_nr)
-			out_port = out_port->dual_link_port;
+		/*
+		 * Pick up right port when going from non-bonded to
+		 * bonded or from bonded to non-bonded.
+		 */
+		if (out_port->dual_link_port) {
+			if (!in_port->bonded && out_port->bonded &&
+			    out_port->link_nr) {
+				/*
+				 * Use primary link when going from
+				 * non-bonded to bonded.
+				 */
+				out_port = out_port->dual_link_port;
+			} else if (!out_port->bonded &&
+				   out_port->link_nr != link_nr) {
+				/*
+				 * If out port is not bonded follow
+				 * link_nr.
+				 */
+				out_port = out_port->dual_link_port;
+			}
+		}
 
 		if (i == num_hops - 1)
 			ret = tb_port_alloc_out_hopid(out_port, dst_hopid,
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index e4014053c21a..7e2cde5da31c 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -775,6 +775,132 @@ struct tb_port *tb_next_port_on_path(struct tb_port *start, struct tb_port *end,
 	return next;
 }
 
+static int tb_port_get_link_speed(struct tb_port *port)
+{
+	u32 val, speed;
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
+	speed = (val & LANE_ADP_CS_1_CURRENT_SPEED_MASK) >>
+		LANE_ADP_CS_1_CURRENT_SPEED_SHIFT;
+	return speed == LANE_ADP_CS_1_CURRENT_SPEED_GEN3 ? 20 : 10;
+}
+
+static int tb_port_get_link_width(struct tb_port *port)
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
+	return (val & LANE_ADP_CS_1_CURRENT_WIDTH_MASK) >>
+		LANE_ADP_CS_1_CURRENT_WIDTH_SHIFT;
+}
+
+static bool tb_port_is_width_supported(struct tb_port *port, int width)
+{
+	u32 phy, widths;
+	int ret;
+
+	if (!port->cap_phy)
+		return false;
+
+	ret = tb_port_read(port, &phy, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_0, 1);
+	if (ret)
+		return ret;
+
+	widths = (phy & LANE_ADP_CS_0_SUPPORTED_WIDTH_MASK) >>
+		LANE_ADP_CS_0_SUPPORTED_WIDTH_SHIFT;
+
+	return !!(widths & width);
+}
+
+static int tb_port_set_link_width(struct tb_port *port, unsigned int width)
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
+	val &= ~LANE_ADP_CS_1_TARGET_WIDTH_MASK;
+	switch (width) {
+	case 1:
+		val |= LANE_ADP_CS_1_TARGET_WIDTH_SINGLE <<
+			LANE_ADP_CS_1_TARGET_WIDTH_SHIFT;
+		break;
+	case 2:
+		val |= LANE_ADP_CS_1_TARGET_WIDTH_DUAL <<
+			LANE_ADP_CS_1_TARGET_WIDTH_SHIFT;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val |= LANE_ADP_CS_1_LB;
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_phy + LANE_ADP_CS_1, 1);
+}
+
+static int tb_port_lane_bonding_enable(struct tb_port *port)
+{
+	int ret;
+
+	/*
+	 * Enable lane bonding for both links if not already enabled by
+	 * for example the boot firmware.
+	 */
+	ret = tb_port_get_link_width(port);
+	if (ret == 1) {
+		ret = tb_port_set_link_width(port, 2);
+		if (ret)
+			return ret;
+	}
+
+	ret = tb_port_get_link_width(port->dual_link_port);
+	if (ret == 1) {
+		ret = tb_port_set_link_width(port->dual_link_port, 2);
+		if (ret) {
+			tb_port_set_link_width(port, 1);
+			return ret;
+		}
+	}
+
+	port->bonded = true;
+	port->dual_link_port->bonded = true;
+
+	return 0;
+}
+
+static void tb_port_lane_bonding_disable(struct tb_port *port)
+{
+	port->dual_link_port->bonded = false;
+	port->bonded = false;
+
+	tb_port_set_link_width(port->dual_link_port, 1);
+	tb_port_set_link_width(port, 1);
+}
+
 /**
  * tb_port_is_enabled() - Is the adapter port enabled
  * @port: Port to check
@@ -1174,6 +1300,36 @@ static ssize_t key_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR(key, 0600, key_show, key_store);
 
+static ssize_t speed_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct tb_switch *sw = tb_to_switch(dev);
+
+	return sprintf(buf, "%u.0 Gb/s\n", sw->link_speed);
+}
+
+/*
+ * Currently all lanes must run at the same speed but we expose here
+ * both directions to allow possible asymmetric links in the future.
+ */
+static DEVICE_ATTR(rx_speed, 0444, speed_show, NULL);
+static DEVICE_ATTR(tx_speed, 0444, speed_show, NULL);
+
+static ssize_t lanes_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct tb_switch *sw = tb_to_switch(dev);
+
+	return sprintf(buf, "%u\n", sw->link_width);
+}
+
+/*
+ * Currently link has same amount of lanes both directions (1 or 2) but
+ * expose them separately to allow possible asymmetric links in the future.
+ */
+static DEVICE_ATTR(rx_lanes, 0444, lanes_show, NULL);
+static DEVICE_ATTR(tx_lanes, 0444, lanes_show, NULL);
+
 static void nvm_authenticate_start(struct tb_switch *sw)
 {
 	struct pci_dev *root_port;
@@ -1330,6 +1486,10 @@ static struct attribute *switch_attrs[] = {
 	&dev_attr_key.attr,
 	&dev_attr_nvm_authenticate.attr,
 	&dev_attr_nvm_version.attr,
+	&dev_attr_rx_speed.attr,
+	&dev_attr_rx_lanes.attr,
+	&dev_attr_tx_speed.attr,
+	&dev_attr_tx_lanes.attr,
 	&dev_attr_vendor.attr,
 	&dev_attr_vendor_name.attr,
 	&dev_attr_unique_id.attr,
@@ -1360,6 +1520,13 @@ static umode_t switch_attr_is_visible(struct kobject *kobj,
 		    sw->security_level == TB_SECURITY_SECURE)
 			return attr->mode;
 		return 0;
+	} else if (attr == &dev_attr_rx_speed.attr ||
+		   attr == &dev_attr_rx_lanes.attr ||
+		   attr == &dev_attr_tx_speed.attr ||
+		   attr == &dev_attr_tx_lanes.attr) {
+		if (tb_route(sw))
+			return attr->mode;
+		return 0;
 	} else if (attr == &dev_attr_nvm_authenticate.attr) {
 		if (sw->dma_port && !sw->no_nvm_upgrade)
 			return attr->mode;
@@ -1759,6 +1926,123 @@ static int tb_switch_add_dma_port(struct tb_switch *sw)
 	return -ESHUTDOWN;
 }
 
+static bool tb_switch_lane_bonding_possible(struct tb_switch *sw)
+{
+	const struct tb_port *up = tb_upstream_port(sw);
+
+	if (!up->dual_link_port || !up->dual_link_port->remote)
+		return false;
+
+	return tb_lc_lane_bonding_possible(sw);
+}
+
+static int tb_switch_update_link_attributes(struct tb_switch *sw)
+{
+	struct tb_port *up;
+	bool change = false;
+	int ret;
+
+	if (!tb_route(sw) || tb_switch_is_icm(sw))
+		return 0;
+
+	up = tb_upstream_port(sw);
+
+	ret = tb_port_get_link_speed(up);
+	if (ret < 0)
+		return ret;
+	if (sw->link_speed != ret)
+		change = true;
+	sw->link_speed = ret;
+
+	ret = tb_port_get_link_width(up);
+	if (ret < 0)
+		return ret;
+	if (sw->link_width != ret)
+		change = true;
+	sw->link_width = ret;
+
+	/* Notify userspace that there is possible link attribute change */
+	if (device_is_registered(&sw->dev) && change)
+		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
+
+	return 0;
+}
+
+/**
+ * tb_switch_lane_bonding_enable() - Enable lane bonding
+ * @sw: Switch to enable lane bonding
+ *
+ * Connection manager can call this function to enable lane bonding of a
+ * switch. If conditions are correct and both switches support the feature,
+ * lanes are bonded. It is safe to call this to any switch.
+ */
+int tb_switch_lane_bonding_enable(struct tb_switch *sw)
+{
+	struct tb_switch *parent = tb_to_switch(sw->dev.parent);
+	struct tb_port *up, *down;
+	u64 route = tb_route(sw);
+	int ret;
+
+	if (!route)
+		return 0;
+
+	if (!tb_switch_lane_bonding_possible(sw))
+		return 0;
+
+	up = tb_upstream_port(sw);
+	down = tb_port_at(route, parent);
+
+	if (!tb_port_is_width_supported(up, 2) ||
+	    !tb_port_is_width_supported(down, 2))
+		return 0;
+
+	ret = tb_port_lane_bonding_enable(up);
+	if (ret) {
+		tb_port_warn(up, "failed to enable lane bonding\n");
+		return ret;
+	}
+
+	ret = tb_port_lane_bonding_enable(down);
+	if (ret) {
+		tb_port_warn(down, "failed to enable lane bonding\n");
+		tb_port_lane_bonding_disable(up);
+		return ret;
+	}
+
+	tb_switch_update_link_attributes(sw);
+
+	tb_sw_dbg(sw, "lane bonding enabled\n");
+	return ret;
+}
+
+/**
+ * tb_switch_lane_bonding_disable() - Disable lane bonding
+ * @sw: Switch whose lane bonding to disable
+ *
+ * Disables lane bonding between @sw and parent. This can be called even
+ * if lanes were not bonded originally.
+ */
+void tb_switch_lane_bonding_disable(struct tb_switch *sw)
+{
+	struct tb_switch *parent = tb_to_switch(sw->dev.parent);
+	struct tb_port *up, *down;
+
+	if (!tb_route(sw))
+		return;
+
+	up = tb_upstream_port(sw);
+	if (!up->bonded)
+		return;
+
+	down = tb_port_at(tb_route(sw), parent);
+
+	tb_port_lane_bonding_disable(up);
+	tb_port_lane_bonding_disable(down);
+
+	tb_switch_update_link_attributes(sw);
+	tb_sw_dbg(sw, "lane bonding disabled\n");
+}
+
 /**
  * tb_switch_add() - Add a switch to the domain
  * @sw: Switch to add
@@ -1814,6 +2098,10 @@ int tb_switch_add(struct tb_switch *sw)
 				return ret;
 			}
 		}
+
+		ret = tb_switch_update_link_attributes(sw);
+		if (ret)
+			return ret;
 	}
 
 	ret = device_add(&sw->dev);
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 49589b38ff12..f2ce6adc1f48 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -216,6 +216,10 @@ static void tb_scan_port(struct tb_port *port)
 		upstream_port->dual_link_port->remote = port->dual_link_port;
 	}
 
+	/* Enable lane bonding if supported */
+	if (tb_switch_lane_bonding_enable(sw))
+		tb_sw_warn(sw, "failed to enable lane bonding\n");
+
 	tb_scan_switch(sw);
 }
 
@@ -269,6 +273,7 @@ static void tb_free_unplugged_children(struct tb_switch *sw)
 			continue;
 
 		if (port->remote->sw->is_unplugged) {
+			tb_switch_lane_bonding_disable(port->remote->sw);
 			tb_switch_remove(port->remote->sw);
 			port->remote = NULL;
 			if (port->dual_link_port)
@@ -534,6 +539,7 @@ static void tb_handle_hotplug(struct work_struct *work)
 			tb_port_dbg(port, "switch unplugged\n");
 			tb_sw_set_unplugged(port->remote->sw);
 			tb_free_invalid_tunnels(tb);
+			tb_switch_lane_bonding_disable(port->remote->sw);
 			tb_switch_remove(port->remote->sw);
 			port->remote = NULL;
 			if (port->dual_link_port)
@@ -703,6 +709,21 @@ static int tb_suspend_noirq(struct tb *tb)
 	return 0;
 }
 
+static void tb_restore_children(struct tb_switch *sw)
+{
+	struct tb_port *port;
+
+	tb_switch_for_each_port(sw, port) {
+		if (!tb_port_has_remote(port))
+			continue;
+
+		if (tb_switch_lane_bonding_enable(port->remote->sw))
+			dev_warn(&sw->dev, "failed to restore lane bonding\n");
+
+		tb_restore_children(port->remote->sw);
+	}
+}
+
 static int tb_resume_noirq(struct tb *tb)
 {
 	struct tb_cm *tcm = tb_priv(tb);
@@ -716,6 +737,7 @@ static int tb_resume_noirq(struct tb *tb)
 	tb_switch_resume(tb->root_switch);
 	tb_free_invalid_tunnels(tb);
 	tb_free_unplugged_children(tb->root_switch);
+	tb_restore_children(tb->root_switch);
 	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list)
 		tb_tunnel_restart(tunnel);
 	if (!list_empty(&tcm->tunnel_list)) {
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 4c77d5264660..16d529983004 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -61,6 +61,8 @@ struct tb_switch_nvm {
  * @device: Device ID of the switch
  * @vendor_name: Name of the vendor (or %NULL if not known)
  * @device_name: Name of the device (or %NULL if not known)
+ * @link_speed: Speed of the link in Gb/s
+ * @link_width: Width of the link (1 or 2)
  * @generation: Switch Thunderbolt generation
  * @cap_plug_events: Offset to the plug events capability (%0 if not found)
  * @cap_lc: Offset to the link controller capability (%0 if not found)
@@ -97,6 +99,8 @@ struct tb_switch {
 	u16 device;
 	const char *vendor_name;
 	const char *device_name;
+	unsigned int link_speed;
+	unsigned int link_width;
 	unsigned int generation;
 	int cap_plug_events;
 	int cap_lc;
@@ -127,6 +131,7 @@ struct tb_switch {
  * @cap_adap: Offset of the adapter specific capability (%0 if not present)
  * @port: Port number on switch
  * @disabled: Disabled by eeprom
+ * @bonded: true if the port is bonded (two lanes combined as one)
  * @dual_link_port: If the switch is connected using two ports, points
  *		    to the other port.
  * @link_nr: Is this primary or secondary port on the dual_link.
@@ -142,6 +147,7 @@ struct tb_port {
 	int cap_adap;
 	u8 port;
 	bool disabled;
+	bool bonded;
 	struct tb_port *dual_link_port;
 	u8 link_nr:1;
 	struct ida in_hopids;
@@ -616,6 +622,9 @@ static inline bool tb_switch_is_icm(const struct tb_switch *sw)
 	return !sw->config.enabled;
 }
 
+int tb_switch_lane_bonding_enable(struct tb_switch *sw);
+void tb_switch_lane_bonding_disable(struct tb_switch *sw);
+
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
 int tb_port_add_nfc_credits(struct tb_port *port, int credits);
 int tb_port_set_initial_credits(struct tb_port *port, u32 credits);
@@ -659,6 +668,7 @@ int tb_lc_read_uuid(struct tb_switch *sw, u32 *uuid);
 int tb_lc_configure_link(struct tb_switch *sw);
 void tb_lc_unconfigure_link(struct tb_switch *sw);
 int tb_lc_set_sleep(struct tb_switch *sw);
+bool tb_lc_lane_bonding_possible(struct tb_switch *sw);
 
 static inline int tb_route_length(u64 route)
 {
diff --git a/drivers/thunderbolt/tb_msgs.h b/drivers/thunderbolt/tb_msgs.h
index 4b641e4ee0c5..3705057723b6 100644
--- a/drivers/thunderbolt/tb_msgs.h
+++ b/drivers/thunderbolt/tb_msgs.h
@@ -122,6 +122,8 @@ struct icm_pkg_header {
 #define ICM_FLAGS_NO_KEY		BIT(1)
 #define ICM_FLAGS_SLEVEL_SHIFT		3
 #define ICM_FLAGS_SLEVEL_MASK		GENMASK(4, 3)
+#define ICM_FLAGS_DUAL_LANE		BIT(5)
+#define ICM_FLAGS_SPEED_GEN3		BIT(7)
 #define ICM_FLAGS_WRITE			BIT(7)
 
 struct icm_pkg_driver_ready {
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index faa14b3df83c..3a39490a954b 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -220,6 +220,23 @@ struct tb_regs_port_header {
 #define ADP_CS_5_LCA_MASK			GENMASK(28, 22)
 #define ADP_CS_5_LCA_SHIFT			22
 
+/* Lane adapter registers */
+#define LANE_ADP_CS_0				0x00
+#define LANE_ADP_CS_0_SUPPORTED_WIDTH_MASK	GENMASK(25, 20)
+#define LANE_ADP_CS_0_SUPPORTED_WIDTH_SHIFT	20
+#define LANE_ADP_CS_1				0x01
+#define LANE_ADP_CS_1_TARGET_WIDTH_MASK		GENMASK(9, 4)
+#define LANE_ADP_CS_1_TARGET_WIDTH_SHIFT	4
+#define LANE_ADP_CS_1_TARGET_WIDTH_SINGLE	0x1
+#define LANE_ADP_CS_1_TARGET_WIDTH_DUAL		0x3
+#define LANE_ADP_CS_1_LB			BIT(15)
+#define LANE_ADP_CS_1_CURRENT_SPEED_MASK	GENMASK(19, 16)
+#define LANE_ADP_CS_1_CURRENT_SPEED_SHIFT	16
+#define LANE_ADP_CS_1_CURRENT_SPEED_GEN2	0x8
+#define LANE_ADP_CS_1_CURRENT_SPEED_GEN3	0x4
+#define LANE_ADP_CS_1_CURRENT_WIDTH_MASK	GENMASK(25, 20)
+#define LANE_ADP_CS_1_CURRENT_WIDTH_SHIFT	20
+
 /* Display Port adapter registers */
 #define ADP_DP_CS_0				0x00
 #define ADP_DP_CS_0_VIDEO_HOPID_MASK		GENMASK(26, 16)
@@ -277,6 +294,9 @@ struct tb_regs_hop {
 #define TB_LC_FUSE			0x03
 
 /* Link controller registers */
+#define TB_LC_PORT_ATTR			0x8d
+#define TB_LC_PORT_ATTR_BE		BIT(12)
+
 #define TB_LC_SX_CTRL			0x96
 #define TB_LC_SX_CTRL_L1C		BIT(16)
 #define TB_LC_SX_CTRL_L2C		BIT(20)
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 382331d71c28..3353396e0806 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -90,6 +90,22 @@ static int tb_pci_activate(struct tb_tunnel *tunnel, bool activate)
 	return 0;
 }
 
+static int tb_initial_credits(const struct tb_switch *sw)
+{
+	/* If the path is complete sw is not NULL */
+	if (sw) {
+		/* More credits for faster link */
+		switch (sw->link_speed * sw->link_width) {
+		case 40:
+			return 32;
+		case 20:
+			return 24;
+		}
+	}
+
+	return 16;
+}
+
 static void tb_pci_init_path(struct tb_path *path)
 {
 	path->egress_fc_enable = TB_PATH_SOURCE | TB_PATH_INTERNAL;
@@ -101,7 +117,8 @@ static void tb_pci_init_path(struct tb_path *path)
 	path->drop_packages = 0;
 	path->nfc_credits = 0;
 	path->hops[0].initial_credits = 7;
-	path->hops[1].initial_credits = 16;
+	path->hops[1].initial_credits =
+		tb_initial_credits(path->hops[1].in_port->sw);
 }
 
 /**
-- 
2.23.0


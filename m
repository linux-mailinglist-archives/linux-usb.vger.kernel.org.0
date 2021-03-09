Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6763327A1
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 14:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhCINs4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 08:48:56 -0500
Received: from mga09.intel.com ([134.134.136.24]:8336 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231319AbhCINsY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 08:48:24 -0500
IronPort-SDR: NxE/U+xEoln/jd99SeGEI0A6gu+PtXUU1dXtelQzQg/74AAivlm6UefU161bC3D/oce1VbbMMk
 0ttdw3wdQKhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="188339392"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="188339392"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 05:48:21 -0800
IronPort-SDR: aw/0DUCA2vpopQFoiuQJJYGSu18w1CzYTndEZQxFXRPxhqEZxTdpIyEtQZCfV1+LA1KgNGAAy4
 IZzwe2Ntz5PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="447506027"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 09 Mar 2021 05:48:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1260D565; Tue,  9 Mar 2021 15:48:19 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] thunderbolt: Expose more details about USB 3.x and DisplayPort tunnels
Date:   Tue,  9 Mar 2021 16:48:18 +0300
Message-Id: <20210309134818.63118-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This exposes two new attributes under each device router: usb3 and dp
that hold number of tunnels ending to this switch. These attributes are
only available if the connection manager supports it (tunneling_details
attribute reads 1). Currently only the software connection manager
supports this.

Based on these userspace can show the user more detailed information
what is going on.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-thunderbolt         | 26 ++++++++++
 drivers/thunderbolt/domain.c                  | 10 ++++
 drivers/thunderbolt/switch.c                  | 41 ++++++++++++++++
 drivers/thunderbolt/tb.c                      | 49 ++++++++++++++-----
 drivers/thunderbolt/tb.h                      |  4 ++
 include/linux/thunderbolt.h                   |  6 +++
 6 files changed, 125 insertions(+), 11 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
index c41c68f64693..1569be391ca6 100644
--- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
@@ -61,6 +61,14 @@ Description:	This attribute holds current Thunderbolt security level
 			 the BIOS.
 		=======  ==================================================
 
+What: /sys/bus/thunderbolt/devices/.../domainX/tunneling_details
+Date:		July 2021
+KernelVersion:	5.13
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	The connection manager implementation may expose
+		additional details about tunneling. If it supports this
+		the attribute reads 1.
+
 What: /sys/bus/thunderbolt/devices/.../authorized
 Date:		Sep 2017
 KernelVersion:	4.13
@@ -102,6 +110,15 @@ Contact:	thunderbolt-software@lists.01.org
 Description:	This attribute contains 1 if Thunderbolt device was already
 		authorized on boot and 0 otherwise.
 
+What: /sys/bus/thunderbolt/devices/.../dp
+Date:		Jul 2021
+KernelVersion:	5.13
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	Only available if the domain tunneling_details attribute
+		reads 1. If present means that the device router has
+		DisplayPort sink. Contents will be number how many
+		active DisplayPort tunnels end up to this router.
+
 What: /sys/bus/thunderbolt/devices/.../generation
 Date:		Jan 2020
 KernelVersion:	5.5
@@ -169,6 +186,15 @@ Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This attribute reports number of TX lanes the device is
 		using simultaneusly through its upstream port.
 
+What: /sys/bus/thunderbolt/devices/.../usb3
+Date:		Jul 2021
+KernelVersion:	5.13
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	Only available if the domain tunneling_details attribute
+		reads 1. If present means that the device router has
+		USB 3.x upstream adapter. Reads 1 if there is an active
+		USB 3.x tunnel to this router.
+
 What:		/sys/bus/thunderbolt/devices/.../vendor
 Date:		Sep 2017
 KernelVersion:	4.13
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index a7d83eec3d15..3a1fb7a39f90 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -282,11 +282,21 @@ static ssize_t security_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(security);
 
+static ssize_t tunneling_details_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	const struct tb *tb = container_of(dev, struct tb, dev);
+
+	return sprintf(buf, "%d\n", !!(tb->cm_caps & TB_CAP_TUNNEL_DETAILS));
+}
+static DEVICE_ATTR_RO(tunneling_details);
+
 static struct attribute *domain_attrs[] = {
 	&dev_attr_boot_acl.attr,
 	&dev_attr_deauthorization.attr,
 	&dev_attr_iommu_dma_protection.attr,
 	&dev_attr_security.attr,
+	&dev_attr_tunneling_details.attr,
 	NULL,
 };
 
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index e73cd296db7e..b72589eabf0c 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1487,6 +1487,21 @@ device_name_show(struct device *dev, struct device_attribute *attr, char *buf)
 }
 static DEVICE_ATTR_RO(device_name);
 
+static ssize_t dp_show(struct device *dev, struct device_attribute *attr,
+		       char *buf)
+{
+	struct tb_switch *sw = tb_to_switch(dev);
+	int ret;
+
+	if (!mutex_trylock(&sw->tb->lock))
+		return restart_syscall();
+	ret = sprintf(buf, "%u\n", sw->dp);
+	mutex_unlock(&sw->tb->lock);
+
+	return ret;
+}
+static DEVICE_ATTR_RO(dp);
+
 static ssize_t
 generation_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -1693,6 +1708,21 @@ static ssize_t nvm_version_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(nvm_version);
 
+static ssize_t usb3_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct tb_switch *sw = tb_to_switch(dev);
+	int ret;
+
+	if (!mutex_trylock(&sw->tb->lock))
+		return restart_syscall();
+	ret = sprintf(buf, "%u\n", sw->usb3);
+	mutex_unlock(&sw->tb->lock);
+
+	return ret;
+}
+static DEVICE_ATTR_RO(usb3);
+
 static ssize_t vendor_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
@@ -1725,6 +1755,7 @@ static struct attribute *switch_attrs[] = {
 	&dev_attr_boot.attr,
 	&dev_attr_device.attr,
 	&dev_attr_device_name.attr,
+	&dev_attr_dp.attr,
 	&dev_attr_generation.attr,
 	&dev_attr_key.attr,
 	&dev_attr_nvm_authenticate.attr,
@@ -1734,6 +1765,7 @@ static struct attribute *switch_attrs[] = {
 	&dev_attr_rx_lanes.attr,
 	&dev_attr_tx_speed.attr,
 	&dev_attr_tx_lanes.attr,
+	&dev_attr_usb3.attr,
 	&dev_attr_vendor.attr,
 	&dev_attr_vendor_name.attr,
 	&dev_attr_unique_id.attr,
@@ -1757,6 +1789,7 @@ static umode_t switch_attr_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct tb_switch *sw = tb_to_switch(dev);
+	const struct tb *tb = sw->tb;
 
 	if (attr == &dev_attr_authorized.attr) {
 		if (sw->tb->security_level == TB_SECURITY_NOPCIE ||
@@ -1769,6 +1802,10 @@ static umode_t switch_attr_is_visible(struct kobject *kobj,
 	} else if (attr == &dev_attr_device_name.attr) {
 		if (!sw->device_name)
 			return 0;
+	} else if (attr == &dev_attr_dp.attr) {
+		if (!(tb->cm_caps & TB_CAP_TUNNEL_DETAILS) ||
+		    !has_port(sw, TB_TYPE_DP_HDMI_OUT))
+			return 0;
 	} else if (attr == &dev_attr_vendor.attr)  {
 		if (!sw->vendor)
 			return 0;
@@ -1788,6 +1825,10 @@ static umode_t switch_attr_is_visible(struct kobject *kobj,
 		if (tb_route(sw))
 			return attr->mode;
 		return 0;
+	} else if (attr == &dev_attr_usb3.attr) {
+		if (!(tb->cm_caps & TB_CAP_TUNNEL_DETAILS) ||
+		    !has_port(sw, TB_TYPE_USB3_UP))
+			return 0;
 	} else if (attr == &dev_attr_nvm_authenticate.attr) {
 		if (nvm_upgradeable(sw))
 			return attr->mode;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 7e6dc2b03bed..32b79dce134f 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -104,10 +104,39 @@ static void tb_remove_dp_resources(struct tb_switch *sw)
 	}
 }
 
+static void tb_add_tunnel(struct tb *tb, struct tb_tunnel *tunnel)
+{
+	struct tb_switch *sw = tunnel->dst_port->sw;
+	struct tb_cm *tcm = tb_priv(tb);
+
+	if (tb_tunnel_is_usb3(tunnel)) {
+		sw->usb3++;
+	} else if (tb_tunnel_is_dp(tunnel)) {
+		sw->dp++;
+		/* Inform userspace about DP tunneling change */
+		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
+	}
+
+	list_add_tail(&tunnel->list, &tcm->tunnel_list);
+}
+
+static void tb_remove_tunnel(struct tb_tunnel *tunnel)
+{
+	struct tb_switch *sw = tunnel->dst_port->sw;
+
+	if (tb_tunnel_is_usb3(tunnel) && sw->usb3) {
+		sw->usb3--;
+	} else if (tb_tunnel_is_dp(tunnel) && sw->dp) {
+		sw->dp--;
+		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
+	}
+
+	list_del(&tunnel->list);
+}
+
 static void tb_discover_tunnels(struct tb_switch *sw)
 {
 	struct tb *tb = sw->tb;
-	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_port *port;
 
 	tb_switch_for_each_port(sw, port) {
@@ -146,7 +175,7 @@ static void tb_discover_tunnels(struct tb_switch *sw)
 			pm_runtime_get_sync(&tunnel->dst_port->sw->dev);
 		}
 
-		list_add_tail(&tunnel->list, &tcm->tunnel_list);
+		tb_add_tunnel(tb, tunnel);
 	}
 
 	tb_switch_for_each_port(sw, port) {
@@ -440,7 +469,6 @@ static int tb_tunnel_usb3(struct tb *tb, struct tb_switch *sw)
 	struct tb_switch *parent = tb_switch_parent(sw);
 	int ret, available_up, available_down;
 	struct tb_port *up, *down, *port;
-	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel;
 
 	if (!tb_acpi_may_tunnel_usb3()) {
@@ -503,7 +531,7 @@ static int tb_tunnel_usb3(struct tb *tb, struct tb_switch *sw)
 		goto err_free;
 	}
 
-	list_add_tail(&tunnel->list, &tcm->tunnel_list);
+	tb_add_tunnel(tb, tunnel);
 	if (tb_route(parent))
 		tb_reclaim_usb3_bandwidth(tb, down, up);
 
@@ -686,7 +714,7 @@ static void tb_deactivate_and_free_tunnel(struct tb_tunnel *tunnel)
 		return;
 
 	tb_tunnel_deactivate(tunnel);
-	list_del(&tunnel->list);
+	tb_remove_tunnel(tunnel);
 
 	tb = tunnel->tb;
 	src_port = tunnel->src_port;
@@ -937,7 +965,7 @@ static void tb_tunnel_dp(struct tb *tb)
 		goto err_free;
 	}
 
-	list_add_tail(&tunnel->list, &tcm->tunnel_list);
+	tb_add_tunnel(tb, tunnel);
 	tb_reclaim_usb3_bandwidth(tb, in, out);
 	return;
 
@@ -1038,7 +1066,7 @@ static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
 		return -ENODEV;
 
 	tb_tunnel_deactivate(tunnel);
-	list_del(&tunnel->list);
+	tb_remove_tunnel(tunnel);
 	tb_tunnel_free(tunnel);
 	return 0;
 }
@@ -1046,7 +1074,6 @@ static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
 static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 {
 	struct tb_port *up, *down, *port;
-	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_switch *parent_sw;
 	struct tb_tunnel *tunnel;
 
@@ -1075,7 +1102,7 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 		return -EIO;
 	}
 
-	list_add_tail(&tunnel->list, &tcm->tunnel_list);
+	tb_add_tunnel(tb, tunnel);
 	return 0;
 }
 
@@ -1083,7 +1110,6 @@ static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 				    int transmit_path, int transmit_ring,
 				    int receive_path, int receive_ring)
 {
-	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_port *nhi_port, *dst_port;
 	struct tb_tunnel *tunnel;
 	struct tb_switch *sw;
@@ -1108,7 +1134,7 @@ static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 		return -EIO;
 	}
 
-	list_add_tail(&tunnel->list, &tcm->tunnel_list);
+	tb_add_tunnel(tb, tunnel);
 	mutex_unlock(&tb->lock);
 	return 0;
 }
@@ -1586,6 +1612,7 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 		tb->security_level = TB_SECURITY_NOPCIE;
 
 	tb->cm_ops = &tb_cm_ops;
+	tb->cm_caps |= TB_CAP_TUNNEL_DETAILS;
 
 	tcm = tb_priv(tb);
 	INIT_LIST_HEAD(&tcm->tunnel_list);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 2af6d632e3d0..b4bc656a06b6 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -123,6 +123,8 @@ struct tb_switch_tmu {
  * @safe_mode: The switch is in safe-mode
  * @boot: Whether the switch was already authorized on boot or not
  * @rpm: The switch supports runtime PM
+ * @usb3: Number of USB 3.x tunnels to this switch (0 or 1)
+ * @dp: Number of DisplayPort tunnels ending to this switch
  * @authorized: Whether the switch is authorized by user or policy
  * @security_level: Switch supported security level
  * @debugfs_dir: Pointer to the debugfs structure
@@ -167,6 +169,8 @@ struct tb_switch {
 	bool safe_mode;
 	bool boot;
 	bool rpm;
+	unsigned int usb3;
+	unsigned int dp;
 	unsigned int authorized;
 	enum tb_security_level security_level;
 	struct dentry *debugfs_dir;
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index e7c96c37174f..dc6cfb4237d1 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -57,6 +57,9 @@ enum tb_security_level {
 	TB_SECURITY_NOPCIE,
 };
 
+/* Connection manager exposes details about tunneling */
+#define TB_CAP_TUNNEL_DETAILS	BIT(0)
+
 /**
  * struct tb - main thunderbolt bus structure
  * @dev: Domain device
@@ -67,6 +70,8 @@ enum tb_security_level {
  * @wq: Ordered workqueue for all domain specific work
  * @root_switch: Root switch of this domain
  * @cm_ops: Connection manager specific operations vector
+ * @cm_caps: Extra capabilities supported by the connection manager
+ *	     implementation
  * @index: Linux assigned domain number
  * @security_level: Current security level
  * @nboot_acl: Number of boot ACLs the domain supports
@@ -80,6 +85,7 @@ struct tb {
 	struct workqueue_struct *wq;
 	struct tb_switch *root_switch;
 	const struct tb_cm_ops *cm_ops;
+	unsigned int cm_caps;
 	int index;
 	enum tb_security_level security_level;
 	size_t nboot_acl;
-- 
2.30.1


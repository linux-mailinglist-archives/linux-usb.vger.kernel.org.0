Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7D0389006
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 16:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347120AbhESOOF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 10:14:05 -0400
Received: from mga14.intel.com ([192.55.52.115]:32007 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242465AbhESOOC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 10:14:02 -0400
IronPort-SDR: JHHAK1CmXWMzrLoRrDJDqarhNZRu7DDEGIfc7ogZ/vOT282bCGHAykeoG79wPd/JrOUXRYQp8A
 cqWKccOLpMhw==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="200677108"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="200677108"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 07:12:41 -0700
IronPort-SDR: KLAV25xHLEkS/lUn939eTI1CTeQz3cgLeY2kT2IWEfCvJyo9lGm3aYJZFbu9GehRtNVfXOUTAT
 I0cJP4oYedGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="467184407"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 19 May 2021 07:12:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6BFA4543; Wed, 19 May 2021 17:12:59 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-acpi@vger.kernel.org,
        Casey G Bowman <casey.g.bowman@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/9] thunderbolt: Add USB4 port devices
Date:   Wed, 19 May 2021 17:12:52 +0300
Message-Id: <20210519141259.84839-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210519141259.84839-1-mika.westerberg@linux.intel.com>
References: <20210519141259.84839-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Create devices for each USB4 port. This is needed when we add retimer
access when there is no device connected but may be useful for other
purposes too following what USB subsystem does. This exports a single
attribute "link" that shows the type of the USB4 link (or "none" if
there is no cable connected).

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-thunderbolt         |   7 ++
 drivers/thunderbolt/Makefile                  |   2 +-
 drivers/thunderbolt/retimer.c                 |  15 ++-
 drivers/thunderbolt/switch.c                  |  17 ++-
 drivers/thunderbolt/tb.h                      |  30 +++++
 drivers/thunderbolt/usb4.c                    |  54 +++++++++
 drivers/thunderbolt/usb4_port.c               | 112 ++++++++++++++++++
 7 files changed, 229 insertions(+), 8 deletions(-)
 create mode 100644 drivers/thunderbolt/usb4_port.c

diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
index 05afeee05538..3537ba1ba892 100644
--- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
@@ -290,6 +290,13 @@ Contact:	thunderbolt-software@lists.01.org
 Description:	This contains XDomain service specific settings as
 		bitmask. Format: %x
 
+What:		/sys/bus/thunderbolt/devices/usb4_portX/link
+Date:		Sep 2021
+KernelVersion:	v5.14
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	Returns the current link mode. Possible values are
+		"usb4", "tbt" and "none".
+
 What:		/sys/bus/thunderbolt/devices/<device>:<port>.<index>/device
 Date:		Oct 2020
 KernelVersion:	v5.9
diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index 7aa48f6c41d9..da19d7987d00 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -2,7 +2,7 @@
 obj-${CONFIG_USB4} := thunderbolt.o
 thunderbolt-objs := nhi.o nhi_ops.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
 thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
-thunderbolt-objs += nvm.o retimer.o quirks.o
+thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o
 
 thunderbolt-${CONFIG_ACPI} += acpi.o
 thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index c44fad2b9fbb..2e5188fb1150 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -283,11 +283,13 @@ struct device_type tb_retimer_type = {
 
 static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status)
 {
+	struct usb4_port *usb4;
 	struct tb_retimer *rt;
 	u32 vendor, device;
 	int ret;
 
-	if (!port->cap_usb4)
+	usb4 = port->usb4;
+	if (!usb4)
 		return -EINVAL;
 
 	ret = usb4_port_retimer_read(port, index, USB4_SB_VENDOR_ID, &vendor,
@@ -331,7 +333,7 @@ static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status)
 	rt->port = port;
 	rt->tb = port->sw->tb;
 
-	rt->dev.parent = &port->sw->dev;
+	rt->dev.parent = &usb4->dev;
 	rt->dev.bus = &tb_bus_type;
 	rt->dev.type = &tb_retimer_type;
 	dev_set_name(&rt->dev, "%s:%u.%u", dev_name(&port->sw->dev),
@@ -389,7 +391,7 @@ static struct tb_retimer *tb_port_find_retimer(struct tb_port *port, u8 index)
 	struct tb_retimer_lookup lookup = { .port = port, .index = index };
 	struct device *dev;
 
-	dev = device_find_child(&port->sw->dev, &lookup, retimer_match);
+	dev = device_find_child(&port->usb4->dev, &lookup, retimer_match);
 	if (dev)
 		return tb_to_retimer(dev);
 
@@ -479,7 +481,10 @@ static int remove_retimer(struct device *dev, void *data)
  */
 void tb_retimer_remove_all(struct tb_port *port)
 {
-	if (port->cap_usb4)
-		device_for_each_child_reverse(&port->sw->dev, port,
+	struct usb4_port *usb4;
+
+	usb4 = port->usb4;
+	if (usb4)
+		device_for_each_child_reverse(&usb4->dev, port,
 					      remove_retimer);
 }
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index e015dc93a916..7303c61a891a 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2741,11 +2741,16 @@ int tb_switch_add(struct tb_switch *sw)
 				 sw->device_name);
 	}
 
+	ret = usb4_switch_add_ports(sw);
+	if (ret) {
+		dev_err(&sw->dev, "failed to add USB4 ports\n");
+		goto err_del;
+	}
+
 	ret = tb_switch_nvm_add(sw);
 	if (ret) {
 		dev_err(&sw->dev, "failed to add NVM devices\n");
-		device_del(&sw->dev);
-		return ret;
+		goto err_ports;
 	}
 
 	/*
@@ -2766,6 +2771,13 @@ int tb_switch_add(struct tb_switch *sw)
 
 	tb_switch_debugfs_init(sw);
 	return 0;
+
+err_ports:
+	usb4_switch_remove_ports(sw);
+err_del:
+	device_del(&sw->dev);
+
+	return ret;
 }
 
 /**
@@ -2805,6 +2817,7 @@ void tb_switch_remove(struct tb_switch *sw)
 		tb_plug_events_active(sw, false);
 
 	tb_switch_nvm_remove(sw);
+	usb4_switch_remove_ports(sw);
 
 	if (tb_route(sw))
 		dev_info(&sw->dev, "device disconnected\n");
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 89e38aeea52b..948e7601428f 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -202,6 +202,7 @@ struct tb_switch {
  * @cap_tmu: Offset of the adapter specific TMU capability (%0 if not present)
  * @cap_adap: Offset of the adapter specific capability (%0 if not present)
  * @cap_usb4: Offset to the USB4 port capability (%0 if not present)
+ * @usb4: Pointer to the USB4 port structure (only if @cap_usb4 is != %0)
  * @port: Port number on switch
  * @disabled: Disabled by eeprom or enabled but not implemented
  * @bonded: true if the port is bonded (two lanes combined as one)
@@ -228,6 +229,7 @@ struct tb_port {
 	int cap_tmu;
 	int cap_adap;
 	int cap_usb4;
+	struct usb4_port *usb4;
 	u8 port;
 	bool disabled;
 	bool bonded;
@@ -241,6 +243,16 @@ struct tb_port {
 	unsigned int dma_credits;
 };
 
+/**
+ * struct usb4_port - USB4 port device
+ * @dev: Device for the port
+ * @port: Pointer to the lane 0 adapter
+ */
+struct usb4_port {
+	struct device dev;
+	struct tb_port *port;
+};
+
 /**
  * tb_retimer: Thunderbolt retimer
  * @dev: Device for the retimer
@@ -645,6 +657,7 @@ struct tb *tb_probe(struct tb_nhi *nhi);
 extern struct device_type tb_domain_type;
 extern struct device_type tb_retimer_type;
 extern struct device_type tb_switch_type;
+extern struct device_type usb4_port_device_type;
 
 int tb_domain_init(void);
 void tb_domain_exit(void);
@@ -1038,6 +1051,8 @@ struct tb_port *usb4_switch_map_pcie_down(struct tb_switch *sw,
 					  const struct tb_port *port);
 struct tb_port *usb4_switch_map_usb3_down(struct tb_switch *sw,
 					  const struct tb_port *port);
+int usb4_switch_add_ports(struct tb_switch *sw);
+void usb4_switch_remove_ports(struct tb_switch *sw);
 
 int usb4_port_unlock(struct tb_port *port);
 int usb4_port_configure(struct tb_port *port);
@@ -1070,6 +1085,21 @@ int usb4_usb3_port_allocate_bandwidth(struct tb_port *port, int *upstream_bw,
 int usb4_usb3_port_release_bandwidth(struct tb_port *port, int *upstream_bw,
 				     int *downstream_bw);
 
+static inline bool tb_is_usb4_port_device(const struct device *dev)
+{
+	return dev->type == &usb4_port_device_type;
+}
+
+static inline struct usb4_port *tb_to_usb4_port_device(struct device *dev)
+{
+	if (tb_is_usb4_port_device(dev))
+		return container_of(dev, struct usb4_port, dev);
+	return NULL;
+}
+
+struct usb4_port *usb4_port_device_add(struct tb_port *port);
+void usb4_port_device_remove(struct usb4_port *usb4);
+
 /* Keep link controller awake during update */
 #define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
 
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 94cc25cc6388..1f82af35328e 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -985,6 +985,60 @@ struct tb_port *usb4_switch_map_usb3_down(struct tb_switch *sw,
 	return NULL;
 }
 
+/**
+ * usb4_switch_add_ports() - Add USB4 ports for this router
+ * @sw: USB4 router
+ *
+ * For USB4 router finds all USB4 ports and registers devices for each.
+ * Can be called to any router.
+ *
+ * Return %0 in case of success and negative errno in case of failure.
+ */
+int usb4_switch_add_ports(struct tb_switch *sw)
+{
+	struct tb_port *port;
+
+	if (tb_switch_is_icm(sw) || !tb_switch_is_usb4(sw))
+		return 0;
+
+	tb_switch_for_each_port(sw, port) {
+		struct usb4_port *usb4;
+
+		if (!tb_port_is_null(port))
+			continue;
+		if (!port->cap_usb4)
+			continue;
+
+		usb4 = usb4_port_device_add(port);
+		if (IS_ERR(usb4)) {
+			usb4_switch_remove_ports(sw);
+			return PTR_ERR(usb4);
+		}
+
+		port->usb4 = usb4;
+	}
+
+	return 0;
+}
+
+/**
+ * usb4_switch_remove_ports() - Removes USB4 ports from this router
+ * @sw: USB4 router
+ *
+ * Unregisters previously registered USB4 ports.
+ */
+void usb4_switch_remove_ports(struct tb_switch *sw)
+{
+	struct tb_port *port;
+
+	tb_switch_for_each_port(sw, port) {
+		if (port->usb4) {
+			usb4_port_device_remove(port->usb4);
+			port->usb4 = NULL;
+		}
+	}
+}
+
 /**
  * usb4_port_unlock() - Unlock USB4 downstream port
  * @port: USB4 port to unlock
diff --git a/drivers/thunderbolt/usb4_port.c b/drivers/thunderbolt/usb4_port.c
new file mode 100644
index 000000000000..520bbfd7bf33
--- /dev/null
+++ b/drivers/thunderbolt/usb4_port.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * USB4 port device
+ *
+ * Copyright (C) 2021, Intel Corporation
+ * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/pm_runtime.h>
+
+#include "tb.h"
+
+static ssize_t link_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct usb4_port *usb4 = tb_to_usb4_port_device(dev);
+	struct tb_port *port = usb4->port;
+	struct tb *tb = port->sw->tb;
+	const char *link;
+
+	if (mutex_lock_interruptible(&tb->lock))
+		return -ERESTARTSYS;
+
+	if (tb_is_upstream_port(port))
+		link = port->sw->link_usb4 ? "usb4" : "tbt";
+	else if (tb_port_has_remote(port))
+		link = port->remote->sw->link_usb4 ? "usb4" : "tbt";
+	else
+		link = "none";
+
+	mutex_unlock(&tb->lock);
+
+	return sysfs_emit(buf, "%s\n", link);
+}
+static DEVICE_ATTR_RO(link);
+
+static struct attribute *common_attrs[] = {
+	&dev_attr_link.attr,
+	NULL
+};
+
+static const struct attribute_group common_group = {
+	.attrs = common_attrs,
+};
+
+static const struct attribute_group *usb4_port_device_groups[] = {
+	&common_group,
+	NULL
+};
+
+static void usb4_port_device_release(struct device *dev)
+{
+	struct usb4_port *usb4 = container_of(dev, struct usb4_port, dev);
+
+	kfree(usb4);
+}
+
+struct device_type usb4_port_device_type = {
+	.name = "usb4_port",
+	.groups = usb4_port_device_groups,
+	.release = usb4_port_device_release,
+};
+
+/**
+ * usb4_port_device_add() - Add USB4 port device
+ * @port: Lane 0 adapter port to add the USB4 port
+ *
+ * Creates and registers a USB4 port device for @port. Returns the new
+ * USB4 port device pointer or ERR_PTR() in case of error.
+ */
+struct usb4_port *usb4_port_device_add(struct tb_port *port)
+{
+	struct usb4_port *usb4;
+	int ret;
+
+	usb4 = kzalloc(sizeof(*usb4), GFP_KERNEL);
+	if (!usb4)
+		return ERR_PTR(-ENOMEM);
+
+	usb4->port = port;
+	usb4->dev.type = &usb4_port_device_type;
+	usb4->dev.parent = &port->sw->dev;
+	dev_set_name(&usb4->dev, "usb4_port%d", port->port);
+
+	ret = device_register(&usb4->dev);
+	if (ret) {
+		put_device(&usb4->dev);
+		return ERR_PTR(ret);
+	}
+
+	pm_runtime_no_callbacks(&usb4->dev);
+	pm_runtime_set_active(&usb4->dev);
+	pm_runtime_enable(&usb4->dev);
+	pm_runtime_set_autosuspend_delay(&usb4->dev, TB_AUTOSUSPEND_DELAY);
+	pm_runtime_mark_last_busy(&usb4->dev);
+	pm_runtime_use_autosuspend(&usb4->dev);
+
+	return usb4;
+}
+
+/**
+ * usb4_port_device_remove() - Removes USB4 port device
+ * @usb4: USB4 port device
+ *
+ * Unregisters the USB4 port device from the system. The device will be
+ * released when the last reference is dropped.
+ */
+void usb4_port_device_remove(struct usb4_port *usb4)
+{
+	device_unregister(&usb4->dev);
+}
-- 
2.30.2


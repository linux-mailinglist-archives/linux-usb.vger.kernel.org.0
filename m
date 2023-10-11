Return-Path: <linux-usb+bounces-1458-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD9D7C50AC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 12:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C4AA1C20FA9
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 10:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A506B1A283;
	Wed, 11 Oct 2023 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgosLS5u"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0AA199D2
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 10:58:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB71B94
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 03:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697021910; x=1728557910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2MWwaJYps/BpGXo5FfKVgyKj0oaJKSOfafaa2F7UeQ0=;
  b=UgosLS5uiqbSjhrnPQEygr8T1vxj/b7j+N65ds3Yi/PmLGYdGywoIZVE
   VcF6ExoH5803oc37RbpJ0UzlFEx9nG/Z/oL4E60RXML7PTAkt/U+okkey
   9jp0SBNbnY91P91GLvFTzH1yOcSobypdCBigP9GnuNhCrXYM4xbTs/yPU
   Q3vqzk5qkUpJnTR4diVVQCJ3JZe3Lo28MFEuu4bLUs5XpevSm/nrhbtDX
   E3W/HV3g9vhblVkI8Otv7g75FNw1ccGQ114yl7jOcVf9OgH/6eQngoWcL
   0d2WKqhQreK4rRQSNRCPaXerXapjX59deHveVGi+vfgrGdR2/mX6zGrPf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="6190645"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="6190645"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 03:58:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897589188"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="897589188"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2023 03:56:43 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>,
	Prashant Malani <pmalani@google.com>,
	Won Chung <wonchung@google.com>,
	linux-usb@vger.kernel.org,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH 1/2] usb: typec: Link enumerated USB devices with Type-C partner
Date: Wed, 11 Oct 2023 13:58:24 +0300
Message-Id: <20231011105825.320062-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231011105825.320062-1-heikki.krogerus@linux.intel.com>
References: <20231011105825.320062-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Adding functions that USB hub code can use to inform the
Type-C class about connected USB devices.

Once taken into use, it will allow the Type-C port drivers
to power off components that are not needed, for example if
USB2 device is enumerated, everything that is only relevant
for USB3 (retimers, etc.), can be powered off.

This will also create a symlink "typec" for the USB devices
pointing to the USB Type-C partner device.

Suggested-by: Benson Leung <bleung@chromium.org>
Tested-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-bus-usb |   9 ++
 drivers/usb/typec/class.c               | 108 ++++++++++++++++++++++--
 drivers/usb/typec/class.h               |  16 ++++
 drivers/usb/typec/port-mapper.c         |   9 +-
 include/linux/usb/typec.h               |  37 ++++++++
 5 files changed, 169 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
index a44bfe020061..2b7108e21977 100644
--- a/Documentation/ABI/testing/sysfs-bus-usb
+++ b/Documentation/ABI/testing/sysfs-bus-usb
@@ -313,6 +313,15 @@ Description:
 		Inter-Chip SSIC devices support asymmetric lanes up to 4 lanes per
 		direction. Devices before USB 3.2 are single lane (tx_lanes = 1)
 
+What:		/sys/bus/usb/devices/.../typec
+Date:		November 2023
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Symlink to the USB Type-C partner device. USB Type-C partner
+		represents the component that communicates over the
+		Configuration Channel (CC signal on USB Type-C connectors and
+		cables) with the local port.
+
 What:		/sys/bus/usb/devices/usbX/bAlternateSetting
 Description:
 		The current interface alternate setting number, in decimal.
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9c1dbf3c00e0..2e0451bd336e 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -13,6 +13,7 @@
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_retimer.h>
+#include <linux/usb.h>
 
 #include "bus.h"
 #include "class.h"
@@ -681,6 +682,33 @@ const struct device_type typec_partner_dev_type = {
 	.release = typec_partner_release,
 };
 
+static void typec_partner_link_device(struct typec_partner *partner, struct device *dev)
+{
+	int ret;
+
+	ret = sysfs_create_link(&dev->kobj, &partner->dev.kobj, "typec");
+	if (ret)
+		return;
+
+	ret = sysfs_create_link(&partner->dev.kobj, &dev->kobj, dev_name(dev));
+	if (ret) {
+		sysfs_remove_link(&dev->kobj, "typec");
+		return;
+	}
+
+	if (partner->attach)
+		partner->attach(partner, dev);
+}
+
+static void typec_partner_unlink_device(struct typec_partner *partner, struct device *dev)
+{
+	sysfs_remove_link(&partner->dev.kobj, dev_name(dev));
+	sysfs_remove_link(&dev->kobj, "typec");
+
+	if (partner->deattach)
+		partner->deattach(partner, dev);
+}
+
 /**
  * typec_partner_set_identity - Report result from Discover Identity command
  * @partner: The partner updated identity values
@@ -865,6 +893,8 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 	partner->num_altmodes = -1;
 	partner->pd_revision = desc->pd_revision;
 	partner->svdm_version = port->cap->svdm_version;
+	partner->attach = desc->attach;
+	partner->deattach = desc->deattach;
 
 	if (desc->identity) {
 		/*
@@ -887,6 +917,11 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 		return ERR_PTR(ret);
 	}
 
+	if (port->usb2_dev)
+		typec_partner_link_device(partner, port->usb2_dev);
+	if (port->usb3_dev)
+		typec_partner_link_device(partner, port->usb3_dev);
+
 	return partner;
 }
 EXPORT_SYMBOL_GPL(typec_register_partner);
@@ -899,8 +934,19 @@ EXPORT_SYMBOL_GPL(typec_register_partner);
  */
 void typec_unregister_partner(struct typec_partner *partner)
 {
-	if (!IS_ERR_OR_NULL(partner))
-		device_unregister(&partner->dev);
+	struct typec_port *port;
+
+	if (IS_ERR_OR_NULL(partner))
+		return;
+
+	port = to_typec_port(partner->dev.parent);
+
+	if (port->usb2_dev)
+		typec_partner_unlink_device(partner, port->usb2_dev);
+	if (port->usb3_dev)
+		typec_partner_unlink_device(partner, port->usb3_dev);
+
+	device_unregister(&partner->dev);
 }
 EXPORT_SYMBOL_GPL(typec_unregister_partner);
 
@@ -1775,6 +1821,50 @@ static int partner_match(struct device *dev, void *data)
 	return is_typec_partner(dev);
 }
 
+static struct typec_partner *typec_get_partner(struct typec_port *port)
+{
+	struct device *dev;
+
+	dev = device_find_child(&port->dev, NULL, partner_match);
+	if (!dev)
+		return NULL;
+
+	return to_typec_partner(dev);
+}
+
+static void typec_partner_attach(struct typec_connector *con, struct device *dev)
+{
+	struct typec_port *port = container_of(con, struct typec_port, con);
+	struct typec_partner *partner = typec_get_partner(port);
+	struct usb_device *udev = to_usb_device(dev);
+
+	if (udev->speed < USB_SPEED_SUPER)
+		port->usb2_dev = dev;
+	else
+		port->usb3_dev = dev;
+
+	if (partner) {
+		typec_partner_link_device(partner, dev);
+		put_device(&partner->dev);
+	}
+}
+
+static void typec_partner_deattach(struct typec_connector *con, struct device *dev)
+{
+	struct typec_port *port = container_of(con, struct typec_port, con);
+	struct typec_partner *partner = typec_get_partner(port);
+
+	if (partner) {
+		typec_partner_unlink_device(partner, dev);
+		put_device(&partner->dev);
+	}
+
+	if (port->usb2_dev == dev)
+		port->usb2_dev = NULL;
+	else if (port->usb3_dev == dev)
+		port->usb3_dev = NULL;
+}
+
 /**
  * typec_set_data_role - Report data role change
  * @port: The USB Type-C Port where the role was changed
@@ -1784,7 +1874,7 @@ static int partner_match(struct device *dev, void *data)
  */
 void typec_set_data_role(struct typec_port *port, enum typec_data_role role)
 {
-	struct device *partner_dev;
+	struct typec_partner *partner;
 
 	if (port->data_role == role)
 		return;
@@ -1793,14 +1883,14 @@ void typec_set_data_role(struct typec_port *port, enum typec_data_role role)
 	sysfs_notify(&port->dev.kobj, NULL, "data_role");
 	kobject_uevent(&port->dev.kobj, KOBJ_CHANGE);
 
-	partner_dev = device_find_child(&port->dev, NULL, partner_match);
-	if (!partner_dev)
+	partner = typec_get_partner(port);
+	if (!partner)
 		return;
 
-	if (to_typec_partner(partner_dev)->identity)
-		typec_product_type_notify(partner_dev);
+	if (partner->identity)
+		typec_product_type_notify(&partner->dev);
 
-	put_device(partner_dev);
+	put_device(&partner->dev);
 }
 EXPORT_SYMBOL_GPL(typec_set_data_role);
 
@@ -2251,6 +2341,8 @@ struct typec_port *typec_register_port(struct device *parent,
 	port->ops = cap->ops;
 	port->port_type = cap->type;
 	port->prefer_role = cap->prefer_role;
+	port->con.attach = typec_partner_attach;
+	port->con.deattach = typec_partner_deattach;
 
 	device_initialize(&port->dev);
 	port->dev.class = &typec_class;
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index 673b2952b074..c36761ba3f59 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -8,6 +8,7 @@
 
 struct typec_mux;
 struct typec_switch;
+struct usb_device;
 
 struct typec_plug {
 	struct device			dev;
@@ -35,6 +36,9 @@ struct typec_partner {
 	enum usb_pd_svdm_ver		svdm_version;
 
 	struct usb_power_delivery	*pd;
+
+	void (*attach)(struct typec_partner *partner, struct device *dev);
+	void (*deattach)(struct typec_partner *partner, struct device *dev);
 };
 
 struct typec_port {
@@ -59,6 +63,18 @@ struct typec_port {
 
 	const struct typec_capability	*cap;
 	const struct typec_operations   *ops;
+
+	struct typec_connector		con;
+
+	/*
+	 * REVISIT: Only USB devices for now. If there are others, these need to
+	 * be converted into a list.
+	 *
+	 * NOTE: These may be registered first before the typec_partner, so they
+	 * will always have to be kept here instead of struct typec_partner.
+	 */
+	struct device			*usb2_dev;
+	struct device			*usb3_dev;
 };
 
 #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
diff --git a/drivers/usb/typec/port-mapper.c b/drivers/usb/typec/port-mapper.c
index a929e000d0e2..d42da5720a25 100644
--- a/drivers/usb/typec/port-mapper.c
+++ b/drivers/usb/typec/port-mapper.c
@@ -8,17 +8,22 @@
 
 #include <linux/acpi.h>
 #include <linux/component.h>
+#include <linux/usb.h>
 
 #include "class.h"
 
 static int typec_aggregate_bind(struct device *dev)
 {
-	return component_bind_all(dev, NULL);
+	struct typec_port *port = to_typec_port(dev);
+
+	return component_bind_all(dev, &port->con);
 }
 
 static void typec_aggregate_unbind(struct device *dev)
 {
-	component_unbind_all(dev, NULL);
+	struct typec_port *port = to_typec_port(dev);
+
+	component_unbind_all(dev, &port->con);
 }
 
 static const struct component_master_ops typec_aggregate_ops = {
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 8fa781207970..a05d6f6f2536 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -202,6 +202,8 @@ struct typec_cable_desc {
  * @accessory: Audio, Debug or none.
  * @identity: Discover Identity command data
  * @pd_revision: USB Power Delivery Specification Revision if supported
+ * @attach: Notification about attached USB device
+ * @deattach: Notification about removed USB device
  *
  * Details about a partner that is attached to USB Type-C port. If @identity
  * member exists when partner is registered, a directory named "identity" is
@@ -217,6 +219,9 @@ struct typec_partner_desc {
 	enum typec_accessory	accessory;
 	struct usb_pd_identity	*identity;
 	u16			pd_revision; /* 0300H = "3.0" */
+
+	void (*attach)(struct typec_partner *partner, struct device *dev);
+	void (*deattach)(struct typec_partner *partner, struct device *dev);
 };
 
 /**
@@ -335,4 +340,36 @@ int typec_port_set_usb_power_delivery(struct typec_port *port, struct usb_power_
 int typec_partner_set_usb_power_delivery(struct typec_partner *partner,
 					 struct usb_power_delivery *pd);
 
+/**
+ * struct typec_connector - Representation of Type-C port for external drivers
+ * @attach: notification about device removal
+ * @deattach: notification about device removal
+ *
+ * Drivers that control the USB and other ports (DisplayPorts, etc.), that are
+ * connected to the Type-C connectors, can use these callbacks to inform the
+ * Type-C connector class about connections and disconnections. That information
+ * can then be used by the typec-port drivers to power on or off parts that are
+ * needed or not needed - as an example, in USB mode if USB2 device is
+ * enumerated, USB3 components (retimers, phys, and what have you) do not need
+ * to be powered on.
+ *
+ * The attached (enumerated) devices will be liked with the typec-partner device.
+ */
+struct typec_connector {
+	void (*attach)(struct typec_connector *con, struct device *dev);
+	void (*deattach)(struct typec_connector *con, struct device *dev);
+};
+
+static inline void typec_attach(struct typec_connector *con, struct device *dev)
+{
+	if (con && con->attach)
+		con->attach(con, dev);
+}
+
+static inline void typec_deattach(struct typec_connector *con, struct device *dev)
+{
+	if (con && con->deattach)
+		con->deattach(con, dev);
+}
+
 #endif /* __LINUX_USB_TYPEC_H */
-- 
2.40.1



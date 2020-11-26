Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D522C5371
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 13:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387979AbgKZL5j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 06:57:39 -0500
Received: from mga11.intel.com ([192.55.52.93]:3884 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726849AbgKZL5i (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 06:57:38 -0500
IronPort-SDR: IM528YlQ0YDangpKuPfhJy44Ws20vNWlPX1G9sPvi8MMD0TpN0cNbVm2ga/CMIkAau1EDUQnRr
 FeZA/3k5ck3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="168772894"
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; 
   d="scan'208";a="168772894"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 03:57:37 -0800
IronPort-SDR: QL8ugdMB1oYrzeSJB+epnybm87/9FuVBOlMBGpQWlfzJT2K461VJItO/v6+uBwxuYq7Wb2/2tp
 1Fg4UZXHdA0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; 
   d="scan'208";a="433253540"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2020 03:57:36 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org
Subject: [PATCHv2] usb: typec: Add type sysfs attribute file for partners
Date:   Thu, 26 Nov 2020 14:57:35 +0300
Message-Id: <20201126115735.50529-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB Power Delivery Specification defines a set of product
types for partners and cables. The product type can be read
from the ID Header VDO which is the first object in the
response to the Discover Identity command. This attribute
will display the product type of the partner. The cables
already have the attribute.

This sysfs attribute file is only created for the partners
and cables if the product type is really known in the
driver. Some interfaces do not give access to the Discover
Identity response from the partner or cable, but they may
still supply the product type separately in some cases.

When the product type of the partner or cable is detected,
uevent is also raised with PRODUCT_TYPE set to show the
actual product type (for example PRODUCT_TYPE=host).

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

That patch is now rebased on top of the latest usb-testing.

---
 Documentation/ABI/testing/sysfs-class-typec |  64 ++++++++++-
 drivers/usb/typec/class.c                   | 118 +++++++++++++++++---
 2 files changed, 165 insertions(+), 17 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 619c4c67432b9..8eab41e79ce68 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -147,6 +147,52 @@ Description:
 		during Power Delivery discovery. This file remains hidden until a value
 		greater than or equal to 0 is set by Type C port driver.
 
+What:		/sys/class/typec/<port>-partner/type
+Date:		December 2020
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:	USB Power Delivery Specification defines a set of product types
+		for the partner devices. This file will show the product type of
+		the partner if it is known. Dual-role capable partners will have
+		both UFP and DFP product types defined, but only one that
+		matches the current role will be active at the time. If the
+		product type of the partner is not visible to the device driver,
+		this file will not exist.
+
+		When the partner product type is detected, or changed with role
+		swap, uvevent is also raised that contains PRODUCT_TYPE=<product
+		type> (for example PRODUCT_TYPE=hub).
+
+		Valid values:
+
+		UFP / device role
+		======================  ==========================
+		undefined		-
+		hub			PDUSB Hub
+		peripheral		PDUSB Peripheral
+		psd			Power Bank
+		ama			Alternate Mode Adapter
+		======================  ==========================
+
+		DFP / host role
+		======================  ==========================
+		undefined		-
+		hub			PDUSB Hub
+		host			PDUSB Host
+		power_brick		Power Brick
+		amc			Alternate Mode Controller
+		======================  ==========================
+
+What:		/sys/class/typec/<port>-partner>/identity/
+Date:		April 2017
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This directory appears only if the port device driver is capable
+		of showing the result of Discover Identity USB power delivery
+		command. That will not always be possible even when USB power
+		delivery is supported, for example when USB power delivery
+		communication for the port is mostly handled in firmware. If the
+		directory exists, it will have an attribute file for every VDO
+		in Discover Identity command result.
 
 USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
 
@@ -159,9 +205,21 @@ described in USB Type-C and USB Power Delivery specifications.
 What:		/sys/class/typec/<port>-cable/type
 Date:		April 2017
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
-Description:
-		Shows if the cable is active.
-		Valid values: active, passive
+Description:	USB Power Delivery Specification defines a set of product types
+		for the cables. This file will show the product type of the
+		cable if it is known. If the product type of the cable is not
+		visible to the device driver, this file will not exist.
+
+		When the cable product type is detected, uvevent is also raised
+		with PRODUCT_TYPE showing the product type of the cable.
+
+		Valid values:
+
+		======================  ==========================
+		undefined		-
+		active			Active Cable
+		passive			Passive Cable
+		======================  ==========================
 
 What:		/sys/class/typec/<port>-cable/plug_type
 Date:		April 2017
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 8f40093c20449..4f6e58dfb81d5 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -11,6 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/usb/pd_vdo.h>
 
 #include "bus.h"
 
@@ -83,6 +84,29 @@ static const char * const typec_accessory_modes[] = {
 	[TYPEC_ACCESSORY_DEBUG]		= "debug",
 };
 
+/* Product types defined in USB PD Specification R3.0 V2.0 */
+static const char * const product_type_ufp[8] = {
+	[IDH_PTYPE_UNDEF]		= "undefined",
+	[IDH_PTYPE_HUB]			= "hub",
+	[IDH_PTYPE_PERIPH]		= "peripheral",
+	[IDH_PTYPE_PSD]			= "psd",
+	[IDH_PTYPE_AMA]			= "ama",
+};
+
+static const char * const product_type_dfp[8] = {
+	[IDH_PTYPE_DFP_UNDEF]		= "undefined",
+	[IDH_PTYPE_DFP_HUB]		= "hub",
+	[IDH_PTYPE_DFP_HOST]		= "host",
+	[IDH_PTYPE_DFP_PB]		= "power_brick",
+	[IDH_PTYPE_DFP_AMC]		= "amc",
+};
+
+static const char * const product_type_cable[8] = {
+	[IDH_PTYPE_UNDEF]		= "undefined",
+	[IDH_PTYPE_PCABLE]		= "passive",
+	[IDH_PTYPE_ACABLE]		= "active",
+};
+
 static struct usb_pd_identity *get_pd_identity(struct device *dev)
 {
 	if (is_typec_partner(dev)) {
@@ -97,6 +121,32 @@ static struct usb_pd_identity *get_pd_identity(struct device *dev)
 	return NULL;
 }
 
+static const char *get_pd_product_type(struct device *dev)
+{
+	struct typec_port *port = to_typec_port(dev->parent);
+	struct usb_pd_identity *id = get_pd_identity(dev);
+	const char *ptype = NULL;
+
+	if (is_typec_partner(dev)) {
+		if (!id)
+			return NULL;
+
+		if (port->data_role == TYPEC_HOST)
+			ptype = product_type_ufp[PD_IDH_PTYPE(id->id_header)];
+		else
+			ptype = product_type_dfp[PD_IDH_DFP_PTYPE(id->id_header)];
+	} else if (is_typec_cable(dev)) {
+		if (id)
+			ptype = product_type_cable[PD_IDH_PTYPE(id->id_header)];
+		else
+			ptype = to_typec_cable(dev)->active ?
+				product_type_cable[IDH_PTYPE_ACABLE] :
+				product_type_cable[IDH_PTYPE_PCABLE];
+	}
+
+	return ptype;
+}
+
 static ssize_t id_header_show(struct device *dev, struct device_attribute *attr,
 			      char *buf)
 {
@@ -171,6 +221,25 @@ static const struct attribute_group *usb_pd_id_groups[] = {
 	NULL,
 };
 
+static void typec_product_type_notify(struct device *dev)
+{
+	char *envp[2] = { };
+	const char *ptype;
+
+	ptype = get_pd_product_type(dev);
+	if (!ptype)
+		return;
+
+	sysfs_notify(&dev->kobj, NULL, "type");
+
+	envp[0] = kasprintf(GFP_KERNEL, "PRODUCT_TYPE=%s", ptype);
+	if (!envp[0])
+		return;
+
+	kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
+	kfree(envp[0]);
+}
+
 static void typec_report_identity(struct device *dev)
 {
 	sysfs_notify(&dev->kobj, "identity", "id_header");
@@ -179,7 +248,21 @@ static void typec_report_identity(struct device *dev)
 	sysfs_notify(&dev->kobj, "identity", "product_type_vdo1");
 	sysfs_notify(&dev->kobj, "identity", "product_type_vdo2");
 	sysfs_notify(&dev->kobj, "identity", "product_type_vdo3");
+	typec_product_type_notify(dev);
+}
+
+static ssize_t
+type_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	const char *ptype;
+
+	ptype = get_pd_product_type(dev);
+	if (!ptype)
+		return 0;
+
+	return sysfs_emit(buf, "%s\n", ptype);
 }
+static DEVICE_ATTR_RO(type);
 
 /* ------------------------------------------------------------------------- */
 /* Alternate Modes */
@@ -592,6 +675,7 @@ static struct attribute *typec_partner_attrs[] = {
 	&dev_attr_accessory_mode.attr,
 	&dev_attr_supports_usb_power_delivery.attr,
 	&dev_attr_number_of_alternate_modes.attr,
+	&dev_attr_type.attr,
 	NULL
 };
 
@@ -604,6 +688,10 @@ static umode_t typec_partner_attr_is_visible(struct kobject *kobj, struct attrib
 			return 0;
 	}
 
+	if (attr == &dev_attr_type.attr)
+		if (!get_pd_product_type(kobj_to_dev(kobj)))
+			return 0;
+
 	return attr->mode;
 }
 
@@ -914,15 +1002,6 @@ EXPORT_SYMBOL_GPL(typec_unregister_plug);
 
 /* Type-C Cables */
 
-static ssize_t
-type_show(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct typec_cable *cable = to_typec_cable(dev);
-
-	return sprintf(buf, "%s\n", cable->active ? "active" : "passive");
-}
-static DEVICE_ATTR_RO(type);
-
 static const char * const typec_plug_types[] = {
 	[USB_PLUG_NONE]		= "unknown",
 	[USB_PLUG_TYPE_A]	= "type-a",
@@ -1522,6 +1601,11 @@ const struct device_type typec_port_dev_type = {
 /* --------------------------------------- */
 /* Driver callbacks to report role updates */
 
+static int partner_match(struct device *dev, void *data)
+{
+	return is_typec_partner(dev);
+}
+
 /**
  * typec_set_data_role - Report data role change
  * @port: The USB Type-C Port where the role was changed
@@ -1531,12 +1615,23 @@ const struct device_type typec_port_dev_type = {
  */
 void typec_set_data_role(struct typec_port *port, enum typec_data_role role)
 {
+	struct device *partner_dev;
+
 	if (port->data_role == role)
 		return;
 
 	port->data_role = role;
 	sysfs_notify(&port->dev.kobj, NULL, "data_role");
 	kobject_uevent(&port->dev.kobj, KOBJ_CHANGE);
+
+	partner_dev = device_find_child(&port->dev, NULL, partner_match);
+	if (!partner_dev)
+		return;
+
+	if (to_typec_partner(partner_dev)->identity)
+		typec_product_type_notify(partner_dev);
+
+	put_device(partner_dev);
 }
 EXPORT_SYMBOL_GPL(typec_set_data_role);
 
@@ -1577,11 +1672,6 @@ void typec_set_vconn_role(struct typec_port *port, enum typec_role role)
 }
 EXPORT_SYMBOL_GPL(typec_set_vconn_role);
 
-static int partner_match(struct device *dev, void *data)
-{
-	return is_typec_partner(dev);
-}
-
 /**
  * typec_set_pwr_opmode - Report changed power operation mode
  * @port: The USB Type-C Port where the mode was changed
-- 
2.29.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617852C3F8F
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 13:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbgKYMGs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Nov 2020 07:06:48 -0500
Received: from mga04.intel.com ([192.55.52.120]:40146 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727409AbgKYMGs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Nov 2020 07:06:48 -0500
IronPort-SDR: Q6jSUV/l8JPHYit4BnjVe4NYNripDBt+IQIpzEQgBeezEZ3gB901Qt/abcgf3tfeDU7+yyMhM2
 71CmdRKTBBxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="169559227"
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="169559227"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 04:06:48 -0800
IronPort-SDR: d1SKB5EHJrxVkJ9DIr+wTnTweHSFPqVYmj2RahrbyGj0JQ8XO1pLuTqdCWxecQc7jyWENR/3/B
 6ucvABPsXR1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="432936360"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2020 04:06:46 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: typec: Add type sysfs attribute file for partners
Date:   Wed, 25 Nov 2020 15:06:42 +0300
Message-Id: <20201125120642.37156-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125120642.37156-1-heikki.krogerus@linux.intel.com>
References: <20201125120642.37156-1-heikki.krogerus@linux.intel.com>
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
 Documentation/ABI/testing/sysfs-class-typec |  53 ++++++-
 drivers/usb/typec/class.c                   | 147 +++++++++++++++++---
 2 files changed, 181 insertions(+), 19 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index b7794e02ad205..64c4b6b32b8ee 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -139,6 +139,41 @@ Description:
 		Shows if the partner supports USB Power Delivery communication:
 		Valid values: yes, no
 
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
 What:		/sys/class/typec/<port>-partner>/identity/
 Date:		April 2017
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
@@ -187,9 +222,21 @@ described in USB Type-C and USB Power Delivery specifications.
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
index 35eec707cb512..1190148ad3ed5 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -11,6 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/usb/pd_vdo.h>
 
 #include "bus.h"
 
@@ -81,6 +82,29 @@ static const char * const typec_accessory_modes[] = {
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
@@ -95,6 +119,32 @@ static struct usb_pd_identity *get_pd_identity(struct device *dev)
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
@@ -139,11 +189,56 @@ static const struct attribute_group *usb_pd_id_groups[] = {
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
 	sysfs_notify(&dev->kobj, "identity", "cert_stat");
 	sysfs_notify(&dev->kobj, "identity", "product");
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
+}
+static DEVICE_ATTR_RO(type);
+
+static umode_t typec_product_type_attr_is_visible(struct kobject *kobj,
+						  struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+
+	if (attr == &dev_attr_type.attr)
+		if (!get_pd_product_type(dev))
+			return 0;
+
+	return attr->mode;
 }
 
 /* ------------------------------------------------------------------------- */
@@ -535,9 +630,19 @@ static DEVICE_ATTR_RO(supports_usb_power_delivery);
 static struct attribute *typec_partner_attrs[] = {
 	&dev_attr_accessory_mode.attr,
 	&dev_attr_supports_usb_power_delivery.attr,
+	&dev_attr_type.attr,
+	NULL
+};
+
+static struct attribute_group typec_partner_group = {
+	.is_visible = typec_product_type_attr_is_visible,
+	.attrs = typec_partner_attrs,
+};
+
+static const struct attribute_group *typec_partner_groups[] = {
+	&typec_partner_group,
 	NULL
 };
-ATTRIBUTE_GROUPS(typec_partner);
 
 static void typec_partner_release(struct device *dev)
 {
@@ -744,15 +849,6 @@ EXPORT_SYMBOL_GPL(typec_unregister_plug);
 
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
@@ -775,7 +871,15 @@ static struct attribute *typec_cable_attrs[] = {
 	&dev_attr_plug_type.attr,
 	NULL
 };
-ATTRIBUTE_GROUPS(typec_cable);
+
+static struct attribute_group typec_cable_group = {
+	.attrs = typec_cable_attrs,
+};
+
+static const struct attribute_group *typec_cable_groups[] = {
+	&typec_cable_group,
+	NULL
+};
 
 static void typec_cable_release(struct device *dev)
 {
@@ -1352,6 +1456,11 @@ const struct device_type typec_port_dev_type = {
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
@@ -1361,12 +1470,23 @@ const struct device_type typec_port_dev_type = {
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
 
@@ -1407,11 +1527,6 @@ void typec_set_vconn_role(struct typec_port *port, enum typec_role role)
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


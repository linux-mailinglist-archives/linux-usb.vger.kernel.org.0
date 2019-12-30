Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD6F512D171
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 16:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbfL3P3D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 10:29:03 -0500
Received: from mga01.intel.com ([192.55.52.88]:49571 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727397AbfL3P3C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 10:29:02 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 07:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224240071"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 07:29:01 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [RFC PATCH 2/3] usb: typec: Add attribute file showing the USB mode of the partner
Date:   Mon, 30 Dec 2019 18:28:56 +0300
Message-Id: <20191230152857.43917-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230152857.43917-1-heikki.krogerus@linux.intel.com>
References: <20191230152857.43917-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Exactly the same attribute that we have for the port. With
partners this attribute will get the information from the
Discover Identity Command response.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-class-typec | 22 ++++++
 drivers/usb/typec/class.c                   | 80 +++++++++++++++++++--
 include/linux/usb/typec.h                   |  2 +
 3 files changed, 99 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 8df6f599c967..f13c2b30fb3d 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -116,6 +116,12 @@ Description:	The supported USB Modes with the active one, that is to be used
 		mode can be changed by writing to the file when the connector
 		interface supports it.
 
+		Note. This attribute file can not be used for resetting the mode
+		after the connection has been established. The mode can be reset
+		after connection by writing to the attribute file with the same
+		name ("usb_mode") of the partner device (this is the port device
+		that has the partner attached to).
+
 		Valid values:
 		- usb2 (USB 2.0)
 		- usb3 (USB 3.2)
@@ -173,6 +179,22 @@ Description:
 		will show 0 until Discover Identity command result becomes
 		available. The value can be polled.
 
+What:		/sys/class/typec/<port>-partner/usb_mode
+Date:		February 2020
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:	The USB Modes that the partner device supports. This information
+		requires the response from Discover Identity command, and will
+		therefore not always be available (as some firmware interfaces
+		do not share the information with the operating system). The
+		currently used mode can be changed by writing to this file when
+		the port driver is able to send Data Reset message to the
+		partner.
+
+		Valid values:
+		- usb2 (USB 2.0)
+		- usb3 (USB 3.2)
+		- usb4 (USB4)
+
 
 USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
 
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 07e4913f04c6..d318eee3b7ef 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -11,6 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/usb/pd_vdo.h>
 
 #include "bus.h"
 
@@ -30,6 +31,7 @@ struct typec_cable {
 struct typec_partner {
 	struct device			dev;
 	unsigned int			usb_pd:1;
+	enum usb_mode			usb_mode;
 	struct usb_pd_identity		*identity;
 	enum typec_accessory		accessory;
 	struct ida			mode_ids;
@@ -154,14 +156,45 @@ static const char * const usb_modes[] = {
 	[USB_MODE_USB4] = "usb4"
 };
 
+static u8 typec_partner_mode(struct typec_partner *partner)
+{
+	struct typec_port *port = to_typec_port(partner->dev.parent);
+	struct usb_pd_identity *id = partner->identity;
+	u32 dev_cap;
+	u8 cap = 0;
+
+	if (port->data_role == TYPEC_HOST) {
+		dev_cap = PD_VDO1_UFP_DEVCAP(id->vdo[0]);
+
+		if (dev_cap & (DEV_USB2_CAPABLE | DEV_USB2_BILLBOARD))
+			cap |= USB_CAPABILITY_USB2;
+		if (dev_cap & DEV_USB3_CAPABLE)
+			cap |= USB_CAPABILITY_USB3;
+		if (dev_cap & DEV_USB4_CAPABLE)
+			cap |= USB_CAPABILITY_USB4;
+	} else {
+		cap = PD_VDO_DFP_HOSTCAP(id->vdo[0]);
+	}
+
+	return cap;
+}
+
 static ssize_t
 usb_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	enum usb_mode mode = to_typec_port(dev)->usb_mode;
-	u8 cap = to_typec_port(dev)->cap->usb;
+	enum usb_mode mode = 0;
 	int len = 0;
+	u8 cap = 0;
 	int i;
 
+	if (is_typec_port(dev)) {
+		cap = to_typec_port(dev)->cap->usb;
+		mode = to_typec_port(dev)->usb_mode;
+	} else if (is_typec_partner(dev)) {
+		cap = typec_partner_mode(to_typec_partner(dev));
+		mode = to_typec_partner(dev)->usb_mode;
+	}
+
 	for (i = USB_MODE_USB2; i < USB_MODE_USB4 + 1; i++) {
 		if (!(BIT(i - 1) & cap))
 			continue;
@@ -179,7 +212,7 @@ usb_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
 static ssize_t usb_mode_store(struct device *dev, struct device_attribute *attr,
 			      const char *buf, size_t size)
 {
-	struct typec_port *port = to_typec_port(dev);
+	struct typec_port *port;
 	int ret = 0;
 	int mode;
 
@@ -187,7 +220,19 @@ static ssize_t usb_mode_store(struct device *dev, struct device_attribute *attr,
 	if (mode < 0)
 		return mode;
 
-	ret = port->ops->usb_mode_set(port, mode);
+	if (is_typec_port(dev)) {
+		port = to_typec_port(dev);
+		ret = port->ops->usb_mode_set(port, mode);
+	} else if (is_typec_partner(dev)) {
+		port = to_typec_port(dev->parent);
+
+		/* Checking does the port support the mode */
+		if (mode && !(BIT(mode - 1) & port->cap->usb))
+			return -EINVAL;
+
+		ret = port->ops->data_reset(port, mode);
+	}
+
 	if (ret)
 		return ret;
 
@@ -649,7 +694,32 @@ static struct attribute *typec_partner_attrs[] = {
 	&dev_attr_usb_mode.attr,
 	NULL
 };
-ATTRIBUTE_GROUPS(typec_partner);
+
+static umode_t typec_partner_attr_is_visible(struct kobject *kobj,
+					     struct attribute *attr, int n)
+{
+	struct typec_partner *partner = to_typec_partner(kobj_to_dev(kobj));
+	struct typec_port *port = to_typec_port(partner->dev.parent);
+
+	if (attr == &dev_attr_usb_mode.attr) {
+		if (!partner->identity)
+			return 0;
+		if (!port->ops || !port->ops->data_reset)
+			return 0444;
+	}
+
+	return attr->mode;
+}
+
+static struct attribute_group typec_partner_group = {
+	.is_visible = typec_partner_attr_is_visible,
+	.attrs = typec_partner_attrs
+};
+
+static const struct attribute_group *typec_partner_groups[] = {
+	&typec_partner_group,
+	NULL
+};
 
 static void typec_partner_release(struct device *dev)
 {
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 1128c3b58618..e548e4d21908 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -192,6 +192,7 @@ struct typec_partner_desc {
  * @vconn_set: Source VCONN
  * @port_type_set: Set port type
  * @usb_mode_set: Set the USB Mode to be used with Enter_USB message
+ * @data_reset: Set new USB mode by using the Data Reset message
  */
 struct typec_operations {
 	int (*try_role)(struct typec_port *port, int role);
@@ -201,6 +202,7 @@ struct typec_operations {
 	int (*port_type_set)(struct typec_port *port,
 			     enum typec_port_type type);
 	int (*usb_mode_set)(struct typec_port *port, enum usb_mode mode);
+	int (*data_reset)(struct typec_port *port, enum usb_mode mode);
 };
 
 /*
-- 
2.24.1


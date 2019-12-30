Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4435B12D170
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 16:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbfL3P3C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 10:29:02 -0500
Received: from mga01.intel.com ([192.55.52.88]:49571 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727397AbfL3P3C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 10:29:02 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 07:29:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224240066"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 07:28:59 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [RFC PATCH 1/3] usb: typec: Add attribute file showing the USB mode of the port
Date:   Mon, 30 Dec 2019 18:28:55 +0300
Message-Id: <20191230152857.43917-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230152857.43917-1-heikki.krogerus@linux.intel.com>
References: <20191230152857.43917-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This attribute file, named "usb_mode", will show the
supported USB modes, which are USB 2.0, USB 3.2 and USB4.
These modes are defined in the latest USB Type-C (R2.0) and
USB Power Delivery (R3.0 V2.0) Specifications.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-class-typec | 12 ++++
 drivers/usb/typec/class.c                   | 61 +++++++++++++++++++++
 include/linux/usb/typec.h                   |  9 +++
 3 files changed, 82 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 0c2eb26fdc06..8df6f599c967 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -108,6 +108,18 @@ Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
 		Revision number of the supported USB Type-C specification.
 
+What:		/sys/class/typec/<port>/usb_mode
+Date:		February 2020
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:	The supported USB Modes with the active one, that is to be used
+		next time with the Enter_USB message, in brackets. The active
+		mode can be changed by writing to the file when the connector
+		interface supports it.
+
+		Valid values:
+		- usb2 (USB 2.0)
+		- usb3 (USB 3.2)
+		- usb4 (USB4)
 
 USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
 
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 70f3c5e9eb0c..07e4913f04c6 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -47,6 +47,7 @@ struct typec_port {
 	enum typec_pwr_opmode		pwr_opmode;
 	enum typec_port_type		port_type;
 	struct mutex			port_type_lock;
+	enum usb_mode			usb_mode;
 
 	enum typec_orientation		orientation;
 	struct typec_switch		*sw;
@@ -146,6 +147,54 @@ static void typec_report_identity(struct device *dev)
 	sysfs_notify(&dev->kobj, "identity", "product");
 }
 
+static const char * const usb_modes[] = {
+	[USB_MODE_NONE] = "none",
+	[USB_MODE_USB2] = "usb2",
+	[USB_MODE_USB3] = "usb3",
+	[USB_MODE_USB4] = "usb4"
+};
+
+static ssize_t
+usb_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	enum usb_mode mode = to_typec_port(dev)->usb_mode;
+	u8 cap = to_typec_port(dev)->cap->usb;
+	int len = 0;
+	int i;
+
+	for (i = USB_MODE_USB2; i < USB_MODE_USB4 + 1; i++) {
+		if (!(BIT(i - 1) & cap))
+			continue;
+
+		if (i == mode)
+			len += sprintf(buf + len, "[%s] ", usb_modes[i]);
+		else
+			len += sprintf(buf + len, "%s ", usb_modes[i]);
+	}
+
+	buf[len - 1] = '\n';
+	return len;
+}
+
+static ssize_t usb_mode_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	struct typec_port *port = to_typec_port(dev);
+	int ret = 0;
+	int mode;
+
+	mode = sysfs_match_string(usb_modes, buf);
+	if (mode < 0)
+		return mode;
+
+	ret = port->ops->usb_mode_set(port, mode);
+	if (ret)
+		return ret;
+
+	return size;
+}
+static DEVICE_ATTR_RW(usb_mode);
+
 /* ------------------------------------------------------------------------- */
 /* Alternate Modes */
 
@@ -597,6 +646,7 @@ static DEVICE_ATTR_RO(supports_usb_power_delivery);
 static struct attribute *typec_partner_attrs[] = {
 	&dev_attr_accessory_mode.attr,
 	&dev_attr_supports_usb_power_delivery.attr,
+	&dev_attr_usb_mode.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(typec_partner);
@@ -1273,6 +1323,7 @@ static struct attribute *typec_attrs[] = {
 	&dev_attr_usb_typec_revision.attr,
 	&dev_attr_vconn_source.attr,
 	&dev_attr_port_type.attr,
+	&dev_attr_usb_mode.attr,
 	NULL,
 };
 
@@ -1302,6 +1353,9 @@ static umode_t typec_attr_is_visible(struct kobject *kobj,
 			return 0;
 		if (port->cap->type != TYPEC_PORT_DRP)
 			return 0444;
+	} else if (attr == &dev_attr_usb_mode.attr) {
+		if (!port->ops || !port->ops->usb_mode_set)
+			return 0444;
 	}
 
 	return attr->mode;
@@ -1656,6 +1710,13 @@ struct typec_port *typec_register_port(struct device *parent,
 	port->port_type = cap->type;
 	port->prefer_role = cap->prefer_role;
 
+	if (cap->usb & USB_CAPABILITY_USB4)
+		port->usb_mode = USB_MODE_USB4;
+	else if (cap->usb & USB_CAPABILITY_USB3)
+		port->usb_mode = USB_MODE_USB3;
+	else if (cap->usb & USB_CAPABILITY_USB2)
+		port->usb_mode = USB_MODE_USB2;
+
 	device_initialize(&port->dev);
 	port->dev.class = typec_class;
 	port->dev.parent = parent;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 0acfbcd8bf04..1128c3b58618 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -72,6 +72,13 @@ enum typec_orientation {
 	TYPEC_ORIENTATION_REVERSE,
 };
 
+enum usb_mode {
+	USB_MODE_NONE,
+	USB_MODE_USB2,
+	USB_MODE_USB3,
+	USB_MODE_USB4
+};
+
 #define USB_CAPABILITY_USB2	BIT(0)
 #define USB_CAPABILITY_USB3	BIT(1)
 #define USB_CAPABILITY_USB4	BIT(2)
@@ -184,6 +191,7 @@ struct typec_partner_desc {
  * @pr_set: Set Power Role
  * @vconn_set: Source VCONN
  * @port_type_set: Set port type
+ * @usb_mode_set: Set the USB Mode to be used with Enter_USB message
  */
 struct typec_operations {
 	int (*try_role)(struct typec_port *port, int role);
@@ -192,6 +200,7 @@ struct typec_operations {
 	int (*vconn_set)(struct typec_port *port, enum typec_role role);
 	int (*port_type_set)(struct typec_port *port,
 			     enum typec_port_type type);
+	int (*usb_mode_set)(struct typec_port *port, enum usb_mode mode);
 };
 
 /*
-- 
2.24.1


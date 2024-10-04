Return-Path: <linux-usb+bounces-15717-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7874F990540
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 16:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F9B31F230A4
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 14:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD282139D1;
	Fri,  4 Oct 2024 14:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqOCZIbG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DD52139B2
	for <linux-usb@vger.kernel.org>; Fri,  4 Oct 2024 14:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050687; cv=none; b=nY5sOftG7cTIoYQVxB1FOL2dVyEygyG4nwaCyGOzLYXU5LhzS6WylEJGJ0QQ7kDVuB6dCHuOVkTbblakM+gUz5pk6G2NIO6qsEU/uBB5NuEYR8pZ0nMWH5SiMASfpaTUsiSuH1p2/QpJCBY0w5lNHauuDFEj7+SPQvqM8PsQqlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050687; c=relaxed/simple;
	bh=gaaz391m/AkjXyrDft5mLFd01BRTlDXUqZzK8JVPk2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4k9ttdgwX/Ym5/oAyBhVpZ0Fjo8L4JgwYJuYWJBQDMisYPAi+X6A7YlmbogFfKk1PANJOvCC/VTUmds+9GN1wLS01pa5K5dDDwBPZkQzGzC6aKzyHg59+6SlqH3mppRDzOpiAyiytzcYgTomtLFXfcTU3EVDnXC9+6di98EzRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqOCZIbG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728050685; x=1759586685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gaaz391m/AkjXyrDft5mLFd01BRTlDXUqZzK8JVPk2A=;
  b=dqOCZIbGUGmfkRgKdOUx3ivPL0jcUz5GU47UoF3OhcC0irraZR3XKn8i
   T6Ksc/e6z+upMt6he5wJlRhIml+s/4EGEDPi3OuDkGVFL/VhEU0DDN9XL
   +B+QPXqNAmK3JXCHNpivYrcpZGttZ4IrUe4NEjvfrqTToa3Qg1wQ9uAg1
   t27CYAOBq9FRVWFEjYEMe7hbzyKE3FXPuLtOVFrhTB4JU1NbEI+mHzDb2
   NO0RAGNfgiy9mwpYmJD/a5/UF3JpwNe+9hEBKAeQnD2zxpZS0rJMEvm6+
   jLpVyNA2UrqjCc4LOvRuBrB8vY0FbrfOtlFWbpt2KutG5tzqRVmx4/qIB
   g==;
X-CSE-ConnectionGUID: slCumvsbSLyKfTskOXY0MA==
X-CSE-MsgGUID: uI2NzoU6RqybsEHDdLRMHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26780793"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="26780793"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 07:04:45 -0700
X-CSE-ConnectionGUID: syQ+jqzaRiu87w68pxe2iQ==
X-CSE-MsgGUID: KvrTuNrCSMuSWVxDXicopQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79144222"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 04 Oct 2024 07:04:43 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 1/4] usb: typec: Add attribute file showing the supported USB modes of the port
Date: Fri,  4 Oct 2024 17:04:36 +0300
Message-ID: <20241004140440.1882311-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004140440.1882311-1-heikki.krogerus@linux.intel.com>
References: <20241004140440.1882311-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This attribute file, named "usb_capability", will show the
supported USB modes, which are USB 2.0, USB 3.2 and USB4.
These modes are defined in the USB Type-C (R2.0) and USB
Power Delivery (R3.0 V2.0) Specifications.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-class-typec | 13 ++++
 drivers/usb/typec/class.c                   | 81 +++++++++++++++++++++
 drivers/usb/typec/class.h                   |  1 +
 include/linux/usb/typec.h                   | 17 +++++
 4 files changed, 112 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 281b995beb05..7c307f02d99e 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -149,6 +149,19 @@ Description:
 		advertise to the partner. The currently used capabilities are in
 		brackets. Selection happens by writing to the file.
 
+What:		/sys/class/typec/<port>/usb_capability
+Date:		May 2024
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:	Lists the supported USB Modes. The default USB mode that is used
+		next time with the Enter_USB Message is in brackets. The default
+		mode can be changed by writing to the file when supported by the
+		driver.
+
+		Valid values:
+		- usb2 (USB 2.0)
+		- usb3 (USB 3.2)
+		- usb4 (USB4)
+
 USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
 
 What:		/sys/class/typec/<port>-partner/accessory_mode
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9262fcd4144f..9c26d2ad40df 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -219,6 +219,13 @@ static ssize_t usb_power_delivery_revision_show(struct device *dev,
 						char *buf);
 static DEVICE_ATTR_RO(usb_power_delivery_revision);
 
+static const char * const usb_modes[] = {
+	[USB_MODE_NONE] = "none",
+	[USB_MODE_USB2] = "usb2",
+	[USB_MODE_USB3] = "usb3",
+	[USB_MODE_USB4] = "usb4"
+};
+
 /* ------------------------------------------------------------------------- */
 /* Alternate Modes */
 
@@ -1289,6 +1296,67 @@ EXPORT_SYMBOL_GPL(typec_unregister_cable);
 /* ------------------------------------------------------------------------- */
 /* USB Type-C ports */
 
+/**
+ * typec_port_set_usb_mode - Set the operational USB mode for the port
+ * @port: USB Type-C port
+ * @mode: USB Mode (USB2, USB3 or USB4)
+ *
+ * @mode will be used with the next Enter_USB message. Existing connections are
+ * not affected.
+ */
+void typec_port_set_usb_mode(struct typec_port *port, enum usb_mode mode)
+{
+	port->usb_mode = mode;
+}
+EXPORT_SYMBOL_GPL(typec_port_set_usb_mode);
+
+static ssize_t
+usb_capability_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	enum usb_mode mode = to_typec_port(dev)->usb_mode;
+	u8 cap = to_typec_port(dev)->cap->usb_capability;
+	int len = 0;
+	int i;
+
+	for (i = USB_MODE_USB2; i < USB_MODE_USB4 + 1; i++) {
+		if (!(BIT(i - 1) & cap))
+			continue;
+
+		if (i == mode)
+			len += sysfs_emit_at(buf, len, "[%s] ", usb_modes[i]);
+		else
+			len += sysfs_emit_at(buf, len, "%s ", usb_modes[i]);
+	}
+
+	buf[len - 1] = '\n';
+	return len;
+}
+
+static ssize_t
+usb_capability_store(struct device *dev, struct device_attribute *attr,
+		     const char *buf, size_t size)
+{
+	struct typec_port *port = to_typec_port(dev);
+	int ret = 0;
+	int mode;
+
+	if (!port->ops || !port->ops->usb_mode_set)
+		return -EOPNOTSUPP;
+
+	mode = sysfs_match_string(usb_modes, buf);
+	if (mode < 0)
+		return mode;
+
+	ret = port->ops->usb_mode_set(port, mode);
+	if (ret)
+		return ret;
+
+	port->usb_mode = mode;
+
+	return size;
+}
+static DEVICE_ATTR_RW(usb_capability);
+
 /**
  * typec_port_set_usb_power_delivery - Assign USB PD for port.
  * @port: USB Type-C port.
@@ -1757,6 +1825,7 @@ static struct attribute *typec_attrs[] = {
 	&dev_attr_vconn_source.attr,
 	&dev_attr_port_type.attr,
 	&dev_attr_orientation.attr,
+	&dev_attr_usb_capability.attr,
 	NULL,
 };
 
@@ -1790,6 +1859,11 @@ static umode_t typec_attr_is_visible(struct kobject *kobj,
 		if (port->cap->orientation_aware)
 			return 0444;
 		return 0;
+	} else if (attr == &dev_attr_usb_capability.attr) {
+		if (!port->cap->usb_capability)
+			return 0;
+		if (!port->ops || !port->ops->usb_mode_set)
+			return 0444;
 	}
 
 	return attr->mode;
@@ -2428,6 +2502,13 @@ struct typec_port *typec_register_port(struct device *parent,
 	port->con.attach = typec_partner_attach;
 	port->con.deattach = typec_partner_deattach;
 
+	if (cap->usb_capability & USB_CAPABILITY_USB4)
+		port->usb_mode = USB_MODE_USB4;
+	else if (cap->usb_capability & USB_CAPABILITY_USB3)
+		port->usb_mode = USB_MODE_USB3;
+	else if (cap->usb_capability & USB_CAPABILITY_USB2)
+		port->usb_mode = USB_MODE_USB2;
+
 	device_initialize(&port->dev);
 	port->dev.class = &typec_class;
 	port->dev.parent = parent;
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index 7485cdb9dd20..85bc50aa54f7 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -55,6 +55,7 @@ struct typec_port {
 	enum typec_role			vconn_role;
 	enum typec_pwr_opmode		pwr_opmode;
 	enum typec_port_type		port_type;
+	enum usb_mode			usb_mode;
 	struct mutex			port_type_lock;
 
 	enum typec_orientation		orientation;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 549275f8ac1b..d8999472212d 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -87,6 +87,17 @@ enum typec_orientation {
 	TYPEC_ORIENTATION_REVERSE,
 };
 
+enum usb_mode {
+	USB_MODE_NONE,
+	USB_MODE_USB2,
+	USB_MODE_USB3,
+	USB_MODE_USB4
+};
+
+#define USB_CAPABILITY_USB2	BIT(0)
+#define USB_CAPABILITY_USB3	BIT(1)
+#define USB_CAPABILITY_USB4	BIT(2)
+
 /*
  * struct enter_usb_data - Enter_USB Message details
  * @eudo: Enter_USB Data Object
@@ -240,6 +251,7 @@ struct typec_partner_desc {
  * @port_type_set: Set port type
  * @pd_get: Get available USB Power Delivery Capabilities.
  * @pd_set: Set USB Power Delivery Capabilities.
+ * @usb_mode_set: Set the USB Mode to be used with Enter_USB message
  */
 struct typec_operations {
 	int (*try_role)(struct typec_port *port, int role);
@@ -250,6 +262,7 @@ struct typec_operations {
 			     enum typec_port_type type);
 	struct usb_power_delivery **(*pd_get)(struct typec_port *port);
 	int (*pd_set)(struct typec_port *port, struct usb_power_delivery *pd);
+	int (*usb_mode_set)(struct typec_port *port, enum usb_mode mode);
 };
 
 enum usb_pd_svdm_ver {
@@ -267,6 +280,7 @@ enum usb_pd_svdm_ver {
  * @svdm_version: USB PD Structured VDM version if supported
  * @prefer_role: Initial role preference (DRP ports).
  * @accessory: Supported Accessory Modes
+ * @usb_capability: Supported USB Modes
  * @fwnode: Optional fwnode of the port
  * @driver_data: Private pointer for driver specific info
  * @pd: Optional USB Power Delivery Support
@@ -283,6 +297,7 @@ struct typec_capability {
 	int			prefer_role;
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
+	u8			usb_capability;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
@@ -350,6 +365,8 @@ int typec_port_set_usb_power_delivery(struct typec_port *port, struct usb_power_
 int typec_partner_set_usb_power_delivery(struct typec_partner *partner,
 					 struct usb_power_delivery *pd);
 
+void typec_port_set_usb_mode(struct typec_port *port, enum usb_mode mode);
+
 /**
  * struct typec_connector - Representation of Type-C port for external drivers
  * @attach: notification about device removal
-- 
2.45.2



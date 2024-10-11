Return-Path: <linux-usb+bounces-16083-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D9799A420
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 14:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BD48B22A4A
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 12:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CAF2178FF;
	Fri, 11 Oct 2024 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+rLzQJe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E6216A11
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728650650; cv=none; b=eFWVSu3rZHxJcrTZvG1eyV/p9NXuR2IllWQI1hinsFPqCYZ96lnVl1N1tyGetv7E/Y0L+wfkl5lTsc5FiQH2PNCD9DJxvfF+UyzrKIRMlEumQtq+/y7MVHOpsTaofisyUWhzsBTz7/z3q/jAYgdWJU0nZtRlcp6+zP605s/hrE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728650650; c=relaxed/simple;
	bh=jKBDXfMzIO82uIeoIJBjBgs5eQuYwr+0uHE3ObyOq7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5ERtkoY3N15v/jV23RC4XWRgb2uXdCTmqTQnpkJKHOgCe6FEY4YIQMgk3aB6bCKyDwkpX6As64Evaavlh8oBAh4n/BTzJF9FTUjNCRpxFPbnip3E37NN50mjV5KqXMGHP51LElSv9aR8FLgzvxM1+Yz1sKoOZ06Fn22xjiq1ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+rLzQJe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728650648; x=1760186648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jKBDXfMzIO82uIeoIJBjBgs5eQuYwr+0uHE3ObyOq7k=;
  b=g+rLzQJe0iI/lSmKUdDGEnQrWZVAHPuczEbJPjfro4Dpi66FFo++mzlr
   q2nUQc6pMxQNX879MxPeGHFtN1rHw5Rj8t0f61qhAGv23OCPsQH06wCsQ
   F2JV4q64xn3m3JZIC6tK2iKJaan8iNsPhzlpv3nqkmqsob2W6LzC/s54F
   8KSQTJuTmVzGYRtgf2jNg6/Cis/R+v/eu4lYbL+fMTSzsOWN1IKSyRePL
   MmT9DEveM6ujIRvmsVf3FyaTuSMpnXui5CJF42R06x00i6COlDs39H+zw
   0tPrS9LOhr9ns8zX3nnhuqZcco2l+ddoLdDNOx+pCqaZB+vLsKJPaD46e
   Q==;
X-CSE-ConnectionGUID: HnstIjgMSb+AFYYhLXCYsA==
X-CSE-MsgGUID: ODI7k0QpSIql6Fwtof3X3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31957695"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="31957695"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 05:44:08 -0700
X-CSE-ConnectionGUID: rneTd7lTR/qLp7C+le+o6w==
X-CSE-MsgGUID: ILInryWDSNCe3HQTvZBfQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="77716145"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 11 Oct 2024 05:44:05 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 1/4] usb: typec: Add attribute file showing the supported USB modes of the port
Date: Fri, 11 Oct 2024 15:43:59 +0300
Message-ID: <20241011124402.3306994-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
References: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
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
index 9262fcd4144f..ea9ee47bb246 100644
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
+	if (!port->ops || !port->ops->default_usb_mode_set)
+		return -EOPNOTSUPP;
+
+	mode = sysfs_match_string(usb_modes, buf);
+	if (mode < 0)
+		return mode;
+
+	ret = port->ops->default_usb_mode_set(port, mode);
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
+		if (!port->ops || !port->ops->default_usb_mode_set)
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
index 549275f8ac1b..f7edced5b10b 100644
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
+ * @default_usb_mode_set: USB Mode to be used by default with Enter_USB Message
  */
 struct typec_operations {
 	int (*try_role)(struct typec_port *port, int role);
@@ -250,6 +262,7 @@ struct typec_operations {
 			     enum typec_port_type type);
 	struct usb_power_delivery **(*pd_get)(struct typec_port *port);
 	int (*pd_set)(struct typec_port *port, struct usb_power_delivery *pd);
+	int (*default_usb_mode_set)(struct typec_port *port, enum usb_mode mode);
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



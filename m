Return-Path: <linux-usb+bounces-16318-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0089A0B41
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 15:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1413E1C22E68
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 13:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8694520C027;
	Wed, 16 Oct 2024 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/DQGtKI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623CC20C025
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729084725; cv=none; b=Vht+8R0AQL+Rdgn2OoIrcjT0yI8OKUONudWb0J6HEbWy2HQ7t8yWNZkcCLxHZagqBz5z9z21v9ViWkeUwBNy1/VTnuvPZodFkzYt69FCbmtylXXNjAUThOXBzu9L22NJxMUjRJYIQmTwHGhHNU+81Q00vTL5SR/S1RGziklDjr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729084725; c=relaxed/simple;
	bh=4iDuDP0jAvpFh/nUqlLs8+fUs4o5COIjUpL6gsaIfhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rq2FIkh/K47C8hOWQZ9lxHi3LAIir2jigX1gQKFvoDE3h26ixMCclThZkwUUVqWWE9EeX5tVb+p2GhjI7MrANNw74J93gKv+MdGx0e+tKuFrDEaToC0qKYMKpQa18F8iu5xm8zL5p4rpga5vaXaUhlFJN0mZshcQzTqaYDdgDVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/DQGtKI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729084724; x=1760620724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4iDuDP0jAvpFh/nUqlLs8+fUs4o5COIjUpL6gsaIfhM=;
  b=I/DQGtKImzIvAia5QUJ14WUchemaXp8Pg+1UtYealfKb0InSilDddl3e
   EZOTnQNsavvhsrcjJC7Ggp/7rhFGaSOrEXKfnrUYFsSFyacJx2xmdtHYL
   aNMkPOVrjaEJug8HU+516ofgvxN5LIDMes8pC4G1iWC0gPaaxLqCmdzSc
   RjXaBe+jO7CwYSqEJF8OtXX7mbTRWOTpz7Gsc1fH3I+AsNv2wtAP3sVLl
   pCFdbCs2eokPsnw7IY0bwt6ASSvFXJp2tdmDooJBh31o83x4a3Q9Q4i9Q
   SvpC+bjUdL59nmFscbsxVWlfEfstB6W6CtKhiQbApCRopMf8OY5jTTlH6
   A==;
X-CSE-ConnectionGUID: U3XxhzXJRwWFmahjaidB6g==
X-CSE-MsgGUID: p/KJB1YjQh6waffq6wfeZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39077769"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39077769"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:18:43 -0700
X-CSE-ConnectionGUID: zi9zn8k1TwiQqV8nJ1KDGA==
X-CSE-MsgGUID: pdYNdHm0SE+HogzmZr+HkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="83300048"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2024 06:18:41 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 2/4] usb: typec: Add attribute file showing the USB Modes of the partner
Date: Wed, 16 Oct 2024 16:18:32 +0300
Message-ID: <20241016131834.898599-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016131834.898599-1-heikki.krogerus@linux.intel.com>
References: <20241016131834.898599-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This attribute file shows the supported USB modes (USB 2.0,
USB 3.0 and USB4) of the partner, and the currently active
mode.

The active mode is determined primarily by checking the
speed of the enumerated USB device. When USB Power Delivery
is supported, the active USB mode should be always the mode
that was used with the Enter_USB Message, regardless of the
result of the USB enumeration. The port drivers can
separately assign the mode with a dedicated API.

If USB Power Delivery Identity is supplied for the partner
device, the supported modes are extracted from it.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-class-typec |  14 +++
 drivers/usb/typec/class.c                   | 124 +++++++++++++++++++-
 drivers/usb/typec/class.h                   |   2 +
 include/linux/usb/typec.h                   |   5 +
 4 files changed, 141 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 3ee757208122..38e101c17a00 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -233,6 +233,20 @@ Description:
 		directory exists, it will have an attribute file for every VDO
 		in Discover Identity command result.
 
+What:		/sys/class/typec/<port>-partner/usb_mode
+Date:		November 2024
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:	The USB Modes that the partner device supports. The active mode
+		is displayed in brackets. The active USB mode can be changed by
+		writing to this file when the port driver is able to send Data
+		Reset Message to the partner. That requires USB Power Delivery
+		contract between the partner and the port.
+
+		Valid values:
+		- usb2 (USB 2.0)
+		- usb3 (USB 3.2)
+		- usb4 (USB4)
+
 USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
 
 Note: Electronically Marked Cables will have a device also for one cable plug
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 2f12269d1465..953cfb1b093e 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -618,6 +618,75 @@ EXPORT_SYMBOL_GPL(typec_unregister_altmode);
 /* ------------------------------------------------------------------------- */
 /* Type-C Partners */
 
+/**
+ * typec_partner_set_usb_mode - Assign active USB Mode for the partner
+ * @partner: USB Type-C partner
+ * @mode: USB Mode (USB2, USB3 or USB4)
+ *
+ * The port drivers can use this function to assign the active USB Mode to
+ * @partner. The USB Mode can change for example due to Data Reset.
+ */
+void typec_partner_set_usb_mode(struct typec_partner *partner, enum usb_mode mode)
+{
+	if (!partner || partner->usb_mode == mode)
+		return;
+
+	partner->usb_capability |= BIT(mode - 1);
+	partner->usb_mode = mode;
+	sysfs_notify(&partner->dev.kobj, NULL, "usb_mode");
+}
+EXPORT_SYMBOL_GPL(typec_partner_set_usb_mode);
+
+static ssize_t
+usb_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct typec_partner *partner = to_typec_partner(dev);
+	int len = 0;
+	int i;
+
+	for (i = USB_MODE_USB2; i < USB_MODE_USB4 + 1; i++) {
+		if (!(BIT(i - 1) & partner->usb_capability))
+			continue;
+
+		if (i == partner->usb_mode)
+			len += sysfs_emit_at(buf, len, "[%s] ", usb_modes[i]);
+		else
+			len += sysfs_emit_at(buf, len, "%s ", usb_modes[i]);
+	}
+
+	sysfs_emit_at(buf, len - 1, "\n");
+
+	return len;
+}
+
+static ssize_t usb_mode_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	struct typec_partner *partner = to_typec_partner(dev);
+	struct typec_port *port = to_typec_port(dev->parent);
+	int mode;
+	int ret;
+
+	if (!port->ops || !port->ops->enter_usb_mode)
+		return -EOPNOTSUPP;
+
+	mode = sysfs_match_string(usb_modes, buf);
+	if (mode < 0)
+		return mode;
+
+	if (mode == partner->usb_mode)
+		return size;
+
+	ret = port->ops->enter_usb_mode(port, mode);
+	if (ret)
+		return ret;
+
+	typec_partner_set_usb_mode(partner, mode);
+
+	return size;
+}
+static DEVICE_ATTR_RW(usb_mode);
+
 static ssize_t accessory_mode_show(struct device *dev,
 				   struct device_attribute *attr,
 				   char *buf)
@@ -664,6 +733,7 @@ static struct attribute *typec_partner_attrs[] = {
 	&dev_attr_supports_usb_power_delivery.attr,
 	&dev_attr_number_of_alternate_modes.attr,
 	&dev_attr_type.attr,
+	&dev_attr_usb_mode.attr,
 	&dev_attr_usb_power_delivery_revision.attr,
 	NULL
 };
@@ -671,6 +741,14 @@ static struct attribute *typec_partner_attrs[] = {
 static umode_t typec_partner_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
 {
 	struct typec_partner *partner = to_typec_partner(kobj_to_dev(kobj));
+	struct typec_port *port = to_typec_port(partner->dev.parent);
+
+	if (attr == &dev_attr_usb_mode.attr) {
+		if (!partner->usb_capability)
+			return 0;
+		if (!port->ops || !port->ops->enter_usb_mode)
+			return 0444;
+	}
 
 	if (attr == &dev_attr_number_of_alternate_modes.attr) {
 		if (partner->num_altmodes < 0)
@@ -744,10 +822,33 @@ static void typec_partner_unlink_device(struct typec_partner *partner, struct de
  */
 int typec_partner_set_identity(struct typec_partner *partner)
 {
-	if (!partner->identity)
+	u8 usb_capability = partner->usb_capability;
+	struct device *dev = &partner->dev;
+	struct usb_pd_identity *id;
+
+	id = get_pd_identity(dev);
+	if (!id)
 		return -EINVAL;
 
-	typec_report_identity(&partner->dev);
+	if (to_typec_port(dev->parent)->data_role == TYPEC_HOST)  {
+		u32 devcap = PD_VDO_UFP_DEVCAP(id->vdo[0]);
+
+		if (devcap & (DEV_USB2_CAPABLE | DEV_USB2_BILLBOARD))
+			usb_capability |= USB_CAPABILITY_USB2;
+		if (devcap & DEV_USB3_CAPABLE)
+			usb_capability |= USB_CAPABILITY_USB3;
+		if (devcap & DEV_USB4_CAPABLE)
+			usb_capability |= USB_CAPABILITY_USB4;
+	} else {
+		usb_capability = PD_VDO_DFP_HOSTCAP(id->vdo[0]);
+	}
+
+	if (partner->usb_capability != usb_capability) {
+		partner->usb_capability = usb_capability;
+		sysfs_notify(&dev->kobj, NULL, "usb_mode");
+	}
+
+	typec_report_identity(dev);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(typec_partner_set_identity);
@@ -917,6 +1018,7 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 	partner->usb_pd = desc->usb_pd;
 	partner->accessory = desc->accessory;
 	partner->num_altmodes = -1;
+	partner->usb_capability = desc->usb_capability;
 	partner->pd_revision = desc->pd_revision;
 	partner->svdm_version = port->cap->svdm_version;
 	partner->attach = desc->attach;
@@ -936,6 +1038,15 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 	partner->dev.type = &typec_partner_dev_type;
 	dev_set_name(&partner->dev, "%s-partner", dev_name(&port->dev));
 
+	if (port->usb2_dev) {
+		partner->usb_capability |= USB_CAPABILITY_USB2;
+		partner->usb_mode = USB_MODE_USB2;
+	}
+	if (port->usb3_dev) {
+		partner->usb_capability |= USB_CAPABILITY_USB2 | USB_CAPABILITY_USB3;
+		partner->usb_mode = USB_MODE_USB3;
+	}
+
 	ret = device_register(&partner->dev);
 	if (ret) {
 		dev_err(&port->dev, "failed to register partner (%d)\n", ret);
@@ -1935,13 +2046,18 @@ static void typec_partner_attach(struct typec_connector *con, struct device *dev
 	struct typec_port *port = container_of(con, struct typec_port, con);
 	struct typec_partner *partner = typec_get_partner(port);
 	struct usb_device *udev = to_usb_device(dev);
+	enum usb_mode usb_mode;
 
-	if (udev->speed < USB_SPEED_SUPER)
+	if (udev->speed < USB_SPEED_SUPER) {
+		usb_mode = USB_MODE_USB2;
 		port->usb2_dev = dev;
-	else
+	} else {
+		usb_mode = USB_MODE_USB3;
 		port->usb3_dev = dev;
+	}
 
 	if (partner) {
+		typec_partner_set_usb_mode(partner, usb_mode);
 		typec_partner_link_device(partner, dev);
 		put_device(&partner->dev);
 	}
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index 85bc50aa54f7..b3076a24ad2e 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -35,6 +35,8 @@ struct typec_partner {
 	int				num_altmodes;
 	u16				pd_revision; /* 0300H = "3.0" */
 	enum usb_pd_svdm_ver		svdm_version;
+	enum usb_mode			usb_mode;
+	u8				usb_capability;
 
 	struct usb_power_delivery	*pd;
 
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index f7edced5b10b..d616b8807000 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -220,6 +220,7 @@ struct typec_cable_desc {
  * @accessory: Audio, Debug or none.
  * @identity: Discover Identity command data
  * @pd_revision: USB Power Delivery Specification Revision if supported
+ * @usb_capability: Supported USB Modes
  * @attach: Notification about attached USB device
  * @deattach: Notification about removed USB device
  *
@@ -237,6 +238,7 @@ struct typec_partner_desc {
 	enum typec_accessory	accessory;
 	struct usb_pd_identity	*identity;
 	u16			pd_revision; /* 0300H = "3.0" */
+	u8			usb_capability;
 
 	void (*attach)(struct typec_partner *partner, struct device *dev);
 	void (*deattach)(struct typec_partner *partner, struct device *dev);
@@ -252,6 +254,7 @@ struct typec_partner_desc {
  * @pd_get: Get available USB Power Delivery Capabilities.
  * @pd_set: Set USB Power Delivery Capabilities.
  * @default_usb_mode_set: USB Mode to be used by default with Enter_USB Message
+ * @enter_usb_mode: Change the active USB Mode
  */
 struct typec_operations {
 	int (*try_role)(struct typec_port *port, int role);
@@ -263,6 +266,7 @@ struct typec_operations {
 	struct usb_power_delivery **(*pd_get)(struct typec_port *port);
 	int (*pd_set)(struct typec_port *port, struct usb_power_delivery *pd);
 	int (*default_usb_mode_set)(struct typec_port *port, enum usb_mode mode);
+	int (*enter_usb_mode)(struct typec_port *port, enum usb_mode mode);
 };
 
 enum usb_pd_svdm_ver {
@@ -365,6 +369,7 @@ int typec_port_set_usb_power_delivery(struct typec_port *port, struct usb_power_
 int typec_partner_set_usb_power_delivery(struct typec_partner *partner,
 					 struct usb_power_delivery *pd);
 
+void typec_partner_set_usb_mode(struct typec_partner *partner, enum usb_mode usb_mode);
 void typec_port_set_usb_mode(struct typec_port *port, enum usb_mode mode);
 
 /**
-- 
2.45.2



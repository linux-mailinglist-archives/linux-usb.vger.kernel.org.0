Return-Path: <linux-usb+bounces-16084-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2425499A421
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 14:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60BA4B229F9
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 12:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B174218584;
	Fri, 11 Oct 2024 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6CW6Uf0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E3121791C
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728650652; cv=none; b=XSL0gGROopwBfcjrXBR0eavdwE1v0Cx5k83KJWxhrW7TEdW2fmV0eITIFjvbyp93a8KnxAMOuE/gLHhbT+/8aAzcYfRcTgDvWDD2wo5+g0Jki8mqEBpUeU7eSkB+oMMgQiVzyyz32f7CbRy437xabQ4s73QmAYZLwFxPeulucts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728650652; c=relaxed/simple;
	bh=3DLvslfPI+iMWLKZ103f9nELbX08bqMmOO+kVQ5VO40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwGyTgX34mn0T5hcR7KUHbbhY1Nm/YkXW8ooPK4D1qxoe+lOHdpRCZj7yHTGhnECVGhWKSjb13zkIbk7uAJOCm86IOLMMumQRP7nddxstD8OmOmqzBY8HWCORGT70LnL2YQhUrI5A5wbNorD4l3mOfCFw1phU/B0D1rK+IFyVIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6CW6Uf0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728650651; x=1760186651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3DLvslfPI+iMWLKZ103f9nELbX08bqMmOO+kVQ5VO40=;
  b=R6CW6Uf0E0i22spBGyc2FSvFWz1Kl2lUB/TOj3JwPaSAq/lLpKwN+S7Y
   olTogvC+nAKKLrAo407RuM6ph101na1EowjhlY8MaToPVgdAaZME+U+nr
   0yEcFLK0jz0KHlVEYHx4mPkxu8RR9vKNoeX/dLaJZowrR7GolBIu8YIwg
   m8Tawc2iY7Er41Rd8K28Lxh0oQtGxavp0IUYp0Cj6TBCU2dGBmuho6bKZ
   w2u2at2osrhH+i0HwTD+Ip4Tx4yiT+dgVqtEIb2USghPxDwllRDVgckPV
   Brxqv3qTI6EHAgj56M/Vix9NufC3pqChW2KOYVGBaPctVd7eaWxfe0n5d
   A==;
X-CSE-ConnectionGUID: 0F+6fMShSd+LCAGivjiBHg==
X-CSE-MsgGUID: EAhrORh2TvWvGD5rR0Hgzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31957704"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="31957704"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 05:44:10 -0700
X-CSE-ConnectionGUID: usyGrRUfSwiFqNmSgkYZ/A==
X-CSE-MsgGUID: LApFIsojRMWn6cr/4AN44A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="77716162"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 11 Oct 2024 05:44:08 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 2/4] usb: typec: Add attribute file showing the USB Modes of the partner
Date: Fri, 11 Oct 2024 15:44:00 +0300
Message-ID: <20241011124402.3306994-3-heikki.krogerus@linux.intel.com>
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
 drivers/usb/typec/class.c                   | 123 +++++++++++++++++++-
 drivers/usb/typec/class.h                   |   2 +
 include/linux/usb/typec.h                   |   5 +
 4 files changed, 140 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 7c307f02d99e..a3afe04b2688 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -233,6 +233,20 @@ Description:
 		directory exists, it will have an attribute file for every VDO
 		in Discover Identity command result.
 
+What:		/sys/class/typec/<port>-partner/usb_mode
+Date:		February 2024
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
index ea9ee47bb246..a6fedafc9c86 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -618,6 +618,74 @@ EXPORT_SYMBOL_GPL(typec_unregister_altmode);
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
+	buf[len - 1] = '\n';
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
@@ -664,6 +732,7 @@ static struct attribute *typec_partner_attrs[] = {
 	&dev_attr_supports_usb_power_delivery.attr,
 	&dev_attr_number_of_alternate_modes.attr,
 	&dev_attr_type.attr,
+	&dev_attr_usb_mode.attr,
 	&dev_attr_usb_power_delivery_revision.attr,
 	NULL
 };
@@ -671,6 +740,14 @@ static struct attribute *typec_partner_attrs[] = {
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
@@ -744,10 +821,33 @@ static void typec_partner_unlink_device(struct typec_partner *partner, struct de
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
@@ -917,6 +1017,7 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 	partner->usb_pd = desc->usb_pd;
 	partner->accessory = desc->accessory;
 	partner->num_altmodes = -1;
+	partner->usb_capability = desc->usb_capability;
 	partner->pd_revision = desc->pd_revision;
 	partner->svdm_version = port->cap->svdm_version;
 	partner->attach = desc->attach;
@@ -936,6 +1037,15 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
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
@@ -1935,13 +2045,18 @@ static void typec_partner_attach(struct typec_connector *con, struct device *dev
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



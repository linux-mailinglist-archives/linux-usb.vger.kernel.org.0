Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92FDE369E7C
	for <lists+linux-usb@lfdr.de>; Sat, 24 Apr 2021 04:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236781AbhDXCRQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Apr 2021 22:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236492AbhDXCRP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Apr 2021 22:17:15 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 994F2C061574
        for <linux-usb@vger.kernel.org>; Fri, 23 Apr 2021 19:16:35 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id u7-20020a259b470000b02904dca50820c2so26586450ybo.11
        for <linux-usb@vger.kernel.org>; Fri, 23 Apr 2021 19:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Mn/X37YGzoXaRidHpnWb9ANkD+US0YqkDbSrWqNk3xI=;
        b=VeR5IHUodRGIJAp4ZK55DOQuTVeVGNv2TfMX/1yAsrlGPc6ZnxM5cwzmkPAJTPqS0s
         QOqCtZ5kHOVDKUbLUw4qPfCjsccVYVaiwuAY2yt5OjY/jftJHu0MFocoqNjpbwgyrF06
         AKMP2a7mA58KXkZA/TDedVWokzAeLCSOqNHTIyMwdkgHYlmnpWvpGUpNTlIkTayUGXqa
         /XbcEIFptn/tp8i9zbOjRQJ4mVGoARjZ7BmZzOV8t0n/QV1uTipEVJRrJp8ZgBXvflP3
         goHVVd4M7BKe2czJwPo6P+d1Be0d1Y+Z0jTD0BzvLdmHpbeeZwY4m+Pf5bNaAhbuArA5
         edlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Mn/X37YGzoXaRidHpnWb9ANkD+US0YqkDbSrWqNk3xI=;
        b=DsqPsKPQrRy64Z/LVGL3jSZ9di+AyU7I+p8OEVd3P4cDSYB2Pg+03btozf5RxnrJ1/
         VCQ44vNVEN3BVcYmSjefuOoe8mXQdx4rHpYPyRt7QI9Y8VdzrEAoRw8GbLO4FeYOaji8
         fNJOrttgAyyX8p0SNNj1f3zWF6GZY3ZYS8EqA2mHgzD97Z6A1uLEpkbmCGDSx+u2C8lu
         4jaUWSl3J5mTInrSl/Cf4PYshyZ0oDN4ybfERT5SHAy4KyDiXm95gXpJxjgfjvJN/lCj
         FAgJ1fssghsuVyZOy1kJzjCz2dg0X2zth4p+J9e9/rN2ZS65R8Odil7Ga4bV0FpJwJJr
         1Ezg==
X-Gm-Message-State: AOAM533IXJbaZ/IbfCTz6kyKs88oUP1PFMykJss7vjR32WMCYf9T7Grw
        +2t6pVax1Usq85bB7pceHI1f7qn6DBdb
X-Google-Smtp-Source: ABdhPJyqTFwgr+iptO4mJmzwn4Zi2dDPDucXnfaoE/2/OvHuX9pLNICLnDV/HDosIYzlCrTJdY3OdbZ5Jy4F
X-Received: from rajat2.mtv.corp.google.com ([2620:15c:202:201:5cef:2faf:44cf:b69b])
 (user=rajatja job=sendgmr) by 2002:a5b:303:: with SMTP id j3mr8975440ybp.433.1619230594664;
 Fri, 23 Apr 2021 19:16:34 -0700 (PDT)
Date:   Fri, 23 Apr 2021 19:16:30 -0700
Message-Id: <20210424021631.1972022-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
Subject: [PATCH v2 1/2] driver core: Move the "removable" attribute from USB
 to core
From:   Rajat Jain <rajatja@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rajat Jain <rajatja@google.com>, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
        helgaas@kernel.org
Cc:     rajatxjain@gmail.com, jsbarnes@google.com, dtor@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Move the "removable" attribute from USB to core in order to allow
it to be supported by other subsystem / buses. Individual buses
that want to support this attribute can opt-in by setting the
supports_removable flag, and then populating the removable property
of the device while enumerating it. The ABI for the attribute remains
unchanged.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v2: Add documentation

 Documentation/ABI/testing/sysfs-bus-usb       | 11 ------
 .../ABI/testing/sysfs-devices-removable       | 17 +++++++++
 drivers/base/core.c                           | 28 +++++++++++++++
 drivers/usb/core/hub.c                        |  8 ++---
 drivers/usb/core/sysfs.c                      | 24 -------------
 drivers/usb/core/usb.c                        |  1 +
 include/linux/device.h                        | 36 +++++++++++++++++++
 include/linux/usb.h                           |  7 ----
 8 files changed, 86 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-removable

diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
index bf2c1968525f..73eb23bc1f34 100644
--- a/Documentation/ABI/testing/sysfs-bus-usb
+++ b/Documentation/ABI/testing/sysfs-bus-usb
@@ -154,17 +154,6 @@ Description:
 		files hold a string value (enable or disable) indicating whether
 		or not USB3 hardware LPM U1 or U2 is enabled for the device.
 
-What:		/sys/bus/usb/devices/.../removable
-Date:		February 2012
-Contact:	Matthew Garrett <mjg@redhat.com>
-Description:
-		Some information about whether a given USB device is
-		physically fixed to the platform can be inferred from a
-		combination of hub descriptor bits and platform-specific data
-		such as ACPI. This file will read either "removable" or
-		"fixed" if the information is available, and "unknown"
-		otherwise.
-
 What:		/sys/bus/usb/devices/.../ltm_capable
 Date:		July 2012
 Contact:	Sarah Sharp <sarah.a.sharp@linux.intel.com>
diff --git a/Documentation/ABI/testing/sysfs-devices-removable b/Documentation/ABI/testing/sysfs-devices-removable
new file mode 100644
index 000000000000..e13dddd547b5
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-removable
@@ -0,0 +1,17 @@
+What:		/sys/devices/.../removable
+Date:		Apr 2021
+Contact:	Matthew Garrett <mjg@redhat.com>,
+		Rajat Jain <rajatja@google.com>
+Description:
+		Information about whether a given device is physically fixed to
+		the platform. This is determined by the device's subsystem in a
+		bus / platform specific way. This attribute is only present for
+		buses that can support determining such information:
+
+		"removable": The device is external / removable from the system.
+		"fixed":     The device is internal / fixed to the system.
+		"unknown":   The information is unavailable.
+
+		Currently this is only supported by USB (which infers the
+		information from a combination of hub descriptor bits and
+		platform-specific data such as ACPI).
diff --git a/drivers/base/core.c b/drivers/base/core.c
index f29839382f81..b8ae4cc52805 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2327,6 +2327,25 @@ static ssize_t online_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(online);
 
+static ssize_t removable_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	const char *state;
+
+	switch (dev->removable) {
+	case DEVICE_REMOVABLE:
+		state = "removable";
+		break;
+	case DEVICE_FIXED:
+		state = "fixed";
+		break;
+	default:
+		state = "unknown";
+	}
+	return sprintf(buf, "%s\n", state);
+}
+static DEVICE_ATTR_RO(removable);
+
 int device_add_groups(struct device *dev, const struct attribute_group **groups)
 {
 	return sysfs_create_groups(&dev->kobj, groups);
@@ -2504,8 +2523,16 @@ static int device_add_attrs(struct device *dev)
 			goto err_remove_dev_online;
 	}
 
+	if (type && type->supports_removable) {
+		error = device_create_file(dev, &dev_attr_removable);
+		if (error)
+			goto err_remove_dev_waiting_for_supplier;
+	}
+
 	return 0;
 
+ err_remove_dev_waiting_for_supplier:
+	device_remove_file(dev, &dev_attr_waiting_for_supplier);
  err_remove_dev_online:
 	device_remove_file(dev, &dev_attr_online);
  err_remove_dev_groups:
@@ -2525,6 +2552,7 @@ static void device_remove_attrs(struct device *dev)
 	struct class *class = dev->class;
 	const struct device_type *type = dev->type;
 
+	device_remove_file(dev, &dev_attr_removable);
 	device_remove_file(dev, &dev_attr_waiting_for_supplier);
 	device_remove_file(dev, &dev_attr_online);
 	device_remove_groups(dev, dev->groups);
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 7f71218cc1e5..500e5648de04 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2442,11 +2442,11 @@ static void set_usb_port_removable(struct usb_device *udev)
 	 */
 	switch (hub->ports[udev->portnum - 1]->connect_type) {
 	case USB_PORT_CONNECT_TYPE_HOT_PLUG:
-		udev->removable = USB_DEVICE_REMOVABLE;
+		dev_set_removable(&udev->dev, DEVICE_REMOVABLE);
 		return;
 	case USB_PORT_CONNECT_TYPE_HARD_WIRED:
 	case USB_PORT_NOT_USED:
-		udev->removable = USB_DEVICE_FIXED;
+		dev_set_removable(&udev->dev, DEVICE_FIXED);
 		return;
 	default:
 		break;
@@ -2471,9 +2471,9 @@ static void set_usb_port_removable(struct usb_device *udev)
 	}
 
 	if (removable)
-		udev->removable = USB_DEVICE_REMOVABLE;
+		dev_set_removable(&udev->dev, DEVICE_REMOVABLE);
 	else
-		udev->removable = USB_DEVICE_FIXED;
+		dev_set_removable(&udev->dev, DEVICE_FIXED);
 
 }
 
diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index d85699bee671..e8ff3afdf7af 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -298,29 +298,6 @@ static ssize_t urbnum_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(urbnum);
 
-static ssize_t removable_show(struct device *dev, struct device_attribute *attr,
-			      char *buf)
-{
-	struct usb_device *udev;
-	char *state;
-
-	udev = to_usb_device(dev);
-
-	switch (udev->removable) {
-	case USB_DEVICE_REMOVABLE:
-		state = "removable";
-		break;
-	case USB_DEVICE_FIXED:
-		state = "fixed";
-		break;
-	default:
-		state = "unknown";
-	}
-
-	return sprintf(buf, "%s\n", state);
-}
-static DEVICE_ATTR_RO(removable);
-
 static ssize_t ltm_capable_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
@@ -825,7 +802,6 @@ static struct attribute *dev_attrs[] = {
 	&dev_attr_avoid_reset_quirk.attr,
 	&dev_attr_authorized.attr,
 	&dev_attr_remove.attr,
-	&dev_attr_removable.attr,
 	&dev_attr_ltm_capable.attr,
 #ifdef CONFIG_OF
 	&dev_attr_devspec.attr,
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index a566bb494e24..5a0f73a28196 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -523,6 +523,7 @@ struct device_type usb_device_type = {
 #ifdef CONFIG_PM
 	.pm =		&usb_device_pm_ops,
 #endif
+	.supports_removable = true,
 };
 
 
diff --git a/include/linux/device.h b/include/linux/device.h
index ba660731bd25..d6442b811607 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -93,6 +93,12 @@ struct device_type {
 	void (*release)(struct device *dev);
 
 	const struct dev_pm_ops *pm;
+
+	/*
+	 * Determines whether the subsystem supports classifying the devices of
+	 * this type into removable vs fixed.
+	 */
+	bool supports_removable;
 };
 
 /* interface for exporting device attributes */
@@ -350,6 +356,19 @@ enum dl_dev_state {
 	DL_DEV_UNBINDING,
 };
 
+/**
+ * enum device_removable - Whether the device is removable. The criteria for a
+ * device to be classified as removable, is determined by its subsystem or bus.
+ * @DEVICE_REMOVABLE_UNKNOWN:  Device location is Unknown (default).
+ * @DEVICE_REMOVABLE: Device is removable by the user.
+ * @DEVICE_FIXED: Device is not removable by the user.
+ */
+enum device_removable {
+	DEVICE_REMOVABLE_UNKNOWN = 0,
+	DEVICE_REMOVABLE,
+	DEVICE_FIXED,
+};
+
 /**
  * struct dev_links_info - Device data related to device links.
  * @suppliers: List of links to supplier devices.
@@ -431,6 +450,9 @@ struct dev_links_info {
  * 		device (i.e. the bus driver that discovered the device).
  * @iommu_group: IOMMU group the device belongs to.
  * @iommu:	Per device generic IOMMU runtime data
+ * @removable:  Whether the device can be removed from the system. This
+ *              should be set by the subsystem / bus driver that discovered
+ *              the device.
  *
  * @offline_disabled: If set, the device is permanently online.
  * @offline:	Set after successful invocation of bus type's .offline().
@@ -541,6 +563,8 @@ struct device {
 	struct iommu_group	*iommu_group;
 	struct dev_iommu	*iommu;
 
+	enum device_removable	removable;
+
 	bool			offline_disabled:1;
 	bool			offline:1;
 	bool			of_node_reused:1;
@@ -778,6 +802,18 @@ static inline bool dev_has_sync_state(struct device *dev)
 	return false;
 }
 
+static inline void dev_set_removable(struct device *dev,
+				     enum device_removable removable)
+{
+	dev->removable = removable;
+}
+
+static inline bool dev_is_removable(struct device *dev)
+{
+	return dev && dev->type && dev->type->supports_removable
+	    && dev->removable == DEVICE_REMOVABLE;
+}
+
 /*
  * High level routines for use by the bus drivers
  */
diff --git a/include/linux/usb.h b/include/linux/usb.h
index d6a41841b93e..0bbb9e8b18c7 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -473,12 +473,6 @@ struct usb_dev_state;
 
 struct usb_tt;
 
-enum usb_device_removable {
-	USB_DEVICE_REMOVABLE_UNKNOWN = 0,
-	USB_DEVICE_REMOVABLE,
-	USB_DEVICE_FIXED,
-};
-
 enum usb_port_connect_type {
 	USB_PORT_CONNECT_TYPE_UNKNOWN = 0,
 	USB_PORT_CONNECT_TYPE_HOT_PLUG,
@@ -701,7 +695,6 @@ struct usb_device {
 #endif
 	struct wusb_dev *wusb_dev;
 	int slot_id;
-	enum usb_device_removable removable;
 	struct usb2_lpm_parameters l1_params;
 	struct usb3_lpm_parameters u1_params;
 	struct usb3_lpm_parameters u2_params;
-- 
2.31.1.498.g6c1eba8ee3d-goog


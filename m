Return-Path: <linux-usb+bounces-5937-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E5584B62E
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 14:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 375F2B22B23
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479F7131740;
	Tue,  6 Feb 2024 13:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWP1Hfdo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6832130AF4
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707225437; cv=none; b=QItOsxW8xuW5N8pPjWHi8/reN7QSXtuXNwJ+M0QrIhwDXwlAGzdgvmo9yAaoUuKv7r/CrD5vYa5Cxo3qyBvbsbXc/5IaeCWO9MjGIt6h5aAPHiyo2vpWZPPgJl27MJtvVJLamyDV8Nd+R3xtuiDtwuMc/PZ53XMFgdTXzT7h1Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707225437; c=relaxed/simple;
	bh=i8aAoC8Nnzc+yJ7AIKSsSOM3ey5MgTzEN1cyr+7dpgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D0HezTZ17tN0F/twLE7DgKhUSLDEItrlXjsH+3X2LXLQ4wr0oTigVNex9ABX2MX+iNwGtzhD+SQUd7uDStS+6zdJ0aXcIwlW+UVYQVBfYbCbKhlesmliQcSxHGBqCpR/ooj5/H8+r4EX30Hq92tHc7/SqQGC8YlOWM+tE7Cnb40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWP1Hfdo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707225436; x=1738761436;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i8aAoC8Nnzc+yJ7AIKSsSOM3ey5MgTzEN1cyr+7dpgU=;
  b=aWP1HfdohEFOqT+H6gRV2Je1FUcP4n0dtqqfnzciem1kYHRgJivgOz1b
   qVDDIepFUNQSIJgTQ6egojLZqC8SDhROVnY2hjwZhnqgR/Jn0GfL+Pl16
   x2AYHHURYvBPmpymWksDDwpoICfr0QJ3q8pBx8hw/OuuoVzT1GVJ6B8r/
   rkew3MhZU6g7B2y5YrUF7InPBGEbKzRh/UG/sCzy/Xnvt/Xs1bUziGeHU
   uV4RQh+La3Z9qVFz0pZq5BARP0x5thigUhJOnwUxEUZ/c2kv7bsxUM4Ge
   50pNdwqnp3Echhjl/DBDHYJMMb+NOFsw6ae7vBcGQ16QmTwqk3gRF1TQg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11479005"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="11479005"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="824177675"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="824177675"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 06 Feb 2024 05:17:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 9AC1C345; Tue,  6 Feb 2024 14:59:15 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: mathias.nyman@linux.intel.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH] usb: common: add driver for USB Billboard devices
Date: Tue,  6 Feb 2024 14:56:23 +0200
Message-ID: <20240206125623.1208161-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces the USB Billboard Driver. Its purpose is to display,
via debugfs, basic information about connected Billboard devices.

USB-C devices that support Alternate Modes (AUMs), such as DisplayPort
and HDMI, can expose a simple USB 2 billboard device that describes the
Alternate Modes the USB-C device supports. This enables users to see
which Alternate Modes are supported by the USB-C device, even if the
host system doesn't support them. All USB-C hosts support USB 2 devices.

The AUM information is communicated through a 'Billboard Capability
Descriptor' and one or more 'Billboard AUM Capability Descriptors'. The
values described in the aforementioned descriptors are exposed by this
driver via debugfs

The driver will create a "billboards" directory within
'/sys/kernel/debug/usb'. Each connected billboard device will have a
corresponding file added to this "billboards" directory.

Example:

$ cat /sys/kernel/debug/usb/billboards/1-1:1.0
Billboard:
iAddtionalInfoURL               USB-C ADAPTOR
bNumberOfAlternateOrUSB4Modes   1
bPreferredAlternateOrUSB4Modes  0
VCONNPower                      1W
bvdVersion                      v1.21
bAdditionalFailureInfo          0
bReserved                       0

AUM-00:
bwAlternateModesVdo             0x405
bmConfigured                    AUM configuration not attempted or exited
wSVID                           0xff01
bAlternateOrUSB4Mode            0x0
iAlternateOrUSB4ModeString      Generic

Link: https://www.usb.org/document-library/billboard-device-class-spec-revision-122-and-adopters-agreement
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/common/Kconfig     |  11 ++
 drivers/usb/common/Makefile    |   1 +
 drivers/usb/common/billboard.c | 334 +++++++++++++++++++++++++++++++++
 3 files changed, 346 insertions(+)
 create mode 100644 drivers/usb/common/billboard.c

diff --git a/drivers/usb/common/Kconfig b/drivers/usb/common/Kconfig
index b856622431a7..68f1154acf81 100644
--- a/drivers/usb/common/Kconfig
+++ b/drivers/usb/common/Kconfig
@@ -49,3 +49,14 @@ config USB_CONN_GPIO
 
 	  To compile the driver as a module, choose M here: the module will
 	  be called usb-conn-gpio.ko
+
+config USB_BILLBOARD
+	tristate "USB Billboard Driver"
+	depends on USB && DEBUG_FS
+	help
+	  Say "y" to display, via debugfs, basic information about connected
+	  USB Billboard devices.
+
+	  USB Billboard Devices communicate the Alternate Modes (AUMs) supported
+	  by a Device Container to a host system. For example, the mode could be
+	  for a DisplayPort, HDMI or any other type of data transfer.
\ No newline at end of file
diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
index 8ac4d21ef5c8..19fba22185a4 100644
--- a/drivers/usb/common/Makefile
+++ b/drivers/usb/common/Makefile
@@ -11,3 +11,4 @@ usb-common-$(CONFIG_USB_LED_TRIG) += led.o
 obj-$(CONFIG_USB_CONN_GPIO)	+= usb-conn-gpio.o
 obj-$(CONFIG_USB_OTG_FSM) += usb-otg-fsm.o
 obj-$(CONFIG_USB_ULPI_BUS)	+= ulpi.o
+obj-$(CONFIG_USB_BILLBOARD)	+= billboard.o
diff --git a/drivers/usb/common/billboard.c b/drivers/usb/common/billboard.c
new file mode 100644
index 000000000000..8be9765c39ba
--- /dev/null
+++ b/drivers/usb/common/billboard.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * USB Billboard Driver
+ *
+ * Copyright (C) 2023, Intel Corporation.
+ * Author: Niklas Neronin <niklas.neronin@linux.intel.com>
+ */
+
+#define DRIVER_DESC	"USB Billboard Driver"
+#define DRIVER_AUTHOR	"Niklas Neronin <niklas.neronin@linux.intel.com>"
+
+#include <linux/usb.h>
+#include <linux/debugfs.h>
+
+#define USB_CAP_TYPE_BILLBOARD_AUM 0x0F
+#define USB_CAP_TYPE_BILLBOARD 0x0D
+#define MAX_NUM_ALT_OR_USB4_MODE 52
+#define USB_STRING_SIZE 256
+#define LPADD (-31)
+
+#define bb_dbg(billboard, ...) dev_dbg(&(billboard->interface)->dev, __VA_ARGS__)
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_LICENSE("GPL");
+
+static struct dentry *billboard_debug_root;
+static struct usb_driver usb_billboard_driver;
+
+/* Structure to hold all of our device specific stuff */
+struct usb_billboard {
+	struct usb_device			*udev;
+	struct usb_interface			*interface;
+	struct usb_billboard_cap_descriptor	*billboard_cap_desc;
+	struct usb_billboard_aum_cap_descriptor	**aum_cap_descs;
+	unsigned char				num_aums;
+};
+
+static void billboard_free(struct usb_billboard *billboard)
+{
+	if (!billboard)
+		return;
+	usb_put_dev(billboard->udev);
+	usb_put_intf(billboard->interface);
+	kfree(billboard->aum_cap_descs);
+	kfree(billboard);
+}
+
+static struct usb_device_id billboard_id_table[] = {
+	{ USB_DEVICE_INFO(0x11, 0, 0) },
+	{ } /* Terminating entry */
+};
+MODULE_DEVICE_TABLE(usb, billboard_id_table);
+
+/* Struct for Billboard Capability Descriptor */
+struct usb_billboard_cap_descriptor {
+	__u8	bLength;
+	__u8	bDescriptorType;
+	__u8	bDevCapabilityType;
+	__u8	iAddtionalInfoURL;
+	__u8	bNumberOfAlternateOrUSB4Modes;
+	__u8	bPreferredAlternateOrUSB4Modes;
+	__le16	VCONNPower;
+	__u8	bmConfigured[32];
+	__u8	bvdVersion[2];
+	__u8	bAdditionalFailureInfo;
+	__u8	bReserved;
+	DECLARE_FLEX_ARRAY(struct {
+		__le16	wSVID;
+		__u8	bAlternateOrUSB4Mode;
+		__u8	iAlternateOrUSB4ModeString;
+	}, aum) __packed;
+} __packed;
+
+/* Struct for Billboard AUM Capability Descriptor */
+struct usb_billboard_aum_cap_descriptor {
+	__u8	bLength;
+	__u8	bDescriptorType;
+	__u8	bDevCapabilityType;
+	__u8	bIndex;
+	__le32	bwAlternateModesVdo;
+} __packed;
+
+static int billboard_show(struct seq_file *s, void *unused)
+{
+	static const char *const power_table[] = {"1", "1.5", "2", "3", "4", "5", "6"};
+	struct usb_billboard *billboard = s->private;
+	struct usb_billboard_cap_descriptor *billboard_cap = billboard->billboard_cap_desc;
+	unsigned char bitpair;
+	char usb_str[USB_STRING_SIZE];
+	int vconn;
+
+	seq_puts(s, "Billboard:\n");
+	usb_string(billboard->udev, billboard_cap->iAddtionalInfoURL, usb_str, USB_STRING_SIZE);
+	seq_printf(s, "%*s %s\n", LPADD, "iAddtionalInfoURL", usb_str);
+
+	seq_printf(s, "%*s %d\n", LPADD, "bNumberOfAlternateOrUSB4Modes",
+		   billboard_cap->bNumberOfAlternateOrUSB4Modes);
+	seq_printf(s, "%*s %d\n", LPADD, "bPreferredAlternateOrUSB4Modes",
+		   billboard_cap->bPreferredAlternateOrUSB4Modes);
+
+	seq_printf(s, "%*s ", LPADD, "VCONNPower");
+	vconn = le16_to_cpu(billboard_cap->VCONNPower);
+	if (vconn & (1 << 15))
+		seq_puts(s, "Power not required\n");
+	else if (vconn < 7)
+		seq_printf(s, "%sW\n", power_table[vconn]);
+	else
+		seq_puts(s, "Reserved\n");
+
+	seq_printf(s, "%*s v%x.%x\n", LPADD, "bvdVersion",
+		   billboard_cap->bvdVersion[1], billboard_cap->bvdVersion[0]);
+	seq_printf(s, "%*s %d\n", LPADD, "bAdditionalFailureInfo",
+		   billboard_cap->bAdditionalFailureInfo);
+	seq_printf(s, "%*s %d\n", LPADD, "bReserved", billboard_cap->bReserved);
+
+	for (int i = 0; i < billboard->num_aums; i++) {
+		seq_printf(s, "\nAUM-%02d:\n", billboard->aum_cap_descs[i]->bIndex);
+		seq_printf(s, "%*s %#x\n", LPADD, "bwAlternateModesVdo",
+			   billboard->aum_cap_descs[i]->bwAlternateModesVdo);
+
+		/* In order, each bit pair in 'bmConfigured' describes a AUM configuration. */
+		bitpair = (billboard_cap->bmConfigured[i / 4] >> (i % 4)) & 0x03;
+		seq_printf(s, "%*s ", LPADD, "bmConfigured");
+		if (bitpair == 1)
+			seq_puts(s, "AUM configuration not attempted or exited\n");
+		else if (bitpair == 2)
+			seq_puts(s, "AUM configuration attempted but unsuccessful and not entered\n");
+		else if (bitpair == 3)
+			seq_puts(s, "AUM configuration successful\n");
+		else
+			seq_puts(s, "Unspecified Error\n");
+
+		seq_printf(s, "%*s %#x\n", LPADD, "wSVID",
+			   billboard_cap->aum[i].wSVID);
+		seq_printf(s, "%*s %#x\n", LPADD, "bAlternateOrUSB4Mode",
+			   billboard_cap->aum[i].bAlternateOrUSB4Mode);
+
+		usb_string(billboard->udev, billboard_cap->aum[i].iAlternateOrUSB4ModeString,
+			   usb_str, USB_STRING_SIZE);
+		seq_printf(s, "%*s %s\n", LPADD, "iAlternateOrUSB4ModeString", usb_str);
+	}
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(billboard);
+
+static int get_billboard_capability_descriptor(struct usb_billboard *billboard,
+					       struct usb_bos_descriptor *bos)
+{
+	struct usb_billboard_cap_descriptor *desc;
+	unsigned char *ptr = (unsigned char *)bos + bos->bLength;
+
+	for (int i = 0; i < bos->bNumDeviceCaps; i++) {
+		desc = (struct usb_billboard_cap_descriptor *)ptr;
+
+		if (desc->bDescriptorType != USB_DT_DEVICE_CAPABILITY)
+			goto skip_to_next_descriptor;
+
+		if (desc->bDevCapabilityType != USB_CAP_TYPE_BILLBOARD)
+			goto skip_to_next_descriptor;
+
+		if (desc->bLength < 48) {
+			bb_dbg(billboard, "incorrect billboard capability descriptor length");
+			goto descriptor_error;
+		}
+
+		if (!desc->bNumberOfAlternateOrUSB4Modes ||
+		    desc->bNumberOfAlternateOrUSB4Modes > MAX_NUM_ALT_OR_USB4_MODE) {
+			bb_dbg(billboard, "incorrect amount of AUMs");
+			goto descriptor_error;
+		}
+
+		if (desc->bLength != desc->bNumberOfAlternateOrUSB4Modes * 4 + 44) {
+			bb_dbg(billboard, "incorrect length of billboard AUM descriptors");
+			goto descriptor_error;
+		}
+
+		billboard->billboard_cap_desc = desc;
+		return 0;
+
+skip_to_next_descriptor:
+		ptr += desc->bLength;
+	}
+
+descriptor_error:
+	return -1;
+}
+
+static int get_billboard_aum_capability_descriptors(struct usb_billboard *billboard,
+						    struct usb_bos_descriptor *bos)
+{
+	struct usb_billboard_aum_cap_descriptor *desc;
+	unsigned char *ptr = (unsigned char *)bos + bos->bLength;
+	unsigned char total = 0;
+
+	for (int i = 0; i < bos->bNumDeviceCaps; i++) {
+		desc = (struct usb_billboard_aum_cap_descriptor *)ptr;
+
+		if (desc->bDescriptorType != USB_DT_DEVICE_CAPABILITY)
+			goto skip_to_next_descriptor;
+
+		if (desc->bDevCapabilityType != USB_CAP_TYPE_BILLBOARD_AUM)
+			goto skip_to_next_descriptor;
+
+		if (desc->bLength != 8) {
+			bb_dbg(billboard, "incorrect length of AUM capability descriptor");
+			goto descriptor_error;
+		}
+
+		if (desc->bIndex >= billboard->num_aums) {
+			bb_dbg(billboard, "incorrect index of AUM capability descriptor");
+			goto descriptor_error;
+		}
+
+		billboard->aum_cap_descs[desc->bIndex] = desc;
+		if (++total == billboard->num_aums)
+			return 0;
+
+skip_to_next_descriptor:
+		ptr += desc->bLength;
+	}
+
+descriptor_error:
+	return -1;
+}
+
+static int probe(struct usb_interface *interface, const struct usb_device_id *id)
+{
+	struct usb_billboard *billboard;
+	struct usb_device *udev;
+	int ret = -ENODEV;
+
+	udev = interface_to_usbdev(interface);
+	if (le16_to_cpu(udev->descriptor.bcdUSB) < 0x201 || !udev->bos)
+		return ret;
+
+	billboard = kzalloc(sizeof(*billboard), GFP_KERNEL);
+	if (!billboard) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	billboard->udev = usb_get_dev(udev);
+	billboard->interface = usb_get_intf(interface);
+
+	if (get_billboard_capability_descriptor(billboard, udev->bos->desc))
+		goto err;
+
+	billboard->num_aums = billboard->billboard_cap_desc->bNumberOfAlternateOrUSB4Modes;
+
+	billboard->aum_cap_descs = kcalloc(billboard->num_aums, sizeof(*billboard->aum_cap_descs),
+					   GFP_KERNEL);
+	if (!billboard->aum_cap_descs) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	if (get_billboard_aum_capability_descriptors(billboard, udev->bos->desc))
+		goto err;
+
+	usb_set_intfdata(interface, billboard);
+
+	debugfs_create_file(dev_name(&interface->dev), 0444, billboard_debug_root, billboard,
+			    &billboard_fops);
+
+	dev_info(&interface->dev, "device successfully attached\n");
+	return 0;
+
+err:
+	billboard_free(billboard);
+	return ret;
+}
+
+static void disconnect(struct usb_interface *interface)
+{
+	debugfs_lookup_and_remove(dev_name(&(interface)->dev), billboard_debug_root);
+	billboard_free(usb_get_intfdata(interface));
+}
+
+static int suspend(struct usb_interface *interface, pm_message_t message) { return 0; }
+static int resume(struct usb_interface *interface) { return 0; }
+
+static int reset_resume(struct usb_interface *interface)
+{
+	struct usb_billboard *billboard = usb_get_intfdata(interface);
+	struct usb_device *udev = interface_to_usbdev(interface);
+
+	if (!udev->bos)
+		return -ENODEV;
+
+	if (get_billboard_capability_descriptor(billboard, udev->bos->desc))
+		return -ENODEV;
+
+	if (billboard->num_aums != billboard->billboard_cap_desc->bNumberOfAlternateOrUSB4Modes) {
+		bb_dbg(billboard, "amount of AUMs changed");
+		return -ENODEV;
+	}
+
+	if (get_billboard_aum_capability_descriptors(billboard, udev->bos->desc))
+		return -ENODEV;
+
+	return 0;
+}
+
+static struct usb_driver usb_billboard_driver = {
+	.name		= "billboard",
+	.probe		= probe,
+	.disconnect	= disconnect,
+	.suspend	= pm_ptr(suspend),
+	.resume		= pm_ptr(resume),
+	.reset_resume	= pm_ptr(reset_resume),
+	.id_table	= billboard_id_table,
+	.supports_autosuspend = 1,
+};
+
+static int __init billboard_init(void)
+{
+	int ret;
+
+	billboard_debug_root = debugfs_create_dir("billboards", usb_debug_root);
+	ret = usb_register(&usb_billboard_driver);
+	if (ret < 0)
+		debugfs_remove(billboard_debug_root);
+
+	return ret;
+}
+module_init(billboard_init);
+
+static void __exit billboard_exit(void)
+{
+	usb_deregister(&usb_billboard_driver);
+	debugfs_remove(billboard_debug_root);
+}
+module_exit(billboard_exit);
-- 
2.43.0



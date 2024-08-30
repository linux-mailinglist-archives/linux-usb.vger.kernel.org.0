Return-Path: <linux-usb+bounces-14400-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF5496654C
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 17:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF7EE1C20128
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 15:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1F51B583F;
	Fri, 30 Aug 2024 15:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XckUzKZw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9931B5323
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725031480; cv=none; b=FkjrzTJdh03O9y3WzDgALYq3WwSFNb9zKgccGIpYD5LdbUO/HkMJp4eitMKrRTIT3pyj8K2/yBd95hpRUB/uaX4LS/KXJGJdAUnnsrI1ZZpmTSHlBPM8J1B3ppcoJYBoq7xU8AU0fm8mS6fy/J7+TsEA+pqAGgqvjC8J7KHq9TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725031480; c=relaxed/simple;
	bh=VRqYs2WV9RUavq8HQiVRm//9zVRFX6Qx4nw6ePE9BLY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mUh6Eycm0481kfK3wZRK1jzSp+CUY9U6QB+Huku5Ka8nC0W4Yrrrzi3jn7ebkQacE7er4VmUGxeKndM+7VxV1qUePYUpFglMzWs1XBEZSkoBFdtZ+X7SAte1BOzd+hbhuMCgfcJpJ7cIus5nm+McE943JelZJPu8dA3/GP2tFtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XckUzKZw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725031478; x=1756567478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VRqYs2WV9RUavq8HQiVRm//9zVRFX6Qx4nw6ePE9BLY=;
  b=XckUzKZw0lqSeXMRLa1MB2/OvlET+ew9x8+TsSY9j+OdNVAcIjiNUiVG
   /cILbs8cMviLpoSyDyMr9w8oc+diHoCS6FSlfMWvACwJUBTVpMJ4NWA3W
   c/+OdlxSG3hVZS4aHC8aIHWEHiXSBnNV+3L7JgrEjPamXp2kflGsdtEpy
   to5r6fp1DPDGWxcxZUvxtEHiX1zm8kNjWVH9tm/Bi4Okjcat8xShOotnB
   Mxaovqa/qSXSb0vArPgxQphtzWxv+94miSUCZRGpaen88XNh47NghFG/3
   jFp8clZT16Z/VJTK1ppJPI97fcTgyRteDWgy84t7OUqXf3jNBkl6/Rh8/
   w==;
X-CSE-ConnectionGUID: s0CgcS9rTHaLz3wsvSeo9Q==
X-CSE-MsgGUID: dPBlFSFLTbu7OS3NPHizHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23861955"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23861955"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 08:24:38 -0700
X-CSE-ConnectionGUID: qgPO2DrcQIaEAfvylvB/lQ==
X-CSE-MsgGUID: gAa0oQEiT1eTdLQxqDdxeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="63981649"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 30 Aug 2024 08:24:37 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	mika.westerberg@linux.intel.com,
	mario.limonciello@amd.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 3/4] usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
Date: Fri, 30 Aug 2024 18:26:29 +0300
Message-Id: <20240830152630.3943215-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
References: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the power management relationship between a tunneled USB3 device
and the tunnel providing USB4 host with a device link as the relationship
between them is not evident from normal device hierarchy.

Tunneling capable ports have an ACPI _DSD object pointing to the USB4
Host Interface that is used to establish USB3 3.x tunnels

Set the link directly between tunneled USB3 devices and USB4 Host
Interface to ensure that the USB4 host can runtime suspend if no tunneled
USB 3.x devices exist.
Current Thunderbolt code sets a link between USB4 Host Interface and USB3
xHCI host which prevents USB4 Host Interface from runtime suspending even
if the USB3 host is only serving native USB devices.

See commit b2be2b05cf3b ("thunderbolt: Create device links from ACPI
description") for details.

As the device link is only set for USB3 devices that are already tunneled
we know that USB4 Host Interface exists and is bound to its driver.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
v2:
 - Don't check twice if device is connected to roothub port
 - also create device link if tunnel mode is unknown and port supports
   tunneling.

 drivers/usb/core/usb-acpi.c | 53 +++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 7f8a912d4fe2..21585ed89ef8 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -142,6 +142,53 @@ int usb_acpi_set_power_state(struct usb_device *hdev, int index, bool enable)
 }
 EXPORT_SYMBOL_GPL(usb_acpi_set_power_state);
 
+/**
+ * usb_acpi_add_usb4_devlink - add device link to USB4 Host Interface for tunneled USB3 devices
+ *
+ * @udev: Tunneled USB3 device connected to a roothub.
+ *
+ * Adds a device link between a tunneled USB3 device and the USB4 Host Interface
+ * device to ensure correct runtime PM suspend and resume order. This function
+ * should only be called for tunneled USB3 devices.
+ * The USB4 Host Interface this tunneled device depends on is found from the roothub
+ * port ACPI device specific data _DSD entry.
+ *
+ * Return: negative error code on failure, 0 otherwise
+ */
+static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
+{
+	const struct device_link *link;
+	struct usb_port *port_dev;
+	struct usb_hub *hub;
+
+	if (!udev->parent || udev->parent->parent)
+		return 0;
+
+	hub = usb_hub_to_struct_hub(udev->parent);
+	port_dev = hub->ports[udev->portnum - 1];
+
+	struct fwnode_handle *nhi_fwnode __free(fwnode_handle) =
+		fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
+
+	if (IS_ERR(nhi_fwnode))
+		return 0;
+
+	link = device_link_add(&port_dev->child->dev, nhi_fwnode->dev,
+			       DL_FLAG_AUTOREMOVE_CONSUMER |
+			       DL_FLAG_RPM_ACTIVE |
+			       DL_FLAG_PM_RUNTIME);
+	if (!link) {
+		dev_err(&port_dev->dev, "Failed to created device link from %s to %s\n",
+			dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
+		return -EINVAL;
+	}
+
+	dev_dbg(&port_dev->dev, "Created device link from %s to %s\n",
+		dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
+
+	return 0;
+}
+
 /*
  * Private to usb-acpi, all the core needs to know is that
  * port_dev->location is non-zero when it has been set by the firmware.
@@ -262,6 +309,12 @@ usb_acpi_find_companion_for_device(struct usb_device *udev)
 	if (!hub)
 		return NULL;
 
+
+	/* Tunneled USB3 devices depend on USB4 Host Interface, set device link to it */
+	if (udev->speed >= USB_SPEED_SUPER &&
+	    udev->tunnel_mode != USB_LINK_NATIVE)
+		usb_acpi_add_usb4_devlink(udev);
+
 	/*
 	 * This is an embedded USB device connected to a port and such
 	 * devices share port's ACPI companion.
-- 
2.25.1



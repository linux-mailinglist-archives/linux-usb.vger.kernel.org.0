Return-Path: <linux-usb+bounces-11438-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D62290EBE8
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 15:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D1341C20F8D
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 13:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E9C15098C;
	Wed, 19 Jun 2024 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjWJdg7V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADBF14F9FE
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718802079; cv=none; b=G6d+GQIiNnbLSU1vtPeJLnkxmKxfgMfUlILe9g/WOpPdpfvMkjEaa8XcvHG4AxGy6uEqietJ9zWa18Yoc7dgBjxipiZWX8xDEyb6v+jGXPb9oSHADexB9WyLg6rfmF/rbQp3KUnV32kB89vnTnOpzotu/lMVf3h07mUehYy/VmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718802079; c=relaxed/simple;
	bh=09SbUEks1l3icVqzm4T5A7DqT95CQcinB29fS88rk/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=caA8j7pGzvLwreOZ/HyttdSWwqp53bQH3UFuwVFQQQ6J8Dus+mld+5X5uzwcG6nEuRg9uZNZ9vfszCU6QPrUkkNwO4iZ/4eIZT2UWxrv9MSatqXdC+50nGcCFklWsCImZWnmUbGSDO1DaT+Kh6Wqt4UXBfEXOD6EDIPaTtqnREI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjWJdg7V; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718802079; x=1750338079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=09SbUEks1l3icVqzm4T5A7DqT95CQcinB29fS88rk/c=;
  b=QjWJdg7VIoa+3GcixPTr8ynd9qz+DMOmEUUfHGYcK3Uh46OnZ4hFRBWR
   EWoxYlCcaWw6mkKfWgH3leYDSkk9/DG8uGKoh7qV6W7O3Rv5cRVCV/UKV
   XpjOinos/Pbm3L2uvn1/UhVMnTasD1wGwxhKMmxZEGBpq28ScYXLI7Eqf
   HSb/PyIYgi3tMrZntyMXMZOrX1GMPf769Hn24OTZsSIikl9Ej5zIHraPM
   91TbRyP+7C8lnQT2yafvmoI0vwkCoTnFTym8vLvdZgTSCQme2IxkgZ+t2
   unZo/ACwt+eQE5XtFKkQ6Sc7r5adpoYjwRoni0iOfkQwDfRq3+6FP5l6k
   A==;
X-CSE-ConnectionGUID: Pb5NZhGdS0ezdqL/PzqW3A==
X-CSE-MsgGUID: bcdQPQbjSNaEiTD3Pcfh1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15868303"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="15868303"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 06:01:18 -0700
X-CSE-ConnectionGUID: VQWu1qSkQ/a2w5qAG04QFA==
X-CSE-MsgGUID: dYSl8vg+SY+GyuaJyWKWgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="47040516"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 19 Jun 2024 06:01:16 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <linux-usb@vger.kernel.org>,
	<gregkh@linuxfoundation.org>
Cc: mika.westerberg@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/4] usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
Date: Wed, 19 Jun 2024 16:03:04 +0300
Message-Id: <20240619130305.2617784-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
References: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
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
 drivers/usb/core/usb-acpi.c | 52 +++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 7f8a912d4fe2..316bcc168e76 100644
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
@@ -262,6 +309,11 @@ usb_acpi_find_companion_for_device(struct usb_device *udev)
 	if (!hub)
 		return NULL;
 
+
+	/* Tunneled devices depend on USB4 Host Interface, set device link to it */
+	if (udev->tunneled && !udev->parent->parent)
+		usb_acpi_add_usb4_devlink(udev);
+
 	/*
 	 * This is an embedded USB device connected to a port and such
 	 * devices share port's ACPI companion.
-- 
2.25.1



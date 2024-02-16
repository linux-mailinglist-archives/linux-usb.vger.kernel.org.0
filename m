Return-Path: <linux-usb+bounces-6563-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB2E857EE1
	for <lists+linux-usb@lfdr.de>; Fri, 16 Feb 2024 15:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 725821C23D23
	for <lists+linux-usb@lfdr.de>; Fri, 16 Feb 2024 14:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DB312D763;
	Fri, 16 Feb 2024 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6Ri5nEG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3C112CDB5
	for <linux-usb@vger.kernel.org>; Fri, 16 Feb 2024 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708092663; cv=none; b=rxfgZJrIwOpjW6Lvzv/ZGfIYbjMhXlk7kDskgCKyg9JafifivoAwx65Jwi7ZsoRysS72dDTIlcNWh6WNLSy10Shu+IuLOUrKor4TjHdA/DklrdffJa3uH+8V20iq6T+uaFIn7hp1GuLCUu/D40Y0+q9btb5+xuwbXsTZ8UV1OjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708092663; c=relaxed/simple;
	bh=MYhJmUYoR6KpnzZ611Z7lQ6Ux9rM8D7z/zGPdHHpRYA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JmlRBvgSzxtW5AfnNtYmzbY+TSHj8PpirhV9zSAtUduPzwXgyMIxrewPHr2OezzFe2S6rOtZOBtNH5o/6sHbJMAOoMEy1vr6CAd8C2hX/rZM2Wp9uk2/2TKZe4+FKrYdeJ4BZjboEFbWFVu1GWz1HdE5EslKm88ZnmPaLEKB86g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6Ri5nEG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708092661; x=1739628661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MYhJmUYoR6KpnzZ611Z7lQ6Ux9rM8D7z/zGPdHHpRYA=;
  b=m6Ri5nEGJAVRyKCPENEVfgBYJrkzWVPScUA1jzr2Jmn8G5UMFT6HpPVm
   7YObiRngHeoOtWRLJ8Kk0mMZLBxHwoDFY7zVOpUYoKkBioHK7ChXkq0B9
   B65rEfEOa67CrX38ag2r8x5CoEaw9vwKLlzyS+ZA3ksgvlDO+fTuccJTR
   gNa05I47+V/Lj2yRvK8kwrRdEZmTSi/iQCgVbihZ3r5Qy/2dIUbuXUMPy
   OFK+7EXbABo97SIQIvZ9UDz1pJBJpwPy+nVuUZbaJCgU32MTSP4+cAQj1
   OsmH4cmwGJHCuVl6pNw1glSWVDmlNtz0eipHgAUG4eNxfEYHsN7vGsOWq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2126882"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2126882"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 06:11:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="935852243"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="935852243"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2024 06:10:58 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: pmenzel@molgen.mpg.de
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	aros@gmx.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH 1/2] usb: usb-acpi: Set port connect type of not connectable ports correctly
Date: Fri, 16 Feb 2024 16:12:29 +0200
Message-Id: <20240216141230.3924677-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <9c53ec38-812f-f701-d2f6-91e28367bb82@linux.intel.com>
References: <9c53ec38-812f-f701-d2f6-91e28367bb82@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ports with  _UPC (USB Port Capability) ACPI objects stating they are
"not connectable" are not wired to any connector or internal device.
They only exists inside the host controller.

These ports may not have a ACPI _PLD (Physical Location of Device) object

Rework the code so that _UPC is read even if _PLD does not exist, and
make sure the port->connect_type is set to "USB_PORT_NOT_USED" instead of
"USB_PORT_CONNECT_TYPE_UNKNOWN".

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/usb-acpi.c | 46 ++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index a34b22537d7c..f250dfc3b14d 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -142,12 +142,19 @@ int usb_acpi_set_power_state(struct usb_device *hdev, int index, bool enable)
 }
 EXPORT_SYMBOL_GPL(usb_acpi_set_power_state);
 
-static enum usb_port_connect_type usb_acpi_get_connect_type(acpi_handle handle,
-		struct acpi_pld_info *pld)
+/*
+ * Private to usb-acpi, all the core needs to know is that
+ * port_dev->location is non-zero when it has been set by the firmware.
+ */
+#define USB_ACPI_LOCATION_VALID (1 << 31)
+
+static void
+usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
 {
 	enum usb_port_connect_type connect_type = USB_PORT_CONNECT_TYPE_UNKNOWN;
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *upc = NULL;
+	struct acpi_pld_info *pld;
 	acpi_status status;
 
 	/*
@@ -158,6 +165,12 @@ static enum usb_port_connect_type usb_acpi_get_connect_type(acpi_handle handle,
 	 * a usb device is directly hard-wired to the port. If no visible and
 	 * no connectable, the port would be not used.
 	 */
+
+	status = acpi_get_physical_device_location(handle, &pld);
+	if (ACPI_SUCCESS(status) && pld)
+		port_dev->location = USB_ACPI_LOCATION_VALID |
+			pld->group_token << 8 | pld->group_position;
+
 	status = acpi_evaluate_object(handle, "_UPC", NULL, &buffer);
 	if (ACPI_FAILURE(status))
 		goto out;
@@ -166,25 +179,22 @@ static enum usb_port_connect_type usb_acpi_get_connect_type(acpi_handle handle,
 	if (!upc || (upc->type != ACPI_TYPE_PACKAGE) || upc->package.count != 4)
 		goto out;
 
+	/* UPC states port is connectable */
 	if (upc->package.elements[0].integer.value)
-		if (pld->user_visible)
+		if (!pld)
+			; /* keep connect_type as unknown */
+		else if (pld->user_visible)
 			connect_type = USB_PORT_CONNECT_TYPE_HOT_PLUG;
 		else
 			connect_type = USB_PORT_CONNECT_TYPE_HARD_WIRED;
-	else if (!pld->user_visible)
+	else
 		connect_type = USB_PORT_NOT_USED;
 out:
+	port_dev->connect_type = connect_type;
 	kfree(upc);
-	return connect_type;
+	ACPI_FREE(pld);
 }
 
-
-/*
- * Private to usb-acpi, all the core needs to know is that
- * port_dev->location is non-zero when it has been set by the firmware.
- */
-#define USB_ACPI_LOCATION_VALID (1 << 31)
-
 static struct acpi_device *
 usb_acpi_get_companion_for_port(struct usb_port *port_dev)
 {
@@ -222,22 +232,12 @@ static struct acpi_device *
 usb_acpi_find_companion_for_port(struct usb_port *port_dev)
 {
 	struct acpi_device *adev;
-	struct acpi_pld_info *pld;
-	acpi_handle *handle;
-	acpi_status status;
 
 	adev = usb_acpi_get_companion_for_port(port_dev);
 	if (!adev)
 		return NULL;
 
-	handle = adev->handle;
-	status = acpi_get_physical_device_location(handle, &pld);
-	if (ACPI_SUCCESS(status) && pld) {
-		port_dev->location = USB_ACPI_LOCATION_VALID
-			| pld->group_token << 8 | pld->group_position;
-		port_dev->connect_type = usb_acpi_get_connect_type(handle, pld);
-		ACPI_FREE(pld);
-	}
+	usb_acpi_get_connect_type(port_dev, adev->handle);
 
 	return adev;
 }
-- 
2.25.1



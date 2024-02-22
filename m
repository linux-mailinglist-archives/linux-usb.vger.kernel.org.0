Return-Path: <linux-usb+bounces-6884-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E7085F9F1
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 14:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D54FDB25F76
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 13:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB91E1332AC;
	Thu, 22 Feb 2024 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iwpj/Ojl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A1F1426D
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 13:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708609011; cv=none; b=fNAsxrM+PTAX6MO+/pP5Xm8CqxDXzw8x0ITWiQxCBTkqKdTroklDAJDkkFrYbezunb68zDma2lmkXTvL7j5SQUkHB6dfB3sRZghyMexUDnbVDJjh02fLRdXItkuXIIWN5k8AAbukLPz22vQNJB3vuGXjblTjHq25vRRYHvfVFng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708609011; c=relaxed/simple;
	bh=6OMIwFbhmJq/0L2V/uWGzSVQkzNz3xxEKBmPu+awb84=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XHEXvPa/927eSsUfWwZPRgHK/rWRXh88ISoT8eOQSyOdRG1wy1eYWsvQj6+02XBNEX74Pz8edUU+fCNBWoM3OglsVQJ3pBwyvKWUNJHqobcH2yMY4qTQdW0kKrAv30I5Vi5hEsoKK4rdWsUgseGiaO/OeoAYLpDBHUVQkummbgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iwpj/Ojl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708609010; x=1740145010;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6OMIwFbhmJq/0L2V/uWGzSVQkzNz3xxEKBmPu+awb84=;
  b=Iwpj/OjlpV+AeMi5hkHTp5qIYGUHOq1Yt8nDy7K/B+jMt4912SnYRlfU
   MEhSqECITHSf8IWwJLKPoMlTQ8sEAc+gnkct2dNtW8tGL6mYzw+YIhZqs
   SsYOGxYPoWAuY9WFWKgyC3jF9VHv//QV42Ju67pKiPHiD9XI93wEJqwtG
   dmKOnHMvk9eAgKdk5yL3RY813OfGMVFyaTiafKQaBPi2QGcMWOsOz+QLF
   GkbDVkOoqrGv5umyUFGg77m7k1uIkytOP0y1BvUlk939aSzag8qIVnzlX
   KlDgtkljDwSX4cxRG79cIOC5O1l7Qd/QdP094+FJMFRr0TMTyk2HW6pC1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13961795"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="13961795"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 05:36:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936851235"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="936851235"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2024 05:36:42 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	<stern@rowland.harvard.edu>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/2] usb: usb-acpi: Set port connect type of not connectable ports correctly
Date: Thu, 22 Feb 2024 15:38:18 +0200
Message-Id: <20240222133819.4149388-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ports with  _UPC (USB Port Capability) ACPI objects stating they are
"not connectable" are not wired to any connector or internal device.
They only exist inside the host controller.

These ports may not have an ACPI _PLD (Physical Location of Device)
object.

Rework the code so that _UPC is read even if _PLD does not exist, and
make sure the port->connect_type is set to "USB_PORT_NOT_USED" instead
of "USB_PORT_CONNECT_TYPE_UNKNOWN".

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



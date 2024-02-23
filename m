Return-Path: <linux-usb+bounces-6957-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0819B861378
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 15:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6DFEB22681
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 14:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CC37FBCA;
	Fri, 23 Feb 2024 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaB+Rzqa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6E076039
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708696893; cv=none; b=dxg0Cd9hTtAsWiqUJdoS7YnzNCtxE7maAYaE7JWLR6K5L6rqfx5v1xTD9lgM4wXVLnr7UjFAtIgG4mFdfSOpSVMTw/soTVUUD+z/iu1yHzeblRJNlzCGFDezTfZ/Bu+BE4kya2Uoty6/+0F7oezBWE/ZdfBnEmZwdAZyQOpmKG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708696893; c=relaxed/simple;
	bh=uFhLumf0xn7KImr/ozi31eMwhK5EEJzKCyw69hFph+0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KWU8G+cyd0i3vtEqkHdUZglLN72vF2WPZIez+Wke1h+b6bnSvLtKeT/JKfeEZ+kfEVrlRnGypzzQOC/OjHh4ZPmwAbWOryEy8XNfmQtwIIo4OQZDQpNrqLbGXtD59ffM48LoPd8rwafXf0XnlleZ8NNn5OQg7Xcv6qg34+gv6jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaB+Rzqa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708696892; x=1740232892;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uFhLumf0xn7KImr/ozi31eMwhK5EEJzKCyw69hFph+0=;
  b=HaB+RzqaO5ZHR4/tHI7E4J+xxLpNa2mO0dsJau7C1bt1LY1nLAc9IEfN
   4m5yXgrf05/w8ykX5hx34XeOyIrJGhe5b0fNMqCYhw/nnTUQ3Q1zd3ALy
   aHfVBC2FDqNQR10G9cq3TIxfQYkDPsopmPRVgx6+adCoeWEt4ghVcwj5F
   J8TjJbV7+FuloA8qBLUixPjb6ogKprlhVNpZaCXbzt++AzQQnIVLbhCrv
   QWO9TBmTuo1Tx9CWbeKhFltNNb1IstExNRdINzaPmx48ys4nuZooAs+yM
   NJ4IljDNIwh4RHQi99q+bL26PIwkUUUJAUYBUZXQ4q8SvoYDSnNAHC5Hz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="6796726"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6796726"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 06:01:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="937025040"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="937025040"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2024 06:01:29 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	<stern@rowland.harvard.edu>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2] usb: usb-acpi: Set port connect type of not connectable ports correctly
Date: Fri, 23 Feb 2024 16:03:05 +0200
Message-Id: <20240223140305.185182-1-mathias.nyman@linux.intel.com>
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

No bugs or known issues are reported due to possibly not parsing _UPC,
and thus leaving the port connect type as "unknown" instead of
"not used". Nice to have this fixed but no need to add it to stable
kernels, or urgency to get it upstream.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
v1 -> v2
  - Commit message improvements
  - send patch separately for easier picking to usb-next

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



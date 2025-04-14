Return-Path: <linux-usb+bounces-23040-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE7EA88A75
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 19:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 535493A9EA5
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 17:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1ADD288CB1;
	Mon, 14 Apr 2025 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYpfaoAg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4E328935F
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 17:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744653368; cv=none; b=sm+vJGkN2mWN3bK5HmnMEKgkGkhnrmBoq2yyaTIynPyi4/jLg00Hiy6BpqH/a+739ZG8p97U3+CKNKAepRsCYYNMulj18iruQKo0YJ4qjQPmqGKGtAIHuPta9AljXmudNv4zvAtP1yhohdNhOjbezYo41zRm1R37lV92BFdb1jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744653368; c=relaxed/simple;
	bh=w8+cLpkpXYDGMDyjQoZ+yw6RAA+PODsI8+YTFpuuB1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbBnFMlyTt+6v4cl+57suF4oKONVpZ36kWOjyuOIUonqRgPSROfG8rtDBVhhOFp+Vyn+bHL7xh5Vr+ukNrFMgkeX/RQtv128D4ESTGu7pB3y5gA73hqdHOdEStal02lK2A098pPJuKcUgwe6hA6aNK1NeJUkhEiwk7L8tNCw5IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYpfaoAg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744653364; x=1776189364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w8+cLpkpXYDGMDyjQoZ+yw6RAA+PODsI8+YTFpuuB1A=;
  b=hYpfaoAg5Gj1VZ7ZVMeapunVb+oB3v3Sd+ekvDRlqgAy/IvqqmplWtlx
   QdUweV2MCpaQPM3zFz4zzc5GQD6P18Dv9PFn75UKyusJrsmenFY+2Pgcd
   VbiduWAA7/1Ee1HVYYb1fq7gh8sk67RYHFSyNO11raYvei3R9t/5ZGNbo
   DIs28spW36vRdm/cP+/2Xt1aGUhBavfD4qWitPvuvlOA8cfDVbQjyyMYt
   XFltrGLwWQH+cgpALwVnsIhMlvQngSdZtkSYE7PzLGph3UgbJQx38u9Dr
   djPrGGUG3BGjnrxBeyDhk2k2ejV9/5XQF8xoiSxJJCtyhjgUkN1u+ocvP
   g==;
X-CSE-ConnectionGUID: IGGCmMthREeiR5+c36nKYA==
X-CSE-MsgGUID: X8FEmk2DRHmCby3SkhV2Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56779857"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56779857"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:56:04 -0700
X-CSE-ConnectionGUID: oaRlK2osTGaXgeTKx+sAww==
X-CSE-MsgGUID: 9TqKOVYQT+6HVrVReqjZPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134866383"
Received: from vpanait-mobl.ger.corp.intel.com (HELO aborzesz-desk.lan) ([10.245.246.215])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:56:01 -0700
From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: mika.westerberg@linux.intel.com,
	andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Subject: [PATCH 2/3] thunderbolt: Add Thunderbolt/USB4 <-> USB3 match function
Date: Mon, 14 Apr 2025 19:55:53 +0200
Message-ID: <20250414175554.107228-3-alan.borzeszkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>
References: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function checks whether given USB4 port device matches with USB3.x
port device, using ACPI _DSD property.

It is designed to be used by component framework to match
USB4 ports with Type-C ports they are connected to.

Also, added USB4 config stub in case mapping function is not reachable.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/thunderbolt/usb4_port.c | 56 ++++++++++++++++++++++++++++-----
 include/linux/thunderbolt.h     | 18 +++++++++++
 2 files changed, 66 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/usb4_port.c b/drivers/thunderbolt/usb4_port.c
index 5150879888ca..852a45fcd19d 100644
--- a/drivers/thunderbolt/usb4_port.c
+++ b/drivers/thunderbolt/usb4_port.c
@@ -105,6 +105,49 @@ static void usb4_port_online(struct usb4_port *usb4)
 	tb_acpi_power_off_retimers(port);
 }
 
+/**
+ * usb4_usb3_port_match() - Matches USB4 port device with USB 3.x port device
+ * @usb4_port_dev: USB4 port device
+ * @usb3_port_fwnode: USB 3.x port firmware node
+ *
+ * Checks if USB 3.x port @usb3_port_fwnode is tunneled through USB4 port @usb4_port_dev.
+ * Returns true if match is found, false otherwise.
+ *
+ * Function is designed to be used with component framework (component_match_add).
+ */
+bool usb4_usb3_port_match(struct device *usb4_port_dev,
+			  const struct fwnode_handle *usb3_port_fwnode)
+{
+	struct fwnode_handle *nhi_fwnode __free(fwnode_handle) = NULL;
+	struct usb4_port *usb4;
+	struct tb_switch *sw;
+	struct tb_nhi *nhi;
+	u8 usb4_port_num;
+	struct tb *tb;
+
+	usb4 = tb_to_usb4_port_device(usb4_port_dev);
+	if (!usb4)
+		return false;
+
+	sw = usb4->port->sw;
+	tb = sw->tb;
+	nhi = tb->nhi;
+
+	nhi_fwnode = fwnode_find_reference(usb3_port_fwnode, "usb4-host-interface", 0);
+	if (IS_ERR(nhi_fwnode))
+		return false;
+
+	/* Check if USB3 fwnode references same NHI where USB4 port resides */
+	if (!device_match_fwnode(&nhi->pdev->dev, nhi_fwnode))
+		return false;
+
+	if (fwnode_property_read_u8(usb3_port_fwnode, "usb4-port-number", &usb4_port_num))
+		return false;
+
+	return usb4_port_index(sw, usb4->port) == usb4_port_num;
+}
+EXPORT_SYMBOL_GPL(usb4_usb3_port_match);
+
 static ssize_t offline_show(struct device *dev,
 	struct device_attribute *attr, char *buf)
 {
@@ -276,12 +319,10 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port)
 		return ERR_PTR(ret);
 	}
 
-	if (dev_fwnode(&usb4->dev)) {
-		ret = component_add(&usb4->dev, &connector_ops);
-		if (ret) {
-			dev_err(&usb4->dev, "failed to add component\n");
-			device_unregister(&usb4->dev);
-		}
+	ret = component_add(&usb4->dev, &connector_ops);
+	if (ret) {
+		dev_err(&usb4->dev, "failed to add component\n");
+		device_unregister(&usb4->dev);
 	}
 
 	if (!tb_is_upstream_port(port))
@@ -306,8 +347,7 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port)
  */
 void usb4_port_device_remove(struct usb4_port *usb4)
 {
-	if (dev_fwnode(&usb4->dev))
-		component_del(&usb4->dev, &connector_ops);
+	component_del(&usb4->dev, &connector_ops);
 	device_unregister(&usb4->dev);
 }
 
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 7d902d8c054b..75247486616b 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -11,6 +11,13 @@
 #ifndef THUNDERBOLT_H_
 #define THUNDERBOLT_H_
 
+#include <linux/types.h>
+
+struct fwnode_handle;
+struct device;
+
+#if IS_REACHABLE(CONFIG_USB4)
+
 #include <linux/device.h>
 #include <linux/idr.h>
 #include <linux/list.h>
@@ -674,4 +681,15 @@ static inline struct device *tb_ring_dma_device(struct tb_ring *ring)
 	return &ring->nhi->pdev->dev;
 }
 
+bool usb4_usb3_port_match(struct device *usb4_port_dev,
+			  const struct fwnode_handle *usb3_port_fwnode);
+
+#else /* CONFIG_USB4 */
+static inline bool usb4_usb3_port_match(struct device *usb4_port_dev,
+					const struct fwnode_handle *usb3_port_fwnode)
+{
+	return false;
+}
+#endif /* CONFIG_USB4 */
+
 #endif /* THUNDERBOLT_H_ */
-- 
2.43.0



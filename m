Return-Path: <linux-usb+bounces-32551-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEuNBdHYb2n8RwAAu9opvQ
	(envelope-from <linux-usb+bounces-32551-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 20:34:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1254A867
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 20:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8317B5CDD20
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 18:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0FC4508FE;
	Tue, 20 Jan 2026 18:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYnbLx/v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10644508E3
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 18:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932734; cv=none; b=K+qhd0sw/b4R5ij0ZPX07Y4vLdoYfatksApAr797eLVmo8NfZxIZtG5c6gwpyKN3vsf175kZixwkw+uOxMf49NU2xCRHkvh1AGKCqg6C7Op8NJH++xuq7jWMxdcSWw9ztZEBdYWo1lVkGVIK6LAUuSG010wuGYiiS9ilqQtP6mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932734; c=relaxed/simple;
	bh=X8q/v3NnmZ56pCzHno6A/G3yliaiRkgR525oiPqJYzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E7lzkIwi+J7F7dfR8Xq5KCPCHo3xVPYgIk3oCvL6YFnU2hMpCpk3GgD9xS7V1tab2BXSQqHM631N0GXukH7KHH+7ZoYpImuEh3yCjaMn58WE0tn7PqjAizkagtuCbSUknJNdCi93+Sn0X68jauy47G/PfvJyCQfylv3ZQBJBjY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYnbLx/v; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768932733; x=1800468733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X8q/v3NnmZ56pCzHno6A/G3yliaiRkgR525oiPqJYzM=;
  b=IYnbLx/vZ4hjR3A3U+3UiFnsm/7L2Q3OO1QtG40nd3sEoQsc86SVyPlJ
   UkPaZYUZ1ye/MSA8Hdz8W1JuCfwaDLimno3872mKWc8+FKyjuzN0aUNjl
   cRiEdmgRx7aVjS9VFpevgUS2y6z/0MLxGx31K21U4BNiPtRYeevGw0AkC
   DpYrSmlToieibvFdT0pkfGhYnC/I6XwACGPi8rf9Wmn3FTruqb9u/L2b4
   Fmv4jYe20nalPvsod9l45j82EoOS5xDBaVd6E0MMbePjvBOKGhlbgVGVq
   ki9AlWhz2Fvz+BB/QT3DSJtgL/WRUHLqW2oJV3TFkR8H41CNWerBUfkTf
   w==;
X-CSE-ConnectionGUID: 7kgtspwyTe+CUomdSibKDA==
X-CSE-MsgGUID: RKRHbyO3RJG4Mv91cJO1SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70055600"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70055600"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:12:13 -0800
X-CSE-ConnectionGUID: ipA1arpMQ8yEo+J9NkRuCQ==
X-CSE-MsgGUID: ap2iRhKDQ2KcTLzR9X45ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="205997474"
Received: from abityuts-desk.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.215])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:12:11 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/4] xhci: dbc: allow setting manufacturer string through sysfs
Date: Tue, 20 Jan 2026 20:11:48 +0200
Message-ID: <20260120181148.128712-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120181148.128712-1-mathias.nyman@linux.intel.com>
References: <20260120181148.128712-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32551-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:email,intel.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,chromium.org:email]
X-Rspamd-Queue-Id: BE1254A867
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Łukasz Bartosik <ukaszb@chromium.org>

Add dbc_manufacturer sysfs attribute to allow changing the manufacturer
description presented by the debug device when a host requests a string
descriptor with iManufacturer index.

Value can only be changed while debug capability (DbC) is in disabled
state to prevent USB device descriptor change while connected to a USB
host.

The default value is "Linux Foundation".
The string length can be from 1 to 126 characters.
String is terminated at null or newline, driver does not support empty
string.

[ mn: Improve commit message and sysfs entry documentation ]
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 13 +++++++
 drivers/usb/host/xhci-dbgcap.c                | 36 +++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
index d153162d6045..d10e6de3adb2 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
+++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
@@ -114,3 +114,16 @@ Description:
 		connected to a USB host.
 		The default value is "Linux USB Debug Target".
 		The field length can be from 1 to 126 characters.
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_manufacturer
+Date:		January 2026
+Contact:	Łukasz Bartosik <ukaszb@chromium.org>
+Description:
+		The dbc_manufacturer attribute allows to change the manufacturer
+		string descriptor presented by the debug device when a host
+		requests a string descriptor with iManufacturer index.
+		Value can only be changed while debug capability (DbC) is in
+		disabled state to prevent USB device descriptor change while
+		connected to a USB host.
+		The default value is "Linux Foundation".
+		The field length can be from 1 to 126 characters.
diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index cae98576545e..9fd497e0dc7f 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1210,6 +1210,40 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
 	return size;
 }
 
+static ssize_t dbc_manufacturer_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	struct xhci_dbc	*dbc = xhci->dbc;
+
+	return sysfs_emit(buf, "%s\n", dbc->str.manufacturer);
+}
+
+static ssize_t dbc_manufacturer_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t size)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	struct xhci_dbc	*dbc = xhci->dbc;
+	size_t len;
+
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+
+	len = strcspn(buf, "\n");
+	if (!len)
+		return -EINVAL;
+
+	if (len > USB_MAX_STRING_LEN)
+		return -E2BIG;
+
+	memcpy(dbc->str.manufacturer, buf, len);
+	dbc->str.manufacturer[len] = '\0';
+
+	return size;
+}
+
 static ssize_t dbc_product_show(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)
@@ -1367,6 +1401,7 @@ static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
 static DEVICE_ATTR_RW(dbc_serial);
 static DEVICE_ATTR_RW(dbc_product);
+static DEVICE_ATTR_RW(dbc_manufacturer);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
 static DEVICE_ATTR_RW(dbc_poll_interval_ms);
 
@@ -1377,6 +1412,7 @@ static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc_bcdDevice.attr,
 	&dev_attr_dbc_serial.attr,
 	&dev_attr_dbc_product.attr,
+	&dev_attr_dbc_manufacturer.attr,
 	&dev_attr_dbc_bInterfaceProtocol.attr,
 	&dev_attr_dbc_poll_interval_ms.attr,
 	NULL
-- 
2.43.0



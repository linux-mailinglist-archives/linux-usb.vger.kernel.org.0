Return-Path: <linux-usb+bounces-11677-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C447F91814D
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 432BC1F23FD1
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D83185E52;
	Wed, 26 Jun 2024 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ae4rpsHW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BC2181D15
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406011; cv=none; b=KtrtpbQj3Nn0DjSod9qPU0pnIUVs2u0NvjpTfwOPVJO/artHRBnOVc1US9qrdNJVKS5Ul6+wTHYsoeHJR/tjOUEXaRJBm4GpG3Bx9wim093jmorVcPcs808nlM+atInD6FczKtAq5uWkHaF3ValBrBhKqn1DfWykSmCOMI2JZqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406011; c=relaxed/simple;
	bh=V0psOe5Z5+WC51AaKP15D9NiBAQ8xA2cLo1nvDYCgZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SEO033M3hplZcFJkw7nCPb4w0WiOhjsLTW1147aPLoSdO2OhGQ/SDaQFIl1oifHSXpudZmSPaRCv+rGhwGUER1AtOGw+YaqOKYPAps1zQJsy8WMk0odSeuzK1vfi7V2ClY5CFfEW/dVe+GuLl4xEIYmaP542eeOdTgZUTEvXNzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ae4rpsHW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406010; x=1750942010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V0psOe5Z5+WC51AaKP15D9NiBAQ8xA2cLo1nvDYCgZQ=;
  b=Ae4rpsHWb5YmImlVVnAIE3ZJJPyTPOsGmVsXTzkdCcb2hB0KREAS2iOO
   HaDH/1CjQFimVTD/O75qt/BbvDURsBsUZFOK1/Cm1i/CWPLyQzYY3Tn73
   fSbx5oLv8/V1URMzAnYcR6ayT620Q9O+xe4HetyfE5qgk3cRXQKMUJUmM
   1pM6/1dyd1La1cm0r0sANAfF/dYOPLGxnalqrGGLKaKZE8dGXlWj6G0Hu
   zLXujAjTXr0Cb1JL36GpJbrg39GKa1/75CIh7BU5XI8MS/n34V3DtbZO1
   0lSipvY0dm6Ql84oEUtRky9EnAMZciSp8EMkMVZB+oEBskG3I2jjXEACH
   A==;
X-CSE-ConnectionGUID: izPVKuQNR8ScdznUnhaSVg==
X-CSE-MsgGUID: AOdMU2vhRTWgqcHUqBNnFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353373"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353373"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:46:49 -0700
X-CSE-ConnectionGUID: cnZMdUvpQT2CXdFM0tHfhQ==
X-CSE-MsgGUID: 2S7s28u4R6GUh6Ou4HOm0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442607"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:46:47 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Samuel Jacob <samjaco@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/21] xhci: dbc: Allow users to modify DbC poll interval via sysfs
Date: Wed, 26 Jun 2024 15:48:18 +0300
Message-Id: <20240626124835.1023046-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
References: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Uday M Bhat <uday.m.bhat@intel.com>

xhci DbC driver polls the host controller for DbC events at a reduced
rate when DbC is enabled but there are no active data transfers.

Allow users to modify this reduced poll interval via dbc_poll_interval_ms
sysfs entry. Unit is milliseconds and accepted range is 0 to 5000.
Max interval of 5000 ms is selected as it matches the common 5 second
timeout used in usb stack.
Default value is 64 milliseconds.

A long interval is useful when users know there won't be any activity
on systems connected via DbC for long periods, and want to avoid
battery drainage due to unnecessary CPU usage.

Example being Android Debugger (ADB) usage over DbC on ChromeOS systems
running Android Runtime.

[minor changes and rewording -Mathias]
Co-developed-by: Samuel Jacob <samjaco@google.com>
Signed-off-by: Samuel Jacob <samjaco@google.com>
Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 10 +++++
 drivers/usb/host/xhci-dbgcap.c                | 38 +++++++++++++++++++
 drivers/usb/host/xhci-dbgcap.h                |  2 +-
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
index 5a775b8f6543..fc82aa4e54b0 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
+++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
@@ -75,3 +75,13 @@ Description:
 		The default value is 1  (GNU Remote Debug command).
 		Other permissible value is 0 which is for vendor defined debug
 		target.
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_poll_interval_ms
+Date:		February 2024
+Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
+Description:
+		This attribute adjust the polling interval used to check for
+		DbC events. Unit is milliseconds. Accepted values range from 0
+		up to 5000. The default value is 64 ms.
+		This polling interval is used while DbC is enabled but has no
+		active data transfers.
diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 872d9cddbcef..161c09953c4e 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1150,11 +1150,48 @@ static ssize_t dbc_bInterfaceProtocol_store(struct device *dev,
 	return size;
 }
 
+static ssize_t dbc_poll_interval_ms_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct xhci_dbc *dbc;
+	struct xhci_hcd *xhci;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+
+	return sysfs_emit(buf, "%u\n", dbc->poll_interval);
+}
+
+static ssize_t dbc_poll_interval_ms_store(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf, size_t size)
+{
+	struct xhci_dbc *dbc;
+	struct xhci_hcd *xhci;
+	u32 value;
+	int ret;
+
+	ret = kstrtou32(buf, 0, &value);
+	if (ret || value > DBC_POLL_INTERVAL_MAX)
+		return -EINVAL;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+
+	dbc->poll_interval = value;
+
+	mod_delayed_work(system_wq, &dbc->event_work, 0);
+
+	return size;
+}
+
 static DEVICE_ATTR_RW(dbc);
 static DEVICE_ATTR_RW(dbc_idVendor);
 static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
+static DEVICE_ATTR_RW(dbc_poll_interval_ms);
 
 static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc.attr,
@@ -1162,6 +1199,7 @@ static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc_idProduct.attr,
 	&dev_attr_dbc_bcdDevice.attr,
 	&dev_attr_dbc_bInterfaceProtocol.attr,
+	&dev_attr_dbc_poll_interval_ms.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(dbc_dev);
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 92661b555c2a..0118c6288a3c 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -95,7 +95,7 @@ struct dbc_ep {
 #define DBC_QUEUE_SIZE			16
 #define DBC_WRITE_BUF_SIZE		8192
 #define DBC_POLL_INTERVAL_DEFAULT	64	/* milliseconds */
-
+#define DBC_POLL_INTERVAL_MAX		5000	/* milliseconds */
 /*
  * Private structure for DbC hardware state:
  */
-- 
2.25.1



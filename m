Return-Path: <linux-usb+bounces-3551-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4062E800DEB
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE42A281ECE
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EF047771;
	Fri,  1 Dec 2023 15:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHWXMTny"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B67B0B9
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443148; x=1732979148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AVvTuBwgEXo/JwgxRB+O9KGd795OuO6oNuhaqt8C7WQ=;
  b=AHWXMTnyKXiIZFt40pcJT6uoOstr0NYWpp5VUVUiRXwHK8Dq5L41v3ru
   kId2WwGCYeKmHe63rp7dIzARPLhf+uQ80fBQ31r/KmgNiewk4p1tIo3eF
   iXeYrVjgIBXWLtkD9NFVUhg+fOoLPyHKb/W9B1k0JWqmVbU7S3qkjz2Kn
   MS4otywxYaFOu+0qHptPIy4zspN3pHLyZJ7o+G9GaWOnTF759Ik3ZgWE3
   HxjWtISNq2/cqQr+vCxTdxFlgEmIUyhXEvDM/hhNlAeT6LBqtuNje53p+
   IQdwL3xOF4QuwELuXa5yUv5zBWf4VvYcYaCrGK2siU9k+fNiB2dvxvjgP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309696"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309696"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:05:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112526"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112526"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:05:46 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/19] xhci: dbc: Use ATTRIBUTE_GROUPS()
Date: Fri,  1 Dec 2023 17:06:32 +0200
Message-Id: <20231201150647.1307406-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
References: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Embrace ATTRIBUTE_GROUPS() to avoid boiler plate code.
This should not introduce any functional changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index df14e336370d..660e3ee31dc6 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1123,7 +1123,7 @@ static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
 
-static struct attribute *dbc_dev_attributes[] = {
+static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc.attr,
 	&dev_attr_dbc_idVendor.attr,
 	&dev_attr_dbc_idProduct.attr,
@@ -1131,10 +1131,7 @@ static struct attribute *dbc_dev_attributes[] = {
 	&dev_attr_dbc_bInterfaceProtocol.attr,
 	NULL
 };
-
-static const struct attribute_group dbc_dev_attrib_grp = {
-	.attrs = dbc_dev_attributes,
-};
+ATTRIBUTE_GROUPS(dbc_dev);
 
 struct xhci_dbc *
 xhci_alloc_dbc(struct device *dev, void __iomem *base, const struct dbc_driver *driver)
@@ -1160,7 +1157,7 @@ xhci_alloc_dbc(struct device *dev, void __iomem *base, const struct dbc_driver *
 	INIT_DELAYED_WORK(&dbc->event_work, xhci_dbc_handle_events);
 	spin_lock_init(&dbc->lock);
 
-	ret = sysfs_create_group(&dev->kobj, &dbc_dev_attrib_grp);
+	ret = sysfs_create_groups(&dev->kobj, dbc_dev_groups);
 	if (ret)
 		goto err;
 
@@ -1179,7 +1176,7 @@ void xhci_dbc_remove(struct xhci_dbc *dbc)
 	xhci_dbc_stop(dbc);
 
 	/* remove sysfs files */
-	sysfs_remove_group(&dbc->dev->kobj, &dbc_dev_attrib_grp);
+	sysfs_remove_groups(&dbc->dev->kobj, dbc_dev_groups);
 
 	kfree(dbc);
 }
-- 
2.25.1



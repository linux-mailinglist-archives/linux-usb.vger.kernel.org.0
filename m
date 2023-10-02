Return-Path: <linux-usb+bounces-949-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B257B57D3
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 18:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 3E88B283D85
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 16:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8DF1DDC5;
	Mon,  2 Oct 2023 16:18:56 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7EA1DA4A
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 16:18:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2EE3B8;
	Mon,  2 Oct 2023 09:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696263532; x=1727799532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eRA4GqvkNOBVpjjvvEdbopHkDW3aOk0+GBRNEkvgsAo=;
  b=G1fIu1hhfcADQxKgfkynBKRfq+2e4cZy0Ubt4ddWPl+k4D47VmTRrXK0
   9ntkl/9cbwl0dO31bLI2BRmT+vmrZ5SvlXFzh9hqCCteKZCWriWwGTJ8D
   glaw1rvpuXZmt7/hFPQ7wWhTNskyOH4psjhTaC2pr+qTFbVgHCYqAt1Jp
   bZgdUKdzJoXcbHfTWJXJdGesXx89JgLnTdxSN1CYUranIpyfG5QDS7Rjf
   ezwVD/4fENpjbC80PYAmt01lLW/vOQgw1z6d3BpYhSfTKlegPQN0nihUU
   RFGUozQe4QcV5Vh3mahIsbPvt4a3kdroYDIEm7TX5lsgy90JdJ62HaZKg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362949520"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="362949520"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 09:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816339773"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816339773"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 02 Oct 2023 09:16:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 38D77345; Mon,  2 Oct 2023 19:16:20 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 04/10] xhci: dbc: Use ATTRIBUTE_GROUPS()
Date: Mon,  2 Oct 2023 19:16:04 +0300
Message-Id: <20231002161610.2648818-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231002161610.2648818-1-andriy.shevchenko@linux.intel.com>
References: <20231002161610.2648818-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Embrace ATTRIBUTE_GROUPS() to avoid boiler plate code.
This should not introduce any functional changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 92869c67a430..3c90410e9cde 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1124,7 +1124,7 @@ static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
 
-static struct attribute *dbc_dev_attributes[] = {
+static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc.attr,
 	&dev_attr_dbc_idVendor.attr,
 	&dev_attr_dbc_idProduct.attr,
@@ -1132,10 +1132,7 @@ static struct attribute *dbc_dev_attributes[] = {
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
@@ -1161,7 +1158,7 @@ xhci_alloc_dbc(struct device *dev, void __iomem *base, const struct dbc_driver *
 	INIT_DELAYED_WORK(&dbc->event_work, xhci_dbc_handle_events);
 	spin_lock_init(&dbc->lock);
 
-	ret = sysfs_create_group(&dev->kobj, &dbc_dev_attrib_grp);
+	ret = sysfs_create_groups(&dev->kobj, &dbc_dev_groups);
 	if (ret)
 		goto err;
 
@@ -1180,7 +1177,7 @@ void xhci_dbc_remove(struct xhci_dbc *dbc)
 	xhci_dbc_stop(dbc);
 
 	/* remove sysfs files */
-	sysfs_remove_group(&dbc->dev->kobj, &dbc_dev_attrib_grp);
+	sysfs_remove_groups(&dbc->dev->kobj, &dbc_dev_groups);
 
 	kfree(dbc);
 }
-- 
2.40.0.1.gaa8946217a0b



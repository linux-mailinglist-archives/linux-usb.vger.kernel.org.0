Return-Path: <linux-usb+bounces-3662-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD9F8030D2
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 775BEB20A0A
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24593225A9;
	Mon,  4 Dec 2023 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NiYfC8Wx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB81AE6
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686680; x=1733222680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yBLKtKJqEbZxp1VH2z51oSiSl+cY2BxyxGtU85AtFf4=;
  b=NiYfC8WxIgkDwFsLdqK5cH09fTmLqWfwOlbT3+UwCMu+x2f15Q2pIVJp
   fJ8t0LPH6rfoA4hgUY9dNkMFueDv0iX83Yd2GLzhooHkcoNKJs9yipIoF
   urX1dCsBGd2H1q9l4gB6lmdoSVhZsFqIygCcU4uIs3DkdPo+qj0a5kXiU
   V8zdPn6EK4uKywwOg4cm1TJWVYHJYPAEKek42fDNvueZGco03sFBzvkSk
   4EaX4fPnD0txVUARKmU6QBkJvF1TF/rJo2rLaB+5fPXmmT925wLH+QQ7r
   6GDvjQpVntVpR/k6krr+8Jlz3XvZNVqHtgSRCPIKoyc89ylq3A6onh3Yo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260657"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260657"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861338902"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861338902"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:31 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 06/18] xhci: dbc: Don't shadow error codes in store() functions
Date: Mon,  4 Dec 2023 12:45:22 +0200
Message-Id: <20231204104534.1335903-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
References: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

kstrtox() along with regmap API can return different error codes
based on the circumstances. Don't shadow them when returning to
the caller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 6b9f4b839270..c211c69e8041 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -977,9 +977,11 @@ static ssize_t dbc_idVendor_store(struct device *dev,
 	void __iomem		*ptr;
 	u16			value;
 	u32			dev_info;
+	int ret;
 
-	if (kstrtou16(buf, 0, &value))
-		return -EINVAL;
+	ret = kstrtou16(buf, 0, &value);
+	if (ret)
+		return ret;
 
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
 	dbc = xhci->dbc;
@@ -1017,9 +1019,11 @@ static ssize_t dbc_idProduct_store(struct device *dev,
 	void __iomem		*ptr;
 	u32			dev_info;
 	u16			value;
+	int ret;
 
-	if (kstrtou16(buf, 0, &value))
-		return -EINVAL;
+	ret = kstrtou16(buf, 0, &value);
+	if (ret)
+		return ret;
 
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
 	dbc = xhci->dbc;
@@ -1056,9 +1060,11 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
 	void __iomem *ptr;
 	u32 dev_info;
 	u16 value;
+	int ret;
 
-	if (kstrtou16(buf, 0, &value))
-		return -EINVAL;
+	ret = kstrtou16(buf, 0, &value);
+	if (ret)
+		return ret;
 
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
 	dbc = xhci->dbc;
@@ -1098,9 +1104,13 @@ static ssize_t dbc_bInterfaceProtocol_store(struct device *dev,
 	u8 value;
 	int ret;
 
-	/* bInterfaceProtocol is 8 bit, but xhci only supports values 0 and 1 */
+	/* bInterfaceProtocol is 8 bit, but... */
 	ret = kstrtou8(buf, 0, &value);
-	if (ret || value > 1)
+	if (ret)
+		return ret;
+
+	/* ...xhci only supports values 0 and 1 */
+	if (value > 1)
 		return -EINVAL;
 
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
-- 
2.25.1



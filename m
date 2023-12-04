Return-Path: <linux-usb+bounces-3661-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F478030D1
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D76EB1F21174
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9204224FD;
	Mon,  4 Dec 2023 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwReqSyk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD19FBB
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686679; x=1733222679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tryNGinZn57NFutKJw2YPUSeLJN8SMTTvdtYFKxmI/A=;
  b=DwReqSyk+Te5iaAtS1b3UNAw+Ys2x9ZwM9mRrnjR/uRw5sXuhXffRYTE
   3NPf2jPEljeDnl3Scg+s//kYm87TVnBJvVnBzuH5QZmfE9BCOPpz1mxkM
   wDQGsh2CDGvkmL8+/vxSuXycD3zo7JZhAHs7fYHprwJY7XGqRQCUvThSt
   V2YcDzhTzawF8g3eTpsHkuaubnBk3cg/ofeoN5wtU+daEy2khFttBjzTQ
   soXSS7F4jgALc46ISjwrRRE0YC/uIRRRj1u+RJ3fU3R4nuO6yBe81IjbH
   Jt7FcR0/4yWAkEB/yKuxlCsljx0l15rRo3fwHtJ8Z1ypIeOG7hSf9HBUl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260649"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260649"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861338872"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861338872"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:26 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 03/18] xhci: dbc: Use sysfs_emit() to instead of scnprintf()
Date: Mon,  4 Dec 2023 12:45:19 +0200
Message-Id: <20231204104534.1335903-4-mathias.nyman@linux.intel.com>
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

Follow the advice of the Documentation/filesystems/sysfs.rst and show()
should only use sysfs_emit() or sysfs_emit_at() when formatting the
value to be returned to user space.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 44 +++++++++++++---------------------
 drivers/usb/host/xhci-dbgcap.h |  1 +
 2 files changed, 17 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index f505b79afe53..df14e336370d 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -910,41 +910,29 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 	mod_delayed_work(system_wq, &dbc->event_work, 1);
 }
 
+static const char * const dbc_state_strings[DS_MAX] = {
+	[DS_DISABLED] = "disabled",
+	[DS_INITIALIZED] = "initialized",
+	[DS_ENABLED] = "enabled",
+	[DS_CONNECTED] = "connected",
+	[DS_CONFIGURED] = "configured",
+	[DS_STALLED] = "stalled",
+};
+
 static ssize_t dbc_show(struct device *dev,
 			struct device_attribute *attr,
 			char *buf)
 {
-	const char		*p;
 	struct xhci_dbc		*dbc;
 	struct xhci_hcd		*xhci;
 
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
 	dbc = xhci->dbc;
 
-	switch (dbc->state) {
-	case DS_DISABLED:
-		p = "disabled";
-		break;
-	case DS_INITIALIZED:
-		p = "initialized";
-		break;
-	case DS_ENABLED:
-		p = "enabled";
-		break;
-	case DS_CONNECTED:
-		p = "connected";
-		break;
-	case DS_CONFIGURED:
-		p = "configured";
-		break;
-	case DS_STALLED:
-		p = "stalled";
-		break;
-	default:
-		p = "unknown";
-	}
+	if (dbc->state >= ARRAY_SIZE(dbc_state_strings))
+		return sysfs_emit(buf, "unknown\n");
 
-	return sprintf(buf, "%s\n", p);
+	return sysfs_emit(buf, "%s\n", dbc_state_strings[dbc->state]);
 }
 
 static ssize_t dbc_store(struct device *dev,
@@ -977,7 +965,7 @@ static ssize_t dbc_idVendor_show(struct device *dev,
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
 	dbc = xhci->dbc;
 
-	return sprintf(buf, "%04x\n", dbc->idVendor);
+	return sysfs_emit(buf, "%04x\n", dbc->idVendor);
 }
 
 static ssize_t dbc_idVendor_store(struct device *dev,
@@ -1017,7 +1005,7 @@ static ssize_t dbc_idProduct_show(struct device *dev,
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
 	dbc = xhci->dbc;
 
-	return sprintf(buf, "%04x\n", dbc->idProduct);
+	return sysfs_emit(buf, "%04x\n", dbc->idProduct);
 }
 
 static ssize_t dbc_idProduct_store(struct device *dev,
@@ -1056,7 +1044,7 @@ static ssize_t dbc_bcdDevice_show(struct device *dev,
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
 	dbc = xhci->dbc;
 
-	return sprintf(buf, "%04x\n", dbc->bcdDevice);
+	return sysfs_emit(buf, "%04x\n", dbc->bcdDevice);
 }
 
 static ssize_t dbc_bcdDevice_store(struct device *dev,
@@ -1096,7 +1084,7 @@ static ssize_t dbc_bInterfaceProtocol_show(struct device *dev,
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
 	dbc = xhci->dbc;
 
-	return sprintf(buf, "%02x\n", dbc->bInterfaceProtocol);
+	return sysfs_emit(buf, "%02x\n", dbc->bInterfaceProtocol);
 }
 
 static ssize_t dbc_bInterfaceProtocol_store(struct device *dev,
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 51a7ab3ba0ca..e39e3ae1677a 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -82,6 +82,7 @@ enum dbc_state {
 	DS_CONNECTED,
 	DS_CONFIGURED,
 	DS_STALLED,
+	DS_MAX
 };
 
 struct dbc_ep {
-- 
2.25.1



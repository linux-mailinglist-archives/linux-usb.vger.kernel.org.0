Return-Path: <linux-usb+bounces-3550-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A09D800DE9
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3D88281E27
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583F548795;
	Fri,  1 Dec 2023 15:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpLXr9Kl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A5B93
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443146; x=1732979146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tryNGinZn57NFutKJw2YPUSeLJN8SMTTvdtYFKxmI/A=;
  b=KpLXr9KlXfRmlC9qMS2b4qXh+GUxo2GUIj09MphmMxeZCvCMG6zfZhOs
   4sJO5UnvzuVWV48L/fLLG1rJp/MGkLGrVIItGG0bs9z2JsMAaGuAl8WNd
   CU4c3GIlpDfbPu8uH5MLSxd1jcApCgNYQ55L9Hfu2rcviUSWyh9o5wUcE
   2I/zR5nOaP/E+YwehwkuFvTKIbvMFHp5U4vOnNyEHnCakl+1i0sIMSyZh
   mAIW1a7lTM0Hdp3w3LIXyyZsNa9m4SUpOjeOU56OuHudtnKBEMdHX9AYW
   rWKk7VSPlUXDMXW2NUSqAuphPTpLVNeL4KwZxDqPU769V/JfEGBsIemNu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309691"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309691"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:05:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112518"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112518"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:05:45 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/19] xhci: dbc: Use sysfs_emit() to instead of scnprintf()
Date: Fri,  1 Dec 2023 17:06:31 +0200
Message-Id: <20231201150647.1307406-4-mathias.nyman@linux.intel.com>
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



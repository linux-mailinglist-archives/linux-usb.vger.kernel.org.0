Return-Path: <linux-usb+bounces-954-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894F7B57D8
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 18:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 23EB01C20974
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 16:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3536C1DA47;
	Mon,  2 Oct 2023 16:19:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664B61D527
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 16:19:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F311A7;
	Mon,  2 Oct 2023 09:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696263554; x=1727799554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FrSE8d9uGldutiXJrJfF6BIwxKeDJqqgKYwSnq784UY=;
  b=l7/7K5U/A7+Zzi6F+US7ak70dSKo74HDpKCIoCDfplnxdvsyIDpmIvOf
   eflvmkCkcNxVFuZmpIFXbJ4XTdKAlEfidqoDyhMc/PDTC02twT8a3lMNB
   ZtePDdbWVAiEZiRiViSDkGLHw4rlIxtOvQlinHNl9eYNJa2GpigVP0ibs
   1gdnJFFRlQWq8knoG3eoBIZm9P/RFEHzDQQCYaPJ3hHq3lZaQP9N/UDtz
   4pleQG3gu3ua/fiZ4J61T7bB61EBFzNhI6tBL1cRIM5m59sL30MDYlPE0
   UWj2CeVj84nDN+rnQiXSFNdVxJH5tiVU0Su68r1OSZzM8NI7xHQAyf+UA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="382588658"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="382588658"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 09:16:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="841031516"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="841031516"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Oct 2023 09:16:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5C2FE157E; Mon,  2 Oct 2023 19:16:20 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 06/10] xhci: dbc: Don't shadow error codes in store() functions
Date: Mon,  2 Oct 2023 19:16:06 +0300
Message-Id: <20231002161610.2648818-6-andriy.shevchenko@linux.intel.com>
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
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

kstrtox() along with regmap API can return different error codes
based on the circumstances. Don't shadow them when returning to
the caller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index d110eb5f1625..2332133c6581 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -978,9 +978,11 @@ static ssize_t dbc_idVendor_store(struct device *dev,
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
@@ -1018,9 +1020,11 @@ static ssize_t dbc_idProduct_store(struct device *dev,
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
@@ -1057,9 +1061,11 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
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
@@ -1099,9 +1105,13 @@ static ssize_t dbc_bInterfaceProtocol_store(struct device *dev,
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
2.40.0.1.gaa8946217a0b



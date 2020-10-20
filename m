Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB33E2936EA
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 10:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392079AbgJTIiT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 04:38:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:49501 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389186AbgJTIiS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 04:38:18 -0400
IronPort-SDR: 2k1pMts9SK1tWAyIYBlP/IlerfxqeMz7NVd6MduF9TNzCzcNT/0vnohWzrjTyHHpJ7+VfU0Ocq
 rH0NBQtuINmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="228807687"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="228807687"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 01:38:18 -0700
IronPort-SDR: RP3FdSmMreYjhdxcme3Vo2lAvsGEFrhPKj/zd0zI46EI9im9pLk3KbgRY47Z9erwthPgqPB2Nr
 uNDldZKHTYbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="523428781"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 20 Oct 2020 01:38:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CF3E5377; Tue, 20 Oct 2020 11:38:15 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: dwc3: Simplify with dev_err_probe()
Date:   Tue, 20 Oct 2020 11:38:15 +0300
Message-Id: <20201020083815.89275-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe(). Less code and the error value gets printed.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/dwc3/core.c | 44 +++++++++++------------------------------
 1 file changed, 11 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index bdf0925da6b6..8787dff5342e 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1126,11 +1126,8 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		ret = PTR_ERR(dwc->usb2_phy);
 		if (ret == -ENXIO || ret == -ENODEV) {
 			dwc->usb2_phy = NULL;
-		} else if (ret == -EPROBE_DEFER) {
-			return ret;
 		} else {
-			dev_err(dev, "no usb2 phy configured\n");
-			return ret;
+			return dev_err_probe(dev, ret, "no usb2 phy configured\n");
 		}
 	}
 
@@ -1138,11 +1135,8 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		ret = PTR_ERR(dwc->usb3_phy);
 		if (ret == -ENXIO || ret == -ENODEV) {
 			dwc->usb3_phy = NULL;
-		} else if (ret == -EPROBE_DEFER) {
-			return ret;
 		} else {
-			dev_err(dev, "no usb3 phy configured\n");
-			return ret;
+			return dev_err_probe(dev, ret, "no usb3 phy configured\n");
 		}
 	}
 
@@ -1151,11 +1145,8 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		ret = PTR_ERR(dwc->usb2_generic_phy);
 		if (ret == -ENOSYS || ret == -ENODEV) {
 			dwc->usb2_generic_phy = NULL;
-		} else if (ret == -EPROBE_DEFER) {
-			return ret;
 		} else {
-			dev_err(dev, "no usb2 phy configured\n");
-			return ret;
+			return dev_err_probe(dev, ret, "no usb2 phy configured\n");
 		}
 	}
 
@@ -1164,11 +1155,8 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		ret = PTR_ERR(dwc->usb3_generic_phy);
 		if (ret == -ENOSYS || ret == -ENODEV) {
 			dwc->usb3_generic_phy = NULL;
-		} else if (ret == -EPROBE_DEFER) {
-			return ret;
 		} else {
-			dev_err(dev, "no usb3 phy configured\n");
-			return ret;
+			return dev_err_probe(dev, ret, "no usb3 phy configured\n");
 		}
 	}
 
@@ -1190,11 +1178,8 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
 		phy_set_mode(dwc->usb3_generic_phy, PHY_MODE_USB_DEVICE);
 
 		ret = dwc3_gadget_init(dwc);
-		if (ret) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "failed to initialize gadget\n");
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to initialize gadget\n");
 		break;
 	case USB_DR_MODE_HOST:
 		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
@@ -1205,20 +1190,14 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
 		phy_set_mode(dwc->usb3_generic_phy, PHY_MODE_USB_HOST);
 
 		ret = dwc3_host_init(dwc);
-		if (ret) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "failed to initialize host\n");
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to initialize host\n");
 		break;
 	case USB_DR_MODE_OTG:
 		INIT_WORK(&dwc->drd_work, __dwc3_set_mode);
 		ret = dwc3_drd_init(dwc);
-		if (ret) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "failed to initialize dual-role\n");
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to initialize dual-role\n");
 		break;
 	default:
 		dev_err(dev, "Unsupported mode of operation %d\n", dwc->dr_mode);
@@ -1555,8 +1534,7 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	ret = dwc3_core_init(dwc);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to initialize core: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to initialize core\n");
 		goto err4;
 	}
 
-- 
2.28.0


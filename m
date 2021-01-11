Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD9B2F16C5
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 14:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730437AbhAKN4x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 08:56:53 -0500
Received: from mga14.intel.com ([192.55.52.115]:4060 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388047AbhAKN4w (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Jan 2021 08:56:52 -0500
IronPort-SDR: kpLN0e0vcYhExgSO2k62zgAFoOEfPSuWuCEGp8EjSJ55IIVo6lnYjDagPE3p2yhKM6Wm1hNLAc
 MgVnN7xCeY4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="177084444"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="177084444"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 05:55:01 -0800
IronPort-SDR: idM2KHaACdJDVMIJ30AkcXhybj5/MgSoew/0PJ4gdqVuLG8kHbhIhBf774yGjBjuLDTKvogtUy
 6i3IRdzaEI0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="351568856"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 11 Jan 2021 05:55:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 34B7514B; Mon, 11 Jan 2021 15:54:58 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RESEND PATCH v1] usb: dwc3: Simplify with dev_err_probe()
Date:   Mon, 11 Jan 2021 15:54:58 +0200
Message-Id: <20210111135458.57084-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
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
index 841daec70b6e..88425a1df39a 100644
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
2.29.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6EA2936E9
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 10:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389187AbgJTIhy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 04:37:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:49462 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389051AbgJTIhy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 04:37:54 -0400
IronPort-SDR: K3ZwHgbTVtroZbfp6Mrxb8SV+pifJ4GRR+tLNroelkr+b1zGx4TMxR5AmjbkDaLRo4WPM3JfOf
 HC0iCnZfIilw==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="228807637"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="228807637"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 01:37:53 -0700
IronPort-SDR: zlQEnaoUL0guzmML/qWBBdiTUWbjdsg5PQpMJtYyToffOe94lq3MePV9fP+pmaCZxlstNnNldR
 tcLEe9pm1V6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="392302257"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 20 Oct 2020 01:37:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C691D377; Tue, 20 Oct 2020 11:37:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: dwc3: keystone: Simplify with dev_err_probe()
Date:   Tue, 20 Oct 2020 11:37:50 +0300
Message-Id: <20201020083750.89210-1-andriy.shevchenko@linux.intel.com>
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
 drivers/usb/dwc3/dwc3-keystone.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-keystone.c b/drivers/usb/dwc3/dwc3-keystone.c
index 9a99253d5ba3..057056c0975e 100644
--- a/drivers/usb/dwc3/dwc3-keystone.c
+++ b/drivers/usb/dwc3/dwc3-keystone.c
@@ -99,13 +99,8 @@ static int kdwc3_probe(struct platform_device *pdev)
 
 	/* PSC dependency on AM65 needs SERDES0 to be powered before USB0 */
 	kdwc->usb3_phy = devm_phy_optional_get(dev, "usb3-phy");
-	if (IS_ERR(kdwc->usb3_phy)) {
-		error = PTR_ERR(kdwc->usb3_phy);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "couldn't get usb3 phy: %d\n", error);
-
-		return error;
-	}
+	if (IS_ERR(kdwc->usb3_phy))
+		return dev_err_probe(dev, PTR_ERR(kdwc->usb3_phy), "couldn't get usb3 phy\n");
 
 	phy_pm_runtime_get_sync(kdwc->usb3_phy);
 
-- 
2.28.0


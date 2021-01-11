Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431222F16CD
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 14:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388053AbhAKN5e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 08:57:34 -0500
Received: from mga12.intel.com ([192.55.52.136]:8632 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388058AbhAKN5a (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Jan 2021 08:57:30 -0500
IronPort-SDR: 2BUrPLrqCiOnbAMrYzrecXDw9A+kU/oAcwXd+fkBGWSGbtpiQSDwJXnQC/hBS1COwSW8XtYoHj
 zQN2bYjutKJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="157043363"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="157043363"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 05:55:42 -0800
IronPort-SDR: 4m2oZnuEit5V6YfyV5zxEh+R8OPe10r9E7P9aGgRa1HATKthPbBAQau6/NYwwOdbr9RevTyTyV
 IXtn6GjYETdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="404122837"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2021 05:55:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7186914B; Mon, 11 Jan 2021 15:55:39 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RESEND PATCH v1] usb: dwc3: keystone: Simplify with dev_err_probe()
Date:   Mon, 11 Jan 2021 15:55:39 +0200
Message-Id: <20210111135539.57234-1-andriy.shevchenko@linux.intel.com>
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
2.29.2


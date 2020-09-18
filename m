Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70BBA26FDF3
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 15:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbgIRNO3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 09:14:29 -0400
Received: from mga09.intel.com ([134.134.136.24]:46076 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgIRNO2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Sep 2020 09:14:28 -0400
IronPort-SDR: gEDQL9VD8jol2OfErpMH6+RRXfWU0liKFOXIrGt6c2I7/irj4Dgzyc55JVBsI4SJHSTVbYwdD2
 l88lKnRFyssg==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="160849945"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="160849945"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 06:14:27 -0700
IronPort-SDR: ysztfmWIuF69AnpuLWP6jjBkE3tH51bjhnvZvgAThZ7JSWUxyr3PfGawYwAWayqc6c/yaAJUa+
 XgS+j4SrzF9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="508871158"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2020 06:14:26 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/10] usb: host: xhci-plat: add platform data support
Date:   Fri, 18 Sep 2020 16:17:43 +0300
Message-Id: <20200918131752.16488-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
References: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Some xhci hosts (eg dwc3 and cdns3) do not use OF to create
platform device, they create xhci-plat platform device runtime.
And these platforms may also have quirks, and the quirks could
be supplied by their parent device through platform data.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-plat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3057cfc76d6a..c7f98edc5678 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -264,7 +264,11 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_reg_clk;
 
-	priv_match = of_device_get_match_data(&pdev->dev);
+	if (pdev->dev.of_node)
+		priv_match = of_device_get_match_data(&pdev->dev);
+	else
+		priv_match = dev_get_platdata(&pdev->dev);
+
 	if (priv_match) {
 		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 
-- 
2.17.1


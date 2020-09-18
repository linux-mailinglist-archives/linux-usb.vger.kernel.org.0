Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1C426FDF5
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 15:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgIRNOc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 09:14:32 -0400
Received: from mga09.intel.com ([134.134.136.24]:46076 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgIRNOb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Sep 2020 09:14:31 -0400
IronPort-SDR: Xo5Wb7Xwb3vWvRC/yltQ7JRYn8iU2JvHPTaS86Kriusx+akJ9FwSNz1olAwLPrkLnyoiWOUPRo
 wmiGE1F00FmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="160849953"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="160849953"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 06:14:30 -0700
IronPort-SDR: mw0rLfuDwGvVckYxwJIeiZ4gorUJhyp+p0sue/LnohiwOSAfD23grT5xItpSGYhW3CnlCrq1Vu
 5VGGj+gKKang==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="508871168"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2020 06:14:29 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/10] usb: host: xhci-plat: delete the unnecessary code
Date:   Fri, 18 Sep 2020 16:17:45 +0300
Message-Id: <20200918131752.16488-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
References: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

The if {} condition is duplicated with outer if {} condition.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-plat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c3ce4d762adf..07ca000a0084 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -283,8 +283,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 
 		/* Just copy data for now */
-		if (priv_match)
-			*priv = *priv_match;
+		*priv = *priv_match;
 	}
 
 	device_wakeup_enable(hcd->self.controller);
-- 
2.17.1


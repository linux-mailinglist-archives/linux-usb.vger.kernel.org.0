Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A694F26FDF8
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 15:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgIRNOg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 09:14:36 -0400
Received: from mga09.intel.com ([134.134.136.24]:46076 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgIRNOf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Sep 2020 09:14:35 -0400
IronPort-SDR: byL6yYH74iIT0C/DgjH1LPCc3xI/lspS7fGacrZ4+s51AvQ7wKJgsKqA8WjKCzHXEeLzejeHmL
 bhdxHsEYTBYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="160849965"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="160849965"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 06:14:35 -0700
IronPort-SDR: UzCoSO+VPNeKiKI+1zvF9Z1JF23E7O90+2/ol5GUklorwqJgvJBlLVczAEl3VVTB99cCru0CHh
 2TLu0dUwuDMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="508871196"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2020 06:14:34 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/10] usb: host: xhci-plat: improve the comments for xhci_plat_suspend
Date:   Fri, 18 Sep 2020 16:17:48 +0300
Message-Id: <20200918131752.16488-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
References: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

To reflect the current code status.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-plat.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index cfca6fc8947c..aa2d35f98200 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -421,11 +421,7 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 		return ret;
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
-	 * to do wakeup during suspend. Since xhci_plat_suspend is currently
-	 * only designed for system suspend, device_may_wakeup() is enough
-	 * to dertermine whether host is allowed to do wakeup. Need to
-	 * reconsider this when xhci_plat_suspend enlarges its scope, e.g.,
-	 * also applies to runtime suspend.
+	 * to do wakeup during suspend.
 	 */
 	return xhci_suspend(xhci, device_may_wakeup(dev));
 }
-- 
2.17.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8494671FFB
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 21:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730274AbfGWTQn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 15:16:43 -0400
Received: from mga11.intel.com ([192.55.52.93]:39759 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728935AbfGWTQn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Jul 2019 15:16:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 12:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; 
   d="scan'208";a="368981847"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jul 2019 12:16:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6B63781; Tue, 23 Jul 2019 22:16:40 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: dwc2: Switch to use device_property_count_u32()
Date:   Tue, 23 Jul 2019 22:16:39 +0300
Message-Id: <20190723191639.67883-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use use device_property_count_u32() directly, that makes code neater.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/dwc2/params.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 55f841a54015..31e090ac9f1e 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -404,10 +404,7 @@ static void dwc2_get_device_properties(struct dwc2_hsotg *hsotg)
 		device_property_read_u32(hsotg->dev, "g-np-tx-fifo-size",
 					 &p->g_np_tx_fifo_size);
 
-		num = device_property_read_u32_array(hsotg->dev,
-						     "g-tx-fifo-size",
-						     NULL, 0);
-
+		num = device_property_count_u32(hsotg->dev, "g-tx-fifo-size");
 		if (num > 0) {
 			num = min(num, 15);
 			memset(p->g_tx_fifo_size, 0,
-- 
2.20.1


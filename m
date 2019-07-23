Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1986071FFD
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 21:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731053AbfGWTRH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 15:17:07 -0400
Received: from mga06.intel.com ([134.134.136.31]:42493 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728935AbfGWTRH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Jul 2019 15:17:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 12:17:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; 
   d="scan'208";a="188902215"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Jul 2019 12:17:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 90A0381; Tue, 23 Jul 2019 22:17:04 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: dwc3: Switch to use device_property_count_u32()
Date:   Tue, 23 Jul 2019 22:17:04 +0300
Message-Id: <20190723191704.67945-1-andriy.shevchenko@linux.intel.com>
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
 drivers/usb/dwc3/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c9bb93a2c81e..98bce85c29d0 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -813,8 +813,7 @@ static void dwc3_set_incr_burst_type(struct dwc3 *dwc)
 	 * result = 1, means INCRx burst mode supported.
 	 * result > 1, means undefined length burst mode supported.
 	 */
-	ntype = device_property_read_u32_array(dev,
-			"snps,incr-burst-type-adjustment", NULL, 0);
+	ntype = device_property_count_u32(dev, "snps,incr-burst-type-adjustment");
 	if (ntype <= 0)
 		return;
 
-- 
2.20.1


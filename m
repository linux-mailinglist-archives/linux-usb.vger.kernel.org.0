Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFFD484E9B
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jan 2022 08:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237956AbiAEHOX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jan 2022 02:14:23 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:39147 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236412AbiAEHOW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jan 2022 02:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1641366862; x=1672902862;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hh9pnCCJ8I7rHkhNif2b+FhAaIPDOHTU7LajUOk9t/o=;
  b=InSn1zlbx1GJvXFAxswWifZOmFnWqTFli2G/T7cTJcoAj8iTwtuzrnwq
   zy8mer02KRiwQ5rEDJmthzrwqJklCg+ZvYQ/aPfUiyB6PIoSz1aC65c5Y
   D3+XzW2zX09WphwS2bTQJm3mmQ3Ov6VgiqWhbw1jIfVf8/F2OGje1KUF6
   ow3K+K9p+t6YHJm82EaXmYrYIXippyXov6oWy7kJ0kzj4qu57ir94DmcK
   tJrUqaMe2z9FJBwENPRUBYbiPlf20Y24bWt4dmf1i3/1VdrkUhReH9hzL
   ylKuvr8VQKU0747w4vR4aY2RhApJvIXm3k3UGg9ETtecpY7XLUstVjFk3
   g==;
X-IronPort-AV: E=Sophos;i="5.88,262,1635199200"; 
   d="scan'208";a="21339561"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 05 Jan 2022 08:14:21 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 05 Jan 2022 08:14:21 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 05 Jan 2022 08:14:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1641366861; x=1672902861;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hh9pnCCJ8I7rHkhNif2b+FhAaIPDOHTU7LajUOk9t/o=;
  b=iSPwlqZ/z1+b1B9aoRgKKbfKeEgFW5dpoj+bp3E+7TWAoMIpz6D5TMlD
   tbH54iLg7PB2D0gBTukskvt9a1Zo4n5etXij+WGoxeTICtyHb8TBlK9ed
   +ZZy5hNpoNsi/MteC4OhZJCo5BDHmJe2v/1pG8Nc9nlwFH1vx1Xs0z7WN
   5lCPdrlzWbdHo1D/ke1ycI629ifHet84bxohzB5TW3LxZGGUf/vFT+a9/
   IjEJ5D5FTjYCumoXCle2cIFl0EVdhOz/Kvvm2W/9p9NgbZh6HwC4x2O2Q
   TQyps5/4xYCtMhFXH3aMKx3QDJGno0clfr9dUiuboy7oWsmUW/gQYd6Gs
   w==;
X-IronPort-AV: E=Sophos;i="5.88,262,1635199200"; 
   d="scan'208";a="21339560"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 05 Jan 2022 08:14:21 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 545E8280065;
        Wed,  5 Jan 2022 08:14:21 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v4 1/1] usb: dwc3: drd: Add support for usb-conn-gpio based usb-role-switch
Date:   Wed,  5 Jan 2022 08:14:07 +0100
Message-Id: <20220105071407.2240302-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb-conn-gpio devices are a subnode of the USB interface controller, which
needs to be populated.
This allows having a non-type-c connector providing dual-role.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v4:
* Use <> for includes

Changes in v3:
* Unregister role-switch upon populating OF tree error
* Do not call devm_of_platform_populate() on non-OF platforms

Changes in v2:
* Added missing variable declaration

 drivers/usb/dwc3/drd.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index d7f76835137f..25f322e62d3f 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -9,6 +9,7 @@
 
 #include <linux/extcon.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
@@ -559,6 +560,18 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 	if (IS_ERR(dwc->role_sw))
 		return PTR_ERR(dwc->role_sw);
 
+	if (IS_ENABLED(CONFIG_OF)) {
+		/* populate connector entry */
+		int ret = devm_of_platform_populate(dwc->dev);
+
+		if (ret) {
+			usb_role_switch_unregister(dwc->role_sw);
+			dwc->role_sw = NULL;
+			dev_err(dwc->dev, "DWC3 platform devices creation failed: %i\n", ret);
+			return ret;
+		}
+	}
+
 	dwc3_set_mode(dwc, mode);
 	return 0;
 }
-- 
2.25.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E94FF45DC2A
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 15:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355605AbhKYOUg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 09:20:36 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:39865 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355628AbhKYOSe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 09:18:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1637849722; x=1669385722;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bX+Fml1ljrIRO6aHJkhfpGDjatAKCqni1JAKL719LsY=;
  b=p3Sy8OcOhxab/TxnFTMVqMMb9cncANuc2+8l+EYIRoaJXy7eJNLoCw6c
   /PJL3VEY0jcNRjpDtPv5d5RQ4i5u+7KosznjP8IFXBUkYToDB3m1jjqge
   lDUkoVgbWQ6V/81/v1pTNGZYXmONoy49TcTl7hgehvAebZakVSoSx3C2r
   NLSOTg7Eur1N8zSIEJBgnnbq90mWBD93IJLtxq/AS9iqm4KZUE6W9mEb5
   oNwlGzFztQji1qw6WsxRgjvThC80NxG60dH0zw7I6j+Ds19s2x5fyzVBy
   qRvMhbpSPJwynW7v+YTEcD25Nm/JEhOUt3SGy6Wjq/5Ib4xMbyQK7LDYh
   Q==;
X-IronPort-AV: E=Sophos;i="5.87,263,1631570400"; 
   d="scan'208";a="20679550"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 25 Nov 2021 15:15:20 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 25 Nov 2021 15:15:20 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 25 Nov 2021 15:15:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1637849720; x=1669385720;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bX+Fml1ljrIRO6aHJkhfpGDjatAKCqni1JAKL719LsY=;
  b=ZuZXOzQJ5qYleZYwTtFmlDBdssafJMnSakjNDBhZu8DXqHWA7Ob3+xiF
   1w2ufIfAIYL0wWxXkt/JPYOYtZ1VloIVqH/0yhQSx7hONGr1y0bwCmKO3
   6Sbez2Bk6LFHjAxP9iNG0pziAX3fkjtveWuD09NiCo9JhzitOHzWwdm1S
   z/hZA25/tIm1x9mEtMiy9O3aJymUfkLEa3jyJ6J49sYWcuPF7qbgYzgdt
   nCFJEOzhNFKNrLX0bS3T0HvG2F2r+4LWPHbqRDlMJ9oFE+Ci58va6zaHj
   nXPpNPhLpIov6Dza+5UpLZAC8rU2KcIQSqkoDyvtbi4D+00Oq3n/tmLyY
   w==;
X-IronPort-AV: E=Sophos;i="5.87,263,1631570400"; 
   d="scan'208";a="20679549"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 25 Nov 2021 15:15:20 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 52FD1280065;
        Thu, 25 Nov 2021 15:15:20 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 1/1] usb: dwc3: drd: Add support for usb-conn-gpio based usb-role-switch
Date:   Thu, 25 Nov 2021 15:15:16 +0100
Message-Id: <20211125141516.1668633-1-alexander.stein@ew.tq-group.com>
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
Changes in v2:
* Added missing variable declaration

 drivers/usb/dwc3/drd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index d7f76835137f..8b5ac689b8da 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -9,6 +9,7 @@
 
 #include <linux/extcon.h>
 #include <linux/of_graph.h>
+#include "linux/of_platform.h"
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
@@ -542,6 +543,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 {
 	struct usb_role_switch_desc dwc3_role_switch = {NULL};
 	u32 mode;
+	int ret;
 
 	dwc->role_switch_default_mode = usb_get_role_switch_default_mode(dwc->dev);
 	if (dwc->role_switch_default_mode == USB_DR_MODE_HOST) {
@@ -559,6 +561,13 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 	if (IS_ERR(dwc->role_sw))
 		return PTR_ERR(dwc->role_sw);
 
+	/* populate connector entry */
+	ret = devm_of_platform_populate(dwc->dev);
+	if (ret) {
+		dev_err(dwc->dev, "DWC3 platform devices creation failed: %i\n", ret);
+		return ret;
+	}
+
 	dwc3_set_mode(dwc, mode);
 	return 0;
 }
-- 
2.25.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4449A47738A
	for <lists+linux-usb@lfdr.de>; Thu, 16 Dec 2021 14:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbhLPNtv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 08:49:51 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:49937 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232137AbhLPNtu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Dec 2021 08:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1639662590; x=1671198590;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hlRQz3Z9fR6tP+813FA/LrPEPubPmGGr6KQdW55lG4s=;
  b=Mh0gK5Ync5z/dUAiGHwSxYHEs69e+e6n7NuzTkxXunhq4hTXQcMktoc7
   CfeCG6BMsIa6cH/nUoAXhjqpqp3Jox8K/K97GNjABCs16c39sXIby9jsb
   g+grVWntmHmmwL3amcM+d3QZ9fUzL3z9LVrxc5is48yJkVgTBZraFvzJF
   6lf7To9uD9XubfKAea9ZIDnVksjavFJas0VoBdYRV480vy0OXro1mdiRn
   bUolRr0onIg9hk20oSQPUWKxhLEyFaGdAMGLli6p8s6P7yUs159Q2cfUU
   3tjy/5+N4+ZQExjOzCEpX3v1yywScXhdwglFZDe4sX+V8M+E7zCvZ+uAJ
   w==;
X-IronPort-AV: E=Sophos;i="5.88,211,1635199200"; 
   d="scan'208";a="21099063"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Dec 2021 14:49:49 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 16 Dec 2021 14:49:49 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 16 Dec 2021 14:49:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1639662589; x=1671198589;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hlRQz3Z9fR6tP+813FA/LrPEPubPmGGr6KQdW55lG4s=;
  b=BKvclGdSHJIuVDqmRzjZbzL02C6ZdUlTUSbN2Fn2tsbRklnii4mQouLQ
   06OeTgGTR/bpaU61V5hPSiqIh/BukAyCzVWH4V/9XPG01Ne8bR58nhaJK
   ObjnC4Bcux69IwLM9xnuTEwmQscSmDzdJb+FjXbnx+p1rDonTvCCeov8b
   HzcmMVnuEKaPcdP3TrvATboHNIre+boHcY5Ig4+VEDqsKEJMlDD3LbVqS
   k68YKbQsmKSaajpSfCbaXARYD+cwwP4H1zfFatlxaI3Z+wkgOq1LSg6Ps
   n626FBiZW8LAKIzXvuOKpTHvslK2zAo/MiwlnRDEj2Vyf9XeNs4PQPTvq
   g==;
X-IronPort-AV: E=Sophos;i="5.88,211,1635199200"; 
   d="scan'208";a="21099062"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Dec 2021 14:49:49 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7C944280065;
        Thu, 16 Dec 2021 14:49:49 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v3 1/1] usb: dwc3: drd: Add support for usb-conn-gpio based usb-role-switch
Date:   Thu, 16 Dec 2021 14:49:40 +0100
Message-Id: <20211216134940.487518-1-alexander.stein@ew.tq-group.com>
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
Greg, thank you for your review.

This was tested on an imx8mp based board (TQMa8MPxL) which uses devicetree.
Unfortunately I have no non-imx platform available to test this on.

devm_of_platform_populate() _will_ fail on non-OF builds, so do not call this
on non-OF enabled platforms.
AFAICS on OF-platforms this call will only fail upon memory allocation errors.
If there are no subnodes, this call will not fail. So existing platform should
work as before.

Changes in v3:
* Unregister role-switch upon populating OF tree error
* Do not call devm_of_platform_populate() on non-OF platforms

Changes in v2:
* Added missing variable declaration

 drivers/usb/dwc3/drd.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index d7f76835137f..1dcce7a04b41 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -9,6 +9,7 @@
 
 #include <linux/extcon.h>
 #include <linux/of_graph.h>
+#include "linux/of_platform.h"
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


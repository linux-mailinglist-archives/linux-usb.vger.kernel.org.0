Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D823245D86F
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 11:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354590AbhKYKxK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 05:53:10 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:10607 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349586AbhKYKvJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 05:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1637837278; x=1669373278;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fEkDeqCTQwU1wd12F0TZVBp7DnTrrEhTrR0RRR/DU88=;
  b=Uv43uCLMTYYrJQ3WPvemel1cYQPNBFpkI+awRABx1l0FOdfrlxZMxFQi
   dbg36BicCgwizJYh5t+iD6DjOEYfl1B4aIpBHagGquY5ae1nSnMQrg3DY
   MautTFBdzxZGgrGEzmVZ6RShfUz939s2WH9ctwEGujWIEo8QwzBAmcoYm
   LL5XTbMvfeDZrZd1G0VKvR7MC6CmCpcRXTyfgKYBbJcdVzEloW7/dOZGU
   OWRj1mlyi0tn6Zq+hjehMhq5pwgFbQdg6zDeJ0CzkKKWhz3jQ3JshRP9M
   e6ktj51c6UxR0xQdxVjUuSoLoXh4qd2h59fTZNjJ/qajvDFL4krsUr1fQ
   w==;
X-IronPort-AV: E=Sophos;i="5.87,263,1631570400"; 
   d="scan'208";a="20673323"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 25 Nov 2021 11:47:57 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 25 Nov 2021 11:47:57 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 25 Nov 2021 11:47:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1637837277; x=1669373277;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fEkDeqCTQwU1wd12F0TZVBp7DnTrrEhTrR0RRR/DU88=;
  b=U6IahE7I/VhZqnhnm9j9eYpwWz+tA7HGcihAW0rY4r1oaiWnylfacI75
   LwVtl7//lyQIZUvSLitIyfoGYOikndyJ2wzDGQsnaBb4e5n+KNfbJ2jUp
   wUh4+AURlOrbSe6QLpgmlMAcHOuEccWyaY2SRYxkFHIP1aqh2pN9oYO00
   TTAAGuR8R4amloKyBXdnYEzJjekPPdh+/N+jhGwE4xY5lYuO2HRgBPCem
   T5szdxYJe4yPvo10IoHmwgZSRDaVKvaueaJxgEZlVvhzNVwIj32hfl5xG
   tnB0r2eX6fqCgBz9+wavsxdaaDve/0mSciBkmV5OaeWhc9grQtsqYI9FC
   g==;
X-IronPort-AV: E=Sophos;i="5.87,263,1631570400"; 
   d="scan'208";a="20673322"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 25 Nov 2021 11:47:57 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 285DF280065;
        Thu, 25 Nov 2021 11:47:57 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/1] usb: dwc3: drd: Add support for usb-conn-gpio based usb-role-switch
Date:   Thu, 25 Nov 2021 11:47:48 +0100
Message-Id: <20211125104748.1418934-1-alexander.stein@ew.tq-group.com>
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
This change is inspired by commit f67213cee2b3 ("phy: tegra: xusb: Add
usb-role-switch support") for tegras xusb driver, which also does
populate the connector entry.

 drivers/usb/dwc3/drd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index d7f76835137f..281d8a310c89 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -9,6 +9,7 @@
 
 #include <linux/extcon.h>
 #include <linux/of_graph.h>
+#include "linux/of_platform.h"
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
@@ -559,6 +560,13 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
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


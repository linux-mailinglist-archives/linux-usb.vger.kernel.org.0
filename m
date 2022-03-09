Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C55F4D2C47
	for <lists+linux-usb@lfdr.de>; Wed,  9 Mar 2022 10:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbiCIJjx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Mar 2022 04:39:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbiCIJjw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Mar 2022 04:39:52 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F8CCEA1D
        for <linux-usb@vger.kernel.org>; Wed,  9 Mar 2022 01:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646818733; x=1678354733;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QinkyWkurnA9GYOKnlibFGMhJylaOQgc0rY+P87JEas=;
  b=a80FnJ0OBa7NnVpR+89TWOJcP91oaQ0bIbCresx0JS6fB249P+/tBjZR
   +DGFF/RU1ZIPmwQDuKLJUNEBreDylgR71yedo0TsrBjZFjAqAyckJZcGX
   fz1qEJ174lxdi5XSlCO20pfF5nXII9K/B7Mnf2kAug329Kt7y1fslsHwX
   JzMxdAtM2WG4RXFjPvGdcGJab0uk8cGKqOfuPGg0Srq6npwV53BZGxDQW
   nIkJgVZ6YAa5Z2EH5WlcACrbgUGSbWur8vqLebU82If1p2m9/oHgjXF0L
   qP7vQJLRgCa/XqAwyvxO7eBvjIF5VyIkyj3lzrZuRlr2ZpNgS6fN+OVxF
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643670000"; 
   d="scan'208";a="22549039"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 09 Mar 2022 10:38:50 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 09 Mar 2022 10:38:50 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 09 Mar 2022 10:38:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646818730; x=1678354730;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QinkyWkurnA9GYOKnlibFGMhJylaOQgc0rY+P87JEas=;
  b=KBtMHdSFCjpm3QSWJJKV8tBNeXt/k4mYcd5Kw+ml9rBNMkzKvw7mBCoe
   iKEvdBfLaNo9aSSHOrZVNM1Afw5lBKShcVB8TtseXvap2jG1d3fxrEclo
   lIsyNBGcFCfvCf/cvEFpSLaD9ombugShTl9tct7qRqxQPADiGXQyVMqEx
   W89IzvYMf4yFWXL3+9OspeFMxyXvQRsJ5YJWfKsbVvxLPXw3ymN/jfqRj
   ezn+DcA8byuPrgp2XEGxchVyEfYkDxEZxJGzLOjFD9ardx4+3A2qDuPqV
   AE5vhZ0KDNP/ny+XlV4kZUdNQgFEqTv0bDO5dxBHYPsZUb3fTsuoPaghq
   A==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643670000"; 
   d="scan'208";a="22549038"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 09 Mar 2022 10:38:50 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 42512280065;
        Wed,  9 Mar 2022 10:38:50 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/1] usb: common: usb-conn-gpio: Make VBUS supply completely optional
Date:   Wed,  9 Mar 2022 10:38:42 +0100
Message-Id: <20220309093842.113260-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It makes sense that if the USB connector is a child of an USB port
providing VBUS supply, there is no need to do it again.
But this does not handle the case where VBUS is controlled by PWR from
USB host controller, without any regulator at all.
Support this by making VBUS pure optional.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This is essentially for getting rid of the warnings:
usb-conn-gpio 38100000.usb:connector: supply vbus not found, using dummy regulator
on our imx8mp based board. Only an ID pin GPIO is provided, VBUS is controlled
by USB PWR signal within USB core hardware.

 drivers/usb/common/usb-conn-gpio.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index 0158148cb054..395f9bbe3056 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -175,7 +175,6 @@ static int usb_conn_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct usb_conn_info *info;
-	bool need_vbus = true;
 	int ret = 0;
 
 	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
@@ -205,22 +204,9 @@ static int usb_conn_probe(struct platform_device *pdev)
 
 	INIT_DELAYED_WORK(&info->dw_det, usb_conn_detect_cable);
 
-	/*
-	 * If the USB connector is a child of a USB port and that port already provides the VBUS
-	 * supply, there's no need for the USB connector to provide it again.
-	 */
-	if (dev->parent && dev->parent->of_node) {
-		if (of_find_property(dev->parent->of_node, "vbus-supply", NULL))
-			need_vbus = false;
-	}
-
-	if (!need_vbus) {
-		info->vbus = devm_regulator_get_optional(dev, "vbus");
-		if (PTR_ERR(info->vbus) == -ENODEV)
-			info->vbus = NULL;
-	} else {
-		info->vbus = devm_regulator_get(dev, "vbus");
-	}
+	info->vbus = devm_regulator_get_optional(dev, "vbus");
+	if (PTR_ERR(info->vbus) == -ENODEV)
+		info->vbus = NULL;
 
 	if (IS_ERR(info->vbus)) {
 		ret = PTR_ERR(info->vbus);
-- 
2.25.1


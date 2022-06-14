Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2145554AFE1
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jun 2022 14:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356301AbiFNMFg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jun 2022 08:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356330AbiFNMFe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jun 2022 08:05:34 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D80B4991C
        for <linux-usb@vger.kernel.org>; Tue, 14 Jun 2022 05:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655208328; x=1686744328;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vKwqltHnwg2LTLPMw4J0G9/0s5ytO7cTrRUQXCNc7pk=;
  b=jErA2HU+JjnSYfVGmd++/P6l29VgUfTdWoZWRV4gb+Dkxo1IV0hFCVlF
   PlXRQ0F3g/VoMh4WI2UkxfX2wsQyoIFKN/Rl81+U9NCIVEq1xn+1P1fMP
   smz1c1GD4OCzOyD30VfYYphX1BeO2EWKi+D0LU7hwYojlhqZYK2jJsr+g
   AmPfD9UG/fbL1fQshgw/axXqt8hJT4tZeag5y7h82vO5gD338Nf5CLb4/
   kVd3/QqgeGRwlnqnh/6IrNqkLRwZsNtuVS+5IWjyV5XeIlQ2Wd/b6fJpb
   8C67U8PYV3AQnVCb3pGo4ElRFy4JLn3fscCNueLwf7C/ot3gV0wBwDaVC
   A==;
X-IronPort-AV: E=Sophos;i="5.91,300,1647298800"; 
   d="scan'208";a="24448380"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 14 Jun 2022 14:05:26 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 14 Jun 2022 14:05:26 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 14 Jun 2022 14:05:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655208326; x=1686744326;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vKwqltHnwg2LTLPMw4J0G9/0s5ytO7cTrRUQXCNc7pk=;
  b=by1IwY+5UqrYvhVmaJCzjZaJn8w/VmgCWEgJodXnM2GIXeINj/b6bgdD
   +T8kyp0e2x2pn+Wnw0LZo3M+sXnJ+FrelGWvFO1FZLeMk5UKFNin2A23+
   z6QCCaDJ3tqgo/5BgB0IWRXcWGiy46Z4K/JH1oMiU1+y0XmBhIGmfiFXk
   3rUBWF9e755uE7waiIsxpCdHaTM0+hqfbMyZ7np0BINl5Tu0dp/TrZ2w5
   M8FDlSfH9i5oMUAHyjvB61eVrs6fIQ1f6MvL1dTr24n/OZf9vlC268lag
   XJcwrNg8P0I2LHa5vG7Z3KH1PyXlehiHbtCFmwuUBQwoNH/2+16cwL2be
   g==;
X-IronPort-AV: E=Sophos;i="5.91,300,1647298800"; 
   d="scan'208";a="24448379"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Jun 2022 14:05:26 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 97C95280056;
        Tue, 14 Jun 2022 14:05:26 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/1] usb: chipidea: ci_hdrc_imx: use dev_err_probe()
Date:   Tue, 14 Jun 2022 14:05:22 +0200
Message-Id: <20220614120522.1469957-1-alexander.stein@ew.tq-group.com>
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

Use dev_err_probe() to simplify handling errors in ci_hdrc_imx_probe()

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 097142ffb184..9ffcecd3058c 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -348,25 +348,18 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		data->pinctrl = devm_pinctrl_get(dev);
 		if (PTR_ERR(data->pinctrl) == -ENODEV)
 			data->pinctrl = NULL;
-		else if (IS_ERR(data->pinctrl)) {
-			if (PTR_ERR(data->pinctrl) != -EPROBE_DEFER)
-				dev_err(dev, "pinctrl get failed, err=%ld\n",
-					PTR_ERR(data->pinctrl));
-			return PTR_ERR(data->pinctrl);
-		}
+		else if (IS_ERR(data->pinctrl))
+			return dev_err_probe(dev, PTR_ERR(data->pinctrl),
+					     "pinctrl get failed\n");
 
 		data->hsic_pad_regulator =
 				devm_regulator_get_optional(dev, "hsic");
 		if (PTR_ERR(data->hsic_pad_regulator) == -ENODEV) {
 			/* no pad regualator is needed */
 			data->hsic_pad_regulator = NULL;
-		} else if (IS_ERR(data->hsic_pad_regulator)) {
-			if (PTR_ERR(data->hsic_pad_regulator) != -EPROBE_DEFER)
-				dev_err(dev,
-					"Get HSIC pad regulator error: %ld\n",
-					PTR_ERR(data->hsic_pad_regulator));
-			return PTR_ERR(data->hsic_pad_regulator);
-		}
+		} else if (IS_ERR(data->hsic_pad_regulator))
+			return dev_err_probe(dev, PTR_ERR(data->hsic_pad_regulator),
+					     "Get HSIC pad regulator error\n");
 
 		if (data->hsic_pad_regulator) {
 			ret = regulator_enable(data->hsic_pad_regulator);
@@ -458,9 +451,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 				&pdata);
 	if (IS_ERR(data->ci_pdev)) {
 		ret = PTR_ERR(data->ci_pdev);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "ci_hdrc_add_device failed, err=%d\n",
-					ret);
+		dev_err_probe(dev, ret, "ci_hdrc_add_device failed\n");
 		goto err_clk;
 	}
 
-- 
2.25.1


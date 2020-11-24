Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78EAF2C2D1C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 17:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390422AbgKXQjb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 11:39:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgKXQjb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Nov 2020 11:39:31 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2F0C0613D6
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 08:39:31 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id 7so16543836qtp.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 08:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xJCMs2ACe4cP40F2noz7X7INSyPqghV7XcdL1Y8jk44=;
        b=tsHbrSW3dyWPXRmGbvhmiu1oOo97D/uet/XjM5R4o+bA+c/xhoVpw7+hAv/c1XK9zO
         THiGkRJSrM0UGF75COF9Feq2MHml26dAa8w+y3vIhiAVtjtXuOO9lgKz122Q11v0T4Nx
         P14bQVorFx59cmAIE8oX1DqwDjDm37w+4fV5zARG1BxvRGVIsC8jZjW7HjExz/enordO
         tQ/xZQM16BxBcxwCzbY6MrmC2xDS++3PImXBjlDTadmC2JczL5rHWWmAQK7mOeVDi8MK
         eX22rLlwgbBtEZjcxFL8cyvIBIsHhVp4I725AZBZlwM1ERSsb15dhjM3oiSb0aD4vQdp
         B6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xJCMs2ACe4cP40F2noz7X7INSyPqghV7XcdL1Y8jk44=;
        b=LPapDLUFcawIfgZSR92mRfRbYdxm5REnJIVoMMbn/oNNzmJRur7KgS8Hg6IvX9T7Da
         noQgkBbJ95Bh0CUU4tbrXeX3FTUZvTfhdB4twhJlg4Uy8ZfEoUM9EiLQvkxGJ6cFzJp/
         QuGQFLKnu92MG1W3wKtLGQ/sHtWD5pmyfDRzYNhN4kuAcuP7NGf3pS9w+eNo5QhFEp7a
         JqxHrPFCI4d97lknxfN1S987hgqXAusVfn/MsXjybe3K3uWgQg+R6YykaXYWKrMJ7F1V
         JOYNvhat3wh6VAOVolxwBHhkbETA29mWVGxo2FXdHI9JZAIG1qGOnzx7TWXSlHDBh4Pn
         Xuvw==
X-Gm-Message-State: AOAM5336CN3PlBLFYGGT5dnX7N14auP7Nph++KZ6dx6IWuIKAVG34nrn
        8K+O+dlLcUvHMH/Pj8I+ZiY=
X-Google-Smtp-Source: ABdhPJwxQSgqodTZWA70pGpp8hU6qE/ubR0RIeqFhQ3c/sSHoPOPLXiCmpfzcLmuc31qncnIzy3c9g==
X-Received: by 2002:ac8:7659:: with SMTP id i25mr5178681qtr.78.1606235970264;
        Tue, 24 Nov 2020 08:39:30 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:c91:9ce8:56e7:5368:ece8])
        by smtp.gmail.com with ESMTPSA id o21sm14060909qko.9.2020.11.24.08.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 08:39:29 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     Peter.Chen@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/3] usb: phy: phy-mxs-usb: Use of_device_get_match_data()
Date:   Tue, 24 Nov 2020 13:39:10 -0300
Message-Id: <20201124163912.12074-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The retrieval of driver data via of_device_get_match_data() can make
the code simpler.

Use of_device_get_match_data() to simplify the code. 

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 67b39dc62b37..8a262c5a0408 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -714,14 +714,9 @@ static int mxs_phy_probe(struct platform_device *pdev)
 	struct clk *clk;
 	struct mxs_phy *mxs_phy;
 	int ret;
-	const struct of_device_id *of_id;
 	struct device_node *np = pdev->dev.of_node;
 	u32 val;
 
-	of_id = of_match_device(mxs_phy_dt_ids, &pdev->dev);
-	if (!of_id)
-		return -ENODEV;
-
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
@@ -797,7 +792,7 @@ static int mxs_phy_probe(struct platform_device *pdev)
 	mxs_phy->phy.charger_detect	= mxs_phy_charger_detect;
 
 	mxs_phy->clk = clk;
-	mxs_phy->data = of_id->data;
+	mxs_phy->data = of_device_get_match_data(&pdev->dev);
 
 	platform_set_drvdata(pdev, mxs_phy);
 
-- 
2.17.1


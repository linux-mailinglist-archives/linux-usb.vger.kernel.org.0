Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C299C2FA4C3
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 16:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405883AbhARPbB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 10:31:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405877AbhARP3I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jan 2021 10:29:08 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD09EC061573
        for <linux-usb@vger.kernel.org>; Mon, 18 Jan 2021 07:28:27 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id o18so1812169qtp.10
        for <linux-usb@vger.kernel.org>; Mon, 18 Jan 2021 07:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ysweUzLzeiCYFl+DLTVwTcwLOex2FvHGSV44HDG9Rl8=;
        b=X9mSWuHiPBYDp8CAXHIWpIZ2FuQj6rir4Q5nCWJ7Auc+DbUqcC3sWHh/xvkC3f2Bvy
         8dU048xOzPyD2sRImo5EsMANiQymtbYy5wEN7ruaNIY1XvsXtGD4zCu3RCO10kGGSIAB
         la5ITXOYS/gtQL2IFXAGrr0YeTOGJoFbvKi8L6bmf8jKPAVRq/uJN1BmDoVy53fCo9JE
         okksmL7w+I+UI2/q4LFVYnpPHe1pnjBpkme7xKpAE+ug2+PcT+F59xWBt6tB5Im8ef5+
         In7ha5SyjNpGPNg+qJ/0vcgsO7TF9YKpMqYdON2EZCc8SVltTxBNb1htnWD97tFPeWtY
         9DUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ysweUzLzeiCYFl+DLTVwTcwLOex2FvHGSV44HDG9Rl8=;
        b=ueGqpmspKvnzHsuMI1Vu4l4g5yiVQmp59CC/rK+bZSUjbmr2qy5KqSldUkdLx6EIPM
         cGJqRH4Qr55KiiZpQNmhz1XjxxVsiQIMYK/0fI6CzV67int7eB4pblGc5LUM84NGRcPA
         eZZeMxPDtojnJsy3WAUgasnIt2yL0SkpnfstkhNtd9gVBUCT3G/sAXmuGu2d2oAhBbO9
         yGzPklW9PTAGV+6IoO4z5qPVOwtFoFDPkfotaaFrnY8yUChCj5em8mWriszmyHQSmcB0
         C4bKLe62uGVzYdmpjjYaw6/187+ZMzZl8u38DsjNuU0ysHe+OnkbhnjOU3Ks9cYuzvU0
         tOsg==
X-Gm-Message-State: AOAM530TEWBAhdySZszWaBucabWbFjcx1kRl/f0YCjAQMAb5+ioYwXNe
        vsrw95eQklCcRKEUhZ0MQIg=
X-Google-Smtp-Source: ABdhPJziaNnLXDZSdJ0HBfRObisQoLwDfQptILQwO8z5btPpfBvBFO/Ps7odOJBuVKSVsvrBXJbQrw==
X-Received: by 2002:ac8:7559:: with SMTP id b25mr153998qtr.126.1610983706869;
        Mon, 18 Jan 2021 07:28:26 -0800 (PST)
Received: from localhost.localdomain ([177.194.79.136])
        by smtp.gmail.com with ESMTPSA id y67sm10854490qka.68.2021.01.18.07.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 07:28:26 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, peter.chen@nxp.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH RESEND] usb: phy: phy-mxs-usb: Use of_device_get_match_data()
Date:   Mon, 18 Jan 2021 12:26:15 -0300
Message-Id: <20210118152615.1644861-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The retrieval of driver data via of_device_get_match_data() can make
the code simpler.

Use of_device_get_match_data() to simplify the code. 

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Peter Chen <peter.chen@nxp.com>
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


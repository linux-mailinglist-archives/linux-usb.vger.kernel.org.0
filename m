Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBB5627D20
	for <lists+linux-usb@lfdr.de>; Mon, 14 Nov 2022 12:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237003AbiKNL4r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Nov 2022 06:56:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236958AbiKNL4c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Nov 2022 06:56:32 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5063B25E81
        for <linux-usb@vger.kernel.org>; Mon, 14 Nov 2022 03:52:15 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id be13so18858833lfb.4
        for <linux-usb@vger.kernel.org>; Mon, 14 Nov 2022 03:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7exiVCrJbaM9H+RqYL7LmV64o+Q+SRzu55CzL4HBG8=;
        b=NlqU7a5Rms7Kf+dRf9fj/RAcJYMVgYbgccJ41nRDEhxNwFkXz1flwK4D1V6YhFdG+8
         LsAKCKNNgkKp0UqQwYcQmx8Ng08xXgiiIP18GxkeGnR/ggPOsP1DPzaybFySgIppXthn
         bRaD9F4D9r6b2aQAWP5Or5dXjl3ZttLHcWr5Tup2UXfpybSpWWNABnxfi9oJYc52gFrq
         V0osDhi8G2rtJ36fP+ZxTgogx18D1hq5d7mf3v85AYezqHjta70DlGyvGNkpd3XDabdK
         xojC27P2dPTmvSZ+fv0YTkq5XErneMgyexBbLi5yIXgOC99hv2wSF+/XPf6nv8wKytIh
         FYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7exiVCrJbaM9H+RqYL7LmV64o+Q+SRzu55CzL4HBG8=;
        b=fDIV6KVfuBA2BUzpj7kpLbOqQcQdNgQzwcL11z2W/WDl8LP/1+u6JrR99vVT+ifeI+
         LFgz7cFQ20IpmQjOTHIqz37J1nhy/RIWAl+zEaneec5V1RVaCrJE0HEX3Q64NOvPkWt8
         BCOHe/1Qvkw6n2SPHE43cgOMLz6ShzDROOSLRMgFNZzn2jHOV/4G0sB/46Q9UD7WyXeU
         HzH+yoqXFKiPek+p2rzd/qVS70/GGB0Ef1eTD2b4ShypBe+gSh1KxemNBNqYl36+fvkQ
         egw+f56zg7gLmy8u4oNjHhowUAdTRELdJDLlzGCCAO0KqR2IZInvje9IQ3dbNscVGz2X
         6ToA==
X-Gm-Message-State: ANoB5plQAjZCbGo78I+zUF4BOY3+chwwsPbaX2l+M6MgNip4k2R/KEXX
        GLeBXgKVWC8Rh07Xc+TAjIQempKmcNCSiw==
X-Google-Smtp-Source: AA0mqf7CUNguB9m6WTIBXnmWrKskLozk/fLnIAN4ZwufexQSGY2VKnvYsxT6pRa3p5egCQcjxoddLg==
X-Received: by 2002:a19:7909:0:b0:4a2:4282:89c7 with SMTP id u9-20020a197909000000b004a2428289c7mr4192598lfc.437.1668426733676;
        Mon, 14 Nov 2022 03:52:13 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm1981531ljh.132.2022.11.14.03.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 03:52:13 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/4] fotg210-udc: Handle PCLK
Date:   Mon, 14 Nov 2022 12:52:00 +0100
Message-Id: <20221114115201.302887-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221114115201.302887-1-linus.walleij@linaro.org>
References: <20221114115201.302887-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds optional handling of the peripheral clock PCLK.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/fotg210-udc.c | 30 ++++++++++++++++++++++++++++--
 drivers/usb/fotg210/fotg210-udc.h |  1 +
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index 4026103330e1..de0f72ca103c 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
+#include <linux/clk.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/phy.h>
 
@@ -1132,6 +1133,10 @@ int fotg210_udc_remove(struct platform_device *pdev)
 	fotg210_ep_free_request(&fotg210->ep[0]->ep, fotg210->ep0_req);
 	for (i = 0; i < FOTG210_MAX_NUM_EP; i++)
 		kfree(fotg210->ep[i]);
+
+	if (!IS_ERR(fotg210->pclk))
+		clk_disable_unprepare(fotg210->pclk);
+
 	kfree(fotg210);
 
 	return 0;
@@ -1167,17 +1172,34 @@ int fotg210_udc_probe(struct platform_device *pdev)
 
 	fotg210->dev = dev;
 
+	/* It's OK not to supply this clock */
+	fotg210->pclk = devm_clk_get(dev, "PCLK");
+	if (!IS_ERR(fotg210->pclk)) {
+		ret = clk_prepare_enable(fotg210->pclk);
+		if (ret) {
+			dev_err(dev, "failed to enable PCLK\n");
+			return ret;
+		}
+	} else if (PTR_ERR(fotg210->pclk) == -EPROBE_DEFER) {
+		/*
+		 * Percolate deferrals, for anything else,
+		 * just live without the clocking.
+		 */
+		ret = -EPROBE_DEFER;
+		goto err;
+	}
+
 	fotg210->phy = devm_usb_get_phy_by_phandle(dev->parent, "usb-phy", 0);
 	if (IS_ERR(fotg210->phy)) {
 		ret = PTR_ERR(fotg210->phy);
 		if (ret == -EPROBE_DEFER)
-			goto err;
+			goto err_pclk;
 		dev_info(dev, "no PHY found\n");
 		fotg210->phy = NULL;
 	} else {
 		ret = usb_phy_init(fotg210->phy);
 		if (ret)
-			goto err;
+			goto err_pclk;
 		dev_info(dev, "found and initialized PHY\n");
 	}
 
@@ -1277,6 +1299,10 @@ int fotg210_udc_probe(struct platform_device *pdev)
 err_alloc:
 	for (i = 0; i < FOTG210_MAX_NUM_EP; i++)
 		kfree(fotg210->ep[i]);
+err_pclk:
+	if (!IS_ERR(fotg210->pclk))
+		clk_disable_unprepare(fotg210->pclk);
+
 	kfree(fotg210);
 
 err:
diff --git a/drivers/usb/fotg210/fotg210-udc.h b/drivers/usb/fotg210/fotg210-udc.h
index e3067d22a895..fadb57ca8d78 100644
--- a/drivers/usb/fotg210/fotg210-udc.h
+++ b/drivers/usb/fotg210/fotg210-udc.h
@@ -231,6 +231,7 @@ struct fotg210_ep {
 struct fotg210_udc {
 	spinlock_t		lock; /* protect the struct */
 	void __iomem		*reg;
+	struct clk		*pclk;
 
 	unsigned long		irq_trigger;
 
-- 
2.38.1


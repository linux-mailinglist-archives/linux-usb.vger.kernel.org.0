Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0891627D22
	for <lists+linux-usb@lfdr.de>; Mon, 14 Nov 2022 12:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237041AbiKNL4u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Nov 2022 06:56:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237000AbiKNL4c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Nov 2022 06:56:32 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B325124BD0
        for <linux-usb@vger.kernel.org>; Mon, 14 Nov 2022 03:52:17 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u11so12789970ljk.6
        for <linux-usb@vger.kernel.org>; Mon, 14 Nov 2022 03:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyU+TKJuyeZ4uZNx8LKOm+8a/rFdvv0uEXAlRDXnoqk=;
        b=vqkzWOw5wv0EZ2VceJ01cP+qBlni3kSVxvqEoek3e9YK2ghh5S3Ta7EwGHo/BS9rmA
         R2fNc6jpGj4gZ/Vqb3wavDH6eVRwyItaRm5d5i+SFneIVuagPKzXPQkcONJLb9PPLC16
         UT+fiVjdNJ+FjtmBN5zkffHbLys3Fbh7ryXs+m4d3mk4On9pYSLq1WkggEF9IwBhqKH4
         cqxjD+h9owR+ItJa85pC//36xYgt9LCJ63UeTgtM0OWzlOV5FHkrMC4n4kic4atR+6PI
         yte6g/yFJzrfkBl+kT8VefB18TYqch4Qr/n7QU2GfBG09guzKB8zGsj8X+UHhA2h4cvP
         F7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyU+TKJuyeZ4uZNx8LKOm+8a/rFdvv0uEXAlRDXnoqk=;
        b=Tu5GCX2rf9JPYrHBDEzM8RHurkSSJyAkdQleQofWoYYo7TSiIciYrcfmcc0ESkyG07
         +BfhqtDtW8il37LyBKCn1QKQtqHEiUuX0bxTiPFtFpgt8g5DVnCQU/1RgRboWoR9GNMD
         m4PUPhcgITFOAFhez3jRycGLpJKqLiyKvG4DqjwipgvShgQp8lgjENZNd0Ux5x8SrzG/
         v0CqzK90qpLOog99BMMVovyWPXbYRvTlCt5JgF3+Ik3UrzB+bdi+Cge/LBrQfJNfmg7t
         R8kG4WHy6eF3yU9ukC+UAfkFaRnNiMDs8kdzgc7HzUxvGrTp49SNrmcXRfgUJB/Q+sAk
         fxaA==
X-Gm-Message-State: ANoB5pmX1v9pLLn4r9xxzfrrTSuAn4tc9Usm7/+ZT/J1b/S2NybweTCG
        sZaEII+iNPmfgJL3ZoY7Zq+Kqw3VTxX0Tw==
X-Google-Smtp-Source: AA0mqf5hxgsrPgiw2s2iSSwrLwtU7J3XBTwnbTUlG8ZfTZbyRY6MBbe6xK5CcT7J9NoHOqFJxPYeoA==
X-Received: by 2002:a2e:80da:0:b0:277:5c6b:7653 with SMTP id r26-20020a2e80da000000b002775c6b7653mr4058420ljg.398.1668426736081;
        Mon, 14 Nov 2022 03:52:16 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm1981531ljh.132.2022.11.14.03.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 03:52:15 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/4] fotg210-udc: Get IRQ using platform_get_irq()
Date:   Mon, 14 Nov 2022 12:52:01 +0100
Message-Id: <20221114115201.302887-4-linus.walleij@linaro.org>
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

The platform_get_irq() is necessary to use to get dynamic
IRQ resolution when instantiating the device from the
device tree. IRQs are not passed as resources in that
case.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/fotg210-udc.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index de0f72ca103c..44dfe66e189c 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -1144,10 +1144,11 @@ int fotg210_udc_remove(struct platform_device *pdev)
 
 int fotg210_udc_probe(struct platform_device *pdev)
 {
-	struct resource *res, *ires;
+	struct resource *res;
 	struct fotg210_udc *fotg210 = NULL;
 	struct fotg210_ep *_ep[FOTG210_MAX_NUM_EP];
 	struct device *dev = &pdev->dev;
+	int irq;
 	int ret = 0;
 	int i;
 
@@ -1157,9 +1158,9 @@ int fotg210_udc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ires = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!ires) {
-		pr_err("platform_get_resource IORESOURCE_IRQ error.\n");
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		pr_err("could not get irq\n");
 		return -ENODEV;
 	}
 
@@ -1189,7 +1190,7 @@ int fotg210_udc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	fotg210->phy = devm_usb_get_phy_by_phandle(dev->parent, "usb-phy", 0);
+	fotg210->phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 0);
 	if (IS_ERR(fotg210->phy)) {
 		ret = PTR_ERR(fotg210->phy);
 		if (ret == -EPROBE_DEFER)
@@ -1267,7 +1268,7 @@ int fotg210_udc_probe(struct platform_device *pdev)
 
 	fotg210_disable_unplug(fotg210);
 
-	ret = request_irq(ires->start, fotg210_irq, IRQF_SHARED,
+	ret = request_irq(irq, fotg210_irq, IRQF_SHARED,
 			  udc_name, fotg210);
 	if (ret < 0) {
 		dev_err(dev, "request_irq error (%d)\n", ret);
@@ -1288,7 +1289,7 @@ int fotg210_udc_probe(struct platform_device *pdev)
 err_add_udc:
 	if (!IS_ERR_OR_NULL(fotg210->phy))
 		usb_unregister_notifier(fotg210->phy, &fotg210_phy_notifier);
-	free_irq(ires->start, fotg210);
+	free_irq(irq, fotg210);
 
 err_req:
 	fotg210_ep_free_request(&fotg210->ep[0]->ep, fotg210->ep0_req);
-- 
2.38.1


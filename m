Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53203627D1F
	for <lists+linux-usb@lfdr.de>; Mon, 14 Nov 2022 12:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236942AbiKNL4p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Nov 2022 06:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236923AbiKNL4b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Nov 2022 06:56:31 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E9724952
        for <linux-usb@vger.kernel.org>; Mon, 14 Nov 2022 03:52:09 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id h12so12815411ljg.9
        for <linux-usb@vger.kernel.org>; Mon, 14 Nov 2022 03:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=23J2rxW29+aENYRjYQO3CvbM83oXKeca0v4ut8EgLyc=;
        b=SSqYE2X6QeuX6Oc6rgira/TUu8ELeOHcfffGwFc1Jjku0sOgO4gIum4DoqTQNT5qNk
         hcbN7I69awhwye9HmUNBROziQ1TlnxA+U6LVOkFHQ3YIE9Bb7hXNRCPjotMA1gBy/+Wp
         wi2pmlaPqGtHVKecw5bV/vZenlc6Nvg+zwbCebB1fn9A2PuvdEO0SejLUp2A/BDu3dhE
         nmRZNsVyk0Rrir4Zc/D9H0Rku9EnlC/GUpOn4JLVtn2J7Vzm2xvZdwPAF3XDhvG8JCT2
         t0kXticvcPgHboc6IVMENf27bFBfyu6zKs2Lo7iXqID4R5R1+qrMNdkZ5w4iFiVyIeHl
         cZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23J2rxW29+aENYRjYQO3CvbM83oXKeca0v4ut8EgLyc=;
        b=iJev4WOPhpkh4sxIXagT4Y4ODIcuCG5wOeQRttp0NBdY8cWpsuVg4vPg4qWt0H3mtN
         g8Jm3EI5CIktlNxMIZ/gHvQ3C+RLTr+UKIxaM2PNclWtWaEckuFrVywhUDtdnNleKn8E
         NYHgKv4ZxGJ0iKVp0NBtUuRyBkMsrsofj79AvlqiRTRSQW8aYd9uttTw4FdMGpa4vqdp
         Iap2QRXdAbBE0CV6AR2+g3e3jchCxSrn17dXDRVuRoOeugEAunjgRQF8gMyU8EzODf71
         bD3LZXhwBBr0wxuKnpU1hM6Q16YuzatauumXQRK5Hi2vrBe2ju9FqTNs7F9PBqnflJCh
         AoLA==
X-Gm-Message-State: ANoB5pnsIDSY6PzLsuAm3rMt5lgQfmC+u30ct4BJBAjY0iFIVGrpIXRI
        MrRQzR7GeJMVneRNVjf8fGGxLEOl8U5FHQ==
X-Google-Smtp-Source: AA0mqf7XeSBAJW33aWa+cj4Lwq//cEDc+UOJ45dGGge6iVbcmhseP5juMhNmoC3w2qnm4TwB/KLfJg==
X-Received: by 2002:a2e:be0a:0:b0:277:a8b:4a53 with SMTP id z10-20020a2ebe0a000000b002770a8b4a53mr3849259ljq.197.1668426728192;
        Mon, 14 Nov 2022 03:52:08 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm1981531ljh.132.2022.11.14.03.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 03:52:07 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/4] fotg210-udc: Use dev pointer in probe and dev_messages
Date:   Mon, 14 Nov 2022 12:51:58 +0100
Message-Id: <20221114115201.302887-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
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

Add a local struct device *dev pointer and use dev_err()
etc to report status.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/fotg210-udc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index 3c357ce42d3b..b3106e4b3194 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -1091,6 +1091,7 @@ int fotg210_udc_probe(struct platform_device *pdev)
 	struct resource *res, *ires;
 	struct fotg210_udc *fotg210 = NULL;
 	struct fotg210_ep *_ep[FOTG210_MAX_NUM_EP];
+	struct device *dev = &pdev->dev;
 	int ret = 0;
 	int i;
 
@@ -1122,7 +1123,7 @@ int fotg210_udc_probe(struct platform_device *pdev)
 
 	fotg210->reg = ioremap(res->start, resource_size(res));
 	if (fotg210->reg == NULL) {
-		pr_err("ioremap error.\n");
+		dev_err(dev, "ioremap error\n");
 		goto err_alloc;
 	}
 
@@ -1133,8 +1134,8 @@ int fotg210_udc_probe(struct platform_device *pdev)
 	fotg210->gadget.ops = &fotg210_gadget_ops;
 
 	fotg210->gadget.max_speed = USB_SPEED_HIGH;
-	fotg210->gadget.dev.parent = &pdev->dev;
-	fotg210->gadget.dev.dma_mask = pdev->dev.dma_mask;
+	fotg210->gadget.dev.parent = dev;
+	fotg210->gadget.dev.dma_mask = dev->dma_mask;
 	fotg210->gadget.name = udc_name;
 
 	INIT_LIST_HEAD(&fotg210->gadget.ep_list);
@@ -1180,15 +1181,15 @@ int fotg210_udc_probe(struct platform_device *pdev)
 	ret = request_irq(ires->start, fotg210_irq, IRQF_SHARED,
 			  udc_name, fotg210);
 	if (ret < 0) {
-		pr_err("request_irq error (%d)\n", ret);
+		dev_err(dev, "request_irq error (%d)\n", ret);
 		goto err_req;
 	}
 
-	ret = usb_add_gadget_udc(&pdev->dev, &fotg210->gadget);
+	ret = usb_add_gadget_udc(dev, &fotg210->gadget);
 	if (ret)
 		goto err_add_udc;
 
-	dev_info(&pdev->dev, "version %s\n", DRIVER_VERSION);
+	dev_info(dev, "version %s\n", DRIVER_VERSION);
 
 	return 0;
 
-- 
2.38.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E1865CA67
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 00:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238405AbjACXfh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Jan 2023 18:35:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238337AbjACXfb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Jan 2023 18:35:31 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC4C1659D
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 15:35:30 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bq39so40175978lfb.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Jan 2023 15:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcCZcfMImVoguFifloAOWn9GN0CXlpPQ4S3kvfMhx2k=;
        b=LMzkaTaD9wctPIdbVm6QZUwZrtpXDiu7SaqEPqgdBxrAK6JScPBaGrLm/A0N01Lhiq
         /h0OmYwR4qgPuUZcg0MhoQMcXM8wZZxbV//ypdaaHphZ9dVEdqWMcg0FSCE80jX22uVM
         xIz43KghAFD0/iQECoyywpdcNddRH6WyU7KavDCrWnWEdv8Uh3MsXOJLcsh+tL9tr2Qq
         4S6lhVTVH9sb1JCGSuu3LZHNAC3/sXJ2Mrugam+0yG0CSodv0QHEPfusOYoT/sI+v5sc
         IG9UxCWX31XmP//ZJvOvpfu9sS0HxngRJtp5PLWnbYfsLBE7Rq1Oye3utnjwW+o2tF9w
         5r2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcCZcfMImVoguFifloAOWn9GN0CXlpPQ4S3kvfMhx2k=;
        b=WQEyLjYWQ1CvaflBTsFV9GSoACPjv0vG+blHOgKqUdylgi8UPJgf8RuDg8lHDW8gfg
         i6AmrCA+5RsnPNe98qMD0XfWKxWe+3CxBnjQEeLIsHKTD2w2JPIjBGbgxJ6rKSU1oFpC
         ey9qqZrWfB1xwCim3JlbZI6N5MKQItiZFvjEmXNedvc1/lH/9UfGJpEaJYVtX/soIox2
         3EH/T74B/0diyd1pmtXMsz8U1PxLuJQCUrNnny3z0zx+YqPa0g0L2Te6NO3q4ZKRzUty
         nNLpJOfDHApSSQrMi4XByyf8TRPrMsubxUEIsgpMUtlzLXUn1UgrLyS3ZvsGTh6nabsM
         tCtg==
X-Gm-Message-State: AFqh2kqEcE4CBqNyRxBWUqOL4ZGfdVDW8bIR5BiTpGYMPnBH2CQfFrhA
        +qTP4Vh7d//pTs3Wj13lC+KUjQ==
X-Google-Smtp-Source: AMrXdXvLdlUsU1PT4CQcHXR+z585RdhI7YL7h5GGKY8TbquQG03EMAnBetUu1yFg0GrQv7/0XuJYMg==
X-Received: by 2002:a05:6512:2393:b0:4a4:68b9:1a00 with SMTP id c19-20020a056512239300b004a468b91a00mr15548858lfv.40.1672788928996;
        Tue, 03 Jan 2023 15:35:28 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512070b00b004a45edc1de2sm4939801lfs.239.2023.01.03.15.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 15:35:28 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 04 Jan 2023 00:35:22 +0100
Subject: [PATCH 6/7] usb: fotg210-udc: Assign of_node and speed on start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-gemini-fotg210-usb-v1-6-f2670cb4a492@linaro.org>
References: <20230103-gemini-fotg210-usb-v1-0-f2670cb4a492@linaro.org>
In-Reply-To: <20230103-gemini-fotg210-usb-v1-0-f2670cb4a492@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Follow the example set by other drivers to assign of_node
and speed to the driver when binding, also print bound
info akin to other UDC drivers.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/fotg210-udc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index 6a4b94d26951..4099e7453112 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -1015,6 +1015,10 @@ static int fotg210_udc_start(struct usb_gadget *g,
 	/* hook up the driver */
 	driver->driver.bus = NULL;
 	fotg210->driver = driver;
+	fotg210->gadget.dev.of_node = fotg210->dev->of_node;
+	fotg210->gadget.speed = USB_SPEED_UNKNOWN;
+
+	dev_info(fotg210->dev, "bound driver %s\n", driver->driver.name);
 
 	if (!IS_ERR_OR_NULL(fotg210->phy)) {
 		ret = otg_set_peripheral(fotg210->phy->otg,
@@ -1071,6 +1075,7 @@ static int fotg210_udc_stop(struct usb_gadget *g)
 
 	fotg210_init(fotg210);
 	fotg210->driver = NULL;
+	fotg210->gadget.speed = USB_SPEED_UNKNOWN;
 
 	spin_unlock_irqrestore(&fotg210->lock, flags);
 

-- 
2.38.1

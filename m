Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676F067154F
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 08:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjARHpu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Jan 2023 02:45:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbjARHpI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Jan 2023 02:45:08 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EF763E21
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 23:09:39 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id x36so13684259ede.13
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 23:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGi6nevtBEvlgNue4HrSz3FnhFRGHNrkieQvtpQFYHc=;
        b=YtWCclO174QhyaMA5EVNNQLEWZVxz+9FPz49LoHxX2km/CLtESfB+9DI3Ioq/2Axmz
         ZIdzk2YypknjThU/8BJSCfqmXhoEtefbk2or5M0kiK0rhsMybkXbKV92/dpwpewYjKMe
         ZW8gR0PdnL1d6aDKso6qqZKbCSYwjg5Ay2BQxN93YOG2scLrRlPBe9oYcWi02CteNDPK
         rJiAPrxMv1jqH8YvB4R/0C8J3dBUHG2xj7Y072Bm/LyyBCa4jiK4ztQnApC012ubxC1G
         PA3j01E5IQ+lkOUrNXKe6E0ppjHgCXo99HP3+/2YXjJsTgIMHjEf7Em9bbIcITNwnd9w
         1pUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGi6nevtBEvlgNue4HrSz3FnhFRGHNrkieQvtpQFYHc=;
        b=ZyoRIDf4DIvaX29HKedSWfhgkKPNx7Wx5nVmYITmmZqJBUjHxUHLfcI8T8qIDmMVsG
         Y3wNWsKD9K0irLxSJVMidSyjij8qpLobOYIYTZycc9uFPHk1ZmP3s7noaFumKCh7KjXO
         XKuyZZLHcVdD6rTDeAzeU9d+hfM4lUB1YWtSdV8zCSPL5ofWnbQ7Xia4NACmEy6ys2zZ
         2yEk8nHzj16B/Oz1yE5Aqtjf91+HMiVKwlwcwvpI/W+3kPAdkrJBpJZBEwYPmBg/rA2w
         fye8JN9AVSN6rw58EKM2iQCrl27X+Qd30EDocXeAoqIbrVXZREwxD0k3HGT9nEuIHZHn
         +9zg==
X-Gm-Message-State: AFqh2kq0SuEZRwY3Q7jUvqe2ybIZRVjGvo5/0imfboNY0zJnixxI0niM
        hzRquiF+QB4unqr+FCdbbtNKGw==
X-Google-Smtp-Source: AMrXdXuwTSY8tCFZbjM9bYBnfxUsuHCctXu6vpXm8O9G6S2RSxRklk3QaVS88VNS2HuBjvhxm1j1+A==
X-Received: by 2002:a05:6402:3226:b0:498:1ca:80d0 with SMTP id g38-20020a056402322600b0049801ca80d0mr7193209eda.28.1674025777745;
        Tue, 17 Jan 2023 23:09:37 -0800 (PST)
Received: from fedora.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id bt16-20020a0564020a5000b00482e0c55e2bsm13596984edb.93.2023.01.17.23.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 23:09:37 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Jan 2023 08:09:20 +0100
Subject: [PATCH v2 6/7] usb: fotg210-udc: Assign of_node and speed on start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-gemini-fotg210-usb-v2-6-100388af9810@linaro.org>
References: <20230103-gemini-fotg210-usb-v2-0-100388af9810@linaro.org>
In-Reply-To: <20230103-gemini-fotg210-usb-v2-0-100388af9810@linaro.org>
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
2.39.0

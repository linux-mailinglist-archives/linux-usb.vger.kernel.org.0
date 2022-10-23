Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0963609410
	for <lists+linux-usb@lfdr.de>; Sun, 23 Oct 2022 16:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbiJWOt1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Oct 2022 10:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiJWOtZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Oct 2022 10:49:25 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E9C7BC03
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 07:49:23 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id bx35so3803241ljb.2
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 07:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8wDe9KgvrXZo013jmPUb5KGWC97pWXByjGKuNq2lqY=;
        b=sDfR+PyIL3h/OUjgjnvO+t2tuWRxbIu9kMdP3XO3lAFuvydSBXRG7PvAF5wcfM8ZAA
         S9yJ29N2lGp5cjT6jxmqrywOmagaUHPcPYZr7TW+xxIL2HUIr3hLIwGE0ucZ5hZ/fNgU
         0p4N7ZsOSZHqTCuKE04o3JLO6xT/LZ6iwg/KEBIre464oeTfzPBAr2bubCUsO7+85Sp+
         QDIGQu1Fshc54ywpaaxKpjlc2GhWWONZmATqyQRqKBEh8jhSH6GPYlhUY9n4ODcanGVy
         B7ViLv0zBGlivbJ5HjpFPXOmZuWOfdjghjk+4Vqouq4dO/2dkPlnAlnZdL3d+P43WtXv
         euFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8wDe9KgvrXZo013jmPUb5KGWC97pWXByjGKuNq2lqY=;
        b=UrvyZcik1HzazztLQV0FOTvbHiw32FHXqYLDc4d4wqeyEHjkDvaYjOV7d16UlzMJ3B
         vWGSRAhrDDq+DdQR44oNZhS7dbinul0Zd2RaN0haju71NO7inhm44DN36Zfc/JAl+0wq
         4rFUiunQgTlZe/Ov8c/6NY4ntXA8B7j93L7Son6UG+QKivCkDA5hqzrc1m3jyKatlAdI
         UVJs+/2LDqLYENP5fzzmZ79zWSswLxRnscRdSKrLE07deN4j4vcYCRu/WG/742Gl9E+k
         av6CmSRoM+4ZnDjYwizyw+2t0hvK9KwvNqak78Cman0AIbw0L/ZkoYTv+PK6OEQ/MvAS
         hkrA==
X-Gm-Message-State: ACrzQf3rAZx5UfqwNHOOluZuqBq9f9zBK/gXtA62LJheyQF24WDpGU7u
        f56ZrpX2pY1RjlHcqGGG1UXHoQ==
X-Google-Smtp-Source: AMsMyM4C8/1vHO6/Sx2Vo1PmVTG9u8ym2VzuFATPuzoRqJr7BIVSX1N5+GjnVgyFU3krto7UB5udmA==
X-Received: by 2002:a2e:b60e:0:b0:277:728:e748 with SMTP id r14-20020a2eb60e000000b002770728e748mr1061426ljn.346.1666536561429;
        Sun, 23 Oct 2022 07:49:21 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id bx13-20020a05651c198d00b002770909be0asm263127ljb.1.2022.10.23.07.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 07:49:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Fabian Vogt <fabian@ritter-vogt.de>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 3/3 v1] usb: fotg210: Select subdriver by mode
Date:   Sun, 23 Oct 2022 16:47:08 +0200
Message-Id: <20221023144708.3596563-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221023144708.3596563-1-linus.walleij@linaro.org>
References: <20221023144708.3596563-1-linus.walleij@linaro.org>
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

Check which mode the hardware is in, and selecte the peripheral
driver if the hardware is in explicit peripheral mode, otherwise
select host mode.

This should solve the immediate problem that both subdrivers
can get probed.

Cc: Fabian Vogt <fabian@ritter-vogt.de>
Cc: Yuan-Hsin Chen <yhchen@faraday-tech.com>
Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/fotg210-core.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-core.c b/drivers/usb/fotg210/fotg210-core.c
index ab7b8974bc18..3d07ee46f6d1 100644
--- a/drivers/usb/fotg210/fotg210-core.c
+++ b/drivers/usb/fotg210/fotg210-core.c
@@ -10,30 +10,37 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/usb.h>
+#include <linux/usb/otg.h>
 
 #include "fotg210.h"
 
 static int fotg210_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	enum usb_dr_mode mode;
 	int ret;
 
-	if (IS_ENABLED(CONFIG_USB_FOTG210_HCD)) {
-		ret = fotg210_hcd_probe(pdev);
-		if (ret)
-			return ret;
-	}
-	if (IS_ENABLED(CONFIG_USB_FOTG210_UDC))
+	mode = usb_get_dr_mode(dev);
+
+	if (mode == USB_DR_MODE_PERIPHERAL)
 		ret = fotg210_udc_probe(pdev);
+	else
+		ret = fotg210_hcd_probe(pdev);
 
 	return ret;
 }
 
 static int fotg210_remove(struct platform_device *pdev)
 {
-	if (IS_ENABLED(CONFIG_USB_FOTG210_HCD))
-		fotg210_hcd_remove(pdev);
-	if (IS_ENABLED(CONFIG_USB_FOTG210_UDC))
+	struct device *dev = &pdev->dev;
+	enum usb_dr_mode mode;
+
+	mode = usb_get_dr_mode(dev);
+
+	if (mode == USB_DR_MODE_PERIPHERAL)
 		fotg210_udc_remove(pdev);
+	else
+		fotg210_hcd_remove(pdev);
 
 	return 0;
 }
-- 
2.37.3


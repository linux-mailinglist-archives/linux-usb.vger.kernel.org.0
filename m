Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C545C59EC17
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 21:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiHWTU6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 15:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiHWTUK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 15:20:10 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001CB13DE6
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 10:58:53 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id w20so3278609edd.10
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 10:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=T6cPiq5aaTmDRXkb9IvTR4+yR7CfcU7U1kI+dKIE7L8=;
        b=Y3RomgNnHGHGivtLFQeqKi6DsKBKgv5X8PyknhAPVLF3R+vy+ORY9Ucmgq66pwtoZx
         ms4eeS9+I5wbX3E/bBZz2sZoJjzhXjE4+Y7qULeYZ4QMjdgx9cX9Qkhwg3MFBALUY75g
         NXn6K8iXrlDoa2ZG9VJcrteLebSIZcmQ4SJedXlMzLqh4Gr/24ekg3/bOT26+DwfeMWR
         6mrq+n0U7u+euuSw2vbmrWXJ+em986fkNxzNdamDI5U4WvY/3e7euOj7OBt7vIkGxLkS
         otqLK7Onj2ro9VadpRREX+q/qOLR2d3hoEw/X0mnenn9GcL43oaH3Y6fmwRZQMohntPs
         p+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=T6cPiq5aaTmDRXkb9IvTR4+yR7CfcU7U1kI+dKIE7L8=;
        b=spBF/8CFQj8+3cQYXvopkEKKGVNe1zwbmUba/FV7B9y2DC/YSLZGzTHcHjYmN+LpbE
         hMFNktQ7TjVI/Au5vLG6S3XMN+BiJxWZ8gW8Zv3Nw6X8I4IBnBOO564SRPG6zxwpSw23
         3psaE/DlUTDKs6z/gZMAr3EBXLq9ZAAJXKNOioKd44AV03GXsqQFlrMXp/Xb+q6Upz4Z
         LRmO4ECjW49VRBS44fiEffFbTHHqTvVJE0Cb3L5siFrjkPwtE0aMvxnD+wIv4v19VsFQ
         MaZDobsrg+iW8Efq5vO5rKEA72QQh9dt6lXMb3nybNA3JFEV+kZ5ibKTeKRri+YAOus4
         dpnw==
X-Gm-Message-State: ACgBeo1jjt4GKqrNQEWwuvXc7nP0fDokcVGA4b+xvFGkxVVHMppm4vod
        pRO9gKr+oOvqeD+LORDuktQ=
X-Google-Smtp-Source: AA6agR5Qla/Xjc0paAV7x2nnK5yePJejLYhbLPyjbfYdzsXV7ahAiPNqfCGdm3nE6WQqKk59dGmELw==
X-Received: by 2002:a05:6402:2791:b0:447:3193:6b13 with SMTP id b17-20020a056402279100b0044731936b13mr2117513ede.335.1661277531412;
        Tue, 23 Aug 2022 10:58:51 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7758:1500:8528:d099:20f2:8fd6? (dynamic-2a01-0c22-7758-1500-8528-d099-20f2-8fd6.c22.pool.telefonica.de. [2a01:c22:7758:1500:8528:d099:20f2:8fd6])
        by smtp.googlemail.com with ESMTPSA id x2-20020aa7d382000000b00446473adeacsm1760974edq.82.2022.08.23.10.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 10:58:50 -0700 (PDT)
Message-ID: <dfcc6b40-2274-4e86-e73c-5c5e6aa3e046@gmail.com>
Date:   Tue, 23 Aug 2022 19:58:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] usb: dwc2: fix wrong order of phy_power_on and phy_init
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since 1599069a62c6 ("phy: core: Warn when phy_power_on is called before
phy_init") the driver complains. In my case (Amlogic SoC) the warning
is: phy phy-fe03e000.phy.2: phy_power_on was called before phy_init
So change the order of the two calls. The same change has to be done
to the order of phy_exit() and phy_power_off().

Fixes: 09a75e857790 ("usb: dwc2: refactor common low-level hw code to platform.c")
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- switch the order of phy_power_off() and phy_exit() too
---
 drivers/usb/dwc2/platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index c8ba87df7..91febf0e1 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -154,9 +154,9 @@ static int __dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
 	} else if (hsotg->plat && hsotg->plat->phy_init) {
 		ret = hsotg->plat->phy_init(pdev, hsotg->plat->phy_type);
 	} else {
-		ret = phy_power_on(hsotg->phy);
+		ret = phy_init(hsotg->phy);
 		if (ret == 0)
-			ret = phy_init(hsotg->phy);
+			ret = phy_power_on(hsotg->phy);
 	}
 
 	return ret;
@@ -188,9 +188,9 @@ static int __dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg)
 	} else if (hsotg->plat && hsotg->plat->phy_exit) {
 		ret = hsotg->plat->phy_exit(pdev, hsotg->plat->phy_type);
 	} else {
-		ret = phy_exit(hsotg->phy);
+		ret = phy_power_off(hsotg->phy);
 		if (ret == 0)
-			ret = phy_power_off(hsotg->phy);
+			ret = phy_exit(hsotg->phy);
 	}
 	if (ret)
 		return ret;
-- 
2.37.2


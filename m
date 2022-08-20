Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE1E59AF44
	for <lists+linux-usb@lfdr.de>; Sat, 20 Aug 2022 19:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346750AbiHTRqH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Aug 2022 13:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbiHTRqF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 Aug 2022 13:46:05 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D518F18348
        for <linux-usb@vger.kernel.org>; Sat, 20 Aug 2022 10:46:04 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id u15so5483082ejt.6
        for <linux-usb@vger.kernel.org>; Sat, 20 Aug 2022 10:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=ZEVXl/bgk3l2LIbVLXv+dyViZALGBnGdxluHeWZ/GDA=;
        b=AKfEw7OlSubnLxoHxG7Tke5drUxWW5apVIM6lSw4JENYuj7owIU+RrYxMg+P5VlCay
         ZTJ8iXUojPC+NmWICtj/izCXZYvFLB44K+zjvMzLgUdGFCKPkvx9b6dsnmlUAM01xLNF
         63PMUM5uLzwGr9T2c2y+X5TdxcO2R3oMCocdZG/a59r2CMKPE6Qus9KXgZGSlnyUktM9
         o9iBlmLcQkZMgj4u0o/JgQMq8N93P3XIMb7qpRiYG55lSW0Dkj3FdKIxn8mMTDgxzAqb
         QmKBMvS6VDxDJHevBx65q2SgU10UeLLge5de2wZBZYwO0+Dx+mr4q8l33SG9VifRxX2L
         dBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=ZEVXl/bgk3l2LIbVLXv+dyViZALGBnGdxluHeWZ/GDA=;
        b=ekmwdK353Ke6ReeLO5oWqhxwG9oEzVQ3T2EmlH4TMRD8HmV6NI/M+F8TRGzj2+Rr6W
         M3h3OuDLz2r8A7A96f2XvLQslAFDnIml6VE1JyvMRCkegPkfzv2ARVkkiy+y6eUvcPfj
         4KXgWNVDPTKebSs5+V3mjAIiRDZEgzlh+ejB/vlU9Lsg31QLUneJM+kMssshJiHhYHDC
         c3tIO1Yfo073gW1KOC83HHyuKxKXWwU+LhaVHX9eoPuYQh7PNXxjdc2Jk80Z2q+1uXdK
         zWZTSfQvgT9ScUcd6PtaKzhfjI86UMtAKX0OCtKnjRv483EwL9tBn8Dqkj/RX+YxTsc0
         g1/w==
X-Gm-Message-State: ACgBeo2f3i2jQmdAf2ZeZ0YfEuFA/HRIauHEtXadYaVMF/uzRKZOmbYv
        HB+kS/iDlmUN+NzYiXmeDPJMWxBpefw=
X-Google-Smtp-Source: AA6agR66+3CdEe7tNI4BZR6JftgAp5LydKvu/vwmmMSf599YZ0S9hHUcrn+31Y9OGSC29YidyuC/Ww==
X-Received: by 2002:a17:907:209c:b0:731:27bb:da8c with SMTP id pv28-20020a170907209c00b0073127bbda8cmr7985070ejb.555.1661017563277;
        Sat, 20 Aug 2022 10:46:03 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c0bb:f700:3cb6:47a0:41b9:1531? (dynamic-2a01-0c23-c0bb-f700-3cb6-47a0-41b9-1531.c23.pool.telefonica.de. [2a01:c23:c0bb:f700:3cb6:47a0:41b9:1531])
        by smtp.googlemail.com with ESMTPSA id ky25-20020a170907779900b0073d68db09ecsm808003ejc.23.2022.08.20.10.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Aug 2022 10:46:02 -0700 (PDT)
Message-ID: <f5632bde-0c34-9696-e979-497ef4fc9556@gmail.com>
Date:   Sat, 20 Aug 2022 19:45:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] usb: dwc2: fix wrong order of phy_power_on and phy_init
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
So change the order of the two calls.

Fixes: 09a75e857790 ("usb: dwc2: refactor common low-level hw code to platform.c")
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/dwc2/platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index c8ba87df7..4db7a18a5 100644
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
-- 
2.37.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E35F14DBA8A
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 23:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350815AbiCPWN7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 18:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239288AbiCPWN4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 18:13:56 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239006334
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 15:12:37 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id r13so7054505ejd.5
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 15:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=d84l6wYcxRO0cEaO9IcZrp8h8jURQZcOK4qYQT4QMuA=;
        b=o7eEzQ+ASLlkjYaFVSPfsXli4290UKATThIPg/XT58iIlalM/ED/pWH2FP3/21sxDC
         0sKZtVS7ZqBIzNz2BY0YsCyP/M5L9S0/gEAR286IuOlWX7GA3X2f3rCvXEG9pMXaLza7
         VbCQPCsI4Cc2vHlkpwIjpRAgyy7i8V3ECLClT1bGmxAmgVbku1uhxZy/9AxnpvcHoqxc
         87mt/iaus9NyY3g+DW63xRR9oSRv9QiYYxk3y/2Mzoy903Djep8++gp6URP1JeP8VXHn
         RryY1TWIsjF9qbHjn7yjimFDaHShQOSSF6nWqMVnHgh0GHiZKzpD7VNkDpt0Lv7OL/Wx
         UqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=d84l6wYcxRO0cEaO9IcZrp8h8jURQZcOK4qYQT4QMuA=;
        b=trISXNIsCtjdYM42w8FQ2N4SGNOy4SV3y5VxFfyQqUxWO8VjjNW1v+61iAxZuQrn3Q
         j3VSs8Qb2zfA0nKPvZCIfdpx2y4OW5lx6L4MEp8C/KjQ915T6cDnLUtGmclS5slcLAbW
         N8uRy/qg/tAgM7D/BPKIB7YhpXJDyfcBBy/wG5SPb8vsIXyjf6/UTwcmwTpXO6wu69S3
         44P7D6X+bbOqYeXxqBCc/Axlz73CsNzvaJYOwcfiDOfLM9yALz5HLVYi5NflLpLfX3bp
         +GDvmQOq4TDChrSHqdLIWpLmUCRvuNMZPZVQrBQMObtGon6vtxSeosrGme3kAR6Ift2N
         itLA==
X-Gm-Message-State: AOAM530+0xyYzY66a331erVivehytzS2dSXPBp+xqUZWpeeT4ma8/UYT
        h1gCeKVMz3SMCNiJMfKfCTI=
X-Google-Smtp-Source: ABdhPJzy3/y1+m2wuz92O7wzDv8zztpXffG3dqpbRODppWqqPJBVfnzd79rWEYVEEKorP5Tz9n85vQ==
X-Received: by 2002:a17:907:6091:b0:6db:ef36:f0ff with SMTP id ht17-20020a170907609100b006dbef36f0ffmr1737966ejc.505.1647468755639;
        Wed, 16 Mar 2022 15:12:35 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b866:cc00:e490:2de6:a89f:9b66? (dynamic-2a01-0c23-b866-cc00-e490-2de6-a89f-9b66.c23.pool.telefonica.de. [2a01:c23:b866:cc00:e490:2de6:a89f:9b66])
        by smtp.googlemail.com with ESMTPSA id si13-20020a170906cecd00b006cded0c5ee2sm1478461ejb.61.2022.03.16.15.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 15:12:35 -0700 (PDT)
Message-ID: <5a364ad0-fb48-5a6b-c04f-479afbdca532@gmail.com>
Date:   Wed, 16 Mar 2022 23:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v2 3/5] usb: host: xhci-plat: create shared hcd after having
 added main hcd
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
In-Reply-To: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
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

This patch is in preparation of an extension where in case of a
root hub with no ports no shared hcd will be created.
Whether one of the root hubs has no ports we figure our in
usb_add_hcd() for the primary hcd. Therefore create the shared hcd
only after this call.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 649ffd861..5d752b384 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -283,12 +283,6 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	device_set_wakeup_capable(&pdev->dev, true);
 
 	xhci->main_hcd = hcd;
-	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
-			dev_name(&pdev->dev), hcd);
-	if (!xhci->shared_hcd) {
-		ret = -ENOMEM;
-		goto disable_clk;
-	}
 
 	/* imod_interval is the interrupt moderation value in nanoseconds. */
 	xhci->imod_interval = 40000;
@@ -313,16 +307,16 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (IS_ERR(hcd->usb_phy)) {
 		ret = PTR_ERR(hcd->usb_phy);
 		if (ret == -EPROBE_DEFER)
-			goto put_usb3_hcd;
+			goto disable_clk;
 		hcd->usb_phy = NULL;
 	} else {
 		ret = usb_phy_init(hcd->usb_phy);
 		if (ret)
-			goto put_usb3_hcd;
+			goto disable_clk;
 	}
 
 	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
-	xhci->shared_hcd->tpl_support = hcd->tpl_support;
+
 	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
 		hcd->skip_phy_initialization = 1;
 
@@ -333,12 +327,21 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_usb_phy;
 
+	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
+			dev_name(&pdev->dev), hcd);
+	if (!xhci->shared_hcd) {
+		ret = -ENOMEM;
+		goto dealloc_usb2_hcd;
+	}
+
+	xhci->shared_hcd->tpl_support = hcd->tpl_support;
+
 	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
 		xhci->shared_hcd->can_do_streams = 1;
 
 	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
 	if (ret)
-		goto dealloc_usb2_hcd;
+		goto put_usb3_hcd;
 
 	device_enable_async_suspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
@@ -352,15 +355,15 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	return 0;
 
 
+put_usb3_hcd:
+	usb_put_hcd(xhci->shared_hcd);
+
 dealloc_usb2_hcd:
 	usb_remove_hcd(hcd);
 
 disable_usb_phy:
 	usb_phy_shutdown(hcd->usb_phy);
 
-put_usb3_hcd:
-	usb_put_hcd(xhci->shared_hcd);
-
 disable_clk:
 	clk_disable_unprepare(xhci->clk);
 
-- 
2.35.1



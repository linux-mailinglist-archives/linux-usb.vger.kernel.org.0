Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0756A4CDCB6
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 19:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241752AbiCDSiX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 13:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241797AbiCDSiG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 13:38:06 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58EEA1D67C5
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 10:37:18 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id dr20so19203283ejc.6
        for <linux-usb@vger.kernel.org>; Fri, 04 Mar 2022 10:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=efc4guVCDN5LLszeccB5jtPV6jvB3vn6Khwu7Qxa6tM=;
        b=LZg6Jion2ZkKJ7hUMFyw4XZ+eubN222n4hmMpGu3OjwFYtLgKWGAMUUw85CQOYWYn0
         5LhbauI/dlm+oMaeSgFZKxR0WwnXFRTZZVzWFYFePGHQyywidN0AY4AlffOyfR36/KRN
         AMP/yVWp0+s/SGQjKnjJxWRjstZSnQzQt/4mp22RoI5p6I1QOnGdjiME/F5egK5DubKb
         7c4JH5/D1jtvjLTrORK5YUOYpVJmpw6j76/0M6WbgjfrdnWFY8JpTCaEeHjcXbhXuO+9
         2sy6du1YCle+8eb2IixVEkdjfebJ7bpxwp5FN5WT3AjHLOTX+6f25n4P+Dc4tDXbLYkC
         f5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=efc4guVCDN5LLszeccB5jtPV6jvB3vn6Khwu7Qxa6tM=;
        b=xDHSJtzapXsNyGFsNZkUMcE3m62luaQ5x8b+FSo1xJzZj/J0xMlQ/9KhnSSvtPBf5p
         Khu3OnxL1tjRWTbznXhN4NgQs8awcQkFmpqln8oH33+oU42RCF0NvlgDob0U5M6MzsQO
         QZHy5watw9y4CQNYaTH1BLj9Fwb8sFrZ0RI+LLt7wkT0LUfeV5GVXrzfEgbaBmlOo23X
         aw5W/6R++1kCVpAlg73n+lIUQkkr0TbtPRNuTnFrvQUocweD9Uhp+Mkew2xLj5ayuWsM
         ptHp3nuZ92ObGLn3AbqLt+RKmxu7ETl2i/hvmhev6m1EhidtNAQa7xqEY7Qkm2eFa4lW
         XVoQ==
X-Gm-Message-State: AOAM531s5vqn+s1/lNAAJW4Pr0p/rNtawplJ1PdjCYS/4L54u3GDRBcM
        fb0fSuZpFQM0M09iQgQOXv8=
X-Google-Smtp-Source: ABdhPJyvHiAA3DD5YgAzFHTnBnsK5rKnQbyYUO8i16bupKT9nZRDm1Ej7ZhF0RGK39BBKHO4rd0aDw==
X-Received: by 2002:a17:906:8616:b0:6ce:36ab:a289 with SMTP id o22-20020a170906861600b006ce36aba289mr44145ejx.127.1646419036915;
        Fri, 04 Mar 2022 10:37:16 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9fb:2800:c56d:9b34:f61c:e318? (dynamic-2a01-0c23-b9fb-2800-c56d-9b34-f61c-e318.c23.pool.telefonica.de. [2a01:c23:b9fb:2800:c56d:9b34:f61c:e318])
        by smtp.googlemail.com with ESMTPSA id s14-20020aa7cb0e000000b00410bf015567sm2344863edt.92.2022.03.04.10.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 10:37:16 -0800 (PST)
Message-ID: <ffee4668-f087-66b9-a52f-d2dddf617a77@gmail.com>
Date:   Fri, 4 Mar 2022 19:34:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 1/5] usb: host: xhci-plat: create shared hcd after having
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
References: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
In-Reply-To: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
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
usb_add_hcd() for the primary hcd. Therefore create the shared
hcd only after this call.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 8094da348..484c7fe3e 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -294,12 +294,6 @@ static int xhci_plat_probe(struct platform_device *pdev)
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
@@ -324,16 +318,15 @@ static int xhci_plat_probe(struct platform_device *pdev)
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
 
 	if (priv) {
 		ret = xhci_priv_plat_setup(hcd);
@@ -351,12 +344,21 @@ static int xhci_plat_probe(struct platform_device *pdev)
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
@@ -370,15 +372,15 @@ static int xhci_plat_probe(struct platform_device *pdev)
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



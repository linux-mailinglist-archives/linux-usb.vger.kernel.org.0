Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 983104DBA88
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 23:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbiCPWN5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 18:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234500AbiCPWN4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 18:13:56 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF6B63A7
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 15:12:38 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z92so3463822ede.13
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 15:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=Mbk9eDgtV28j0TWUuMi3KlCoJjoq5ox4im4qxu+j5Ck=;
        b=SmhRYRQhoXZPq4H8FSWuHTlBLFyJmoQ8H9PxDXvVqGz+Myc/4Kx9o0TKTuo1gXBIgl
         8lazzj1K2J7wvX/iEG3pOjANpIdSfgP5YCKS8nnCETMFlTFdpl0yF1M/64fl4tc+QR/R
         xszvesuLHTL1GJ7qJJZ0e2QV+W+C+Aseaza7EGvktqdlVs/nR0R7rQ0YwfL1HHIHElSf
         8OjHRgzHqND5IbDVDoT7YtTFW5FYTNy+P+/pomkyAPQbRegIVij728nORfjyVUooUZQY
         kSCry2bhKdTt+bkMl1liOGajsKjWctE0+Fyr4Y6RfABK01fcxqYnduOBON3/2DHl6Swt
         CocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=Mbk9eDgtV28j0TWUuMi3KlCoJjoq5ox4im4qxu+j5Ck=;
        b=k9cNFq6wPfCsVaO31Y98WpQxyXysauZSgECDUY28jMePAUwetotSoTePSz/rDC1ZFp
         tt4ZkL4JYEEUgiSjTVEUJRyadpjbhbjNucnwvApBCpCHohrde0GuBpWK+9qiJKVKJmoo
         9qzX42txQxeyOQ8GwDDKEeERtrMzP4ng3obc9KDJqH8ywN/hYR7qE1BDqffapTCpmew3
         nwAbEcJSD4C4a0YMI/gyzXLI7NZLLtGwMR8sv3Cfqm39/1lCk6FZY3u9Jf72d672sU5G
         wo07R5Hp5CgpfgRAsyrHj7PsHxqZe2ad/F7cNJeD7ig/Uqi4JEVJXS2L+r1M8cRZTOzs
         UK4g==
X-Gm-Message-State: AOAM530CuoH74H66n2u3n4w2Zh2iMJ4mM78ET3lx1N+mf01e0jiTy1oW
        Xs+VGFWFX2v203zdrZC/Q4g=
X-Google-Smtp-Source: ABdhPJyOYTPz8Lm6U+5GQXq3v/ePt7jRdvqzUwNvaWYE2Emf9uwGbx2vo9KvFKvzAOWYR5pDdSLSwA==
X-Received: by 2002:a05:6402:50cf:b0:418:ee57:ed9 with SMTP id h15-20020a05640250cf00b00418ee570ed9mr1494329edb.37.1647468756890;
        Wed, 16 Mar 2022 15:12:36 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b866:cc00:e490:2de6:a89f:9b66? (dynamic-2a01-0c23-b866-cc00-e490-2de6-a89f-9b66.c23.pool.telefonica.de. [2a01:c23:b866:cc00:e490:2de6:a89f:9b66])
        by smtp.googlemail.com with ESMTPSA id ec21-20020a170906b6d500b006d170a3444csm1424902ejb.164.2022.03.16.15.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 15:12:36 -0700 (PDT)
Message-ID: <506113fe-5bd9-bdd0-7858-2b702ca32d53@gmail.com>
Date:   Wed, 16 Mar 2022 23:11:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v2 4/5] usb: host: xhci-plat: prepare operation w/o shared hcd
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

This patch prepares xhci-plat for the following scenario
- If either of the root hubs has no ports, then omit shared hcd
- Main hcd can be USB3 if there are no USB2 ports

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 5d752b384..c512ec214 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -180,7 +180,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	struct device		*sysdev, *tmpdev;
 	struct xhci_hcd		*xhci;
 	struct resource         *res;
-	struct usb_hcd		*hcd;
+	struct usb_hcd		*hcd, *usb3_hcd;
 	int			ret;
 	int			irq;
 	struct xhci_plat_priv	*priv = NULL;
@@ -327,21 +327,26 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_usb_phy;
 
-	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
-			dev_name(&pdev->dev), hcd);
-	if (!xhci->shared_hcd) {
-		ret = -ENOMEM;
-		goto dealloc_usb2_hcd;
-	}
+	if (!xhci_has_one_roothub(xhci)) {
+		xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
+						    dev_name(&pdev->dev), hcd);
+		if (!xhci->shared_hcd) {
+			ret = -ENOMEM;
+			goto dealloc_usb2_hcd;
+		}
 
-	xhci->shared_hcd->tpl_support = hcd->tpl_support;
+		xhci->shared_hcd->tpl_support = hcd->tpl_support;
+	}
 
-	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
-		xhci->shared_hcd->can_do_streams = 1;
+	usb3_hcd = xhci_get_usb3_hcd(xhci);
+	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4)
+		usb3_hcd->can_do_streams = 1;
 
-	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
-	if (ret)
-		goto put_usb3_hcd;
+	if (xhci->shared_hcd) {
+		ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
+		if (ret)
+			goto put_usb3_hcd;
+	}
 
 	device_enable_async_suspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
-- 
2.35.1



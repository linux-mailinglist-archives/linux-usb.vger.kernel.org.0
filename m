Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1E314CDCB5
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 19:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237349AbiCDSiZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 13:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241813AbiCDSiL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 13:38:11 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609411D67C5
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 10:37:23 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id gb39so19215408ejc.1
        for <linux-usb@vger.kernel.org>; Fri, 04 Mar 2022 10:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=09N1QN49YKxRhEIn1LjCDFBtShHoPdeuFT9UB97L/Cw=;
        b=Dq+QfdPMGLA6HE1ym+z7hDcxBF6iwrTk2XShYDu2DGXGBdaGhKmeZGOJ88ej7U92lP
         zRXDk1UGs1qTDhhf4Q65bCVp2YSu76UGjiCbcVpL9CJHjrLLp4LdqIQDYVfErtGUp7Dx
         769BVNy/SzeTdpCaeRYdfxddWLc1WaNhwVAIffV6Zqrf0JUNWhP+75ug9YABSRPsVHWv
         sp2UKAhaKDOoJRfYzEHf9lTxOXDeFsj3FyLce0z/F/yj3LFCsHjpPpu4ycyNKfda/zl/
         5dD8h1ofH/q7fq5wxzyBrheSQPAMWeALb2unU3CowR4RcSb5UyhwLfL43MEv40B9ZlEL
         ocqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=09N1QN49YKxRhEIn1LjCDFBtShHoPdeuFT9UB97L/Cw=;
        b=g/98jsZnlJDdkX2qv1aVd7+0J1TCYADhsFvsqHEdeEQKCWN6oUboDg6XwTqGyZyJaj
         ZEREAQ92JKiNaW3aFeugYXr3soS8kOU2PntDDR/GVIhyk8wbbEXSgDDmoJndCgM7k5oR
         IwSpY/PiTG7TN2D5+WWzqoJm6kOa261m8muzkGnTwnxJxZ5BCessOWfx6KbqBwyqXdTu
         2Gkewb+Es/tXbJ0+d7/JF9Xyda57JF6FXPnzKcSRuC/gdlN4uTKNTGAZXNHI1+c8nIVM
         W9Wt+wi6uCSzsr8FudNioxGMxMYLTqw7ShWBW3soYDXrgkbxLpNTStp67Xcwl4Ag6wue
         YGsg==
X-Gm-Message-State: AOAM530A0yiRrjcAOe15Vvw50JcS5G1G41kfcFFuz8NKQ9R8duqp0XyL
        2/OUMIuu969NEQRzo0WM54c=
X-Google-Smtp-Source: ABdhPJzeJcGwu1DKue/A6+wQ2Hnx/O0WYJ3eZscuyHECzbbA79iTk3Y/ds1fUUSYaBfzJJAf6UzaKg==
X-Received: by 2002:a17:906:aed4:b0:6da:aa56:c923 with SMTP id me20-20020a170906aed400b006daaa56c923mr80865ejb.148.1646419041874;
        Fri, 04 Mar 2022 10:37:21 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9fb:2800:c56d:9b34:f61c:e318? (dynamic-2a01-0c23-b9fb-2800-c56d-9b34-f61c-e318.c23.pool.telefonica.de. [2a01:c23:b9fb:2800:c56d:9b34:f61c:e318])
        by smtp.googlemail.com with ESMTPSA id f6-20020a50fc86000000b0040f614e0906sm2383081edq.46.2022.03.04.10.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 10:37:21 -0800 (PST)
Message-ID: <854f54a4-44bc-2a54-89e9-ae2486068d35@gmail.com>
Date:   Fri, 4 Mar 2022 19:36:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 4/5] usb: host: xhci-plat: prepare operation w/o shared hcd
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

This patch prepares xhci-plat for the following scenario
- If either of the root hubs has no ports, then omit shared hcd
- Main hcd can be USB3 if there are no USB2 ports

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 484c7fe3e..0177d8564 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -191,7 +191,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	struct device		*sysdev, *tmpdev;
 	struct xhci_hcd		*xhci;
 	struct resource         *res;
-	struct usb_hcd		*hcd;
+	struct usb_hcd		*hcd, *usb3_hcd;
 	int			ret;
 	int			irq;
 	struct xhci_plat_priv	*priv = NULL;
@@ -344,21 +344,26 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_usb_phy;
 
-	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
-			dev_name(&pdev->dev), hcd);
-	if (!xhci->shared_hcd) {
-		ret = -ENOMEM;
-		goto dealloc_usb2_hcd;
-	}
+	if (xhci->needs_shared_hcd) {
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



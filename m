Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE3B87473B7
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jul 2023 16:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbjGDOJq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jul 2023 10:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbjGDOJ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jul 2023 10:09:28 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1FB6119
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 07:09:16 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc6ab5ff5so54034695e9.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Jul 2023 07:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688479755; x=1691071755;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oIGU+ozIO3paTEyKxH3vTYeSNSxsHSAjxm+XkAQu3uI=;
        b=Fkb+4Jr9U/QktwlkKJ89eVRmLLvj8654lI+8tNecV1clBvxMJXwSkvXWrnllZsL5Gu
         NEi/KagGsXfAUxjO9maUCLd//SZUNIMEvLn3WXkDIPexnkq3vf4F96sHjMxNVPVHZ+aV
         hplis3EQqCWJIyzSXxLDHnPf0vBot58rA/cLBeynhCCWyyHDk3Jy6vPMyEbJkLFtuYSE
         9v50tl/Yoj+/NC5Ua5LWZ/Efo/f1jPPNzAFvGNmEA0gohCLS0U2gEB+EJ8SRcHNd5T+i
         7WsWQ42xcC4h9FUGsA7MKfPUOFlbHZg6GT9PfnpVRZvZdNaz0IYMbZHVRKRd/p/RRlAN
         0K6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688479755; x=1691071755;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIGU+ozIO3paTEyKxH3vTYeSNSxsHSAjxm+XkAQu3uI=;
        b=Ya6Z68ChkfufiWhVGexuksABJGkwVEij52iX0UH86wk2M/M+fEOavj1FB1FAUlqOsm
         G4XsrGpy6j9yTFw1V929tZA/o6Nnab0ytddKVBjMLyiE+b/R+qRo7fK2tpZ6RGcBFpo+
         jMEWQd5gK3pUbwdqvQpYdAlCXnWEw+8+UitKTBRqk+JwUxrIHBunW6WzjNjicMEs7Mca
         dI4/SigEAt0SE/NiOQjLiA2pKobWL/w4QMRrFn40sP6mYg+dxhuZBbGbniSuf6J6Dcee
         vgYTaBpRubJpnSqodaYgToWgmjctMJ66RJQc+tfhLnDB4ffUl0yRizcdsAo3LmQN0EUc
         kl2A==
X-Gm-Message-State: AC+VfDzPVL1L69X1ZG3rlOnh8AASNfUe81U7opumO3tNL26I+FozF4N8
        xt+I3JwD3xkMiyO/wCqV0VShMQ==
X-Google-Smtp-Source: ACHHUZ6i0D1q3zY8REWtXtWMwnL+5jmpzWnT0HBZul57idM6AIrA7ojQBPv9vPsxPcb0FTlkr7nN6g==
X-Received: by 2002:a7b:cd8f:0:b0:3fb:a1d0:a872 with SMTP id y15-20020a7bcd8f000000b003fba1d0a872mr11743025wmj.20.1688479755436;
        Tue, 04 Jul 2023 07:09:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y23-20020a7bcd97000000b003fbb2c0fce5sm17707338wmj.25.2023.07.04.07.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 07:09:14 -0700 (PDT)
Date:   Tue, 4 Jul 2023 17:09:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Wayne Chang <waynec@nvidia.com>,
        Sing-Han Chen <singhanc@nvidia.com>,
        Jim Lin <jilin@nvidia.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] Revert "usb: gadget: tegra-xudc: Fix error check in
 tegra_xudc_powerdomain_init()"
Message-ID: <ZKQoBa84U/ykEh3C@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8baace8d-fb4b-41a4-ad5f-848ae643a23b@moroto.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit f08aa7c80dac27ee00fa6827f447597d2fba5465.

The reverted commit was based on static analysis and a misunderstanding
of how PTR_ERR() and NULLs are supposed to work.  When a function
returns both pointer errors and NULL then normally the NULL means
"continue operating without a feature because it was deliberately
turned off".  The NULL should not be treated as a failure.  If a driver
cannot work when that feature is disabled then the KConfig should
enforce that the function cannot return NULL.  We should not need to
test for it.

In this driver, the bug means that probe cannot succeed when CONFIG_PM
is disabled.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
My patch also is based on static analysis and reviewing the code so,
you know, probably best to be careful all round.

 drivers/usb/gadget/udc/tegra-xudc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 83eaa65ddde3..df6028f7b273 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3718,15 +3718,15 @@ static int tegra_xudc_powerdomain_init(struct tegra_xudc *xudc)
 	int err;
 
 	xudc->genpd_dev_device = dev_pm_domain_attach_by_name(dev, "dev");
-	if (IS_ERR_OR_NULL(xudc->genpd_dev_device)) {
-		err = PTR_ERR(xudc->genpd_dev_device) ? : -ENODATA;
+	if (IS_ERR(xudc->genpd_dev_device)) {
+		err = PTR_ERR(xudc->genpd_dev_device);
 		dev_err(dev, "failed to get device power domain: %d\n", err);
 		return err;
 	}
 
 	xudc->genpd_dev_ss = dev_pm_domain_attach_by_name(dev, "ss");
-	if (IS_ERR_OR_NULL(xudc->genpd_dev_ss)) {
-		err = PTR_ERR(xudc->genpd_dev_ss) ? : -ENODATA;
+	if (IS_ERR(xudc->genpd_dev_ss)) {
+		err = PTR_ERR(xudc->genpd_dev_ss);
 		dev_err(dev, "failed to get SuperSpeed power domain: %d\n", err);
 		return err;
 	}
-- 
2.39.2

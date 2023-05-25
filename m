Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 157987106DA
	for <lists+linux-usb@lfdr.de>; Thu, 25 May 2023 10:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236207AbjEYIFd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 May 2023 04:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235019AbjEYIFb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 May 2023 04:05:31 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C59E183
        for <linux-usb@vger.kernel.org>; Thu, 25 May 2023 01:05:30 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f603ff9c02so1916285e9.2
        for <linux-usb@vger.kernel.org>; Thu, 25 May 2023 01:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685001929; x=1687593929;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XEaBmzb77Yfj4NT5Cv6mQfZ6VRH3pcFg5KkRGTmBOZ8=;
        b=A0u68dVhg/5A0DP6/oeFiqIA7ss/S/4G1tOj0bHIIenfPcYcQZ1xGxadrD02u80RVR
         Nmido22xyDD7a8nwx6X/pSQ7u1cEe69fpyAtMHCHbuJ+MY507gqScGIa6P2kpuyRNPhe
         CZrrJr8Oblb0+VCOStG4Sf0Rc9R+/ZssjRk/eYS+0Db8b1GJSN1rlb5/IEizYjS0RyMw
         +O3NZcV3rt2w+cZyr8Ip4nH6yxzD1nqrfBAvoPF6ZwTQgGlZc5HgONcAlMklThl+5eq/
         ULmAYlWEWFbtEgNwT8WL3aP2z/wFQptVVKsOD/48OlpBB+delvkNHL+pDyvMSzzlkSCm
         QiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685001929; x=1687593929;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEaBmzb77Yfj4NT5Cv6mQfZ6VRH3pcFg5KkRGTmBOZ8=;
        b=Y6ply67ZE6QaAB3/NWt0CFOcGqLHYYBh8ixAGhC1+Y0RPnEYJnJYHlXbiGW7+9JOnj
         Yhfr8ONbTrkwW972EsiSeiera43jdWjj9gIain2Rly6LbLslZZiGLsG5KBFTKjU6678j
         fc6OF+BZsRp0Ny7ef+AOJlOEb28z8IcaWyyWbyRTl4FxGNZjGtO/OQTrF0GqhLkOa6UI
         nD9MwXSaARMRitTgNZV3AsMJ8LjKmCygbCKU1OQrZaTjSS5DxLIAivDiqP6uWSAPit5l
         A4jidngrKQ7OOKrfkqTGicR0M64tjjXJL955IcYeMNmdImKs/34DfZbxDKcLIXawT3uS
         /tEg==
X-Gm-Message-State: AC+VfDwZP7yj1/nxdeJcqPhSHDQBlWlTUbeaTrbsACZCDY99jmW3NvEa
        xmbP88wmF/liCIocw4aNyEceog==
X-Google-Smtp-Source: ACHHUZ5O8zLR7hgpDa++vgvNxVPsuKlJj3giFo2RNRpcZa5gxEBB6tIO3W6VDK0VNufvUi9m4R2EJA==
X-Received: by 2002:a1c:7415:0:b0:3f6:11cb:4926 with SMTP id p21-20020a1c7415000000b003f611cb4926mr2255542wmc.22.1685001929090;
        Thu, 25 May 2023 01:05:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s15-20020a7bc38f000000b003f6028a4c85sm4779312wmj.16.2023.05.25.01.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:05:27 -0700 (PDT)
Date:   Thu, 25 May 2023 11:05:24 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Felipe Balbi <balbi@kernel.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: phy: tahvo: release resources on error in probe()
Message-ID: <80496b6d-990e-4fb3-808b-daf3143cef15@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We need to do some clean up before returning on this error path.

Fixes: 0d45a1373e66 ("usb: phy: tahvo: add IRQ check")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/phy/phy-tahvo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
index 47562d49dfc1..5cac31c6029b 100644
--- a/drivers/usb/phy/phy-tahvo.c
+++ b/drivers/usb/phy/phy-tahvo.c
@@ -391,7 +391,7 @@ static int tahvo_usb_probe(struct platform_device *pdev)
 
 	tu->irq = ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		return ret;
+		goto err_remove_phy;
 	ret = request_threaded_irq(tu->irq, NULL, tahvo_usb_vbus_interrupt,
 				   IRQF_ONESHOT,
 				   "tahvo-vbus", tu);
-- 
2.39.2


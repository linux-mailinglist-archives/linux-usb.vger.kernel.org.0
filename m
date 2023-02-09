Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79312690ABF
	for <lists+linux-usb@lfdr.de>; Thu,  9 Feb 2023 14:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjBINoL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Feb 2023 08:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbjBINoJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Feb 2023 08:44:09 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D013C1A;
        Thu,  9 Feb 2023 05:44:06 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id m14so1777038wrg.13;
        Thu, 09 Feb 2023 05:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/4DTmXFwApA8waMAf0L62/W+9hAErlR/ehQjcCNwjq8=;
        b=SvqxnUsaAdjvzlWfwPu/6gggRtVTPcNgg4vTkSpOYYCWLJnY5AGKEm9JCFeIZJ/2eq
         hqfL22GNZvV1MtHa2jAktMJ1BoqRkK+6HV1Y7+uwIEQXJn7A327RXTO6IWHdZjb6yzyT
         RDMm92avX+sr6Ag8CERaZDPblMOgZdEBVszp624kZaPPA95BfO1RYizGiZmJKImxdyJG
         wHe/aFiQKZd4IZIkm8Q9eacZUV/YPvCvQNY3Om/6EMiGluSDoCSwYytZ2VyKAK+y57eI
         +UYzvVHpKsCLgocQecprFxEy0X9BW4+e/qhMs8yfeA4h48eSPbjEl9JCVc1/FvH8O+Kf
         SlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/4DTmXFwApA8waMAf0L62/W+9hAErlR/ehQjcCNwjq8=;
        b=nirQWgmYyPlgNi+oKds0uEAZpOc/V+MPvHm9G24ftcxL79BX88jiUb2YjDY3bVXkgD
         sjjATyGK5WQE9F253qw0UTN136A45GJoLxdPxWhc+KSzTjxLSvVC8s3lLTSEbovEk6UQ
         4AQpiFxUFqU6RYtJZK947jlPvRmwdd1zZON6r5rg3YFEhrj6l3xSpA0KqiLRoFIdncw3
         K+UBhtFYF/AgpGIAq4ZzhbWhjnVA9by+tdOlc4IV88Qivpb+1Tz7khiqHSW/QwB+wO9Y
         p6t9lf2PKzGtlxUBZpX/UCOnSCNcaIjYPQ1L6BS1gLr7aAEmFKJFZyIj1hvvXhwIMbFR
         Z7Ew==
X-Gm-Message-State: AO0yUKWklNR5BKxZRw8jZIFgEky3IqfcW+2dAZIYbrVqM5bE814Gc3La
        YgCjTQpsx6LO4fu5dw9DyPY=
X-Google-Smtp-Source: AK7set/oGb0BPv+y6CypTmY1t5MFOnwlR8lInTjUEIKOguf0oQ84U9/Dznvkm4bghiG/CAs9NlNAjA==
X-Received: by 2002:a5d:510e:0:b0:2c3:e4f5:18c with SMTP id s14-20020a5d510e000000b002c3e4f5018cmr9673087wrt.30.1675950244957;
        Thu, 09 Feb 2023 05:44:04 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v2-20020a5d6102000000b002be5bdbe40csm1290080wrt.27.2023.02.09.05.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:44:04 -0800 (PST)
Date:   Thu, 9 Feb 2023 16:43:45 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] xhci: host: potential NULL dereference in
 xhci_generic_plat_probe()
Message-ID: <Y+T4kTcJwRwxNHJq@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It's possible to exit the loop with "sysdev" set to NULL.  In that
case we should use "&pdev->dev".

Fixes: ec5499d338ec ("xhci: split out rcar/rz support from xhci-plat.c")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index cd17ccab6e00..b9f9625467d6 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -368,6 +368,9 @@ static int xhci_generic_plat_probe(struct platform_device *pdev)
 #endif
 	}
 
+	if (!sysdev)
+		sysdev = &pdev->dev;
+
 	if (WARN_ON(!sysdev->dma_mask)) {
 		/* Platform did not initialize dma_mask */
 		ret = dma_coerce_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
-- 
2.35.1


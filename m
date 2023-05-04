Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2F116F6E82
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 17:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjEDPA3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 11:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbjEDPAJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 11:00:09 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44917900D
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 07:59:35 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-306f9df5269so427152f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 04 May 2023 07:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683212370; x=1685804370;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2DVPTtRLE7vhONkGU6O8/IrbGHqrgyGLWCXCIuAQz8U=;
        b=Nfk0qxpn/0iP4LfqMOqHbjYvzHbHPJgvPd4+KANA20In8OGV3ZPwFY02Pz3V15eA++
         kz+55K9u62P2k+NJ2gzOpiQULuMo8pjwWd5e27SkkvcURwTwME392f4j4lz8R8gneTZc
         fvLx7aiccyRW5p6iiFK0+WsHqTvAa9OuOldpLVtb2Vatg+DjNGsUvqyOUy3SmK2YjlGh
         91WLrewhKydHTznO2RmuZVtpKgIo5PzmNVRGtPXVu7PsIxj7PGFnFRrv2JMqZqzYTCNd
         dq6XUfpv8JZ7hamZHr1947z76q2q/ZzPNJEtLlmZdmAf0+bnFyQgPBjC4DSjkbSO10X6
         cuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683212370; x=1685804370;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2DVPTtRLE7vhONkGU6O8/IrbGHqrgyGLWCXCIuAQz8U=;
        b=jg/l7TPHQccZ7n9AC2caeKDwrEuzuapI06zCDsJgBKQyFW/z3kaJE7m6UPNWvWH1YX
         mmMVqBwcQtSQG8YCZJXz6pQyn3GGQhDePh0Lj8Mgg+gKcQ0GKYbn1fC7pGVjkdwkY/g9
         y/JVB6HLrRvig/40c6JgFeENa0fBfhVfzIKC8VZT3cKxqE3doDqeDvWvWs77JPTyoBPv
         QRqpxDHdAE/iMpYnioxzZtO0mLdT4Fwl5BthwqW1T+5qdD6d3CEiYQ72SV7tPTKHNjbb
         IfvxXVGYM52/Jn1a7mAYNYwFfrE+zcyZ8IbgTTXrVMjamkZL11S1rsj+7siQDNTiok5O
         36Dw==
X-Gm-Message-State: AC+VfDzT6oZCw5xwuCfchk+6JdjlDZkWwExzX9ueLDOUWmn0SHHZJBdY
        NHUHTieSAAEiB3YHL8NIE2Zj0g==
X-Google-Smtp-Source: ACHHUZ42nVccQHdJ7yViR0Mn2loZHBdE+qHdvwMLrqt/JbVuQSPlCto/pVCZJ+12DWsKcs+iMA3jmg==
X-Received: by 2002:a05:6000:1185:b0:306:27bc:f906 with SMTP id g5-20020a056000118500b0030627bcf906mr2508689wrx.67.1683212370382;
        Thu, 04 May 2023 07:59:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s3-20020a5d6a83000000b002fe13ec49fasm36891858wru.98.2023.05.04.07.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 07:59:29 -0700 (PDT)
Date:   Thu, 4 May 2023 17:59:24 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: dwc3: fix a test for error in dwc3_core_init()
Message-ID: <d0c5a04f-deee-4ebe-9b0b-dc5492564519@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This was refactored recently and the "ret = " was accidentally deleted
so the errors aren't checked.

Fixes: 1d72fab47656 ("USB: dwc3: refactor phy handling")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/dwc3/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 0beaab932e7d..7b2ce013cc5b 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1137,7 +1137,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 
 	dwc3_set_incr_burst_type(dwc);
 
-	dwc3_phy_power_on(dwc);
+	ret = dwc3_phy_power_on(dwc);
 	if (ret)
 		goto err_exit_phy;
 
-- 
2.39.2


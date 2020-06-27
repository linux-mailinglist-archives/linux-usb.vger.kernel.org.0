Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2474F20C0C8
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jun 2020 12:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgF0Kb5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Jun 2020 06:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgF0Kb4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Jun 2020 06:31:56 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D300AC03E979
        for <linux-usb@vger.kernel.org>; Sat, 27 Jun 2020 03:31:55 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id f8so594332ljc.2
        for <linux-usb@vger.kernel.org>; Sat, 27 Jun 2020 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ym/jGfC/wRYbBSqIgaHGmxMOp5pNXvITAvz7DtiXLU=;
        b=wVuDw1KKoMJ9piLqGC1AOt3j9eeW4UNdFNsTUjPYuinyrELoHLOB0xaOuzWCxqYh8l
         XTSTqhYYpivdqmENnj2O1N1V1G4lkdFOJZ6L+Ij4iO7c85R/jC8lgBipZUcNQUbIPcp3
         RW5GsJw6NBjjFAaC6ccp5q3zvfpYjVOj2uZzTdK4xAdXbHgioQqxyonDLosW+9ho6jiA
         asQ8qvYPdxZ4qm/xypvkkHV2QXJow7ncspHVvVdjvHFpedFOSZ+DegM8RoNcS0bwwSdF
         pmJerdduDk1b5kPucOLLIrV5xA2wPaOTjFmNWwwR4T0s+pUXwHzgMo7C50A8S/yuyeJw
         OtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ym/jGfC/wRYbBSqIgaHGmxMOp5pNXvITAvz7DtiXLU=;
        b=EgiQ5LGeIWJlieVBZdege3FUtOSwCWc26a03PVkqsS9YBqkcIbCP9pQAhICicwehvj
         1F4eDGre9ZzcsYz0/CVtXaKIk1cfVhlFPB7lDfYtgdJedfeihg/GMYo9CatBqgmxjy2L
         TBEVWsRV6RdDsZMlbYzV1clyhN8VdXPwaSqP4UQtEpv1D8fvfP3x/yzZmjvvit/kD4Iu
         9GxnwuQDVBIJDf5kDwcRvlwvgMqL+LwHyGzGwAMv6egYqD7FydtL4PIZ/DR2PzKGwcNO
         mGkIT5T0EZT9a0MzTIr/pN7iHrNxqmw28kNdNpfdG1DqMmPqZETu32j+egp5qcfPOpgd
         CcNw==
X-Gm-Message-State: AOAM531U4fEYj48lb/LOeU9ALpZr67LsTT0w1+GTDSJaT8AmGs/EMEFY
        jFYf3lqbacZk9UKCi5wiU8/VvQ==
X-Google-Smtp-Source: ABdhPJx9VcfuN96sy/lJSJR8oULXrTpqM7H3hbI7fgcyMjcko8HSfEsx5qPmw9cg9TP6n2ZnELkrkg==
X-Received: by 2002:a2e:9a44:: with SMTP id k4mr3418120ljj.139.1593253914344;
        Sat, 27 Jun 2020 03:31:54 -0700 (PDT)
Received: from genomnajs.lan (c-d63ee155.152980-0-69706f6e6c79.bbcust.telenor.se. [85.225.62.214])
        by smtp.gmail.com with ESMTPSA id f5sm6974244ljc.99.2020.06.27.03.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 03:31:53 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] usb: gadget: udc: Drop surplus include
Date:   Sat, 27 Jun 2020 12:31:50 +0200
Message-Id: <20200627103150.439132-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The UDC NET2272 driver includes <linux/gpio.h> but does not
use any symbols from this file, so drop the include.

Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/gadget/udc/net2272.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 928057b206f1..bb4471152930 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -9,7 +9,6 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/errno.h>
-#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-- 
2.25.4


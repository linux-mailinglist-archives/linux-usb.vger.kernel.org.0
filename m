Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD253391857
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235002AbhEZNCn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234289AbhEZNCd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:33 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8690CC06138A
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:58 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id q5so1051025wrs.4
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KHHS+1f8u9j5b2K6D8nWWJ9Ja8sSbiW1E3dlvhtlLBY=;
        b=YdrcsCUq4brY2yobkX1/GUAIJXjIThXIDSYtUILPMJ59oHikTJJPOJk1KVRV4C/N1/
         iU/2WvkrVWitvghGCE/UXvluwkqQX/mu2U5XDgxqePLxUNyQnQJrcn8Mcy6xWZ47u+sW
         pjoVRMNu4yYUclNsmy9F0WlBUKG6T4DzwKA7nkYPnakxozPnXYSDkVlUYK7f5sBwD9HF
         IG0TgozYv6h4J2TKq8ISwJmGJjJFYo3Hk68b0rR3JS8wUS77JXjQznwxsjLAbUqhkmj+
         Mpg7GL0/l0qJJNjXzoZc6fRJ6KZ8ZR/SKxZrH2ZDXp3UpFO14Mx+ahUBLi91Jd3Pe4eQ
         ii5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KHHS+1f8u9j5b2K6D8nWWJ9Ja8sSbiW1E3dlvhtlLBY=;
        b=RjUWVDEqYlh3C3tc+7WPxhOA5EI6BXXaLaSBqSU3ns7gjAEDL8cyoyBXux2zaAWgNR
         ueiCF/drsjhFNh0ttQ1BQFJDSweGcufaXGS44pvUgHXR6nOqR3SbGMCiyikeEU9Ifs+/
         0sZ1YnuOOvHldiQrpQm8zlhRqFEaa+SF2Xz+SWQKw7kVOAUtJYtQbweXg8H0evT0ggR3
         arVPubWMbGv1eb+BAKeTqZhN1sb5r4TXmkuHuGqhBWjTAV3g3KB51B4fSAKLkPh4MReZ
         9UCM/wgb7ZyjOjGZeNqEfxCS7B5iIIfBrflkoTfagnfi9dEV391AeQ18XXE2k+j67uZG
         Y+4g==
X-Gm-Message-State: AOAM530FVBqhzMQ8rKWIF5daAWX53Vbgxkd3ocIJ22tKCMsb/7Tj0VNb
        /lGkszAF8J+cJbg9XES7Ye/kNw==
X-Google-Smtp-Source: ABdhPJyGybci+q+lRWReYMoifHv7LQ4kvGX3EDOi8lqyZRGOjUCRogacK+Qd5xv7FX4H9dRnM5a1gQ==
X-Received: by 2002:adf:dc88:: with SMTP id r8mr32103693wrj.277.1622034057161;
        Wed, 26 May 2021 06:00:57 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:00:56 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/24] usb: cdns3: cdns3-imx: File headers are not good candidates for kernel-doc
Date:   Wed, 26 May 2021 14:00:23 +0100
Message-Id: <20210526130037.856068-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/cdns3/cdns3-imx.c:21: warning: expecting prototype for cdns3(). Prototype was for USB3_CORE_CTRL1() instead

Cc: Peter Chen <peter.chen@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Aswath Govindraju <a-govindraju@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/cdns3/cdns3-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index 74e758dc08955..59860d1753fd5 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * cdns3-imx.c - NXP i.MX specific Glue layer for Cadence USB Controller
  *
  * Copyright (C) 2019 NXP
-- 
2.31.1


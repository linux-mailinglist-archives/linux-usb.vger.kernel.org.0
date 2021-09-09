Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23C540589D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 16:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348521AbhIIOIC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 10:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348329AbhIIOH7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Sep 2021 10:07:59 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44B6C07AF6C
        for <linux-usb@vger.kernel.org>; Thu,  9 Sep 2021 05:06:47 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso1279709pjh.5
        for <linux-usb@vger.kernel.org>; Thu, 09 Sep 2021 05:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rPp12f8Ez8YFS6vZFGosKnk85vMfxCQl6xQNG6ad8+4=;
        b=AKoLAxOac5Mq3pgWitQMZZHdOv/vD7F1je+fnMrAUlKSLltHXPMDLP4WbzhZYkIWqO
         OaoiGwrsfHgQflciLZtGzxsvZswYXAJuCDZhdTW85xT88MFqXrd51pENIl/1m45D1F3B
         cvpM4TLn+yl5w9FPP/Wdxx2oUzSPvr2uOXBdGQ8voTWnHCexi9j9oxk7Voqh6EOCV9K6
         NXvqVecm4lY27wZvdKti2A9qxbL5sC24fp1eEwxPhMYAvGnCyein20UFAXkMNOa/Zule
         xepG84ypvOU1CZLtvywBHx7BAp3sY/rOmUi3RxbCGVj7I/ldR6Wzmn1JawRVPoi4+c5r
         b8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rPp12f8Ez8YFS6vZFGosKnk85vMfxCQl6xQNG6ad8+4=;
        b=XuZYO15AdGanwreCrOa2c67EOMcux0TVpxylqY+1wavFftv2vWnT0Hq4zdSc8tyWwJ
         3zyLJREV8+jlrbHEihZLULIrY7/FS9nIyuxGLdQQ1SR6J8OBRYBTMOU6yNWynfnpmgSN
         D+HKppM0nEWxbxVNuTSQatqQWTClQFk5clkweNrLQ9YsyMiqsfYVAJOzr+ab4uD46e0u
         suAaw/YAbCuFn7BECWpFVFdhtOnGnMfqUsBsF9+f9Fm2YTQwnPQpVru7lotr8raYD4c+
         6JuxqBip99h9ZEbxXVxSCqaq7VnGD1kWRxeTrFHImWD+LJaRqA572t4qKnDsJWAbg9yl
         97DQ==
X-Gm-Message-State: AOAM531ab32ucxQiJ5speR39w3CI8vzZdZoIKWaH/Y0epU5s98vqtSWT
        48T/nyRU9LFyrTDp3dDW+tKg/SOFIKQ0NQ==
X-Google-Smtp-Source: ABdhPJw7D8GjBRHMwg8xXIz1ZN4XgD67RisZ1RvNPFQMZ//P79dU99SSNCIak8KP/ws8x7lWRmlDIQ==
X-Received: by 2002:a17:90b:116:: with SMTP id p22mr3107774pjz.67.1631189206971;
        Thu, 09 Sep 2021 05:06:46 -0700 (PDT)
Received: from ajay-VirtualBox.. ([122.161.240.129])
        by smtp.gmail.com with ESMTPSA id o1sm2215127pjk.1.2021.09.09.05.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 05:06:46 -0700 (PDT)
From:   Ajay Garg <ajaygargnsit@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Ajay Garg <ajaygargnsit@gmail.com>
Subject: [PATCH] usb: gadget: fix for a typo that conveys logically-inverted information.
Date:   Thu,  9 Sep 2021 17:36:24 +0530
Message-Id: <20210909120624.77557-1-ajaygargnsit@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Upon calling usb_ep_autoconfig_release(), the endpoint becomes *not
valid*.

Signed-off-by: Ajay Garg <ajaygargnsit@gmail.com>
---
 drivers/usb/gadget/epautoconf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epautoconf.c
index 1eb4fa2e623f..ed5a92c474e5 100644
--- a/drivers/usb/gadget/epautoconf.c
+++ b/drivers/usb/gadget/epautoconf.c
@@ -181,7 +181,7 @@ EXPORT_SYMBOL_GPL(usb_ep_autoconfig);
  * This function can be used during function bind for endpoints obtained
  * from usb_ep_autoconfig(). It unclaims endpoint claimed by
  * usb_ep_autoconfig() to make it available for other functions. Endpoint
- * which was released is no longer invalid and shouldn't be used in
+ * which was released is no longer valid and shouldn't be used in
  * context of function which released it.
  */
 void usb_ep_autoconfig_release(struct usb_ep *ep)
-- 
2.30.2


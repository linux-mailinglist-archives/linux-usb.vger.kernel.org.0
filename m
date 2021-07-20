Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E3C3D0282
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jul 2021 22:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhGTTZZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jul 2021 15:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbhGTTZG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jul 2021 15:25:06 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DDA7C061574
        for <linux-usb@vger.kernel.org>; Tue, 20 Jul 2021 13:05:42 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id b26so37629538lfo.4
        for <linux-usb@vger.kernel.org>; Tue, 20 Jul 2021 13:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MwoPtOTtksI8aah/OCUbRg60DYRqxSN4Gc1FrjJCesU=;
        b=kti/eKSte3YR3ZJfOHAHeDLLqrHHELI4Uu39GB83EbsBXT/9z0PlXV0s0aUtm6IbOn
         GI0ZQB7skxlAbfnrcPQ4Ul39y0yQHagvJUkh5Zzwf336mmQ+zf7qyw3xj0SueEK597P7
         SR744gNRBSI7MwLJ9jxjO+bsXb2rsPkZxJhweSBwRq3IrJIH9q3xw25c50wh11bXT7s6
         DCyljngToL5rfUtSUxh3wRtq5n/k1S67M0m/v5Lir4JQ52Y81CIZf84JB4uuQeIT6F3C
         lPfsgvq7DwiuPFWf7IwKsJqUn6iIlvaEVhAHXslm/BceUkzo4HG6NhdEdTO+3kCzPp4x
         7QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MwoPtOTtksI8aah/OCUbRg60DYRqxSN4Gc1FrjJCesU=;
        b=sXHFnjjBSNU7sskgFv+SKd/Ubs2SxXxLULmE3NGkevNODT9X0glR5bpnx1rFZOA9HG
         mVI3ADL+dQV9uVQBT9ke+4MbqGHKyCKVyR0GXmVzCS1hRc7lxqVpEU7oOJC/v333EyjS
         Z3UafMQsDdLXfN1YtcowJgdg8y+6uTaARYVfoigUd/0P0WOI4WHMWlD9pLgA564Bu0oL
         36KMLWJ7s8qIGonV7hLkMVKXA5Z6A3+eJ5Q2q4O3lk4f2fUn7fYvUhod8x7N66quq81Z
         slPjxYelVW+tmItlQ1r8mmYfEr0+2uGvpRx4lr4Lb95FmlUc8QXVTsQVbub10qezQjpJ
         cmzw==
X-Gm-Message-State: AOAM530+xKcNPJVvPI4Uv5mZjVuf5dUkLUbbaWxrK+gC7VxwV2kxh3K+
        GsiUMqUtGnLqE23w4AEuzjSi/Q==
X-Google-Smtp-Source: ABdhPJxXSqbhZ1mg3hXRF2VcLytOSteeYdg/rDgJTRScS2s5001h+5FOskpCxebc7Dio37WXL+RtZg==
X-Received: by 2002:ac2:4426:: with SMTP id w6mr14736445lfl.595.1626811540874;
        Tue, 20 Jul 2021 13:05:40 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id r9sm2458285ljc.62.2021.07.20.13.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 13:05:40 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] usb: isp1301-omap: Fix the GPIO include
Date:   Tue, 20 Jul 2021 22:03:36 +0200
Message-Id: <20210720200336.223398-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The file is using only GPIO descriptors, so only include
<linux/gpio/consumer.h> instead of the legacy include.

This is a non-urgent fix.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Felipe Balbi <balbi@kernel.org>
Fixes: f3ef38160e3d ("usb: isp1301-omap: Convert to use GPIO descriptors")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/phy/phy-isp1301-omap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-isp1301-omap.c b/drivers/usb/phy/phy-isp1301-omap.c
index f3e9b3b6ac3e..190699b38b41 100644
--- a/drivers/usb/phy/phy-isp1301-omap.c
+++ b/drivers/usb/phy/phy-isp1301-omap.c
@@ -12,7 +12,7 @@
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 #include <linux/usb.h>
-- 
2.31.1


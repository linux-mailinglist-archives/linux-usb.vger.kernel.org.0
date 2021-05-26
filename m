Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38F67391868
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbhEZNDK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235006AbhEZNCo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:44 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44575C061345
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:09 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id g17so816760wrs.13
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o36LW+hTNNsqoigEuNG+wNAHEgSOlM2c2v5gTuumT6A=;
        b=fe2q372U1NRt7LxZBrrrBiv/0gEAOAmRpODo8k5VMyG+7Xr4MOjtWdZImmZUg1V/XC
         /2m2FX+GOzkufz6Qo1w24rzpKoUKlSdGx9fstG2I301jTVu3AIFKSWCF2v+bmkX3asMj
         kYPUmLrcwYKMnZ0zr5XBYa7O5z5VK7WF+3Zh1tA1hlGfqWk+sfewoqGPPtYPuyDZQ3l6
         17uUYjqAou5k7d3/ZAKRusc2BvK1gP7yhS0onSbQ1flstx71443M4wDOQL975US7ZIAL
         YmdOLO4A379l9SyE7RtPrAAZOkkQpFqUhIFdPCrBUG63sVhtquhzlBq8XC0M2rL18dE/
         M6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o36LW+hTNNsqoigEuNG+wNAHEgSOlM2c2v5gTuumT6A=;
        b=Qe+TtX3dRCqp5fOCb1/2HF6pjvEXvEEgTXIq6Mmu4FLcjq53AO8/CysDu/1R6bU371
         ZMXu5tGcfUYkD9HHHV6LuebgR+2lwFvy9eO+/o2BC+O4JVL2zXXTwmsGm1A9s+DEX+Ii
         xj7npbJq43CEI0KL7OUwa1a1wqn7EUuvYWQHmqNYOSkU0n6KR+++9USgEDfrkWGT7Idt
         smIoAuRmSdIOT4vUrJ0jY6FoD6h65gc8+SgHnKG9DKl/wCt2fHF7YQ8mcb4P7Q5UXSwY
         hv9EUFyvJHwk4gL+hglMKug0H3/PiDjgS9d3svFV5dldIKoX2sqZ97FZXP2v7qACUaHY
         yKMQ==
X-Gm-Message-State: AOAM532isEB91YK3shYChSSZZCGOyflziQQ2hCM2W+pQyqZtVqndgz3f
        R7/ES8WjLKHNxKS3zAp9TSsbgw==
X-Google-Smtp-Source: ABdhPJxbGb+Q0j/7v5WuRF+0wZltMrwCJKhRTJIXKl3ptpTQ4KxLGZloC1MW7YR2CQ085BEG/JQplQ==
X-Received: by 2002:a5d:4246:: with SMTP id s6mr29164312wrr.9.1622034067391;
        Wed, 26 May 2021 06:01:07 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:01:06 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Jez <pjez@cadence.com>, linux-usb@vger.kernel.org
Subject: [PATCH 20/24] usb: cdns3: cdns3-gadget: Provide correct function naming for '__cdns3_gadget_ep_queue()'
Date:   Wed, 26 May 2021 14:00:33 +0100
Message-Id: <20210526130037.856068-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/cdns3/cdns3-gadget.c:2499: warning: expecting prototype for cdns3_gadget_ep_queue(). Prototype was for __cdns3_gadget_ep_queue() instead

Cc: Peter Chen <peter.chen@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Aswath Govindraju <a-govindraju@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pawel Jez <pjez@cadence.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/cdns3/cdns3-gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index 54fa429fae777..57adcdbfab5f6 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -2486,7 +2486,7 @@ static int cdns3_gadget_ep_disable(struct usb_ep *ep)
 }
 
 /**
- * cdns3_gadget_ep_queue - Transfer data on endpoint
+ * __cdns3_gadget_ep_queue - Transfer data on endpoint
  * @ep: endpoint object
  * @request: request object
  * @gfp_flags: gfp flags
-- 
2.31.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73114633003
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 23:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbiKUWzZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 17:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiKUWzX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 17:55:23 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CFA6B230
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 14:55:21 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id b131so15324789yba.11
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 14:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tAYfgT2K+QSpRBdE72N8/xL/0XwoTTyIQAdPR8n4aAY=;
        b=xx2dmW2BD0vRL8W/mfJHJKLdVA9nelo/3OCRt3N9AycNajxIJjWjDJ5m6milDrDxL5
         BaxtOX89AdRTl/xCS+3CSxxszL8Ce7jc6M+YwxoEA6cnum51yyRZN3zSqqgqZ+R6nnjd
         0FD+BDE/HhYqIcf2MjvsKgbU1T36RkM9V1D/BRZCGw3B/68od7SLiXg7Bcc+gVWs5rE1
         n4cMvTl00n14sUM+oUZ39VOiOno4DyQed8G2+F0GcsMtVwa5QDQH0PcE14Cn9sY4qJkL
         IfzrDHFXlBJSXc2shKDSFJ5fDhVG8Zc/0YySZuOVfyz4bOasv6l7xGQiw/KXQn+TFDjv
         pCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tAYfgT2K+QSpRBdE72N8/xL/0XwoTTyIQAdPR8n4aAY=;
        b=my4E8hgsQH+Lb8SXML31WGw8+NWwapVHDup7PvF/COucAC3CYVbV6t8OiHgK7i+54X
         8nH9VJ1cSdbvr70mr5XgTCTM4IlDXk0AJ/yOy2AXGtNxUKZABmidui1s9mivd7NQs+E+
         ewQLaiFogWTW6x+HtKMW6DaivQZXUq6f2ZDoRFpRKbTfTf4eohqSNu9iOGnlsTIptkUo
         JaofJwq248dALbyRgrp75+cT+2di1Vbehx2BVvAxgx991UqQXYhZ3v1Z1j+rJT+eaSHz
         OO6zjj5uZ6+fhnAq6fnN8CE5qVGgO/k7V31MgywV2PmZZ48RvGccxQNC3OpYEWYaWX/l
         Q78w==
X-Gm-Message-State: ANoB5pnwOimj1L/OGqv9HykoB/IOcV41UTjlbho1kwPnVm01n4vlT+0d
        Tos4fKIqL7jRaKpFThBf1QePe7eA5mukZM2mAsQ8Mg==
X-Google-Smtp-Source: AA0mqf7/E7J5AcX/By+409kDTmFrBsa25hGxhpn8Me8myX+qJHaWGyKcLMw4Qt03a4OhYHThY5akrWsYMx+/TYKVd00=
X-Received: by 2002:a25:1843:0:b0:6dc:b9ec:7c87 with SMTP id
 64-20020a251843000000b006dcb9ec7c87mr2764895yby.322.1669071320018; Mon, 21
 Nov 2022 14:55:20 -0800 (PST)
MIME-Version: 1.0
References: <a989b3b798ecaf3b45f35160e30e605636d66a77.1669044086.git.geert+renesas@glider.be>
In-Reply-To: <a989b3b798ecaf3b45f35160e30e605636d66a77.1669044086.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Nov 2022 23:55:04 +0100
Message-ID: <CACRpkdZXYip7OpncA4TX+xCMCfH4Y764t-2F6FkT6WYB-50zxQ@mail.gmail.com>
Subject: Re: [PATCH] usb: USB_FOTG210 should depend on ARCH_GEMINI
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 21, 2022 at 4:22 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The Faraday Technology FOTG210 USB2 Dual Role Controller is only present
> on Cortina Systems Gemini SoCs.  Hence add a dependency on ARCH_GEMINI,
> to prevent asking the user about its drivers when configuring a kernel
> without Cortina Systems Gemini SoC support.
>
> Fixes: 1dd33a9f1b95ab59 ("usb: fotg210: Collect pieces of dual mode controller")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Ok that's fair. When Faraday merged these drivers they probably had
some other system(s) in mind, but they don't talk much recently so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

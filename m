Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEA7B64E7E2
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 08:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbiLPHol (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 02:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiLPHok (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 02:44:40 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59883E0B5
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 23:44:39 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id 192so1497705ybt.6
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 23:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iB0g31kIx7VaA2NoMT/LCOrwGHXhyI2Tl4nmAYaudHM=;
        b=eHNXV0sESw66UesXX9FIBGUDzVJZdw1NziDG5wsXB5q6k/uBmJXS5fXr+qOAv+a2GP
         pwbPd39uur7vTE5I5o772lteXPWZgXnUrtqHS5ig8c2sbH07endJMrkpgHwB5VT89sBb
         NiIuQddoTfGYG54IA8IPdQc1tz3u2TlHZZEJkJSH9EM52/VBvTZoFenPPKeYl/LvzC2L
         I2Wps3ifa7oUlNP9MJD/QJAQ9/OP2dqN89lXDIC2DXrk3LzrCwZRksP44jyq+lwgl/Ge
         /BtDja3bOEbyOfSMDKTTewT7TUCia4K6Sg9m2qX3RzlWMm45BrUXfsZnXAv1Kahj23Ua
         pmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iB0g31kIx7VaA2NoMT/LCOrwGHXhyI2Tl4nmAYaudHM=;
        b=WToXOHtybuOUxCeM5MBt+NsslmqTKgCqHABKD1lBpl92e2gton7jejTBGVF/6+On3b
         7Jv5QSLdYzmWGSuU8l2WRpGEAndAxn02FUhdCABkAShXBzzV9AREOXn5ZQ2yRgsdtOHy
         /7M4m49aXfPsh5pcMgg3dkdrBXCBM762X6gGFP7z9jedylLna9g5z40ep1n0ZgnbevEo
         mmwqDCDpDdyiQO+pLxRcNFQJSShWVhohdu1E+kNC8d90lSVFDeebs15+/SyY43AuSBwp
         fMVcRw7pJaARhQumUhfR7K7vIcRqWVNCl/a0oDJ0kTU+0diJmgiNgj+030M9/dzgMjoT
         wf9A==
X-Gm-Message-State: ANoB5pkh7h8KcN6hsyTlM0Iw8eRQw11mKa+Q81UFL7NZV2oVYFAnFrAw
        JfoRwdx/wqs+hQ/RckrHEPNjnilr3b9VYaoYLzOwbBK8RCEkPVyP
X-Google-Smtp-Source: AA0mqf4aOJq72axMei8yRuRCQgM1U84CIyWRdlNSBV4BGxhBGs5mvy0EVOnJ3HSVRARYCpSLcBYA1cf2aEHjXX+xBV0=
X-Received: by 2002:a25:8e82:0:b0:6d2:70d5:3ed0 with SMTP id
 q2-20020a258e82000000b006d270d53ed0mr97954892ybl.457.1671176679014; Thu, 15
 Dec 2022 23:44:39 -0800 (PST)
MIME-Version: 1.0
References: <20221215165728.2062984-1-arnd@kernel.org>
In-Reply-To: <20221215165728.2062984-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 16 Dec 2022 08:44:27 +0100
Message-ID: <CACRpkda3V2Fv9aOxxcuQ5NKv3sWic9-skQU_z7=0S692h_WhnQ@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210: fix OTG-only build
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 15, 2022 at 5:57 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The fotg210 module combines the HCD and OTG drivers, which then
> fails to build when only the USB gadget support is enabled
> in the kernel but host support is not:
>
> aarch64-linux-ld: drivers/usb/fotg210/fotg210-core.o: in function `fotg210_init':
> fotg210-core.c:(.init.text+0xc): undefined reference to `usb_disabled'
>
> Move the check for usb_disabled() after the check for the HCD module,
> and let the OTG driver still be probed in this configuration.
>
> A nicer approach might be to have the common portion built as a
> library module, with the two platform other files registering
> their own platform_driver instances separately.
>
> Fixes: ddacd6ef44ca ("usb: fotg210: Fix Kconfig for USB host modules")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

My mistake, I thought this function was a generic USB function
and not related to host. I might just push it down to the host again.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

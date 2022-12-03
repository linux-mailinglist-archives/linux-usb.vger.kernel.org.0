Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFA75641576
	for <lists+linux-usb@lfdr.de>; Sat,  3 Dec 2022 10:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiLCJwq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Dec 2022 04:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiLCJwp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Dec 2022 04:52:45 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A28D6307
        for <linux-usb@vger.kernel.org>; Sat,  3 Dec 2022 01:52:43 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-3b56782b3f6so71606947b3.13
        for <linux-usb@vger.kernel.org>; Sat, 03 Dec 2022 01:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i8ivVIAR3Hl3GeEWDWKdonaWgssAeiZcW6ff920f8pY=;
        b=hfQ8Bub3CUzpaUwsLlJWVhV4Xn5nzBGG1/DnqQG+CRPeGXn9mpgC1TDGqAA6rrjosF
         /mlluNdI8INwyW1rwUyQBrFDwJNXoXnbdmBzWHoNzRpOC9sRwFzoOxbkBc5EJZGsBRun
         2cgSSTQ8HzNOKwD8RkrogNaf93VMcHqr5WcToBQmixPGhFCE3+TY2vnLCBwlb5Wsh9BH
         jQpzYYK7cUeVFVhmWnN+rJLljAhjK4j7BybHwq3CKAZIsGyJsdyklPartSA/fFDQBxOC
         QdDeK0ri2hxOd3F4Vk+0w4OjPLMS2wLYvlvNBWPUc5SFSCjlspDxiMV/pmyUARlYE/Gn
         w5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8ivVIAR3Hl3GeEWDWKdonaWgssAeiZcW6ff920f8pY=;
        b=CEp1fiF0DNNN87WkvuLBrHsJDyfBCYNVFElS/OUMsVvAqdnVlaqXmFp4ZaMcIT2QQQ
         sqv+2i6RkAwvyAnmUQJQuC+epEeX80+AY83WpyrxZ5WNIIlyq6aoNzByvgXGKaW9Ltfg
         0aWMefEP8nq69YPWObpH/KjfpjEF2/oSVebFZZJMtNIDGlPLZLxwhvXlpbq8vn2J9AOZ
         z6kERK2mvZU8LA/ffjxvZLo7i6uQqAlgOTrkz+4EJE6jD4Z5MjF/hNoIpMph2qSxp1TV
         1BnIbdb0FTkzEvHtkhJjviOB7BaHk2QI8aj9RCEjZAksokmf1Ts/vknfgsm4kOvIZ3hk
         NvYA==
X-Gm-Message-State: ANoB5ple9XtCDt9CGwA1AqBQCq+PInhMahVP9NUmOvdNTy2BrEQCCFIU
        nPLWKL4cBLAQY9OSV0NoDc6v63DKW7C/B91eLr7bRA==
X-Google-Smtp-Source: AA0mqf6Om8p/9zh/EddNv2e3rL7WfoeKQZw6ni1Ibk5O1EhMdhcul080woUVTq3Q8jyygP2+oxbZZRZVf9GrJEtdB/4=
X-Received: by 2002:a81:3855:0:b0:38b:17c4:4297 with SMTP id
 f82-20020a813855000000b0038b17c44297mr54547195ywa.446.1670061162443; Sat, 03
 Dec 2022 01:52:42 -0800 (PST)
MIME-Version: 1.0
References: <1669704115-40011-1-git-send-email-wangyufen@huawei.com>
In-Reply-To: <1669704115-40011-1-git-send-email-wangyufen@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Dec 2022 10:52:31 +0100
Message-ID: <CACRpkdaeB_PheVHAnKgTwPuWvyUzK0+xGSXg4R=L=tG-FG4xnQ@mail.gmail.com>
Subject: Re: [PATCH v2] USB: FHCI: fix error return code in of_fhci_probe()
To:     Wang Yufen <wangyufen@huawei.com>
Cc:     gregkh@linuxfoundation.org, mailhol.vincent@wanadoo.fr,
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

On Tue, Nov 29, 2022 at 7:21 AM Wang Yufen <wangyufen@huawei.com> wrote:

> Fix to return a negative error code of PTR_ERR(fhci->gpiods[i])
> instead of 0.
>
> Fixes: a4efdb8a423b ("USB: FHCI: Switch to GPIO descriptors")
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

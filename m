Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60C3561F47D
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 14:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbiKGNiv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 08:38:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbiKGNit (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 08:38:49 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783521B797
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 05:38:47 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id a5so17563324edb.11
        for <linux-usb@vger.kernel.org>; Mon, 07 Nov 2022 05:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXfA7HOVJTMMe3XIw68HaDTdqMKJ79WSb+xmFhw8Na4=;
        b=OVAHmdYlCb2hKRvGgZMTG7VWJicSrxOacC3921VsKiYzqi9jTC7F4nw3KvKcIrxO8k
         bxFF9dKpwqPFi2KcKo/aLkVbNQK/tl43zU3ULTxaqfwA2cYaUraDQZkIL2gqBnObL0gr
         MtbJbmv18JmHA0cHOFNB9NCAGdhyHOG2leETwRlpAUNU0popFySYEhVPiVlxbgJ++mPy
         dd6QYUmKnQhXQR1+CwMgTomwGWrczHM25hS8OsKsIUk/IElfbt4nv4Y2CGITM54MeauP
         r8/Da6uoo8G1+TiX5chwTpJajJJzusueIobhTbZo9YqM9iLEnjYznwtp1Gs91U6pDdR2
         DbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXfA7HOVJTMMe3XIw68HaDTdqMKJ79WSb+xmFhw8Na4=;
        b=Qf09/5tDpJcR7fU2f2eDVlajuxJE7vjrOYSjwMbKJ2Ig/5e1Sd1OveRMdET4YtoQJz
         1tN5MVnRJaUkuNXyWDnIOSdbv7JAhlLKV9B5pSKcRmza4V1laEmxwxQ9ARfMKJffSkl4
         lIbyGItTf4P0LdvAIOXW0aBU3vycQXxBN3EgIF+uRZonovdpJKzbvU180Iwqt6kUSX0c
         OS6xgYsgwrhPJW02DTPed6i1Vdg9KYSJjUJO4Wtq4joaQlf0dCBeZRNlovf8NHgPjRHM
         MP7LbkrjfMFEskzjx23zIg4ienT9RPZhmr6PItlGVxKnb4iiT84P5ArrDMgRTCksO2hg
         77kA==
X-Gm-Message-State: ACrzQf1RjYcEvHMYNA13kJdd2v2kWpOiVvOxwcnturUqKPpmXNhPgWYA
        Q9opBD+v3y4/7bPZUE0doG7+m1WHrqu3fxTrGG9Cxg==
X-Google-Smtp-Source: AMsMyM52qq852Pp9zRkbf0eshzC0HsiGQf7v0fBkykI+7bn0jlMuAXakg3BsPOTSQ2puDufFqE/UDmvRQR/x/sNZuK0=
X-Received: by 2002:aa7:c718:0:b0:462:ff35:95dc with SMTP id
 i24-20020aa7c718000000b00462ff3595dcmr49167040edq.32.1667828326065; Mon, 07
 Nov 2022 05:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20221107090753.1404679-1-linus.walleij@linaro.org>
In-Reply-To: <20221107090753.1404679-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Nov 2022 14:38:35 +0100
Message-ID: <CACRpkdasVj1j6Jyik_fRp8_0TydhCXmB+edzG6kYsxacDgq3eg@mail.gmail.com>
Subject: Re: [PATCH] USB: bcma: Make GPIO explicitly optional
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Chuhong Yuan <hslester96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 7, 2022 at 10:07 AM Linus Walleij <linus.walleij@linaro.org> wr=
ote:

> What the code does is to not check the return value from
> devm_gpiod_get() and then avoid using an erroneous GPIO descriptor
> with IS_ERR_OR_NULL().
>
> This will miss real errors from the GPIO core that should not be
> ignored, such as probe deferral.
>
> Instead request the GPIO as explicitly optional, which means that
> if it doesn't exist, the descriptor returned will be NULL.
>
> Then we can add error handling and also avoid just doing this on
> the device tree path, and simplify the site where the optional
> GPIO descriptor is used.
>
> There were some problems with cleaning up this GPIO descriptor
> use in the past, but this is the proper way to deal with it.
>
> Cc: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Cc: Chuhong Yuan <hslester96@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Actually I think this is something of a regression that needs
a Cc: stable tag.

On my router (DIR-890L) this is needed for the USB ports to probe
and work, I think due to recent refactorings involving device links
and whatnot, i.e. probe deferral happens all the time and the
deferral error has to be handled. I think many BCM systems are
affected.

Yours,
Linus Walleij

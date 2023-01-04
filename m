Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B505365CAA3
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 01:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233437AbjADAOS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Jan 2023 19:14:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbjADAOQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Jan 2023 19:14:16 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC9913F57
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 16:14:15 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id c124so34887230ybb.13
        for <linux-usb@vger.kernel.org>; Tue, 03 Jan 2023 16:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ/lWA2u673qQ3zZUAqUhxWgXqekzo4IW91NihIOMao=;
        b=FMXhuV3K2ARtmgPHeUhmZFz7Ug53ziDjO+cCjXO9HNwnsX8S02ay2252oFhhss3762
         z96s/0ZsfKsPyffy3FeMV2aZh0HgEnBAJa0VLdJRnYIaU5PRaFPYAMATDB1t6MYDA6Zl
         94nTVRaQ7ACXOSVNgpmXUtakqKwKJuKCTVgf/ti26nwyFIxfHGzr3362F+FoWXPCk2kQ
         RAjKwD4tkQ4U1pOHiKEG0aoXTFaCYQoVqv2DEjBwpMWsGPC925H7LUAI7iMT+TzwWQwl
         Jmu0JLGmSKqQQThJAiU0SVYeKoBpMOjHDvNQ6OFGEdueQYAvDH11SgcJc7JoyC7YLl0X
         EOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQ/lWA2u673qQ3zZUAqUhxWgXqekzo4IW91NihIOMao=;
        b=byxw0O0JQcdsQrfIUoZ/XqjMty7KIYg3LpYBhCxIK7fZhvBD9dqZr/EewrHl4TkmCV
         WHBVX8eF51OZaMFCvfLECI/ZsaZ9vf47rQCgMWzp4JNbboDj1Cuihq19BsjF4gL4HTs0
         g/cpn6fbgGLwu65Zp/Ir3R4GTIMntXoOlEMJlT9SLrzpztNSn91iUAMrxLu+Hj1y+1NL
         GH4C1XyMN6VxiKicKTYEZZhhPxMwZ9C8mnuPYWddZqNoSnk00q/wn1WGreFl7iCovgwI
         D+YW9ipfD3TgHPmXp2nOGvroWew92+ebWWZvTEwUcrgXTkpJFE4ybEh05ygpuXvjwCDZ
         ERwA==
X-Gm-Message-State: AFqh2kp7kevFS9W7IoenN9jkaCdz9gSicNziSQNA8kclZjd02s7aCtlh
        ntvRosfqOOLN+2wFalZYYHOLvtvyi5Vr85YDy6PR1g==
X-Google-Smtp-Source: AMrXdXtULjWSx/uLAyoLdOmvGxodGKaxAIYHXql4LycOyWtwq7wqvcnw0vWsSR5d21aGy9Mikwess4Umu7qN+6/8UxY=
X-Received: by 2002:a25:8e8e:0:b0:6fa:a54e:9276 with SMTP id
 q14-20020a258e8e000000b006faa54e9276mr3560320ybl.460.1672791254909; Tue, 03
 Jan 2023 16:14:14 -0800 (PST)
MIME-Version: 1.0
References: <20221215165728.2062984-1-arnd@kernel.org> <CACRpkda3V2Fv9aOxxcuQ5NKv3sWic9-skQU_z7=0S692h_WhnQ@mail.gmail.com>
 <CAFr9PXmVXqAX73VUzAt_M2yPN93in9Y_LHyYcEA1Dfj_m_4ZHA@mail.gmail.com>
In-Reply-To: <CAFr9PXmVXqAX73VUzAt_M2yPN93in9Y_LHyYcEA1Dfj_m_4ZHA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 Jan 2023 01:14:03 +0100
Message-ID: <CACRpkdZBs0RTwnEjTu81ih0Pyar-e0mb-9-zo9rS6fB9OAHWog@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210: fix OTG-only build
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Mon, Jan 2, 2023 at 7:10 AM Daniel Palmer <daniel@0x0f.com> wrote:

> Maybe a little unrelated to this patch but this IP is also used on the
> MStar/SigmaStar chips

I actually think Arnd Bergmann at one point sent me a device with
this line of chips in it. I suppose you will be upstreaming this
support?

> (albeit only the host (FUSBH200) part that used
> to have its own driver that got removed at some point...)

Sorry for reading this after sending out my latest changes, here:
https://lore.kernel.org/linux-usb/20230103-gemini-fotg210-usb-v1-0-f2670cb4a492@linaro.org/T/#t

The first patch in this series differentiates between
FOTG200 and FOTG210, do you mean to say there is
rather FUSBH200 as well? There is also FUSB220...
(Faraday used to have datasheets on their webpage
but I can't access them anymore.)

> For what it's worth I could not get this driver to function correctly
> with UVC cameras etc and was fed up with hacking it apart to try to
> get it to work when it's mostly a copy/paste of an old copy of the
> common EHCI driver.
> So I added some extra quirks to the common EHCI driver to allow it to
> run this IP too and deleted the custom driver in my tree (hence the
> conflicts..).
>
> I'm not sure how using the common EHCI driver works with the OTG part
> but if it's possible to make that work maybe my way is a better
> solution than trying to maintain this driver?

That's a good point, do you have a pointer to your EHCI
quirk patch so I can take a look?

Yours,
Linus Walleij

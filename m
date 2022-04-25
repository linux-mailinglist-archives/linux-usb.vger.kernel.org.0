Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F60C50E437
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 17:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240595AbiDYPWm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 11:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240093AbiDYPWf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 11:22:35 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C521CB821D
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 08:19:29 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id m23so7432710ljc.0
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 08:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gbvN9hifJhOg9ssdtEKH3hyyXss5ViI49409FnezR30=;
        b=mhWd5JhrqBrkQMZ4LpkSfxLs7Bb7WTE3Tn6mFhB+1844PEjg8kDve9OzQGc7iwNFKW
         Q1rbD+9VfOORQLxkKhmMNQfNFDffwtvikZ8lknpV0bVib3fNE1NFjpxzGUEnSW/2tPsf
         JwNerpQfSP9hmNROder9/tHnu6owF8gcoau9RbuZMevZE9i8VGsZvpmgJ7FIVMQPKBUH
         sA00wE55FdFQbN4gclqDNOSdylHlH5PxKuI7WU5tFxiGiDa2NrUP/cbDxT4VLx+3aHpC
         4oVIgumoL86fcatp0cYWHmYaG783pi3INQb72P9sk+MCHyEiBwmV6s2j8jkfIW+UoQAg
         8wwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gbvN9hifJhOg9ssdtEKH3hyyXss5ViI49409FnezR30=;
        b=g5+kEfQE3J3NZ7IzRE4g1zCos8pcIuxGiH7YFFceAJt/M5Dl8uaw8pNzovWOWaLlSG
         GR/aaQK3knSjUtYhgwdbrf8Fl7qmeCrrrGzoBA69fvxbPzJtctkCCx0PRds8peZ+1Ksz
         A8YrAmAkjGNBiaaGfGsrW6pUg+3q9bNvie1g9nhHkGILdKxE1gVcM+FH7lLG7r5tay5g
         6DYgiTz9svmgAFweSJhCOiJuVx1RGLes4GzQO37jN+T7aY8f5VLfez/WBHxcNrdOGnVA
         scHKClDj/u1cBPEh17fzkYwRAOFhnw2oq7Q+4zBg14JiHbLYWMPRAjEJvyM4kGwWH81o
         iyzw==
X-Gm-Message-State: AOAM531uqCLPNuOW71h2Gl3vqRV0PptJK9SI+3nQ5dRiF1tEnSRtaVwG
        MaklQSZazA7LHyUk5OBj7wBWPqg3ZvqH5U8z6XnVJQ==
X-Google-Smtp-Source: ABdhPJwmOc4cvVDxnf+KGjHnQOYKHQsW5SoWUwnmH2b0GVOv94G6awKy+KqGoTu4g1XRGR8HMhlKjp0+yaDzmcgntRQ=
X-Received: by 2002:a05:651c:1204:b0:24e:e127:f509 with SMTP id
 i4-20020a05651c120400b0024ee127f509mr11115488lja.459.1650899967782; Mon, 25
 Apr 2022 08:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <18b3541e5372bc9b9fc733d422f4e698c089077c.1650177997.git.lukas@wunner.de>
 <9325d344e8a6b1a4720022697792a84e545fef62.camel@redhat.com>
 <20220423160723.GA20330@wunner.de> <20220425074146.1fa27d5f@kernel.org>
 <CAG48ez3ibQjhs9Qxb0AAKE4-UZiZ5UdXG1JWcPWHAWBoO-1fVw@mail.gmail.com>
 <20220425080057.0fc4ef66@kernel.org> <CANn89iLwvqUJHBNifLESJyBQ85qjK42sK85Fs=QV4M7HqUXmxQ@mail.gmail.com>
In-Reply-To: <CANn89iLwvqUJHBNifLESJyBQ85qjK42sK85Fs=QV4M7HqUXmxQ@mail.gmail.com>
From:   Jann Horn <jannh@google.com>
Date:   Mon, 25 Apr 2022 17:18:51 +0200
Message-ID: <CAG48ez0nw7coDXYozaUOTThWLkHWZuKVUpMosY2hgVSSfeM4Pw@mail.gmail.com>
Subject: Re: [PATCH] net: linkwatch: ignore events for unregistered netdevs
To:     Eric Dumazet <edumazet@google.com>
Cc:     Jakub Kicinski <kuba@kernel.org>, Lukas Wunner <lukas@wunner.de>,
        Paolo Abeni <pabeni@redhat.com>,
        Oliver Neukum <oneukum@suse.com>,
        "David S. Miller" <davem@davemloft.net>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        netdev <netdev@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Jacky Chou <jackychou@asix.com.tw>, Willy Tarreau <w@1wt.eu>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 25, 2022 at 5:13 PM Eric Dumazet <edumazet@google.com> wrote:
> On Mon, Apr 25, 2022 at 8:01 AM Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > On Mon, 25 Apr 2022 16:49:34 +0200 Jann Horn wrote:
> > > > Doesn't mean we should make it legal. We can add a warning to catch
> > > > abuses.
> > >
> > > That was the idea with
> > > https://lore.kernel.org/netdev/20220128014303.2334568-1-jannh@google.com/,
> > > but I didn't get any replies when I asked what the precise semantics
> > > of dev_hold() are supposed to be
> > > (https://lore.kernel.org/netdev/CAG48ez1-OyZETvrYAfaHicYW1LbrQUVp=C0EukSWqZrYMej73w@mail.gmail.com/),
> > > so I don't know how to proceed...
> >
> > Yeah, I think after you pointed out that the netdev per cpu refcounting
> > is fundamentally broken everybody decided to hit themselves with the
> > obliviate spell :S
>
> dev_hold() has been an increment of a refcount, and dev_put() a decrement.
>
> Not sure why it is fundamentally broken.

Well, it's not quite a refcount. It's a count that can be incremented
and decremented but can't be read while the device is alive, and then
at some point it turns into a count that can be read and decremented
but can't be incremented (see
https://lore.kernel.org/netdev/CAG48ez1-OyZETvrYAfaHicYW1LbrQUVp=C0EukSWqZrYMej73w@mail.gmail.com/).
Normal refcounts allow anyone who is holding a reference to add
another reference.

> There are specific steps at device dismantles making sure no more
> users can dev_hold()

So you're saying it's intentional that even if you're already holding
a dev_hold() reference, you may not be allowed to call dev_hold()
again?

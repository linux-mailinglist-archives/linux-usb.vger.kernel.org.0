Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 621ED50E41F
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 17:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242765AbiDYPQ6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 11:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232572AbiDYPQ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 11:16:56 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DB786E32
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 08:13:52 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2ebf4b91212so151785417b3.8
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lGJfET6zx2lX9xnmjZgx/ZL4hWK8L5YfaTTc8LihlQo=;
        b=m4gmv4xavyUPw0oMD1Z+6Roct3zB8Mf5Wcqt27bR5K2Psvm5OMmi9wQEkP9Hr6dGco
         orJjkUP5PoVwwd82xhZuDi3f9wMfXMucJzwSszpmftVZTnPNEH4N7n6PicB5/p+8d5l7
         o5rWDXncnbfRFj3Q4GsasbJZuSKB43YnqLLgRflBydPcE8J4sJNIp4gpM+9oaTbwFLe+
         hD0DcU/i0QhZmCIU5hpObP2EqkIJS4jLAhiur+S3/iNz9GbB3A9g7Btu4Gz98z3lCzKp
         henIbLp3qsbCIgWrxXseP4Y/UGkWLMHPAzYRg6PkamWN5u0Cd2cTKMOtaJR9jMWpUs0M
         C+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lGJfET6zx2lX9xnmjZgx/ZL4hWK8L5YfaTTc8LihlQo=;
        b=ka6p8xMQKYV99btttAp7wJPUfckAiRw8JxrC5DZ6MtR069XCyrxMtsFQnmXZNte1jT
         apWVZxWQdvYVhy8j0lS5OfDzMBDVGKVWj4neWVbRCQtbWtb05nkUaXH0eju6FvMwWswK
         JMgGytGFvoczneOQ5mCHzHvUTdv3lECpGyobPUdCNxz5oddLqqnp4N39zSe8J0tc/eeS
         H16tpBvh6j2eisS7eMbdZUHgZeecvDraFMzpDeND0jYObqqTeVPGENScjd/REh6slrhM
         idcxSs2INnedHysXDFI6Lz0k30XprvaEGUD5VY1PgCgKIurVxnHcUzg97964AkSD3uSE
         41vg==
X-Gm-Message-State: AOAM530js2V66AqbskEp2N2jM9WbIMKZJ9a+CZbKw9fz4rGhtozNcsoI
        9PKoh01RBfJXE5PvPHM68IS24lyBdYrUSCYW0Nd2vQ==
X-Google-Smtp-Source: ABdhPJxtt0sOYUftXeVvAkArJFxFgYPfuiavJQLewGE6UdXj7fIzOhFtlIGOSC/JTAEjC1rHgiqOwpC1GwEw8Ob710I=
X-Received: by 2002:a81:a016:0:b0:2f7:cfa3:4dc3 with SMTP id
 x22-20020a81a016000000b002f7cfa34dc3mr8207683ywg.467.1650899631646; Mon, 25
 Apr 2022 08:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <18b3541e5372bc9b9fc733d422f4e698c089077c.1650177997.git.lukas@wunner.de>
 <9325d344e8a6b1a4720022697792a84e545fef62.camel@redhat.com>
 <20220423160723.GA20330@wunner.de> <20220425074146.1fa27d5f@kernel.org>
 <CAG48ez3ibQjhs9Qxb0AAKE4-UZiZ5UdXG1JWcPWHAWBoO-1fVw@mail.gmail.com> <20220425080057.0fc4ef66@kernel.org>
In-Reply-To: <20220425080057.0fc4ef66@kernel.org>
From:   Eric Dumazet <edumazet@google.com>
Date:   Mon, 25 Apr 2022 08:13:40 -0700
Message-ID: <CANn89iLwvqUJHBNifLESJyBQ85qjK42sK85Fs=QV4M7HqUXmxQ@mail.gmail.com>
Subject: Re: [PATCH] net: linkwatch: ignore events for unregistered netdevs
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Jann Horn <jannh@google.com>, Lukas Wunner <lukas@wunner.de>,
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

On Mon, Apr 25, 2022 at 8:01 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon, 25 Apr 2022 16:49:34 +0200 Jann Horn wrote:
> > > Doesn't mean we should make it legal. We can add a warning to catch
> > > abuses.
> >
> > That was the idea with
> > https://lore.kernel.org/netdev/20220128014303.2334568-1-jannh@google.com/,
> > but I didn't get any replies when I asked what the precise semantics
> > of dev_hold() are supposed to be
> > (https://lore.kernel.org/netdev/CAG48ez1-OyZETvrYAfaHicYW1LbrQUVp=C0EukSWqZrYMej73w@mail.gmail.com/),
> > so I don't know how to proceed...
>
> Yeah, I think after you pointed out that the netdev per cpu refcounting
> is fundamentally broken everybody decided to hit themselves with the
> obliviate spell :S

dev_hold() has been an increment of a refcount, and dev_put() a decrement.

Not sure why it is fundamentally broken.

There are specific steps at device dismantles making sure no more
users can dev_hold()

It is a contract. Any buggy layer can overwrite any piece of memory,
including a refcount_t.

Traditionally we could not add a test in dev_hold() to prevent an
increment if the device is in dismantle phase.
Maybe the situation is better nowadays.

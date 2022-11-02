Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 167746169F7
	for <lists+linux-usb@lfdr.de>; Wed,  2 Nov 2022 18:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbiKBRGj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Nov 2022 13:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiKBRGi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Nov 2022 13:06:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D22211A32
        for <linux-usb@vger.kernel.org>; Wed,  2 Nov 2022 10:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667408742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8g+IU1SbconJtIJvE9qWH+h96tYel1GhCAQmvBe4qsI=;
        b=XJPEDlVKiPnFSfbr173eMLO2awzmTbJGCHwX+JP0CCqPlylroMJ43d/aEVu2Pntqx4+A13
        AOoV6h/kMJNrjRZ7cfG7ErElrozcvNB7HX0m2Hdo4N+c5lpZlCYkhWe7Vxn4xVWnGBYuQO
        tOi0j/9SOyeyKthezao8AYXvdoBjTKM=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-135-7igcFTdHMs22Hej6dMOrng-1; Wed, 02 Nov 2022 13:05:41 -0400
X-MC-Unique: 7igcFTdHMs22Hej6dMOrng-1
Received: by mail-vs1-f69.google.com with SMTP id 190-20020a6719c7000000b003aa14ac75f5so4782026vsz.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Nov 2022 10:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8g+IU1SbconJtIJvE9qWH+h96tYel1GhCAQmvBe4qsI=;
        b=b12f0IJ7/txyXn664GasySRen2/Py7wI2DCZZUdet6UZhHfDu73BVfci+HJKtgjD6s
         uBiuW+H8jOC3MPsGV0e9fP3CMm79awdQIbHFuYBY1QOpIfPl7WS+hcPBy/te95TovWN5
         FrzwU0AaVJxF6px/UHjdOfNI3C0XTqWeAg/VuKWKu9j+qyZOsfMOaMoCck4eKI/SE5PR
         +o87OKKChwGp334ugoMveBFXAZju4zV1o69kP5qDl/u9Gf96YEIExvgWX4xGgmV3+WXT
         3y5tstVyZ5EtQHy7ZRougLSwD54ivaFH6oY//jZc/U2EMbGoqxMr6YDtxHuD2kMmNWFL
         LgVA==
X-Gm-Message-State: ACrzQf13Fx8PQ2zWSpPTFFck3wJYxD3kMCRgxN3bhSMiZHLuZRSmXC0d
        xCyOxnKGZJwVukglSuhcbsrcX7piuk6EjGqgzk1UtmxrQNg+x+hrdqaeyv1/L6OarvM5PuErKPE
        8df0zBYKg6ztsW4Uw5U4ERh/Bgy1kyA4CaO2I
X-Received: by 2002:a67:dc0b:0:b0:3aa:304f:54bc with SMTP id x11-20020a67dc0b000000b003aa304f54bcmr12393815vsj.76.1667408740595;
        Wed, 02 Nov 2022 10:05:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ZVn7Uq6fOScLt3XDDum0YUD0JH7ATLN68jBf8DzysLFYF3QjlN0LTcHgv3m8T/SZU2rTj+ahxYImgUAhPpRU=
X-Received: by 2002:a67:dc0b:0:b0:3aa:304f:54bc with SMTP id
 x11-20020a67dc0b000000b003aa304f54bcmr12393784vsj.76.1667408740326; Wed, 02
 Nov 2022 10:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221102161542.30669-1-sven@svenpeter.dev>
In-Reply-To: <20221102161542.30669-1-sven@svenpeter.dev>
From:   Eric Curtin <ecurtin@redhat.com>
Date:   Wed, 2 Nov 2022 17:05:24 +0000
Message-ID: <CAOgh=FxPmg_xDq=5xW3=NpGXHBWAZ-E57SiqsbVfNc7UXtq5sA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tipd: Prevent uninitialized event{1,2} in IRQ handler
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hector Martin <marcan@marcan.st>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2 Nov 2022 at 16:24, Sven Peter <sven@svenpeter.dev> wrote:
>
> If reading TPS_REG_INT_EVENT1/2 fails in the interrupt handler event1
> and event2 may be uninitialized when they are used to determine
> IRQ_HANDLED vs. IRQ_NONE in the error path.
>
> Fixes: c7260e29dd20 ("usb: typec: tipd: Add short-circuit for no irqs")
> Fixes: 45188f27b3d0 ("usb: typec: tipd: Add support for Apple CD321X")
> Signed-off-by: Sven Peter <sven@svenpeter.dev>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

> ---
>  drivers/usb/typec/tipd/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index b637e8b378b3..2a77bab948f5 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -474,7 +474,7 @@ static void tps6598x_handle_plug_event(struct tps6598x *tps, u32 status)
>  static irqreturn_t cd321x_interrupt(int irq, void *data)
>  {
>         struct tps6598x *tps = data;
> -       u64 event;
> +       u64 event = 0;
>         u32 status;
>         int ret;
>
> @@ -519,8 +519,8 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
>  static irqreturn_t tps6598x_interrupt(int irq, void *data)
>  {
>         struct tps6598x *tps = data;
> -       u64 event1;
> -       u64 event2;
> +       u64 event1 = 0;
> +       u64 event2 = 0;
>         u32 status;
>         int ret;
>
> --
> 2.25.1
>
>


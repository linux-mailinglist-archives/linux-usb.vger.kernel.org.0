Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71544249047
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 23:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgHRVjy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 17:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgHRVjw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 17:39:52 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC8AC061389
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 14:39:52 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id di22so16415817edb.12
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 14:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wM0RvXX5r7K6vYdTcICnY2/WtQpA82buzfG4amxK2JE=;
        b=etMCLJtNFGFQP1J9oYH7RK0TYbs569rBDL/0YCvirX3ZvhfNAzOyDc/NbwJYtk3icm
         AhsWcuGY87Hpquv0EYKZtSw5GWBj8c9Xq37m2xWDQ0K+9pSTSnVG6bNC+Of4OstrQ+oN
         8cWGAL53eJTqoszEHYFuhyVAKAzcJtZtERnpw1BhYMTywg7MjYfE/J93lMnZfJc9riMv
         kCJOOT5Es8dW99SdlrwAzmRpHyI6pI0ZFYnn0mmrgYxrxBVUUoMNlMPYrQ/Hzr/z9MS9
         lFxm1jQB6K45l9n7k+tsf+dg22CIazhhYMsC1rZaRj/uJ1uKLOcGvHoz4fjvMcBwr1dM
         5nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wM0RvXX5r7K6vYdTcICnY2/WtQpA82buzfG4amxK2JE=;
        b=VNEBEeJIgYFBaQO8wSxdxoz0NrPGkJM2dxcLmx2kkgDiFMTrPIXVvYfNVZ4VYdyigN
         GRb41q6clUU/yJT2lcZRxcp/B5yIFBC8hvL1TNLFxETqMdkTi1nMXYpORP127FAq3dXy
         83fPdt2JiHMEbO+BfR+b/thZh8msCZnpm9D10oKvVdlfZnuL/3YuSKnTpi19mUVihJqI
         R0AytfOmQPb5ks2vZgvHhBqoj6o/5gIPP2AXKV/gUnlZtFKDSH9XjQrzPO8RL/G08M8y
         vlp+5hUGwBMOhZcSXnJuPCHwv5eGKA3DUs1rEYp9SsOG73uMdKSckxB7N1Emt5dRiQwX
         BzUA==
X-Gm-Message-State: AOAM531tiDBaNg6rpZdIVItPUAy+1/1LB78yBLla7pYku6JDXdWRPBpt
        Ezpm8e9LB/YXhF1RZS7EmqRXUFlKNC7hz9oi3wg=
X-Google-Smtp-Source: ABdhPJw+AV0H2vIXUAyhMBFjgWW1V9JTpGyOAQgnLroZLFI3esWDZN8jO6GHi54UVyMNpnZ6HuK0OzqkGaiLNGuZDDU=
X-Received: by 2002:a05:6402:1457:: with SMTP id d23mr21792142edx.149.1597786790681;
 Tue, 18 Aug 2020 14:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200818165848.4117493-1-lorenzo@google.com>
In-Reply-To: <20200818165848.4117493-1-lorenzo@google.com>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Date:   Tue, 18 Aug 2020 14:39:39 -0700
Message-ID: <CAHo-Oox6qcD-+FoB0d+s45e1i4q_zw07a1NZGYNrah=goT1nQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: gadget: f_ncm: fix ncm_bitrate for SuperSpeed
 and above.
To:     Lorenzo Colitti <lorenzo@google.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 18, 2020 at 9:59 AM Lorenzo Colitti <lorenzo@google.com> wrote:
>
> Currently, SuperSpeed NCM gadgets report a speed of 851 Mbps
> in USB_CDC_NOTIFY_SPEED_CHANGE. But the calculation appears to
> assume 16 packets per microframe, and USB 3 and above no longer
> use microframes.
>
> Maximum speed is actually much higher. On a direct connection,
> theoretical throughput is about 3.86 Gbps for gen1x1 and
> 9.35 Gbps for gen2x1, and I have seen gadget->host speeds
> >2 Gbps for gen1x1 and >4 Gbps for gen2x1.
>
> Unfortunately the ConnectionSpeedChange defined in the CDC spec
> only uses 32-bit values, so we can't report accurate numbers for
> 10Gbps and above. So always report a speed of 4 Gbps, which is
> close enough to the technical maximum of a 5 Gbps link.
>
> This results in:
>
> [96033.958723] cdc_ncm 8-2:1.0 enx4643f5db6f40: renamed from usb0
> [96033.997136] cdc_ncm 8-2:1.0 enx4643f5db6f40: 4000 mbit/s downlink 4000=
 mbit/s uplink
>
> Fixes: 1650113888fe ("usb: gadget: f_ncm: add SuperSpeed descriptors for =
CDC NCM")
> Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/fun=
ction/f_ncm.c
> index 1d900081b1..0c073df225 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -85,8 +85,8 @@ static inline struct f_ncm *func_to_ncm(struct usb_func=
tion *f)
>  /* peak (theoretical) bulk transfer rate in bits-per-second */
>  static inline unsigned ncm_bitrate(struct usb_gadget *g)
>  {
> -       if (gadget_is_superspeed(g) && g->speed =3D=3D USB_SPEED_SUPER)
> -               return 13 * 1024 * 8 * 1000 * 8;
> +       if (gadget_is_superspeed(g) && g->speed >=3D USB_SPEED_SUPER)
> +               return 4000000000;
>         else if (gadget_is_dualspeed(g) && g->speed =3D=3D USB_SPEED_HIGH=
)
>                 return 13 * 512 * 8 * 1000 * 8;
>         else
> --
> 2.28.0.220.ged08abb693-goog
>

Do you know what this actually affects besides the display?
My cursory investigation shows it gets printed to kernel log and sent
over some sort of ncm notification to the other side...

Is it better to underestimate or overestimate?
(ie. would it be better to report 3.5 gbps for super and max out at
4.2 gbps for super plus instead?)

However, since this is obviously better than the utterly bogus 851,968,000:

Reviewed-by: Maciej =C5=BBenczykowski <maze@google.com>

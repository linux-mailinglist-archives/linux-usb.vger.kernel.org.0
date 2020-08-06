Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5413623DF3B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 19:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728618AbgHFRmT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 13:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730017AbgHFRl6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Aug 2020 13:41:58 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66825C061574
        for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2020 10:41:56 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id bs17so17009294edb.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2020 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eVNC5JIvb29x+/EoPSkWX9n3kZsyljMO1F2zv0QtpBU=;
        b=DvdePUdwROz8ftDZVMIV5sbIa3DuJHX7zcVhliWbkTKRNdD7uvJMP0TYH8heXtOLXQ
         Lo/uHEd8Ylhtic2kp+Lgs+Bnjs87YWGG73azNiX7ecxQtEdZVifWjNQe/omBUPmARZ0X
         lfmLVJzLhioPWsYR7ZnjgmIWT4Wb+uuzhMAZDh81aKqTpb2RWzSpMTJSdC/RPQH3JcGN
         pE/ohYtRZ7CRWXKibX+/j5/YX0e0gpZj6cwSLAh0KuBZ0yJL4h2ltvL4RaTW4fayt/Uv
         QyBPM89GzIqHQn6kvgMAmdAm+eDwooG2wTFNcbpuMwtUYFFnzdQQXoIzbQtqDSAdS1WA
         x7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eVNC5JIvb29x+/EoPSkWX9n3kZsyljMO1F2zv0QtpBU=;
        b=iLcdlXXr1U0UjRmWouUlhaWYNwoxd4DQK8CIEnQafFblpVJh2uCAWdSod5PhGMrBkF
         sHjpRCeGXAEt+pCQd1llj5om/m6tMjw/dbN0W9J+2WZw1J90HUIbfmjx61BIYBkAGyXT
         /3BktypEoH1KPbQDKvxCTJedrA1w2E217Hftl86efd9D4ULU3WIOcIAIrp2VH1dKln8o
         +3ofC+rWaa2eeeN9oQXa05J4+GFR7FqxptECvuubkQeop2j3tft6FvZzezyLxma3xWCD
         27VDGxPCCpd1aD9FPzzVbbpx1jS7xOjGPHLKH4/NlQpVyYFTDG1Pk80mmy7h9TmbtZC6
         arQg==
X-Gm-Message-State: AOAM530HnYG6HJsj0pNftvjT4iUs3NQ8feyv8GxamKE7ak25gsZLvesV
        b8+/I5DABKY9qptGiGXgpq3J3m9c8zpv9aMEmBo=
X-Google-Smtp-Source: ABdhPJwD32UNHrHSsnZ2aN9zuRPPkEErpercXoh9u/ZS09a+womEC0xX4ktkvwp5yfq0Cj3OHlsw4lhvI30x1gQjyoY=
X-Received: by 2002:a05:6402:2031:: with SMTP id ay17mr5026704edb.46.1596735714892;
 Thu, 06 Aug 2020 10:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200806161643.1694266-1-lorenzo@google.com> <CAHo-Ooxh7OWkkGP58YPE-0aeQ5wn6juGb0rfgMmuHC53quJaZA@mail.gmail.com>
In-Reply-To: <CAHo-Ooxh7OWkkGP58YPE-0aeQ5wn6juGb0rfgMmuHC53quJaZA@mail.gmail.com>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Date:   Thu, 6 Aug 2020 10:41:43 -0700
Message-ID: <CAHo-Oow8sZ8QaX3HNuFoJFmF01XximkOwbmxn6iWQF+a9vPkXw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_ether: enable qmult on SuperSpeed Plus as well
To:     Lorenzo Colitti <lorenzo@google.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

btw. it looks like irq throttling in the same file:

@@ -598,9 +599,10 @@ static netdev_tx_t eth_start_xmit(struct sk_buff *skb,
-       /* throttle highspeed IRQ rate back slightly */
+       /* throttle high/super speed IRQ rate back slightly */
        if (gadget_is_dualspeed(dev->gadget))
-               req->no_interrupt =3D (dev->gadget->speed =3D=3D USB_SPEED_=
HIGH)
+               req->no_interrupt =3D (dev->gadget->speed =3D=3D USB_SPEED_=
HIGH ||
+                                    dev->gadget->speed =3D=3D USB_SPEED_SU=
PER)

should also be fixed to be >=3D SUPER and not =3D=3D.

On Thu, Aug 6, 2020 at 10:29 AM Maciej =C5=BBenczykowski
<zenczykowski@gmail.com> wrote:
>
> On Thu, Aug 6, 2020 at 9:17 AM Lorenzo Colitti <lorenzo@google.com> wrote=
:
> >
> > The u_ether driver has a qmult setting that multiplies the
> > transmit queue length (which by default is 2).
> >
> > The intent is that it should be enabled at high/super speed, but
> > because the code does not explicitly check for USB_SUPER_PLUS,
> > it is disabled at that speed.
> >
> > Fix this by ensuring that the queue multiplier is enabled for any
> > wired link at high speed or above. Using >=3D for USB_SPEED_*
> > constants seems correct because it is what the gadget_is_xxxspeed
> > functions do.
> >
> > The queue multiplier substantially helps performance at higher
> > speeds. On a direct SuperSpeed Plus link to a Linux laptop,
> > iperf3 single TCP stream:
> >
> > Before (qmult=3D1): 1.3 Gbps
> > After  (qmult=3D5): 3.2 Gbps
> >
> > Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
> > ---
> >  drivers/usb/gadget/function/u_ether.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget=
/function/u_ether.c
> > index c3cc6bd14e..31ea76adcc 100644
> > --- a/drivers/usb/gadget/function/u_ether.c
> > +++ b/drivers/usb/gadget/function/u_ether.c
> > @@ -93,7 +93,7 @@ struct eth_dev {
> >  static inline int qlen(struct usb_gadget *gadget, unsigned qmult)
> >  {
> >         if (gadget_is_dualspeed(gadget) && (gadget->speed =3D=3D USB_SP=
EED_HIGH ||
> > -                                           gadget->speed =3D=3D USB_SP=
EED_SUPER))
> > +                                           gadget->speed >=3D USB_SPEE=
D_SUPER))
> >                 return qmult * DEFAULT_QLEN;
> >         else
> >                 return DEFAULT_QLEN;
> > --
> > 2.28.0.163.g6104cc2f0b6-goog
> >
>
> Reviewed-by: Maciej =C5=BBenczykowski <maze@google.com>
>
> Though I think this probably deserves a fixes tag of some sort.
> Probably:
>
> Fixes: 04617db7aa68 ("usb: gadget: add SS descriptors to Ethernet gadget"=
)
>
> since that's the commit that did:
>
> -MODULE_PARM_DESC(qmult, "queue length multiplier at high speed");
> +MODULE_PARM_DESC(qmult, "queue length multiplier at high/super speed");
>
> ...
>
> -/* for dual-speed hardware, use deeper queues at highspeed */
> +/* for dual-speed hardware, use deeper queues at high/super speed */
>  static inline int qlen(struct usb_gadget *gadget)
>  {
> -       if (gadget_is_dualspeed(gadget) && gadget->speed =3D=3D USB_SPEED=
_HIGH)
> +       if (gadget_is_dualspeed(gadget) && (gadget->speed =3D=3D USB_SPEE=
D_HIGH ||
> +                                           gadget->speed =3D=3D USB_SPEE=
D_SUPER))
>                 return qmult * DEFAULT_QLEN;
>         else
>                 return DEFAULT_QLEN;

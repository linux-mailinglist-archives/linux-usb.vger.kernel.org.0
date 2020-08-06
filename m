Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9E9E23DEC8
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 19:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbgHFR36 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 13:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729642AbgHFR3w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Aug 2020 13:29:52 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC75C061574
        for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2020 10:29:51 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id d6so37356123ejr.5
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2020 10:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5w8kbDHckwyh+GU/sqIPsW3oE7ZiFebxCeNdaGkMSiY=;
        b=UuNBpQd/4YvVi0Km+qhA4cgyHAB9y+K0GJgcJR98s26UTswZiXCXCOnGLccuzQSlXW
         vUcAUMbuocg2E3yyUl6jMu8NAHVzsQ0giZr0JfTnzBdpeSPtuj7OSvvDvcRZfLkoRTwH
         HuRqBnCL6Jk+gerqkchwFWv8hfnOHmn9vEaeM5USTbLAp2kJoeV8AgNwk8ps/Ca3mBTO
         dNJAqda0yk94f5pjm4h8vLjXSwusnVAtf7xjlG1Vp4fUMSujRbhvcZmChqe/H2/JRP57
         L207ZEhimBrqDijCIALyUkBcDgTZOJE/c13sQb0HCVNuQpqIHSXE+d8I7D+2cgQhLru4
         NCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5w8kbDHckwyh+GU/sqIPsW3oE7ZiFebxCeNdaGkMSiY=;
        b=gKqqcZlWU6Uri/ZXeovB0EuQcLjM+K49EuBz9muyoM/Dcwq+1GcqbDbwDC19aapEl3
         Cs6ihtiSMi+Hvrb3moIzGvHQHb1CPr5jblWIEQ476ntP37rSbGWWv2Fr8jMdV5gHoYM8
         4T9Mn1fPhXnHqPDmp9a4AkHldTNvoy0SLyYkMxjHcSq9LLwGWgKUB9kJOsdOuyRV19Dz
         lPqi7IOvqpwZseX3N98iv3ISOVJgfne3EpRCXBgS3CfgLZFs/yDYeLx84rcLZPkCWIJh
         FRAFweuTuqZvsU1D7LnB2Ao1H36fTzWnB/b61O1TYgmnPCuUaOJzTnASmz0cS7Etcrop
         Bb5Q==
X-Gm-Message-State: AOAM531EhwN4oyCMFsEUWt+Hl1iu9ipj4dDa/86i+W/ms4hDC5GIE70a
        VJOz7JuwFYjBDES2e25RQtYMdI+Iyp4Giq3iirA=
X-Google-Smtp-Source: ABdhPJxqAEflnBvvHqefUAAeUBtQXYcwRJg3QeukRrmqobJ0Jn6J0yQfwfHoutlbfcoKmGLnB+S2Cd/66DZy6wPLyRk=
X-Received: by 2002:a17:906:1453:: with SMTP id q19mr5594976ejc.111.1596734990314;
 Thu, 06 Aug 2020 10:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200806161643.1694266-1-lorenzo@google.com>
In-Reply-To: <20200806161643.1694266-1-lorenzo@google.com>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Date:   Thu, 6 Aug 2020 10:29:38 -0700
Message-ID: <CAHo-Ooxh7OWkkGP58YPE-0aeQ5wn6juGb0rfgMmuHC53quJaZA@mail.gmail.com>
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

On Thu, Aug 6, 2020 at 9:17 AM Lorenzo Colitti <lorenzo@google.com> wrote:
>
> The u_ether driver has a qmult setting that multiplies the
> transmit queue length (which by default is 2).
>
> The intent is that it should be enabled at high/super speed, but
> because the code does not explicitly check for USB_SUPER_PLUS,
> it is disabled at that speed.
>
> Fix this by ensuring that the queue multiplier is enabled for any
> wired link at high speed or above. Using >=3D for USB_SPEED_*
> constants seems correct because it is what the gadget_is_xxxspeed
> functions do.
>
> The queue multiplier substantially helps performance at higher
> speeds. On a direct SuperSpeed Plus link to a Linux laptop,
> iperf3 single TCP stream:
>
> Before (qmult=3D1): 1.3 Gbps
> After  (qmult=3D5): 3.2 Gbps
>
> Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
> ---
>  drivers/usb/gadget/function/u_ether.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/f=
unction/u_ether.c
> index c3cc6bd14e..31ea76adcc 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -93,7 +93,7 @@ struct eth_dev {
>  static inline int qlen(struct usb_gadget *gadget, unsigned qmult)
>  {
>         if (gadget_is_dualspeed(gadget) && (gadget->speed =3D=3D USB_SPEE=
D_HIGH ||
> -                                           gadget->speed =3D=3D USB_SPEE=
D_SUPER))
> +                                           gadget->speed >=3D USB_SPEED_=
SUPER))
>                 return qmult * DEFAULT_QLEN;
>         else
>                 return DEFAULT_QLEN;
> --
> 2.28.0.163.g6104cc2f0b6-goog
>

Reviewed-by: Maciej =C5=BBenczykowski <maze@google.com>

Though I think this probably deserves a fixes tag of some sort.
Probably:

Fixes: 04617db7aa68 ("usb: gadget: add SS descriptors to Ethernet gadget")

since that's the commit that did:

-MODULE_PARM_DESC(qmult, "queue length multiplier at high speed");
+MODULE_PARM_DESC(qmult, "queue length multiplier at high/super speed");

...

-/* for dual-speed hardware, use deeper queues at highspeed */
+/* for dual-speed hardware, use deeper queues at high/super speed */
 static inline int qlen(struct usb_gadget *gadget)
 {
-       if (gadget_is_dualspeed(gadget) && gadget->speed =3D=3D USB_SPEED_H=
IGH)
+       if (gadget_is_dualspeed(gadget) && (gadget->speed =3D=3D USB_SPEED_=
HIGH ||
+                                           gadget->speed =3D=3D USB_SPEED_=
SUPER))
                return qmult * DEFAULT_QLEN;
        else
                return DEFAULT_QLEN;

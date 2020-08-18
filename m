Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91BF248FEC
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 23:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgHRVHq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 17:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgHRVHp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 17:07:45 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B1EC061389
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 14:07:45 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id di22so16356822edb.12
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 14:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tg3fq8QopDPM3H6hvEmtBHTEHxQ97zVsM+BL7BTqXak=;
        b=cDHzDazbyao+n/MrcgqxjjpP1ydZvXZYbCkHcnCVd5ylsV4qFfyKW6iTCdnrT72lV2
         WB468ImO9u+cJxcBAiSs0g/9djSSLlIiGIT2DJE+zgPeP9TaK5Cat9/odLPGjvkOsbmY
         vlQcOflLhiij1h7lAl4mpBAhXcA83rViVyWg3UnmZqBnr/xgfPhiiLRD4OmP0Mdq4M9p
         LJkQBHkwIQbh2a2NIzNkkzPLts0SNETlNvvTCm1cRRCuJMtVcjnT1ZZkkLeaBYH6eIaS
         mnwHif5jcrsFRiIxwYQ/U7aed+Ywh8xVvqrEIWKEjblgONVec5bQExWF8LZoCNbiaVy/
         /kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tg3fq8QopDPM3H6hvEmtBHTEHxQ97zVsM+BL7BTqXak=;
        b=MS4fdcwxBCDSNrocJpWV8LbSywuAW7FWc9d/R/t9SQckmqH6e1LLtO7o9k80DtcT+V
         mcVUfHuTWuGsT01lJAy04xf3ARtjd/qCXC0FCVQFDa70gDC3BnIIg5jUbgZW/J96fjpv
         7Pc6C7wc7vRm8k0NHUN4/fHKJPxyQzxvsTK/eQfowSkajSoqTo9duj1r6dSEuxEWCuD9
         jMMndcdRc+34O11PxONvndh7C7L6OqUFgGzN+qnc2X4jOnDBfv9JXTZnk6zCsO9TX+f0
         BaONKZJYTYYejUSyDyWeFfM3LoryqskoN5Zq8npv5iLHsszucA4c7D+7VnirTTkMsvrZ
         XYVw==
X-Gm-Message-State: AOAM530Eq8VcF9Y3nKB7bIQxRcQcL9DhShHAo33pUgu2dbU8ErQx0o2R
        vQbdXSvMdfyzz6rauX7MU5wFxwdLCx5w2ml0GbQ0rj22m8I=
X-Google-Smtp-Source: ABdhPJwzngSedfmTekK6DcfXWG0KoOsa8Ux00cqZMuOOnx7SsXr9T5UEW/q/8/j+RvsYYar2v+M3mrw4kP0wSkWAOdo=
X-Received: by 2002:a50:ba84:: with SMTP id x4mr22683268ede.282.1597784863810;
 Tue, 18 Aug 2020 14:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200818161949.4083551-1-lorenzo@google.com>
In-Reply-To: <20200818161949.4083551-1-lorenzo@google.com>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Date:   Tue, 18 Aug 2020 14:07:32 -0700
Message-ID: <CAHo-OozLD+uE3Oi+dp2O3LcbYc8QcWuhcVfK1VXPNp8HO+QcOQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: gadget: u_ether: enable qmult on SuperSpeed Plus
 as well
To:     Lorenzo Colitti <lorenzo@google.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 18, 2020 at 9:19 AM Lorenzo Colitti <lorenzo@google.com> wrote:
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
> Fixes: 04617db7aa68 ("usb: gadget: add SS descriptors to Ethernet gadget"=
)
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
> 2.28.0.220.ged08abb693-goog
>

Reviewed-by: Maciej =C5=BBenczykowski <maze@google.com>

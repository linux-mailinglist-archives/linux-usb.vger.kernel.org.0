Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8DD5252299
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 23:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgHYVQX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 17:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgHYVQW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 17:16:22 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66590C061574
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2020 14:16:22 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id j25so9246553ejk.9
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2020 14:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w6n4txJ4EigQDO4mdlmR6EG8G7YCqN4NXK39t2onjL4=;
        b=EjzT8/4cYPJp66ySYlHmBPJf4AndLPl6+Ugp9a76fMoQI7zpboIhmLG+qIDuRS+ghS
         KLOusA/okIriPRSmQHP/uVi4LEQJklICjNT4visCkVIFnrfv3SxAGrWES4PJA3/ZUynb
         EA4todwD9Im/crw8zHMNjFzifx9c9gMgbyc25vvp29lvtXUNe7dA0IBR016nYC564G79
         gGxbpF7b9/KmwtNijJnKgVPqEiEpIm9QIXNunNWVJU6ffH8uisofKV9n2eRotMVtF+dC
         s9BMvmIGytINP9Prew/ldYM16aLE00VrZKQNHdTXDhOqhLIlezNLR5Bz1909T2kDKkbq
         4aZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w6n4txJ4EigQDO4mdlmR6EG8G7YCqN4NXK39t2onjL4=;
        b=hRWA8nX1QsnZle0G0O/Xp+ALrJ7w77oKuGWLLVoTUyLqd/g8lHKRw13Xp3ZfG9psM3
         7FK0Ly8BMjuA2MWGSb4pe1MzQVOmh9askDOvbM7fJU9dGbdphuww/TVrIUV3Jj8UAY8j
         55BSo7/Ela2a0MzDlyf7LoXV9QLr2NwH2RuXWKJDbP5w679+g3sdTNfZdPk947uyhE5G
         FqAlFFSslw6MBik7UWgYmra+TURw2kVUisYrm+4FQWzK7eUAO8vFgrnXH2NP5MJjwpnu
         3S+S7TSkWsFeCFjpmvN/Focs08mjHaIBIasjFdsIMgxWhNXvIl8frXXlCIWi+Mmkmti8
         FifQ==
X-Gm-Message-State: AOAM533rHC3GE7AxDM1CilyjlzlnmAVpr03W0F61jNuuk59IIwDM6FXq
        IdsfSvnVpREGi8PhLEiDDLTaa0hLHIFX7gAik6k=
X-Google-Smtp-Source: ABdhPJwgnCEi0qodfD7GJ0nTOKwhc6TYhcSK8coVx9I05oreFT54N2Fg/c7MvPn32kTN0HghNRgLIrn3N1xfDbLUE0M=
X-Received: by 2002:a17:906:fa19:: with SMTP id lo25mr12084353ejb.274.1598390180954;
 Tue, 25 Aug 2020 14:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200825055505.765782-1-lorenzo@google.com> <20200825055505.765782-2-lorenzo@google.com>
In-Reply-To: <20200825055505.765782-2-lorenzo@google.com>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Date:   Tue, 25 Aug 2020 14:16:10 -0700
Message-ID: <CAHo-OozGbtHLVx8m1CQj9a8wMynkTnmW0Xxe5H=GC3=3+tkjgA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] usb: gadget: f_ncm: fix ncm_bitrate for SuperSpeed
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

On Mon, Aug 24, 2020 at 10:55 PM Lorenzo Colitti <lorenzo@google.com> wrote=
:
>
> Currently, SuperSpeed NCM gadgets report a speed of 851 Mbps
> in USB_CDC_NOTIFY_SPEED_CHANGE. But the calculation appears to
> assume 16 packets per microframe, and USB 3 and above no longer
> use microframes.
>
> Maximum speed is actually much higher. On a direct connection,
> theoretical throughput is at most 3.86 Gbps for gen1x1 and
> 9.36 Gbps for gen2x1, and I have seen gadget->host iperf
> throughput of >2 Gbps for gen1x1 and >4 Gbps for gen2x1.
>
> Unfortunately the ConnectionSpeedChange defined in the CDC spec
> only uses 32-bit values, so we can't report accurate numbers for
> 10Gbps and above. So, report 3.75Gbps for SuperSpeed (which is
> roughly maximum theoretical performance) and 4.25Gbps for
> SuperSpeed Plus (which is close to the maximum that we can report
> in a 32-bit unsigned integer).
>
> This results in:
>
> [50879.191272] cdc_ncm 2-2:1.0 enx228b127e050c: renamed from usb0
> [50879.234778] cdc_ncm 2-2:1.0 enx228b127e050c: 3750 mbit/s downlink 3750=
 mbit/s uplink
>
> on SuperSpeed and:
>
> [50798.434527] cdc_ncm 8-2:1.0 enx228b127e050c: renamed from usb0
> [50798.524278] cdc_ncm 8-2:1.0 enx228b127e050c: 4250 mbit/s downlink 4250=
 mbit/s uplink
>
> on SuperSpeed Plus.
>
> Fixes: 1650113888fe ("usb: gadget: f_ncm: add SuperSpeed descriptors for =
CDC NCM")
> Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/fun=
ction/f_ncm.c
> index 1d900081b1..5b9266a87f 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -85,8 +85,10 @@ static inline struct f_ncm *func_to_ncm(struct usb_fun=
ction *f)
>  /* peak (theoretical) bulk transfer rate in bits-per-second */
>  static inline unsigned ncm_bitrate(struct usb_gadget *g)
>  {
> -       if (gadget_is_superspeed(g) && g->speed =3D=3D USB_SPEED_SUPER)
> -               return 13 * 1024 * 8 * 1000 * 8;
> +       if (gadget_is_superspeed(g) && g->speed >=3D USB_SPEED_SUPER_PLUS=
)
> +               return 4250000000U;
> +       else if (gadget_is_superspeed(g) && g->speed =3D=3D USB_SPEED_SUP=
ER)
> +               return 3750000000U;
>         else if (gadget_is_dualspeed(g) && g->speed =3D=3D USB_SPEED_HIGH=
)
>                 return 13 * 512 * 8 * 1000 * 8;
>         else
> --
> 2.28.0.297.g1956fa8f8d-goog
>

Reviewed-by: Maciej =C5=BBenczykowski <maze@google.com>

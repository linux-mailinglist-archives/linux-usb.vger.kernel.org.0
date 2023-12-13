Return-Path: <linux-usb+bounces-4090-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C96A810770
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 02:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22BCC1F2197C
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 01:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CC2A5E;
	Wed, 13 Dec 2023 01:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Epi5hp+O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878F0A5
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 17:12:06 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so6343a12.0
        for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 17:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702429925; x=1703034725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hduHVDy0MOFsp0Y6n+Hk33OuNWF1OBB68kJNXYKHkws=;
        b=Epi5hp+Oyzv9xfRAHslcuz2VY5Tl7azdwA1RNETf/7YZa8fHwajdYv4BYm5WtXxTtV
         d7UF/Xsx+Lswuo0mRoA572V4+B9lS9kpjRucA31dFP48fZ45xaKULzHDcleDc2mhyPXK
         X9YciKxjL+OjpD0KcnD2LxgO+wIEEcymEfufl9pRa8vi9KmZIG+6SHqT6xmijVuCh6zN
         wkHsX8AQb2mdNM8pc0gT6K0s/ULj40gMJpkMORIJ03X9/HtrbFZzNcoQhkA/dxrDj+MP
         l11FP+CLc9ijEAA2hHojE4rZmUsFMv8XWn8gjs/qOJuID4X0LKyg8KQ2rKbBeqIucZtM
         eXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702429925; x=1703034725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hduHVDy0MOFsp0Y6n+Hk33OuNWF1OBB68kJNXYKHkws=;
        b=BJPNcehen85xGWI7TGKreOrhYqGR7pVz0dWK/AEZSNxAWnf3NGQVhzkGVTzeZJuLnv
         RqtwePKv5QGjdcPfqJZGn/rYMvpnTAy+8xnPK0ozm/5YtuAib00y/KLyIg4ZG3IeuLw1
         BirZ8dYzyknYYwhGFs4bMlhYVuZCHJHC+cS4m03oMR4G7b4ORre1X6ve7v1UZC/XmnWu
         /Kv/4JGG9q6XblD0ucmkgxFq8ah/6azUlB6+aexY/+vYBKQClfY471gm5fqQL1v4gZXJ
         nqNHAST6WJkG4aZdxwUfCH4alxF85Kh+tf93ecGRLV9v97FtuA732Ob5vKP+XkdPPYlK
         V5dA==
X-Gm-Message-State: AOJu0Yyf52sYVprehP+84q257Hm9+qh5yw6AaBTIWId0NZzypDzhfzlR
	WeTw6a+Fpb/tKQ/3ytVqM13dW8e5MIDT+AophAwtCQ==
X-Google-Smtp-Source: AGHT+IGQerk5NGB3rNbGAUhdn/wlj9huGSDWiM00yD90xC46A7t3vCO7/NkzbSY4Z1OsywStrGPvVXCqs1DnDcFfo/Y=
X-Received: by 2002:a50:d601:0:b0:551:f450:752a with SMTP id
 x1-20020a50d601000000b00551f450752amr39888edi.6.1702429924863; Tue, 12 Dec
 2023 17:12:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212203222.lxihy34lh22g6d3w@hdebian> <ccb72864-6623-4652-8ccf-700c2c68916e@suse.com>
In-Reply-To: <ccb72864-6623-4652-8ccf-700c2c68916e@suse.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Tue, 12 Dec 2023 17:11:49 -0800
Message-ID: <CANP3RGdOT9rrBai+uuTZCo7JPyeEbh_u+vu6VD7t_Z80nfAn1Q@mail.gmail.com>
Subject: Re: Question regarding CDC NCM and VNC performance issue
To: Oliver Neukum <oneukum@suse.com>
Cc: Hiago De Franco <hiagofranco@gmail.com>, Francesco Dolcini <francesco@dolcini.it>, davem@davemloft.net, 
	edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org, 
	linux-usb@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 1:21=E2=80=AFPM Oliver Neukum <oneukum@suse.com> wr=
ote:
>
> On 12.12.23 21:32, Hiago De Franco wrote:
>
> Hi,
>
> > On Mon, Dec 11, 2023 at 12:44:42PM -0800, Maciej =C5=BBenczykowski wrot=
e:
> >> On Mon, Dec 11, 2023 at 12:29=E2=80=AFPM Hiago De Franco <hiagofranco@=
gmail.com> wrote:
>
> >> Hiago, could you try lowering CDC_NCM_TIMER_PENDING_CNT, if need be al=
l the way to 1?
> >> It is defined in include/linux/usb/cdc_ncm.h as 3 currently
> >> This applies to the host side.
> >
> > On my side CDC_NCM_TIMER_PENDING_CNT is set to 2 by default, did you
> > mean CDC_NCM_RESTART_TIMER_DATAGRAM_CNT?
>
> Yes, I meant that. Sorry.
>
> > Despite of that, I tried to lower both CDC_NCM_TIMER_PENDING_CNT and
> > CDC_NCM_RESTART_TIMER_DATAGRAM_CNT all the way down to 1, first the
> > CDC_NCM_TIMER_PENDING_CNT, then CDC_NCM_RESTART_TIMER_DATAGRAM_CNT and
> > finally both at the same time, but it didn't help.
> >
> > I've also put some printks as following:
> >
> >       ctx->tx_curr_frame_num =3D n;
> >       printk("hfranco: tx_curr_frame_num =3D %d", n);
> >
> >       if (n =3D=3D 0) {
> >               printk("hfranco: n =3D=3D 0");
> >               /* wait for more frames */
> >               /* push variables */
> >               ctx->tx_curr_skb =3D skb_out;
> >               goto exit_no_skb;
> >
> >       } else if ((n < ctx->tx_max_datagrams) && (ready2send =3D=3D 0) &=
& (ctx->timer_interval > 0)) {
> >               printk("hfranco: tx_max_datagrams =3D %d", ctx->tx_max_da=
tagrams);
> >               printk("hfranco: timer_interval =3D %d", ctx->timer_inter=
val);
> >               printk("hfranco: n inside else if =3D %d", n);
> >               /* wait for more frames */
> >               /* push variables */
> >               ctx->tx_curr_skb =3D skb_out;
> >               /* set the pending count */
> >               if (n < CDC_NCM_RESTART_TIMER_DATAGRAM_CNT)
> >                       ctx->tx_timer_pending =3D CDC_NCM_TIMER_PENDING_C=
NT;
> >               goto exit_no_skb;
> >
> >       } else {
> >               printk("hfranco: n inside else =3D %d", n);
> >               if (n =3D=3D ctx->tx_max_datagrams)
> >                       ctx->tx_reason_max_datagram++;  /* count reason f=
or transmitting */
> >
> > I ran it on my host PC, compiled it as module for my Debian dekstop, an=
d

Shouldn't you be doing this on the gadget side?
I thought we were thinking it was the gadget transmit timer having issues.

> > this is the dmesg:
> >
> > [ 9663.478807] hfranco: tx_curr_frame_num =3D 1
> > [ 9663.478816] hfranco: tx_max_datagrams =3D 40
> > [ 9663.478818] hfranco: timer_interval =3D 400000
> > [ 9663.478820] hfranco: n inside else if =3D 1
> > [ 9663.478822] hfranco: timer started
> > [ 9663.479645] hfranco: tx_curr_frame_num =3D 1
> > [ 9663.479652] hfranco: n inside else =3D 1
> >
> > And then it basically repeats. Looks like 'n' never passes the 1 value.
> > By tweaking the flags mentioned before, 'n' got a value of 4, but that
> > was the maximum value. I was wondering, why do you think this code look=
s
> > suspicious? I basically just inserted some printks on the tx side, I
> > will see if I can get something from the rx as well.
>
> If we look at the statistics you initially gathered, we can see that all =
transmissions
> on the host side happen because the timeout elapses. That, however, does
> _not_ tell us that the host is to blame. We could look at two possible sc=
enarios
>
> A - the gadget is bundling up the packets with too much delay and the hos=
t
> just answers to the megatransmissions with one packet and the delay on th=
e host
> is inconsequential
>
> B - the timer on the host runs for too long or sometimes not at all. If t=
hat were
> the case that code I pointed out would be most likely to blame
>
> Could I suggest we try to localize the issue? Can you ping the host from =
the device?
>
>         Regards
>                 Oliver

--
Maciej =C5=BBenczykowski, Kernel Networking Developer @ Google


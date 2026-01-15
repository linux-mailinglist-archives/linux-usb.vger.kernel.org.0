Return-Path: <linux-usb+bounces-32361-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9FDD220AA
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 02:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 461CA301A0D1
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 01:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7BE24BD1A;
	Thu, 15 Jan 2026 01:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzafDcRu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f68.google.com (mail-yx1-f68.google.com [74.125.224.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994B52745C
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 01:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768441057; cv=none; b=u8Ggh/qsOGJH0o2q08cOe7MKtPgNygQGgfiUjB206uSwe5BmMtGClvfoRSmP8UcjYqm/I3iYNjUiHbVbVPfk7pPEGlQNRi5h+1tlej5HPI69/MLZi9pibkfdbsRGW//fJGUa0V6SLdCdwSE5tr6FcraophzVpPEGBeKZS6RzIKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768441057; c=relaxed/simple;
	bh=lrBxfCFHk+sKV/vPX6Piq/EGDpfS6Td7IPPcFSyc1pQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5Ry/Qdh14KTGsNVD2CJXk0sn0JcQDLgeMoxCypGI5/A5oKLTD7KeWp+Yr4Wp7UhuvFpjWSU2LSh0CP7w1YQYh5EQcyPEObRhBFCzdgXX4VcstCO+ZgSvUP0IT5SUM9gOGY4A09nfK/arJ0+l5ihggqJUUJzZ4R8KeX7NppJMxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzafDcRu; arc=none smtp.client-ip=74.125.224.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f68.google.com with SMTP id 956f58d0204a3-6420c08f886so498014d50.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 17:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768441056; x=1769045856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YirfysgYMdBvFk99B2wJC0lksxajAD7fV8Cq0vE9ImY=;
        b=MzafDcRuhh2u8aXSuu/TAj5nz8lAJanfa30AvySvpD/VW6Jtx+rVH0U77LzoyxQmDN
         h8vUKYiE0pRyPyzNABB8HfSXDJdlAbHvJQsmrSnNn+uG9NS4UnjJSdm8+GuDL+YoLd54
         MbZpzwEYL/D4AG7zqznHjldi0DlEG8MBGrUp8j4dwOvPZq+Fs7Ljjluba91OlkDi+mPh
         dvpb9hAA9FWO6Y327Ey3l5Vk9gs74wDj+vM4MVDCxapM30qP5yb3HsW2hRE5yV6AzvR9
         uY3Q+AEumZ+yK3E+22xliiMtkZWxWrXMR+O2GwU7DaGpKztW6rQIuo7zucmdAi3AvIEU
         91Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768441056; x=1769045856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YirfysgYMdBvFk99B2wJC0lksxajAD7fV8Cq0vE9ImY=;
        b=XSoXxG6Vsl9LskytQ7ze9K7Z2EMpkBdUZctASWfbOj4zH6GmTSdyX1CJrqZIjOPNlg
         +Dsm9UgAz+HYC08MhYv9BkkoV/gXeYGAZyWexmZPc2m1Jbo9ZCZIU24pT4cK22xAqPzs
         TlmlVyuKbt//hUwYJ3SEpVbYkKw+k2w93FAuOuHgAQ7GPBN8BomtInbgHNKwRmapIMDX
         vXgR6Shen2LW7C1zpIChUaiTMluwfMTu0WWYI1MUjTmzMayYJaq6mrdXiaPVBJ/cA7iW
         7ZaKZAf+LPAD9eCRGj4k2GOGve+xH+qmvhYWUEeH44st+yjxqJK8WPMQBKPv/gCJBY1Q
         sX8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAVJwNNnqJPAJVh7Fmj4yqyVBJSQ7xyizCWA7nWCNcxOjFm1b7ffn951khF95V8dEFCy7jg1hsyAU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0LLfB0dTbMiVLGoBzkidCdovgXJFSziWX7WbTaTfd36wFIa3f
	V29juvz1i7eSGToW/97zw4FwCU9zpyFRYECIfNh/xhHYWXoWZFTUC561TqCTB6fXWGjME3kw795
	JTmrmfP0qD9kkuY9JQ0KuMr8X0prbFF0=
X-Gm-Gg: AY/fxX6WQr6yYlEaSF5pZOdwZM9WK6DuGCBRc7P7fwvnZNG/lvk8xayBOE/EER68IQK
	NiU6JMZaq8iQzi3Yg7UmDmY4txjW4SFdlNxdcSmPq3x6JEFyIbk+i7vlLndBSjft54HMWfWY2pD
	7vMIAL61NmPL/bs9/BUJEA//S2vNiE2cqx7WGDIHZaKv2O92qWbsuF2wPgSm/S1lQS5PXTvaaG+
	BsK7085poBZ4Wdnp5shG8xU+TF9OUY/hKqHhOpNmxHInZnrxfoTNvBDuwGNzivsBmDxQ2ppNQzL
	eBWNGFkKcQxGKME=
X-Received: by 2002:a05:690e:1209:b0:644:60d9:7538 with SMTP id
 956f58d0204a3-64901b291f1mr3044766d50.94.1768441055734; Wed, 14 Jan 2026
 17:37:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114025622.24348-1-insyelu@gmail.com> <3501a6e902654554b61ab5cd89dcb0dd@realtek.com>
In-Reply-To: <3501a6e902654554b61ab5cd89dcb0dd@realtek.com>
From: lu lu <insyelu@gmail.com>
Date: Thu, 15 Jan 2026 09:37:23 +0800
X-Gm-Features: AZwV_Qjcp6qk4o1JaIdGtozRTxgzn4PqECwb9cv4PmT5KQFRTyXtVRh5TBO0nso
Message-ID: <CAAPueM4XheTsmb6xd3w5A3zoec-z3ewq=uNpA8tegFbtFWCfaA@mail.gmail.com>
Subject: Re: [PATCH] net: usb: r8152: fix transmit queue timeout
To: Hayes Wang <hayeswang@realtek.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>, 
	nic_swsd <nic_swsd@realtek.com>, "tiwai@suse.de" <tiwai@suse.de>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hayes Wang <hayeswang@realtek.com> =E4=BA=8E2026=E5=B9=B41=E6=9C=8814=E6=97=
=A5=E5=91=A8=E4=B8=89 12:38=E5=86=99=E9=81=93=EF=BC=9A
>
> insyelu <insyelu@gmail.com>
> > Sent: Wednesday, January 14, 2026 10:56 AM
> [...]
> > When the TX queue length reaches the threshold, the netdev watchdog
> > immediately detects a TX queue timeout.
> >
> > This patch updates the transmit queue's trans_start timestamp upon
> > completion of each asynchronous USB URB submission on the TX path,
> > ensuring the network watchdog correctly reflects ongoing transmission
> > activity.
> >
> > Signed-off-by: insyelu <insyelu@gmail.com>
> > ---
> >  drivers/net/usb/r8152.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> > index fa5192583860..afec602a5fdb 100644
> > --- a/drivers/net/usb/r8152.c
> > +++ b/drivers/net/usb/r8152.c
> > @@ -1954,6 +1954,8 @@ static void write_bulk_callback(struct urb *urb)
> >
> >         if (!skb_queue_empty(&tp->tx_queue))
> >                 tasklet_schedule(&tp->tx_tl);
> > +
> > +       netif_trans_update(netdev);
> >  }
>
> Based on the definition of netif_trans_update(), I think it would be bett=
er to move it into tx_agg_fill().
> Such as

HI Hayes Wang,

To reduce the performance impact on the tx_tl tasklet=E2=80=99s transmit pa=
th,
netif_trans_update() has been moved from the main transmit path into
write_bulk_callback (the USB transfer completion callback).
The main considerations are as follows:
1. Reduce frequent tasklet overhead
netif_trans_update() is invoked frequently under high-throughput
conditions. Calling it directly in the main transmit path continuously
introduces a small but noticeable CPU overhead, degrading the
scheduling efficiency of the tx_tl tasklet.
2. Move non-critical operations out of the critical path
By deferring netif_trans_update() to the USB callback thread=E2=80=94and
ensuring it executes after tasklet_schedule(&tp->tx_tl)=E2=80=94the timesta=
mp
update is removed from the critical transmit scheduling path, further
reducing the burden on tx_tl.
3. This design follows the approach used in mature USB NIC drivers
such as rtl8150

Although it is semantically more intuitive to call
netif_trans_update() at the point where tx_agg_fill is defined,
delaying the timestamp update is both reasonable and safe from a
performance standpoint=E2=80=94the network watchdog mechanism only requires=
 a
coarse indication that =E2=80=9Ca transmission occurred recently=E2=80=9D a=
nd does not
require strict synchronization with the submission time of each
individual packet.
If strict semantic consistency is preferred, I am happy to resubmit a
patch that aligns with the above rationale.

Best Regards,
insyelu
>
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -2449,6 +2449,8 @@ static int r8152_tx_agg_fill(struct r8152 *tp, stru=
ct tx_agg *agg)
>         ret =3D usb_submit_urb(agg->urb, GFP_ATOMIC);
>         if (ret < 0)
>                 usb_autopm_put_interface_async(tp->intf);
> +       else
> +               netif_trans_update(tp->netdev);
>
>  out_tx_fill:
>         return ret;
>
> Best Regards,
> Hayes
>


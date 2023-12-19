Return-Path: <linux-usb+bounces-4339-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F30818741
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 13:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAF8C285458
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 12:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F7017758;
	Tue, 19 Dec 2023 12:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wOu4JDKn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142D11772C
	for <linux-usb@vger.kernel.org>; Tue, 19 Dec 2023 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5534180f0e9so10733a12.1
        for <linux-usb@vger.kernel.org>; Tue, 19 Dec 2023 04:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702988405; x=1703593205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGKx9QMiELZaU1HwmiSAKm9vP6vU82H9qicT2UPdRAA=;
        b=wOu4JDKnCc25qfKeVWD+um8Fg3A4i2qqzw4DR682b2GBgmcIRbnbsmQk589k5OVVN8
         g/z3FBHS3TWzZB/QSQoBnuqWLuZ99qdmh+2okPywL67BfG2WhcRXaSiaIaDDrMZfWPS1
         xtXkuZ3NX9LI9CDu9QiEmadAX20c0P3wCW6mRzorATXdbStx3XDGFN43riznP5TfdnrT
         ZUrshnMM1cYKNFrYpbx83YkG/ux7Egw1D8Yu8bXJRbDRcGqyZ6uxL2rnPa06U50X/Fr8
         FW5P6MrG9pi3YbKJndrFiW1J7Uo3DhcEDHz+/F2/55nx25tuofgB/CNyLeSE57bUHgpZ
         PPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702988405; x=1703593205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGKx9QMiELZaU1HwmiSAKm9vP6vU82H9qicT2UPdRAA=;
        b=bqS461gMC6w3hNAeco5XimKf/qx30QgnlLb8dHkng68nw0JbFbWhptcElJNM+QYqK6
         xr0FdT0a8E7Di9UHyJ+NddNJysZUjNs3K2v3i7qT0T1bbwlMgUm57XGsNIBjCkKdwS0y
         omDbdp9WkO6ePEJ/FaPqUyHp2V5oESFfDwf5UNap4yiSXVwlFgAsl6ZxeuIpUhgmqSmZ
         9c77SdvD1fS83i7uv524qy60BXrgpa7poJGn9zR76Vy3UrPfZCskzS6Z+bDuN0MO3396
         tlCDknq8nAeA4eE6gxnsPbtLqI0wL3qPPeIo87dZWrGWODE/Wli59io7Spm1CA/uDydI
         xwNQ==
X-Gm-Message-State: AOJu0YwMs0hJQ/5P5d/vbP5rxHQ+d/vXWXQIyjw2RJIPWIUW5OIE9Myk
	Ojhe0jQA4PJ1vmlIAffcApu/lWhBLpYg2ry5kgNlDgws9o4H
X-Google-Smtp-Source: AGHT+IEU8rdVu5lsATrA28teIjlBjuDo5LPV0Y+k9ss08xuxB0zair0pdU8qdOGxA1Wd4JxB4gTiXvIGf040+H/E9Ys=
X-Received: by 2002:a50:cd89:0:b0:553:6de7:43d7 with SMTP id
 p9-20020a50cd89000000b005536de743d7mr178004edi.6.1702988403706; Tue, 19 Dec
 2023 04:20:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANP3RGefehSBiFUbaEbLGiaj64JsYbATJhr+i_4ed-xjq2ARZA@mail.gmail.com>
 <70822a4d-a9d9-4be4-9d1f-89e50a8a7378@suse.com> <20231218205953.g77zdjsojrgjak6a@hdebian>
 <CANP3RGf6OEA1kksEPSKd1A4U3P-GEp1ySnhi_X1qB_9KeQfMYw@mail.gmail.com> <0603f052-df86-4803-b7f3-4a263d7ebcf2@suse.com>
In-Reply-To: <0603f052-df86-4803-b7f3-4a263d7ebcf2@suse.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Tue, 19 Dec 2023 04:19:46 -0800
Message-ID: <CANP3RGeg1NKGcoOyst-UWLbf=j9f2Qj27YbvTBPGMZADaqxeJQ@mail.gmail.com>
Subject: Re: Question regarding CDC NCM and VNC performance issue
To: Oliver Neukum <oneukum@suse.com>
Cc: Hiago De Franco <hiagofranco@gmail.com>, Francesco Dolcini <francesco@dolcini.it>, davem@davemloft.net, 
	edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org, 
	linux-usb@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 12:45=E2=80=AFAM Oliver Neukum <oneukum@suse.com> w=
rote:
>
>
>
> On 19.12.23 00:00, Maciej =C5=BBenczykowski wrote:
> > On Mon, Dec 18, 2023 at 1:00=E2=80=AFPM Hiago De Franco <hiagofranco@gm=
ail.com> wrote:
>
> Hi,
>
> >> Everything basically worked, without any freezing/slowness (please not=
e
> >> that during the test I wasn't using the VNC client, only the arping). =
I
> >> also did it using screen with ssh/serial console disconnected.
> >>
> >> Although I passed -U flag to arping, I still get replies. Is this
> >> expected?
> >
> > No. this defeats the purpose of the (since it's not unidirectional).
> > Perhaps -A would work better.
> > You could also probably pick an ip as the destination that isn't the
> > device on the other side of the cable, so that it *doesn't* respond.
> >
> > The following seems to work for me:
> >    while true; do sudo arping -c 1 -i $DEV -b 1.2.3.4; sleep 10; done
> > since nothing responds to 1.2.3.4 on my lan.
> >
> > But Oliver's point about it possibly needing 10 or 11 queued packets
> > is also interesting...
> > though that would be very very weird...
>
> Probably not 10 or 11 but more than 1. Sorry for being unclear. Let me
> explain.
>
> The timer should not run for an idle interface, should it?
> Thus we have three situations
>
> A - first network packet to be transmitted:
> queue it and start a timer
>
> B - further network packet to be transmitted:
> queue it and modify the timer
>
> C - enough network packets:
> transmit
>
> It seems to me that Hiago has just shown that A works. Lowering the thres=
hold
> also solves the issue, so C works. Case B seems to be the issue, yet the =
test
> setup tests case A. That is my issue.

Perhaps.  I've been looking at the gadget tx code, and assuming hrtimers wo=
rk,
I don't see how it could possibly screw up...  the hrtimer arm/cancel
are clearly
at the same spot in the code where we allocate/unqueue the ncm->skb_tx_data

(I have found a potential use-after-free-on-error bug and a stupidity
that I'll send fixes for,
but that doesn't appear related to this thread)

But the host side driver seems more complex/confusing.
However, I've not really ever looked at it previously though, so it
might just be that...

Maybe there's some case where we end up with no timer and queued packets??
Haven't found it yet though...

>
>         Regards
>                 Oliver


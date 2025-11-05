Return-Path: <linux-usb+bounces-30083-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4533EC3561B
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 12:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A74511A202B4
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 11:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CD0309F18;
	Wed,  5 Nov 2025 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jdzg+1om"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473732C324F
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762342511; cv=none; b=hSo937aBCXUN2pwFqrQFz4uWsrH7y/4ImV675xg3iuiQ5BWxaX71yo0ZyBBrXFXxavDx+jx0xvMhkBowrydYz7NcB3IzMXNANuIgYGuDLPiyUnWtTB8zHoDCWs25KafGVnkgdSvW+J3WL+3OUHCOjRaEPTHilmniiCC6o9oq/ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762342511; c=relaxed/simple;
	bh=NDPmengAA3O43vQ2dEatpgskmbKE/KwZ+34jsLyahiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdUfd4JCQTx8ELsah42GU3771ozKj/3GNPibyuVbaGWZR+qoQcr8fllzMu9yEggXBecGyWoMu8xxt6MfRUtzzzT493kB9iQEiDHqRqC0SVMaUFAcmD+aIQnsjBBIvjsqaPhTr2PIgNyqoHNk0iToxk8dH8+ohuDlnl9zdaXpyFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jdzg+1om; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ed02d102e2so66386071cf.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Nov 2025 03:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762342509; x=1762947309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+W1N3GV0ISOIB1b307IaPpcps1dImR1XBpRzOuXp+w=;
        b=jdzg+1om9LCoGLAv/JR6qBnp9Fy3mzEYdmqKz+ZyrS8p4gJL8bf5x8yujvxAKQyC8m
         82uKcj7j34jt4j+i2b+n8NPQIZ1FajKc3KuKIRQ8Xpil68x5AGCelfhIrMyKA6rCg40O
         oOgxrTU3ptDGta0v9fJKIY4n9d2qHH/AA3dXezSLRNSsEEnaw/kNIMe8XhkVrnVHKR9C
         Sfui0aQ3ClthgAbjyZXrND//LmSVpzbAozIBP8a7H0+nxBkAiLQHGvGVpmKvfufNLPhi
         vY14WoEfXKqU+W/eHtJkMpyhSqyj+6xBR48EWAlOMCNHXd0uYag1LhgOHlxi2DirnSVW
         NeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762342509; x=1762947309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+W1N3GV0ISOIB1b307IaPpcps1dImR1XBpRzOuXp+w=;
        b=XPTvK94VCZbW6EP8NK/FgjUv53uYFu+a2yVuGM3R5+q4vnCD+VGQd1jwUcJKk8579S
         40vlSpp4H23ckx64gplKSSO9K+0e8x9+Da1XRZWxbjAtAyB7Cg1K3ZhUBG/LkBTVBtc7
         j95teS7jE552pvxLmVzcnGJ5UonbPQw1U/1MOx0kvnjkfnlnU1mcCrlWJvR0LDhqURpV
         IOq86IfWXABLBUeRrCCbzxw0+bJV03lEhQkUgMNx508cVBpeF2nNBVQOb/aT9O/bSke9
         0d3pQnYcVKJuuB18jPi5zSh8JK86FzpLwBPbkXYtSaLZxXoY2XH8tczF57YhCy8BeWbk
         ZePQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwLtbSuHdAXniEbiHqsW05npZ74ez6jXnRZWogB9aYL3NCYDvinJRoamv9cNtraQbpTa3nBaE7+O0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKopudaH2/+wTY4Pl1q4SBSS/UDT0t/qIJPy6NokdnWhFHjIVt
	anYWEgXTrLMetMC53H4XE1ge/o+HYb075OehzYOYdHkI1TsQc9OAJUDgw4bTKvSeMo4jsDMzUio
	wMLxf/pjdrl2QNHfqT8LfYm3ng91PI3JNPP9CNrGp
X-Gm-Gg: ASbGncuSdpJy4dgPpGmSXNOYW2w+wJ7rzBle/uWn7jtjbYaCwjfPCsYXGQDVfQ3K733
	laJsB4u+OiAMrVCVHDMFtPUBrloKMwO3AZ57JBpPW7VfUywkDkMdtKXk6uPbbTVziaHJY5F19zU
	v75QJ7ts6XVFKTmbpcMtEM9BqIdPG4PXJe/Eenvpdjfm+ccWPHLUTT/+tUu97BKNz+X2Z1jEB4v
	jepxTkwxrahK6rChGHB5LzOEkhk97kMU+6fXtB7/2Dlkaf51PhD6T9JbxhJ
X-Google-Smtp-Source: AGHT+IGMXcCEhIJHpGo7YNeYhryMQkkc6IzLUqJAUavr5rpAuF/dXxmhxy/A4LPKy1yD7Bty4AsF95OH791uN0yuHXY=
X-Received: by 2002:a05:622a:18a8:b0:4e8:a3ed:4c50 with SMTP id
 d75a77b69052e-4ed72357bb0mr34619601cf.24.1762342508898; Wed, 05 Nov 2025
 03:35:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104161327.41004-1-simon.schippers@tu-dortmund.de>
 <CANn89iLLwWvbnCKKRrV2c7eo+4UduLVgZUWR=ZoZ+SPHRGf=wg@mail.gmail.com> <f2a363d3-40d7-4a5f-a884-ec147a167ef5@tu-dortmund.de>
In-Reply-To: <f2a363d3-40d7-4a5f-a884-ec147a167ef5@tu-dortmund.de>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 5 Nov 2025 03:34:57 -0800
X-Gm-Features: AWmQ_bkvkKkMJFocPBsmzZgiLwCaG6r4wmjfCZGCsPkSck7oY88Q0TSSw56W1JE
Message-ID: <CANn89i+66TqhOgcBqnbDDEdubDNHnhUyNk0XZdBdhxFrXM=fug@mail.gmail.com>
Subject: Re: [PATCH net-next v1 0/1] usbnet: Add support for Byte Queue Limits (BQL)
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: oneukum@suse.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 2:40=E2=80=AFAM Simon Schippers
<simon.schippers@tu-dortmund.de> wrote:
>
> On 11/4/25 18:02, Eric Dumazet wrote:
> > On Tue, Nov 4, 2025 at 8:14=E2=80=AFAM Simon Schippers
> > <simon.schippers@tu-dortmund.de> wrote:
> >>
> >> During recent testing, I observed significant latency spikes when usin=
g
> >> Quectel 5G modems under load. Investigation revealed that the issue wa=
s
> >> caused by bufferbloat in the usbnet driver.
> >>
> >> In the current implementation, usbnet uses a fixed tx_qlen of:
> >>
> >> USB2: 60 * 1518 bytes =3D 91.08 KB
> >> USB3: 60 * 5 * 1518 bytes =3D 454.80 KB
> >>
> >> Such large transmit queues can be problematic, especially for cellular
> >> modems. For example, with a typical celluar link speed of 10 Mbit/s, a
> >> fully occupied USB3 transmit queue results in:
> >>
> >> 454.80 KB / (10 Mbit/s / 8 bit/byte) =3D 363.84 ms
> >>
> >> of additional latency.
> >
> > Doesn't 5G need to push more packets to the driver to get good aggregat=
ion ?
> >
>
> Yes, but not 455 KB for low speeds. 5G requires a queue of a few ms to
> aggregate enough packets for a frame but not of several hundred ms as
> calculated in my example. And yes, there are situations where 5G,
> especially FR2 mmWave, reaches Gbit/s speeds where a big queue is
> required. But the dynamic queue limit approach of BQL should be well
> suited for these varying speeds.
>
> >>
> >> To address this issue, this patch introduces support for
> >> Byte Queue Limits (BQL) [1][2] in the usbnet driver. BQL dynamically
> >> limits the amount of data queued in the driver, effectively reducing
> >> latency without impacting throughput.
> >> This implementation was successfully tested on several devices as
> >> described in the commit.
> >>
> >>
> >>
> >> Future work
> >>
> >> Due to offloading, TCP often produces SKBs up to 64 KB in size.
> >
> > Only for rates > 500 Mbit. After BQL, we had many more improvements in
> > the stack.
> > https://lwn.net/Articles/564978/
> >
> >
>
> I also saw these large SKBs, for example, for my USB2 Android tethering,
> which advertises a network speed of < 500 Mbit/s.
> I saw these large SKBs by looking at the file:

TCP does not sense the underlying network speed. This would be moot if
a link is shared by one thousand flows...
The rate is determined by CWND * MSS / RTT.
Some congestion controls have a tendency to inflate CWND to a very big
value, hence bufferbloat.
One of BBR goal is to avoid bufferbloat.

BQL is only a part of the solution.

Disabling TSO/GSO is certainly not part of the solution, you can trust
me on this.

>
> cat /sys/class/net/INTERFACE/queues/tx-0/byte_queue_limits/inflight
>
> For UDP-only traffic, inflight always maxed out at MTU size.
>
> Thank you for your replies!
>
> >> To
> >> further decrease buffer bloat, I tried to disable TSO, GSO and LRO but=
 it
> >> did not have the intended effect in my tests. The only dirty workaroun=
d I
> >> found so far was to call netif_stop_queue() whenever BQL sets
> >> __QUEUE_STATE_STACK_XOFF. However, a proper solution to this issue wou=
ld
> >> be desirable.
> >>
> >> I also plan to publish a scientific paper on this topic in the near
> >> future.
> >>
> >> Thanks,
> >> Simon
> >>
> >> [1] https://medium.com/@tom_84912/byte-queue-limits-the-unauthorized-b=
iography-61adc5730b83
> >> [2] https://lwn.net/Articles/469652/
> >>
> >> Simon Schippers (1):
> >>   usbnet: Add support for Byte Queue Limits (BQL)
> >>
> >>  drivers/net/usb/usbnet.c | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> --
> >> 2.43.0
> >>


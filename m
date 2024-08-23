Return-Path: <linux-usb+bounces-13927-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEA895C5EC
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 08:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED4E11F235C4
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 06:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCBB13A265;
	Fri, 23 Aug 2024 06:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DTm0UDS0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718A1376E9
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 06:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396335; cv=none; b=l+yehCmrZwfEwtPijYCLVh7MfvJx4QP4ynS/pcLrqbnTgiIQ5YsABwuLe/bKpQ8CNUvDrzVenW0DYOrfqGA0ydY/JkvGO07so2ZLsKXHVXs6EIDLdb2nvXUxkfABwAX7GdvBGCZDviAXL0NVpaIvgA+3cqfPFGiIH6FbD615T8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396335; c=relaxed/simple;
	bh=x4RcTxS7zfyh4VHyZyqlmz2Rc+bMT15P3mXl4u4J2bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0GMHp/MrjnYnarUnKbfBKc4KcHx/6xs+YcexbOGQqQLFDKIA95vn3iWT3c2EhgrzFSGEe1do67y1Eg+BGWS5+nFLERTIrMzpqZN5MwJPfVtaxpZWys5Q/pilzmITp2pf3K2x9QDVs9LCEFBRPhq2qwz5byMBQewqXK6aVLGxgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=DTm0UDS0; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a86a37208b2so69111966b.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 23:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724396332; x=1725001132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcIxVeXUlcjPdvkVXsSj564WbRYyu4Yc+PxDazeFpqE=;
        b=DTm0UDS0hge/iB4brm2d1SGUgR/Ap3dIWBWYxZ2zzEYpGCPg2iXRmqZJmJTvHhnpsm
         jKnf7XdvSJecGT8zoLFy7HoZdY+KhKItw4Qa445DZq/Emu1/2mxdafp8SUFKp1cZnUZ7
         Lst0Sj41FPIE6lfeenq9GVpZorwpwedrz3XdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724396332; x=1725001132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcIxVeXUlcjPdvkVXsSj564WbRYyu4Yc+PxDazeFpqE=;
        b=mblWbpjbKdAuadWHxsEA4zLm86EdR0CyfgNhc/P1YgLiRxS5Q3S5kC1Y0P4YL0Xj8M
         es1UbeCMMIVXwZ3yy/C0c4BJkJ2Fj2T8D/XtbS79cR4pn0Tkf3mwN+suUXFFF43rQGl8
         DAkSeuGZCvIEdD3/Et4yE2vBySexPRVwjJUoTsbrJJeBXJLxkfhyvdk582Jh+tyHzG/g
         7nr5bmbxpycxX/lDt7Qf/JsQirV9Dp+cKeD+lvb+5Bj1gfnSNc0PwV63zSDYYZV0HajM
         eIwJVphBGyqWf3b52WYuH3Z4Qw2DDwF5Tu+bx9xU1b7GNzIZ9k0v0zMSssAIyJT0O5oF
         Z79w==
X-Forwarded-Encrypted: i=1; AJvYcCW0mv89AxQaNRZxDOAAELZkKw6Ux7PMh/mc+x0Jah8kdv28BOu43sJ0TWFde8L10XZKLkOclDlMHcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQxk1AdjbIbV04FfKp4ZVyw9yKQ7KePmDK9uOsPnNYiJwSbcSL
	WokXuu6CFmrs81uSwx2P3xw7fQ71mZc1QG5rwP+GJf+ohxieYjONGy0wsdDbwv87+T1HMBAICI3
	+EnWICLtXs2g5d30gcxwSXGTpxw759yo375jRbA==
X-Google-Smtp-Source: AGHT+IFG+M4ne0xENiIqIcMPBrRLBLgQky0RVUEjz1aXRxZPrsloy3xTC9Z6s3XTTLDlppz5PKUmpwzZQofsdjIJn+k=
X-Received: by 2002:a17:906:da88:b0:a86:799d:f8d1 with SMTP id
 a640c23a62f3a-a86a54a991cmr93026066b.47.1724396331230; Thu, 22 Aug 2024
 23:58:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYUPR06MB62171A7BF25AB6963CBA07FED28F2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <2024082251-grief-profanity-b0da@gregkh> <TYUPR06MB62176043F3E6D6B6675301D3D2882@TYUPR06MB6217.apcprd06.prod.outlook.com>
In-Reply-To: <TYUPR06MB62176043F3E6D6B6675301D3D2882@TYUPR06MB6217.apcprd06.prod.outlook.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 23 Aug 2024 08:58:39 +0200
Message-ID: <CAOf5uwnz01F28kw12ZN5k3usTcCBMKpFJpAXTaYBZ_3zgWQU3Q@mail.gmail.com>
Subject: Re: [PATCH v6] usb: gadget: u_serial: Add null pointer check in
 gs_read_complete & gs_write_complete
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Prashanth K <quic_prashk@quicinc.com>, 
	"quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"opensource.kernel" <opensource.kernel@vivo.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Aug 23, 2024 at 8:40=E2=80=AFAM =E8=83=A1=E8=BF=9E=E5=8B=A4 <hulian=
qin@vivo.com> wrote:
>
> Hello linux community expert:
>
> >> Fixes: c1dca562be8a ("usb gadget: split out serial core")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> >> ---
> >> v6:
> >>   - Update the commit text
> >>   - Add the Fixes tag
> >>   - CC stable kernel
> >>   - Add serial_port_lock protection when checking port pointer
> >>   - Optimize code comments
> >>   - Delete log printing
>
> >You need to list ALL of the versions here, I seem to have missed v4 and
> >v5 somewhere so I don't know what changed there.
>
>  V4: Add cc stable kernel     >> Cc: stable@vger.kernel.org
>  V5: Add the Fixes tag       >> Fixes: c1dca562be8a ("usb gadget: split o=
ut serial core")
> >You can also add the Fixes tag and CC stable kernel, so that it can be
> >backported to older kernels (such as 5.15) also.
>    ---------  The above two lines are from Prashanth K's comment
>
> >>  static void gs_read_complete(struct usb_ep *ep, struct usb_request
> >> *req)  {
> >> -    struct gs_port  *port =3D ep->driver_data;
> >> +    struct gs_port  *port;
> >> +    unsigned long  flags;
> >> +
> >> +    spin_lock_irqsave(&serial_port_lock, flags);
> >> +    port =3D ep->driver_data;
> >> +
> >> +    /* When port is NULL, return to avoid panic. */
>
> >This comment is not needed, it's obvious that you check before dereferen=
ce.
>  OK, I will delete this comment in the new patch.
>
> >BUT you can mention that you are trying to check with the race somewhere=
 else, right?  Please do that, and document here where that race is at that=
 you are doing this extra locking for.
>  I don't fully understand what you mean. Are you asking which logic is in=
 competition with this one, causing this port to be null?
>


> Considering that in some extreme cases, when the unbind operation
> being executed, gserial_disconnect has already cleared gser->ioport,
> and the controller has not stopped & pullup 0, sys.usb.config is reset

Here few people know what sys.usb.config doing, you should describe properl=
y
what is doing. What I can imagine that you unbind and bind to a new gadget
changing the sys.usb.config. Is that right?

> and the bind operation will be re-executed, calling gs_read_complete,
> which will result in accessing gser->iport, resulting in a null pointer
> dereference, add a null pointer check to prevent this situation.

My only question why unbind should not wait for pending urb to be completed=
,
before getting in the race?

>
> >> +    if (!port) {
> >> +            spin_unlock_irqrestore(&serial_port_lock, flags);
> >> +            return;
> >> +    }
> >>
> >> -    /* Queue all received data until the tty layer is ready for it. *=
/
> >>      spin_lock(&port->port_lock);
> >> +    spin_unlock(&serial_port_lock);
>
> >nested spinlocks, why?  Did you run this with lockdep enabled to verify =
you aren't hitting a different bug now?
>  Because there is a competition relationship between this function and th=
e gserial_disconnect function,
>  the gserial_disconnect function first obtains serial_port_lock and then =
obtains port->port_lock.
>  The purpose of nesting is to ensure that when gs_read_complete is execut=
ed, it can be successfully executed after obtaining serial_port_lock.
>  gserial_disconnect(..)
>  {
>         struct gs_port  *port =3D gser->ioport;
>         ...
>         spin_lock_irqsave(&serial_port_lock, flags);
>         spin_lock(&port->port_lock);
>         ...
>         gser->ioport =3D NULL;   ---> port =3D NULL;
>         ...
>         spin_unlock(&port->port_lock);
>         spin_unlock_irqrestore(&serial_port_lock, flags);
>  }
>
> After enabling the lockdep function (CONFIG_DEBUG_LOCK_ALLOC=3Dy), there =
is no lockdep-related warning information.
>
> >And why is one irqsave and one not?  That feels odd, it might be right, =
but you need to document here why the difference.
>  After the gs_read_complete function is executed, spin_unlock_irqrestore =
is used to restore the previous state=EF=BC=8C

=E8=83=A1=E8=BF=9E=E5=8B=A4 this is not a common locking pattern that is th=
e reason that
should be properly described.

> -       /* Queue all received data until the tty layer is ready for it. *=
/
>         spin_lock(&port->port_lock);
> +       spin_unlock(&serial_port_lock);
> +
> +       /* Queue all received data until the tty layer is ready for it. *=
/
>         list_add_tail(&req->list, &port->read_queue);
>         schedule_delayed_work(&port->push, 0);
> -       spin_unlock(&port->port_lock);
> +       spin_unlock_irqrestore(&port->port_lock, flags);   ---> Here we u=
se spin_unlock_irqrestore to restore the state
>  }
>
> Thanks

Thank you


Return-Path: <linux-usb+bounces-13938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC4695C716
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 09:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA3D91F2213F
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 07:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D885313D52A;
	Fri, 23 Aug 2024 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AzDqNmIa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D7F433CE
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 07:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399879; cv=none; b=Wi1Zwc0vjgXqTh4BqNeIwLp+dFL7oloGQXH242gEJnSf/J8n6HXi+lsqfed3cF3ODX9uikOQqqm4+3jqndKtplVSdXH4a/h7qiTvpNgEoEB9vfcF167Ss3gwdXaeAI0Zja15peTxHihfMTvZOFrYzVd955Jgqx8Hg6a6tbWBnl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399879; c=relaxed/simple;
	bh=t3lkUJpVNYTLzdIOq2kqdXAXqlBNArJf4oHXt6Y2JBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/EgmjlEOwleyLiE6jCYOAS9K8vUIi7AtSDyE8fS3m8RS6OjXtZWdESvEcxyHDKFm6wsOavfzndoZ30xZsquQ7E6kOrkbBMYikxU3sQIzsjOtNAnYpFtp4VZDW+Fn3rTIEbGYSbSVbf5681v+vn33Er+DcN6qb8l5T1Yj5WYdxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=AzDqNmIa; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a86859e2fc0so205577766b.3
        for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 00:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724399876; x=1725004676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG70/jC2mzXi0oHgs9Iw5R9O9LyWrgNsejh29CzrB/s=;
        b=AzDqNmIaLNJECKZz+vTb6R9NrizQp3JS949M+tJwR3xlwtbvqLMuy0tnaWWwzCZ17s
         UL6TOOY8D+UxgtMyDGgezOQ3tyHjOVVRMzenMxR0ynz3mUYVQsGn74uaHVZkNEfdCaEL
         W0e8TOV+u6Fro3Qc+zHSCzpG7Na3+r9qKhlW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724399876; x=1725004676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CG70/jC2mzXi0oHgs9Iw5R9O9LyWrgNsejh29CzrB/s=;
        b=GiY8S6WdUrXlJSMPEJuPNBIfRscKAOP0ekNYjsJJ8c1Gl6ggOAf0AJCZFubJhJZ4s/
         OA5MS/3V+cU6AcBaWdhw4Hsmi1ULtQUSUq1fyGowojWAENS2cXGeCh7LVJjA2mBQXVEA
         kFMma9RVlMCE6QPb+FUETG0F1hpAo3064YC/1xm9yYwseO7UpmqpYkECrVMW9wQkq9OW
         QOGru76qeaZ09hRtXi5Lkb5Bb7jFSzimsSq/wsYuLyWP6Kwh3XDrZJKHyLi8/3OWSaYG
         zVPDNOdwAQ8CIs6Bafh/rPXE6e2yjCRxTt80KUNBYdxqL8/n9xcuw/v002RP3ADdPDbQ
         9DEg==
X-Forwarded-Encrypted: i=1; AJvYcCX43P6xFVvCkcCNDa5P6qSVAr1xx/MI1/lYHZHsJKgWlrNxQKu3uwIRFVaD0CHgeDVlVFFQpP//zGw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz5zXp2knaKrS7uP7P9MDUy18VZHxSZDe/QsGh1cPov9bpe93b
	VZO1ZO5mxHMwyXcIczy0Ei8qF+CjH2IfEXv79Q1elsf+F+gN7WQLA1DECJPBF98crdn9Pszn7YR
	rkrmRllUkLXLIIw/StK+NMCA+3Ko4spoEvyc0OQ==
X-Google-Smtp-Source: AGHT+IGCTEt9qJslktoedJ5myWNlaB5S9MotuCJiG7S/ujvEUKsyZNgSXlQDy9wmRnNuErBP9hV6x1mFDQHb4eYfr+s=
X-Received: by 2002:a17:907:e2c6:b0:a86:a178:42da with SMTP id
 a640c23a62f3a-a86a52bb7e4mr88308266b.21.1724399875313; Fri, 23 Aug 2024
 00:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYUPR06MB62171A7BF25AB6963CBA07FED28F2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <2024082251-grief-profanity-b0da@gregkh> <TYUPR06MB62176043F3E6D6B6675301D3D2882@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <CAOf5uwnz01F28kw12ZN5k3usTcCBMKpFJpAXTaYBZ_3zgWQU3Q@mail.gmail.com> <8ab0ca38-1bf4-ed3e-eef0-cbed2a524b34@quicinc.com>
In-Reply-To: <8ab0ca38-1bf4-ed3e-eef0-cbed2a524b34@quicinc.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 23 Aug 2024 09:57:44 +0200
Message-ID: <CAOf5uwmQ_drN9xE88Eyf01kmh=GLwitLCSo7KxiNDE9-h-D0KQ@mail.gmail.com>
Subject: Re: [PATCH v6] usb: gadget: u_serial: Add null pointer check in
 gs_read_complete & gs_write_complete
To: Prashanth K <quic_prashk@quicinc.com>
Cc: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"opensource.kernel" <opensource.kernel@vivo.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prashanth

On Fri, Aug 23, 2024 at 9:34=E2=80=AFAM Prashanth K <quic_prashk@quicinc.co=
m> wrote:
>
>
>
> On 23-08-24 12:28 pm, Michael Nazzareno Trimarchi wrote:
> > Hi
> >
> > On Fri, Aug 23, 2024 at 8:40=E2=80=AFAM =E8=83=A1=E8=BF=9E=E5=8B=A4 <hu=
lianqin@vivo.com> wrote:
> >>
> >> Hello linux community expert:
> >>
> >>>> Fixes: c1dca562be8a ("usb gadget: split out serial core")
> >>>> Cc: stable@vger.kernel.org
> >>>> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> >>>> ---
> >>>> v6:
> >>>>   - Update the commit text
> >>>>   - Add the Fixes tag
> >>>>   - CC stable kernel
> >>>>   - Add serial_port_lock protection when checking port pointer
> >>>>   - Optimize code comments
> >>>>   - Delete log printing
> >>
> >>> You need to list ALL of the versions here, I seem to have missed v4 a=
nd
> >>> v5 somewhere so I don't know what changed there.
> >>
>
> [...]
> >>> nested spinlocks, why?  Did you run this with lockdep enabled to veri=
fy you aren't hitting a different bug now?
> >>  Because there is a competition relationship between this function and=
 the gserial_disconnect function,
> >>  the gserial_disconnect function first obtains serial_port_lock and th=
en obtains port->port_lock.
> >>  The purpose of nesting is to ensure that when gs_read_complete is exe=
cuted, it can be successfully executed after obtaining serial_port_lock.
> >>  gserial_disconnect(..)
> >>  {
> >>         struct gs_port  *port =3D gser->ioport;
> >>         ...
> >>         spin_lock_irqsave(&serial_port_lock, flags);
> >>         spin_lock(&port->port_lock);
> >>         ...
> >>         gser->ioport =3D NULL;   ---> port =3D NULL;
> >>         ...
> >>         spin_unlock(&port->port_lock);
> >>         spin_unlock_irqrestore(&serial_port_lock, flags);
> >>  }
> >>
> >> After enabling the lockdep function (CONFIG_DEBUG_LOCK_ALLOC=3Dy), the=
re is no lockdep-related warning information.
> >>
> >>> And why is one irqsave and one not?  That feels odd, it might be righ=
t, but you need to document here why the difference.
> >>  After the gs_read_complete function is executed, spin_unlock_irqresto=
re is used to restore the previous state=EF=BC=8C
> >
> > =E8=83=A1=E8=BF=9E=E5=8B=A4 this is not a common locking pattern that i=
s the reason that
> > should be properly described.
> This pattern was already used on gser_suspend/resume callbacks, this was
> done because the lock was stored under port (and port itself was
> becoming null), hence we added a static spinlock to mitigate it.
> >
I see now, but why don't disable the endpoint before disconnecting?

/* disable endpoints, aborting down any active I/O */
usb_ep_disable(gser->out);
usb_ep_disable(gser->in);

Michael


> >> -       /* Queue all received data until the tty layer is ready for it=
. */
> >>         spin_lock(&port->port_lock);
> >> +       spin_unlock(&serial_port_lock);
> >> +
> >> +       /* Queue all received data until the tty layer is ready for it=
. */
> >>         list_add_tail(&req->list, &port->read_queue);
> >>         schedule_delayed_work(&port->push, 0);
> >> -       spin_unlock(&port->port_lock);
> >> +       spin_unlock_irqrestore(&port->port_lock, flags);   ---> Here w=
e use spin_unlock_irqrestore to restore the state
> >>  }
> >>
> >> Thanks
> >
> > Thank you



--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com


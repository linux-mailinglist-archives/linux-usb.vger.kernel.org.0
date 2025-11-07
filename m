Return-Path: <linux-usb+bounces-30189-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B2C3F1A5
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 10:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 413564EDD19
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 09:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D221B3191D1;
	Fri,  7 Nov 2025 09:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WmHJDP2l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A81317715
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762506736; cv=none; b=UcVjBjpLWmH3F0BNFs1kZQsAlMrSz6wjNV0ySDrriWKtq93jVGXsbkR+ekmT1zAveq2IPoo9jsVD+15DealzJu8/lqYC7Ti5uQrzfJ+hPTQexeZoCsUjp5mfBlLcCb4oez9R2hAqxBMZuVwBWlkgklusJ01WEhD1ZMOrEvjfAHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762506736; c=relaxed/simple;
	bh=TNmjgWT8K07xW+rkVyxtkNOCHhbFvM5lquafFX2QXz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7/FCYAvL2rK05dngvMw8sNr/Ym84inisdfP/9pbhy3UUFdacm1P1P/MtqxWG0nstykobmTkPU9ZPQJitTKjhrKwKzPLkwCmGXVQQBfdkbdIm23b7EqKUu8MoAXKr5aHczBlJTqwTgh35ce2W9OCqkqVd13VZDJvipnFaTr1sqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WmHJDP2l; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso501760b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 01:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762506732; x=1763111532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5b+M3zzopCvof55wzjaKXg+MrS7xrBcOB8Vyij7yJyg=;
        b=WmHJDP2lxMEULUIBA7G4RBKU/wYPQFGUqdSAMj7+toe51jplE3kfh7bpsWr8QxTuDT
         j4pXp4xQ3h7A5pQlI4zwdPdGHSGL18esO6wGGI4G7R9rxfBf51E2yy/uYd20m1idk/1f
         2kFGGgtT379aefDdSPW8LMpQwCOXPOQx4DgqBLKwjPYABv2RBOdu3oY56AyqIRE1ZCcT
         56UG5cT6ehCFLWFYTcS12bBCNgaCe+gt2kO79thuoI8z3pEnd5g1sMfKmyxrZwQNc+yX
         nR/YWB+XK0fpYy+D3lgRIr7zvKWnZqQeqeR6m6TGBFY8TWiELxvvozdYu1lTkmEY3nQO
         uv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762506732; x=1763111532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5b+M3zzopCvof55wzjaKXg+MrS7xrBcOB8Vyij7yJyg=;
        b=u2uIQrYzQKMT8zTWnW4i00YEMNMN/lPsHhFJ/foiE6aKGTfspDQ1UNu2h62jmNkUci
         1FKuBvqmxcPA7Zs2/7b486LLtF3dYVAd/0I5EPUhpl4tf/Z0BqSNVSB5l0HRECNPOjbY
         M9Fd9miZ2jky0YYE9e0D1V9vN5PU9jKNnmGIOC2w5TCfdQVewY6ir99FXSATnCy7X4vq
         Up/LiREye/0auqxGFh307qw+Bl5MTBtCLHFXR6Tl9VDTf1vrXWekZZWcL0WDACsW3qTX
         +nWTgXpnZTwQDlJlOBl5mVo0pN1zDeDY1x2O7H/5HXXYrEpReEzWY4bc9VgyR4Bqn3mD
         mS6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWX2JYClf6rwcfpcqg6zftm4CbHjK7W6hsgS+VwpzpfiF2JMJty0v37x4EB1S97sAaftLXPlj7Ze1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH6YoPT7DnxottrjNl7bLqQsA6nIUhLBiXnxRF/QAgUcP9ov+A
	w2Ts8d4JbiHDjPmVxmNAzwYp7Zwk0T8wYlxMLjVdWFgkRjxKvsZG9PAhB0HYMEtooygONtsXcFF
	LEFNnzEJy7pjsyGc9vqpCwVhl63WdDmuhylpq9RTDMxtT+ZKy7Eom1xV4lxs=
X-Gm-Gg: ASbGnctVqJOg5ufKuUeaxv24h8LHJeQH+UxnUyW/EHKmwusOodJ9nE8Fx004Sh/JzF2
	64+F2TQeez0IYbBxM0zIeVqyREvLdQ2GnGOYCOPWwLFnJhGvW6xJTT4lVrXD8scjN7aHH8kA48S
	fTI5jGq7YwhLa0p37bb9pSdU3Fhub5kKRfVbyTLXpbnCRKh3kmem7by/RsDzG0ZkflWq46tSOT5
	o9ZkgxuhCoBu21BzYuhPatGJIvqCh2nMmT+qRzyAkqtrCEPa1H+ndegoC1zIPx5HQmFEhA=
X-Google-Smtp-Source: AGHT+IHWENirlvcfA41rvumMc/AZyRmx9tfkjQkwROpRjDKeutH5HgnBVz2Cj4Uw9rrJPEek8xG2BFZODl9IVdlK3Gc=
X-Received: by 2002:a17:903:388b:b0:28e:ccd7:dd61 with SMTP id
 d9443c01a7336-297c04a11e6mr33698895ad.57.1762506731353; Fri, 07 Nov 2025
 01:12:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017233459.2409975-1-royluo@google.com> <20251017233459.2409975-3-royluo@google.com>
 <20251030011659.bmgdry3wwf4kgjwv@synopsys.com> <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
 <20251104020713.orax7rk6qhko5p4m@synopsys.com> <CA+zupgy4qO9X=R7KqEru5kr7tYhgdw=9Z70sLNKj5DTS_J7KZw@mail.gmail.com>
 <20251106003830.v22dnomurtqmqc2y@synopsys.com> <CA+zupgzNRG3vAukQe89bTJ_EaC2A=o+_pY6QoVOdRfXu8BJOAg@mail.gmail.com>
 <20251106234839.kezpk2okjhkajqp3@synopsys.com>
In-Reply-To: <20251106234839.kezpk2okjhkajqp3@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Fri, 7 Nov 2025 17:11:34 +0800
X-Gm-Features: AWmQ_blqfpqntmKv9_TI2d4T2dFjIvyvpvXv_YU9eXLSRtz2Ua5X5nKU0YFMoFo
Message-ID: <CA+zupgzxjEXJaVJLj=O1MirV6Y-o5uSWPQyQ26kjXO=gfv+W0g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 7:48=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Thu, Nov 06, 2025, Roy Luo wrote:
> > On Thu, Nov 6, 2025 at 8:38=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synop=
sys.com> wrote:
> > >
> > > On Tue, Nov 04, 2025, Roy Luo wrote:
> > > > On Tue, Nov 4, 2025 at 10:07=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@=
synopsys.com> wrote:
> > > > >
> > > > > On Fri, Oct 31, 2025, Roy Luo wrote:
> > > > > > On Wed, Oct 29, 2025 at 6:35=E2=80=AFPM Thinh Nguyen <Thinh.Ngu=
yen@synopsys.com> wrote:
> > > > >
> > > > > In dwc3_google_suspend(), looks like is_hibernation is set after =
you
> > > > > enable pme irq, probably very unlikely, but can the interrupt be
> > > > > asserted then? If so, will there be another interrupt asserted?
> > > > > Otherwise the current logic may think it was spurious interrupt a=
 miss
> > > > > an event.
> > > >
> > > > The pme interrupt can only be asserted after controller is in
> > > > hibernation, that is, after the usb psw dom is turned off and
> > > > the dwc3_google_usb_psw_pd_notifier() callback is
> > > > completed. So no, the interrupt won't fire before is_hibernation
> > > > is set.
> > >
> > > Thanks for the confirmation.
> > >
> > >
> > > <snip>
> > >
> > >
> > > > > > >
> > > > > > > I'm still trying to wrap my head around how usb_top_pd, usb_p=
sw_pd, and
> > > > > > > the google->dev are working together in the glue here, partic=
ularly why
> > > > > > > usb_top_pd is needed. It seems usb_top_pd shouldn't be handle=
d by this
> > > > > > > glued? Do you do anything except setting wakeup-capable?
> > > > > > >
> > > > > > > BR,
> > > > > > > Thinh
> > > > > >
> > > > > > To provide more context, the underlying usb power domain has 3 =
power
> > > > > > states: Full Power, Power Gated, Off. The usb_top_pd and usb_ps=
w_pd
> > > > > > are the logical power domains to represent the 3 power states.
> > > > > > - Full Power:     usb_psw_pd ON,   usb_top_p ON.
> > > > > > - Power Gated: usb_psw_pd OFF, usb_top_p ON.
> > > > > > - Off:                 usb_psw_pd OFF, usb_top_p OFF.
> > > > > >
> > > > > > To enter hibernation, the usb power domain must enter Power Gat=
ed
> > > > > > state. To achieve this, this glue driver holds a handle to usb_=
top_pd
> > > > > > and would cast a vote to keep it ON when attempting to enter
> > > > > > hibernation. In addition, the usb_psw_pd runtime PM is directly=
 tied
> > > > > > to google->dev so that usb_psw_pd would be OFF when google->dev
> > > > > > suspends. Together, the usb power domain would reach Power Gate=
d
> > > > > > state when device suspends.
> > > > > >
> > > > > > I hope this information helps.
> > > > > >
> > > > >
> > > > > Yes. This is very helpful.
> > > > >
> > > > > So, while the glue driver is bound, usb_top_pd is always ON? Even=
 when
> > > > > xhci driver is not bound or when in device mode?
> > > >
> > > > Since usb_top_pd is the parent power domain of usb_psw_pd, and
> > > > usb_psw_pd RPM is directly tied to glue device, usb_top_pd would
> > > > be ON when glue device is active (because usb_psw_pd is ON)
> > > > and would be OFF when glue device suspends in non-hibernation
> > > > scenarios (because usb_psw_pd is OFF). In hibernation scenario,
> > > > a vote is casted for usb_top_pd to keep it on even when the
> > > > glue device is suspended and usb_psw_pd is OFF.
> > > >
> > > > To your question, usb_top_pd is not always ON because it would be
> > > > turned off when the glue device suspends in non-hibernation scenari=
o.
> > > > When in device mode and provided dwc3 dev is active, usb_top_pd
> > > > would be ON because its child usb_psw_pd is ON.
> > > >
> > >
> > > Thanks for the clarification and bearing with my questions.
> > >
> > > If there's no device connected, do you role-switch back to default mo=
de?
> > > Often I see that the role-switch is defaulted to peripheral and switc=
h
> > > to default mode if there's no connection.
> >
> > Yes, the default mode would be peripheral and it would switch
> > to peripheral mode if there's no connection.
> >
> > >
> > > I want to check the case where the device may wakeup by connection bu=
t
> > > cannot because it is not in host mode. Do you have a separate
> > > TCPC/connector that can wakeup the system on attachment?
> >
> > Yes, there's a separate TCPC/connector to trigger a role
> > switch when there's an incoming connection.
> >
>
> This addressed my concerns. My other comments are minor nits.
>
> You can include this on your next submission:
>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>
> Thanks,
> Thinh

Thinh,

Thanks for the review, appreciate it!
I'd like to give you a heads up on a change I'm going to make
in the next version. Per Krzysztof's suggestion in [1], I'm making
a register region that's shared between the controller and the
PHY a syscon node. The impact to this patch is that mmio
space "host_cfg" and "usbint_cfg" would be accessed through
syscon API instead, but there won't be any functional change.

[1] https://lore.kernel.org/linux-phy/89733ddf-8af3-42d0-b6e5-20b7a4ef588c@=
kernel.org/

Regards,
Roy Luo


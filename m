Return-Path: <linux-usb+bounces-27917-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE1B529DF
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 09:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D17604E1618
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 07:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575CC26CE26;
	Thu, 11 Sep 2025 07:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BI34y01B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B63269B0D
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 07:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757575705; cv=none; b=o3vBrfiQdXc86Pw8G+xcoZjL50Kx8E1BdQN1aloPtj6wgxYDsbMfXjY1rlw5pqLRjt0OowZRsc7jO3Xa/7DJ7GyQVT/NhDtHjDqpxsyfbV3o1Y5BcwA6mpLu405sOxaHPt4g6CKD445mnygDM6S3ukOptzLzOQAmSjpzv3orm8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757575705; c=relaxed/simple;
	bh=3LhkY1jX7VWQuXhPNbPkpRjL05D6uPNjtQLzUhymk24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZvHIfLBXb2n4XbAuJBly7dLxB2JTBeW20rj7P9wXkl1JmBfM01+qgw8ptc35FyoeDgz5NB8Y2p0w2W5zsb3nq05eq0ATz+AilGfqme6fF3sbanBnY3z3/0wi4DBCG8TIHWsKCu3pFHDcJSFNyMMJ6J3QlIfsA96racyl18r219g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BI34y01B; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dd9d72f61so62205e9.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 00:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757575702; x=1758180502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FK7U3lnC3y7/ffQqOSxbeSeWtjBYH2LRmWQkOy2vWj8=;
        b=BI34y01Bi9b5mt85ULdCsq2yDo6aOmkHLrmKltQbP5knXvX57Hgq+up2ZFKDFy36FM
         ZY9gZHF6HoKW3adLm+X/mIHntwSx/wRY0QxlfA57Sqfci8Zzl6Y2V0OlAK1FUmZNudpp
         dANhUrVQE2pLPJ5W0gNUQScgXTBXjUHVxb4f8tPpK42q+SF2RTzujVAs2AXUuU9xzoYR
         v3ot67AzUlQ64pLDWI1U4bncCeFk9aQKclUhnqlIq4gS2vvYeVFc2fU/1TjVNRZ43sSW
         8QkO8RbGMnqV814XaXAzYe3vz3p317lkBYPT+zIM+t2dwCzAY6MxwHUFo0C6rUddsnRv
         7Ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757575702; x=1758180502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FK7U3lnC3y7/ffQqOSxbeSeWtjBYH2LRmWQkOy2vWj8=;
        b=I6eBSIs6b8Bl6aKaDeWUrHPKFvCkxbfwJTJff6MbcygpDdGmeF2I2JK4nvnGd9tJAI
         FXu93hRGMEutapBRaZk/l1sYdSqUXMIq01lX3AVmUwMmlHn0UqLvgN03Cjj8p5inpqoq
         d9iUqeMOXQ/GFb+yIzoYbfQYnGir+we7jHPHwKxfeosYqV6iyDPU1GMj3nUmpwrz1yIT
         LdKjBQkVkBYqXczrXPYPwd1gVwYA3Q8m3IuzGdEJ5YArZn+fNyV7smobiz1mf8KkAtBm
         4c3htzq1IdGl5E0v72THDpp8EUy4eCIRMeB+s8F/oyc12+hEpHum5eQxsXlfSi2S0I+H
         FrHA==
X-Forwarded-Encrypted: i=1; AJvYcCX3mDhTvfg78fulWzxk4ZFjQ4VCReFCZs9VZR+Vvp+/93x1MXugz0KGT78+TG9XfI/g1M+vEF9fTkc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Jvuz7B/ArI3Iugm53Anr0/wWKQ9y4Pyw7lsyWYqRzpLubSi4
	xjMffjC8QnWrFxO+BG//v+lw/w2OS2f9zz5onIecflIHcyPHzXIxPWa7gAfqVelJQlYvvlCc6DW
	8hCjKPhfuqfhUb+PqxDx7nHHTwitNugoK4AyV6Neu
X-Gm-Gg: ASbGncsV1qXG1bDiuJyalm98W1m34voJ9JKtHo8h5E4UWj8IesY/9yGt/Ndg4LKVRlG
	k3N9K/KbOH/6jAsp1TCjiyXSzLwDM1NPCaeczDRD6GSUy7RsFuuxzgkgjz4/Sr0cNn6QVuumEha
	CuIKBHnSB1+m9CIP5BQMmgxgyt3gaONuBKL79p+MDEdIa56g47eaSZLXv7tnc2zipdI2pm4Ay/I
	0XQJNJomzUC2oVy63GPzTYFNTQFoJIXehM6uGm3dfPwBSdTVlo9hyYqfuZtkQ==
X-Google-Smtp-Source: AGHT+IEbjA8wA5uTk3TcHbPBQJWjhclijtbB5//wAB0Y6KJCSvzkuEDQ/JZz09gc9AUpAZcVbdPxutDodlFxxbV1cXQ=
X-Received: by 2002:a05:600c:c058:b0:45c:b4fb:f0b3 with SMTP id
 5b1f17b1804b1-45df81fcfe9mr2603385e9.3.1757575702354; Thu, 11 Sep 2025
 00:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818082722.2952867-1-khtsai@google.com> <2025090657-unpinned-unnatural-2ccd@gregkh>
In-Reply-To: <2025090657-unpinned-unnatural-2ccd@gregkh>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Thu, 11 Sep 2025 15:27:55 +0800
X-Gm-Features: AS18NWBti6JrawpdlOsgZ6vAT-gYWOrF4Yel8dW_q6Hc4XuwW9RLv4IpCjBtqnk
Message-ID: <CAKzKK0oyBomOOFGv4LHM18BgN8tS=Mcyok4gfq4q81vgk54iVA@mail.gmail.com>
Subject: Re: [PATCH] usb: udc: Add trace event for usb_gadget_set_state
To: Greg KH <gregkh@linuxfoundation.org>
Cc: royluo@google.com, jkeeping@inmusicbrands.com, stern@rowland.harvard.edu, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Sat, Sep 6, 2025 at 9:16=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Mon, Aug 18, 2025 at 04:27:19PM +0800, Kuen-Han Tsai wrote:
> > While the userspace program can be notified of gadget state changes,
> > timing issue can lead to missed transitions when reading the state
> > value.
> >
> > Introduce a trace event for usb_gadget_set_state to reliably track stat=
e
> > transitions.
> >
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> > ---
> >  drivers/usb/gadget/udc/core.c  | 1 +
> >  drivers/usb/gadget/udc/trace.h | 5 +++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/cor=
e.c
> > index d709e24c1fd4..e28fea614496 100644
> > --- a/drivers/usb/gadget/udc/core.c
> > +++ b/drivers/usb/gadget/udc/core.c
> > @@ -1125,6 +1125,7 @@ void usb_gadget_set_state(struct usb_gadget *gadg=
et,
> >  {
> >       gadget->state =3D state;
> >       schedule_work(&gadget->work);
> > +     trace_usb_gadget_set_state(gadget, 0);
>
> Will this show the state the gadget has been set to?  And why not just
> do that in the work callback, as that is when it really happens.

Yes, it shows the new state by logging the state field from the gadget obje=
ct.

The work callback is for handling asynchronous sysfs notifications
that occur later. Placing the tracepoint here accurately reflects when
the state change actually happens.

>
> What is the output of this trace line?
>

The output looks like

usb_gadget_set_state: speed 5/5 state 5 100mA
[sg:self-powered:activated:connected] --> 0
usb_gadget_set_state: speed 5/5 state 6 100mA
[sg:self-powered:activated:connected] --> 0
usb_gadget_set_state: speed 5/5 state 7 100mA
[sg:self-powered:activated:connected] --> 0
usb_gadget_set_state: speed 5/5 state 7 900mA
[sg:bus-powered:activated:connected] --> 0

Regards,
Kuen-Han


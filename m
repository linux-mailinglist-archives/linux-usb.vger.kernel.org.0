Return-Path: <linux-usb+bounces-23308-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C13A971A1
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 17:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7163189D49D
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 15:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A72F28FFEA;
	Tue, 22 Apr 2025 15:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WC2yptBz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A42A2900AC
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745337066; cv=none; b=p5bo5ODhe6e4PEqUAy4rXK3CpoEDZwS8Tu6sRBtEUQgLcPuFLhj/hBOEbCHyTyKWz4SRHBXWyCfsx+VsNtDTqhn83ZqNjgOf6mBvR1FrfAMFaQpmjDhfY/+jl1q3tiSwnd3fkyBrfs5Ypb8v8kvo9dlnmFzW3hBOxzYpy4pFBzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745337066; c=relaxed/simple;
	bh=3sqNGatK3nNf3ioHPn/vTJ1ihZQnxYjPJUzKw2ujuNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMgVs7DjzbJHqShV2jhy1apAsBESUpITMnyfsahuLObtPrJdEOkvxxGKE2kFhGY0LPdz7jTk9QnFrYOalETI/OXbis1x9XbqTBu5+03dhsdaBPcN9HnP+wwcmpGoQF13FaoahTd34AiI9jJr3eoeyut7IPO/Ne2nDaV+qcTHKcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WC2yptBz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5499c8c95beso7526e87.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 08:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745337062; x=1745941862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdFGD2OG7sa0PhB8zVDzwTwQ3rmo3v4yX/7hU6EpgHE=;
        b=WC2yptBzUE4Cu5A/1Zf0rY4marKoohubisGqMU8HDaA2CjNIt4qc3VnKoqK32RBc8D
         YvwEXXqgZhR6L2rVT0epwwDea4opUN/G4hNHUNKRh8/OTxgDPCzPvOSISShOfzroiq4O
         3lNWa5dAXrIEVv6U2MiO3WRR0Ob/snHAXS6WSY6TGi23SM6Dwm3z0D/Mzfl0gGXrzmQj
         MKML2Xx1Jjg2ucMkUEF6hcyY7B6frA1bHLSpMM2vX2Gz7INJAb9tSk+8UKfeFFusiTtq
         sDofLki336i6ILQWAkTT6OpgDGG17ZlnrOzdEf6Gc3wjvSZi1G9f2eTZGAnB5InApZXb
         i7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745337062; x=1745941862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdFGD2OG7sa0PhB8zVDzwTwQ3rmo3v4yX/7hU6EpgHE=;
        b=R1Z9dKGwyrUbDRwTNLAMawKUuDqZCszZYxSBLShx8ozZnZRAB9NbAeHOOsh++Nk08r
         3f0NKE2dUay4IWNzHW7L8GEn59LNTbVdiZKc7OlQ457l0DBfmMrFqcI843u607lIxXAP
         rK4U3nPXQi+/5SvSlkz7sPJ1wpfnBEwrjtLoOiNZlvOPuD0oav5chd8rsQ/E1MV8FGFI
         pK91TfYt6ascxhw8OXh6IMwv5+310Rs7KHLwL5KM7D2Zy68xpBpxUzyXt+8MD8+re9Kf
         0/wkMcL2AJ8ioa1yzisAkxTfl96mzR26IwmCfUaTha035fkpEBStdm+QQmFpzYuz/lkA
         Gc4w==
X-Forwarded-Encrypted: i=1; AJvYcCVNhAH0H0dGLcie9WlLP2Kauc3FxDEAEkWM3gj3s8gJ2dtdgMFzHvswq0EWN/u954kKQvWETVKk9Bg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Xd727lcZ6J+/hfPNyeZTAY3bPJ4TOKQ3OCWfORdpgCpqWz1S
	rjMxpTr7gnngeCXQ2HL/E85bNFasr7IkDeUKu/GROdThsZj0ZEVzkMWNUTewt9Lo7OS0Cx4cZDA
	pdKvQnK3KnStiEB90Ahh/2XyuML6eizZZNOfi
X-Gm-Gg: ASbGncuur4bvtw8UJdVTgSTI6y8UI95A9RXoc7IFLgtPsJlWIO9jdWkuMawXm49HE48
	Om+/S3zPRxvEYLeo9y7QgSr2jRKXhpbFr17cAQbo8s2a5eTHz5s4Zd8Jb7Tj16dnUKdVheDLcsi
	RGzXLYK4EDEDvexz3hQoFzHgU1Yqrh5QZcmYghH3AJcMwecdba66AHiT9M
X-Google-Smtp-Source: AGHT+IHQqUWx2u3/cq0FvzsslIUm5Dy/4pb7LqJE77ayHMAIePU0Cj0gbTYfXvpwXwPkr+tZIRDQNcab7m9Im8ZO0D8=
X-Received: by 2002:ac2:5181:0:b0:545:1cbb:74e5 with SMTP id
 2adb3069b0e04-54d6e956f35mr697284e87.3.1745337061944; Tue, 22 Apr 2025
 08:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416100515.2131853-1-khtsai@google.com> <20250419012408.x3zxum5db7iconil@synopsys.com>
 <CAKzKK0qCag3STZUqaX5Povu0Mzh5Ntfew5RW64dTtHVcVPELYQ@mail.gmail.com> <20250421232007.u2tmih4djakhttxq@synopsys.com>
In-Reply-To: <20250421232007.u2tmih4djakhttxq@synopsys.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Tue, 22 Apr 2025 23:50:35 +0800
X-Gm-Features: ATxdqUHW9FF8cqE3jm_WZD_OgsvjOfh6Q1uw_o-6F0YcJvOWm3NGOVNgd0xjp7M
Message-ID: <CAKzKK0pReSZeJ1-iRUbU=w+dK0O1fB7AgecfC7KJap6m5cQWnQ@mail.gmail.com>
Subject: Re: [PATCH v4] usb: dwc3: Abort suspend on soft disconnect failure
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 7:20=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Mon, Apr 21, 2025, Kuen-Han Tsai wrote:
> > On Sat, Apr 19, 2025 at 9:24=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > On Wed, Apr 16, 2025, Kuen-Han Tsai wrote:
>
> <snip>
>
> > > > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > > > index 89a4dc8ebf94..630fd5f0ce97 100644
> > > > --- a/drivers/usb/dwc3/gadget.c
> > > > +++ b/drivers/usb/dwc3/gadget.c
> > > > @@ -4776,26 +4776,22 @@ int dwc3_gadget_suspend(struct dwc3 *dwc)
> > > >       int ret;
> > > >
> > > >       ret =3D dwc3_gadget_soft_disconnect(dwc);
> > > > -     if (ret)
> > > > -             goto err;
> > > > -
> > > > -     spin_lock_irqsave(&dwc->lock, flags);
> > > > -     if (dwc->gadget_driver)
> > > > -             dwc3_disconnect_gadget(dwc);
> > > > -     spin_unlock_irqrestore(&dwc->lock, flags);
> > > > -
> > > > -     return 0;
> > > > -
> > > > -err:
> > > >       /*
> > > >        * Attempt to reset the controller's state. Likely no
> > > >        * communication can be established until the host
> > > >        * performs a port reset.
> > > >        */
> > > > -     if (dwc->softconnect)
> > > > +     if (ret && dwc->softconnect) {
> > > >               dwc3_gadget_soft_connect(dwc);
> > > > +             return -EAGAIN;
> > >
> > > This may make sense to have -EAGAIN for runtime suspend. I supposed t=
his
> > > should be fine for system suspend since it doesn't do anything specia=
l
> > > for this error code.
> > >
> > > When you tested runtime suspend, did you observe that the device
> > > successfully going into suspend on retry?
> >
> > Hi Thinh,
> >
> > Yes, the dwc3 device can be suspended using either
> > pm_runtime_suspend() or dwc3_gadget_pullup(), the latter of which
> > ultimately invokes pm_runtime_put().
> >
> > One question: Do you know how to naturally cause a run stop failure?
> > Based on the spec, the controller cannot halt until the event buffer
> > becomes empty. If the driver doesn't acknowledge the events, this
> > should lead to the run stop failure. However, since I cannot naturally
> > reproduce this problem, I am simulating this scenario by modifying
> > dwc3_gadget_run_stop() to return a timeout error directly.
> >
>
> I'm not clear what you meant by "naturally" here. The driver is
> implemented in such a way that this should not happen. If it does, we
> need to take look to see what we missed.
>
> However, to force the driver to hit the controller halt timeout, just
> wait/generate some events and don't clear the GEVNTCOUNT of event bytes
> before clearing the run_stop bit.
>
> BR,
> Thinh

Hi Thinh,

Thank you for getting back to me and the method to force the timeout!

By "naturally," I meant reproducing the issue without artificial steps
designed solely to trigger it. You're right; since the driver is
designed to prevent this state, reproducing it "naturally" is
difficult.

I really appreciate your patience, and thank you once more for the
helpful clarification.

Regards,
Kuen-Han


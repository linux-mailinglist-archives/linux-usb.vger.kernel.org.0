Return-Path: <linux-usb+bounces-26533-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7183B1C418
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 12:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BC083BDECF
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 10:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA1228A70C;
	Wed,  6 Aug 2025 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OysWKLhf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3B51E0DE3
	for <linux-usb@vger.kernel.org>; Wed,  6 Aug 2025 10:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754475503; cv=none; b=ISaYH4tpAXfJmo6io0XCrNHOIyPTlV3ADZlU2+MRu2zZPUQ7YyCxs+awioTirWu0BGmWhD1yQOnxA/ROl0p/wMOPU7Xf2B86Hvzn+cWEHJhqsrjIgzDteWQEN8YMK7kWHkMk+j6S9JW8Nz8JiGmRno5ECqKHA6rGwQZt8iBA18g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754475503; c=relaxed/simple;
	bh=V+tx+6mM+JuNzDxjB+VYuHFYKY7ox6O/A5wpbBaVVkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cioVSEGQWqf6BTz/uB2Fb9mapJ2wDB76AV0IE8i+ONgOFliXoyVXaxwJtuW+kVesUuCJo8YWf2pkoKhkuAQRqYksvL48Do7wZ79FNQHXkLN1QmzBkdysKKxDTAuDTqNu4HO+uthf3uMcy9FvdWAoIQ6h82JT6CGsFbaZ/22DxiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OysWKLhf; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55b7bf0a8d5so4737e87.0
        for <linux-usb@vger.kernel.org>; Wed, 06 Aug 2025 03:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754475500; x=1755080300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7qQUS8+u2xO+u0F3mnuNBgSEsUV5KSCo/w8cVWRKao=;
        b=OysWKLhfHvOK/fjO2AD53yI8EO40LchKB+Q5QFmhXA17M2nvNB4TVxcttpdzc4J6ZP
         LQSjVgO/umbi1qp5K5U8YFbJDQG7AxIlVO74Iug5EZflhTcSNKJAr2+IUMtVKqs7g4X1
         arIduR+mUWzD15DqQK5zIUkv3fmhkPet5AHD9DShC5w2jsosnCtJXhBolECvcdBR/7il
         cyhk8BQnqIMRKLmGQf6ybIaiLcxGziRlG9DP3A7vVpwov4g/dxr47S8wQf3HU+H/Z9NJ
         mO/YmtcWVM4lc0ITJmSsdLEEiESas8JVEh0aNDzLahFmccY6MONdYtXzCfr2/4PpA0QB
         DUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754475500; x=1755080300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7qQUS8+u2xO+u0F3mnuNBgSEsUV5KSCo/w8cVWRKao=;
        b=NgIXeTQCcMXHeTiRGVE5dWRPRTP4fb+y3L468pz/4uDYEqSBUkB2qP0mFsY1HhKaKv
         NI5WKqRBGm1dCDSZIZ8C9aVcbf5gO3/UGAnNVfkw4OTKPWXySOOuRJOPGxSshTTjwT2y
         u3iEyCfJYd1fE+TJt4hDEGLbrJ5EOZz1kEXrSEiw8lcs12msbVsVrcw4z8j3Vai7zFme
         f7fWDmR6Jxh+YFcD9G+7RtKum5SISitgVIxahdpSyVbYlZa8ZJkDG+mM+3URQgBTxhqq
         6oiNghAqV+v1a7HTRVcwAAoEabQ9PQweATQHzKuPPEY3ZSUpw4utQpEOUHwhsw8PpGHT
         1PXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfXs+2QLRStk5hgINV2wMz/Fv2M5xjBiVb/i1XM2rOs2uErDniSXVEqLqp3A3jbHV3OcqRPotmhTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNKBcwXH6kulBW1RevF/ehSziRr1gFJI4gfrGjRMMGVwKNvVDY
	h4cYM/543sOj1BiocmVOOpDsYTKYiZsfstQB7nM8rpyoCH2I7/Wp8nj9bWCVNrqxGH2rW06I5hL
	ANLboVKJZnxrAqWvXhA/cjLmMewWjNu/KB1WTTlO2
X-Gm-Gg: ASbGnctYnnRKEY7aFt35s+Qn62XmO+lEN7tG2ebHq57/fXRCqxSx2HAR4/nSDdnlHkr
	gqepkPWlMWJwBNYEDH6LMcOhBnNxt8W0fC1s99oW6yQsqTdkMyyP/OP2W0EB0zw/PryWrQ69IRu
	W8qjuY6CLFvPO+zY6PzOpfGTZlMNUor6Npk/28nQhi19Tgb2uD2FUQbr28krjnvPkOHCfWLqLIr
	lXDyAa9FWtOwX1uibBRmLMq8oB5XhCU0/0=
X-Google-Smtp-Source: AGHT+IGeMeQryjlZT6D1fsHjYZ3n8Bi3hG2qr3dC3XS/BHQDCrrn9M5S+zHCM6dJmQNO0SOq+LzTsHxoa80+mLwWXfQ=
X-Received: by 2002:ac2:5f4d:0:b0:55a:2d72:de56 with SMTP id
 2adb3069b0e04-55caf7edc53mr180825e87.5.1754475499394; Wed, 06 Aug 2025
 03:18:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805063413.2934208-1-khtsai@google.com> <20250805232843.xka5z3edqatoyzqh@synopsys.com>
In-Reply-To: <20250805232843.xka5z3edqatoyzqh@synopsys.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Wed, 6 Aug 2025 18:17:52 +0800
X-Gm-Features: Ac12FXxXwMZ5CiEiQhgKwbVYZvnkYpPiT10OV2Mv6NwRveoq6oFso5eku6xc5gY
Message-ID: <CAKzKK0r7StRcA=dEZSzK2=yN-HdFyKDsDV=+yzTdE0_UJboORw@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: Ignore late xferNotReady event to prevent halt timeout
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thinh,

Thank you for your review.

On Wed, Aug 6, 2025 at 7:28=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Tue, Aug 05, 2025, Kuen-Han Tsai wrote:
> > During a device-initiated disconnect, the End Transfer command resets
> > the event filter, allowing a new xferNotReady event to be generated
> > before the controller is fully halted. Processing this late event
> > incorrectly triggers a Start Transfer, which prevents the controller
> > from halting and results in a DSTS.DEVCTLHLT bit polling timeout.
> >
> > Ignore the late xferNotReady event if the controller is already in a
> > disconnected state.
> >
> > Fixes: 8f608e8ab628 ("usb: dwc3: gadget: remove unnecessary 'dwc' param=
eter")
>
> The Fixes should target since the beginning of the driver:
> 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")

Commit 72246da40f37 doesn't have the dwc->connected member. Should we
change the Fixes tag to f09ddcfcb8c5 ("usb: dwc3: gadget: Prevent EP
queuing while stopping transfers")?
That's the commit where the "dwc->connected =3D false" logic was moved befo=
re
stopping active transfers within the pullup function.

>
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> > ---
> > Tracing:
> >
> > # Stop active transfers by sending End Transfer commands
> > dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20d08] params 00000000 =
00000000 00000000 --> status: Successful
> > dwc3_gadget_ep_cmd: ep1in: cmd 'End Transfer' [40d08] params 00000000 0=
0000000 00000000 --> status: Successful
> >  ...
> > # Recieve an xferNotReady event on an ISOC IN endpoint
> > dwc3_event: event (35d010c6): ep1in: Transfer Not Ready [000035d0] (Not=
 Active)
> > dwc3_gadget_ep_cmd: ep1in: cmd 'Start Transfer' [35d60406] params 00000=
000 ffffb620 00000000 --> status: Successful
> > dwc3_gadget_ep_cmd: ep2in: cmd 'End Transfer' [30d08] params 00000000 0=
0000000 00000000 --> status: Timed Out
> >  ...
> > # Start polling DSTS.DEVCTRLHLT
> > dwc3_gadget_run_stop: start polling DWC3_DSTS_DEVCTRLHLT
> >  ...
> > # HALT timeout and print out the endpoint status for debugging
> > dwc3_gadget_run_stop: finish polling DWC3_DSTS_DEVCTRLHLT, is_on=3D0, r=
eg=3D0
> > dwc3_gadget_ep_status: ep1out: mps 1024/2765 streams 16 burst 5 ring 64=
/56 flags E:swbp:>
> > dwc3_gadget_ep_status: ep1in: mps 1024/1024 streams 16 burst 2 ring 21/=
64 flags E:swBp:<
> > dwc3_gadget_ep_status: ep2out: mps 1024/2765 streams 16 burst 5 ring 56=
/48 flags e:swbp:>
> > ---
> >  drivers/usb/dwc3/gadget.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index 25db36c63951..ad89cbeea761 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -3777,6 +3777,15 @@ static void dwc3_gadget_endpoint_transfer_comple=
te(struct dwc3_ep *dep,
> >  static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *de=
p,
> >               const struct dwc3_event_depevt *event)
> >  {
> > +     /*
> > +      * During a device-initiated disconnect, a late xferNotReady even=
t can
> > +      * be generated after the End Transfer command resets the event f=
ilter,
> > +      * but before the controller is halted. Ignore it to prevent a ne=
w
> > +      * transfer from starting.
> > +      */
> > +     if (dep->dwc->connected)
>
> Did you test this? This is supposed to be if (!dep->dwc->connected)
> right?
>

You're absolutely right, I'll update your suggested change in the next
patch. Sorry for the mistake.

The code in my Android testing environment was correct and we've
verified that it resolves the halt problem.

Regards,
Kuen-Han




> > +             return;
> > +
> >       dwc3_gadget_endpoint_frame_from_event(dep, event);
> >
> >       /*
> > --
> > 2.50.1.565.gc32cd1483b-goog
> >


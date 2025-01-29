Return-Path: <linux-usb+bounces-19831-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B82DAA21912
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 09:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19C567A0820
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 08:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7221991BF;
	Wed, 29 Jan 2025 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CfGT+5sz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BB12942A
	for <linux-usb@vger.kernel.org>; Wed, 29 Jan 2025 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738139484; cv=none; b=Zzxw6XsgaIyng229QSQ4x9i6fgXnBFVtmqFzqq0RsPo5xIWLcT+XSGFgUs4O0hRNFPTHXXLxnRm/qKc2T4bz/WWlEqQMpoJ89uMpiuvdXxkL5GAUkeMf27HIV94VywB9otpGvLwho5s6VAmT/CprmAR5MgQtVjC6RCBnmiFVOqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738139484; c=relaxed/simple;
	bh=X1Gy+qc6UqKiuqEeXpB4gGP6dR8/VSSAPvGoFtK0isE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TaSlHs2y5Z163U8COEH6BrrbAMi8SE3hHLglBn6lFvuYC7KHxW1eJEEJdXmU8CH8D1sRDdgLXzFWnWTZanrPxkc7BSsID614hLBV3fABS3pjGNs47VUVUctFIMJc6V/dxvEXNmBIrNlRUrFhCz/+jv/oRJrBVyyCILhyfrf4ORQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CfGT+5sz; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-29fcbf3d709so2070965fac.2
        for <linux-usb@vger.kernel.org>; Wed, 29 Jan 2025 00:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738139482; x=1738744282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjtWcY8pBfBrPcsQti8f5d/L1YSlF4JEUCk9XiM0TIk=;
        b=CfGT+5szMKGf9S20kE1w3Cax9VclHUoGxFfLRFgn1WJwt/5jSBkpEPdoLJaqko6vAc
         FBrUXjrquCmJuBMHVYpo8U1RqHTtv4VT9Y0rTm/gVNJqqWi2hOogsjFleDDNSlJuYEVF
         L8QvrBWwF3PjNNUk8MEn5qYi61CW+bI4e851Xu9TsJr8KHVClK6vzrQv1/Ax7rzdGFr2
         SqQSFlCsyrq094cTLsGcwjqOpuvT5H7UYUsqU1Tq2gAz02EzWt6xMPlj0ypDaEyC16y/
         kk+x72tW0HoA8QwTQ21Fzs7h+424Gj5yeofjhShFUexlpDEJSaFZGI5TBxpB9UnkQn7s
         ft8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738139482; x=1738744282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjtWcY8pBfBrPcsQti8f5d/L1YSlF4JEUCk9XiM0TIk=;
        b=BvwrbU1kcDvDWSVLAUq64L5RrMcBogMeaqVl6ru5/ua7T/pU5/L5ipiHiDDrTbu6yN
         wykZ+jjO2XX+9GRamQDd0+B3zCmJYudW3fgdEIu2Izv0ogmUFiVXiD6MdMQxgfQvFwLW
         eZmW7W3JurnkGCm+gGBlZrZAEPi1rDngR4HjYXPCQz1aL3311QVE3g6mz1lzIgdzynJi
         77JMBFVg5deKAUOkNud0skZMzeLEQSyl2Ah8E5vtD5JNkFlfn1y+lqrjszVYZFS/qRpZ
         jaZQM7DPvftT3O+rCxFVvOJmqn627IWTMdbHJjtwtlwNWszILInzPzT7iOdKpypB/ehl
         ngcA==
X-Forwarded-Encrypted: i=1; AJvYcCXMcdwMrUVpFH6j3o1Pe3r25OfhY8fnYeNEvDWkBpRyzupUSa9VlF6+V2wF1omJnSTYNqM3SD8PFQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbTcJ4QBcGnM0ftKnOg20Myj/WCZm8AgTWdWzuglfZ9i6RIP0a
	b/nZFiheV/DBHQzhOf1p49Y+kG0pi8AX2B3T+6jOnjLPvO84T7+uwH4LQvmUX3XnluyQc+OkQVv
	jlNRdAavBlDaiHxkBIi2uC7Ud167tAWvjQDZX
X-Gm-Gg: ASbGnctgY5ahfetyCA4dEl4lZPzVum7bXJGwQcJom8ZoMGEwMtHYTyrifLYFXsS1LVN
	NxkKZxmjhl4Zibbr5K47A8pfq5ETX1cy7uSdok8aPQ6kdt9kC3RQShifHqgA1MFiahG/fFpJrEU
	R79TeSgjjqDCpBJinbmvIrfVr9gp7bTg==
X-Google-Smtp-Source: AGHT+IH3tYc7tSCEvRaC0rVSY01F3ZJ0j8pButfw+vMxN7n0F5UFuVgALzSyfPEgVd3Ko0LxAfT8xHLPvCWpkFokiuA=
X-Received: by 2002:a05:6871:7a84:b0:29e:6b6a:d6f4 with SMTP id
 586e51a60fabf-2b32f355c37mr1167239fac.37.1738139481866; Wed, 29 Jan 2025
 00:31:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124075911.811594-1-badhri@google.com> <20250128024416.7i3i2vmw2ioy5huf@synopsys.com>
In-Reply-To: <20250128024416.7i3i2vmw2ioy5huf@synopsys.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 29 Jan 2025 00:30:45 -0800
X-Gm-Features: AWEUYZmu4STMU9PLyyq-46H_9oE-nEJON737q3Txbr79YsSRIhVy7qztgU-zCXc
Message-ID: <CAPTae5L6Worr3WsuuV-SUNJh6SOVf+RnLWt2d1LNLDYvY6uRuA@mail.gmail.com>
Subject: Re: [PATCH v1] usb: dwc3: gadget: Prevent irq storm when TH re-executes
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jameswei@google.com" <jameswei@google.com>, 
	"stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 6:44=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Fri, Jan 24, 2025, Badhri Jagan Sridharan wrote:
> > While commit d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events
> > in event cache") makes sure that top half(TH) does not end up overwriti=
ng
> > the cached events before processing them when the TH gets invoked more
> > than one time, returning IRQ_HANDLED results in occasional irq storm
> > where the TH hogs the CPU. The irq storm can be prevented if
> > IRQ_WAKE_THREAD is returned.
> >
> > ftrace event stub during dwc3 irq storm:
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000866: irq_handler_exit: =
irq=3D14 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000872: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000874: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000881: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000883: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000889: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000892: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000898: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000901: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000907: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000909: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000915: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000918: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000924: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000927: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000933: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000935: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     ....
> >
> > Cc: stable@kernel.org
> > Fixes: d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events in event=
 cache")
>
> I don't think this should be Cc to stable, at least not the way it is
> right now.
>
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/dwc3/gadget.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index d27af65eb08a..376ab75adc4e 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -4519,7 +4519,7 @@ static irqreturn_t dwc3_check_event_buf(struct dw=
c3_event_buffer *evt)
> >        * losing events.
> >        */
> >       if (evt->flags & DWC3_EVENT_PENDING)
> > -             return IRQ_HANDLED;
> > +             return IRQ_WAKE_THREAD;
>
> This looks like a workaround to the issue we have. Have you tried to
> enable imod instead? It's the feature to help avoid these kind of issue.

Hi Thinh,

Thanks for the feedback ! Yes, we have been experimenting with the
interrupt moderation interval as well.
Have follow up questions though, please bear with me !

1. Given that when DWC3_EVENT_PENDING  is still set,
dwc3_check_event_buf() is still waiting for the previous cached events
to be processed by the dwc3_thread_interrupt(), what's the reasoning
behind returning IRQ_HANDLED here ? Shouldn't we be returning
IRQ_WAKE_THREAD anyways ?

2. When interrupt moderation is enabled, does DEVICE_IMODC start to
decrement as soon as the interrupt is masked (where I expect that the
interrupt line gets de-asserted by the controller) in
dwc3_check_event_buf()  ?

/* Mask interrupt */
dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
   DWC3_GEVNTSIZ_INTMASK | DWC3_GEVNTSIZ_SIZE(evt->length));

Regards,
Badhri




>
> Thanks,
> Thinh
>
> >
> >       count =3D dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
> >       count &=3D DWC3_GEVNTCOUNT_MASK;
> >
> > base-commit: 70cd0576aa39c55aabd227851cba0c601e811fb6
> > --
> > 2.48.1.262.g85cc9f2d1e-goog
> >


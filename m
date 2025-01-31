Return-Path: <linux-usb+bounces-19899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A38A23C54
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2025 11:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81DD83A7FFD
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2025 10:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2C01B0F36;
	Fri, 31 Jan 2025 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MmsCHpoY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7536169397
	for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2025 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738320024; cv=none; b=TMcYzrzujhBKeJpHkDyW5yNawzAQykBI3XjBg8f2YUeIWZxxnBLlz+p0bmX/rYz3xwJlc03+s0LV4jo5PCgs0HIVCAJgSsr3CX4QFcNz/ZjzJXHZziFFYXfCqbgnS2eHj2VDVHSMiO5nIMDSObzo+aodE2l4u1PR1lfR4Z9U9ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738320024; c=relaxed/simple;
	bh=zGozuPCBMOemT7y95BZGxsqa8aZAmAOcXkDBmMDIVXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Km7q1cmzCtWkctmPanGxHhuSxLQjNRTxQVn5UHX4y/rw3OtouoAMv0mWhjIWXroI4NsHr6/95SdVf5XChmpot8tuS1Em53duGfONvZtBFmWT5uWp1KudECrhqiPXnt7TdF21lgCxL2r9vv0uZb3F004hp5GJs5i5etOTU98gajU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MmsCHpoY; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5f63c89e72bso451362eaf.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2025 02:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738320021; x=1738924821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVGXguvD/XWSPN/7H/Vn3/LDWfkxwGC1zpYLla2oYRs=;
        b=MmsCHpoY5TwL5Vmu+zGh+35SZSftaWaFfGlw36bCRFEZqAPABYk/u75G59WSTRWPID
         5454BA4W+uLNWjFoGgQp4qrJKuEM4y73fZmQCuOQK+sINtreBj6Qz4BwNu5m8j7ekPvz
         edgnY2qfFWqKggvY57k160Qw2RVTEZRFlg47oNInXvtLRatrNj0iLQVKs/U2oVz2LJIN
         2pc/FhRDqmk6xRShqOSjuKxnP6Wp7FnN1u5PAYMim6fTv2olOEy6Z0AX0uezQJs0iyuC
         wE7aOd926VKZbuoqvl+DBM/qcyUlIhhGzYtATJb9ypjd0UadxqU6QHV4DJZ7uWP5Q79H
         LQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738320021; x=1738924821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVGXguvD/XWSPN/7H/Vn3/LDWfkxwGC1zpYLla2oYRs=;
        b=K4lePZXWh12HMJ6mLDLyI2vw8wsrDQq0OEw9xORa1Eje8YF2aQi8CuGQ5BCABF1C1R
         QoBQ7nZeCzYL0DHdvQL4VdWzfW86Gz6MgezUHCuDy27qUGwVV+AGNQutCpENHVWQEGLk
         96/eW3WxL7gfXK64SgWg/lwAQn1QaN1T1QceYTCo/uBJzr3vJ6RVoWjDh4sxKClmuVHF
         1ZEiXo30whrwxYRuo3OdSSwpSD+eSMzKpv6SdKbizfscPIr3R1m7uE2P+yq8v6Sf33sU
         CS86bIYqOb7341l74n5dYap5P3I58fDawsHz7G2PGuJaHb62dkbNpzinJY4MsPDofOe7
         Dy3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+AztittfafZGdKhLVJ+o/9XVXKN5aNqYTYsJLz5kyNy0T6NxEVdPg+oWJjAAyukbZOmgMcl9qSLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCFwGkN4eox5u3WF1JX2u8rmiYboSOOzyHD5KJ4P7427tbC9Xm
	AcSBQ1CfQJuiBbj/7XjvC1nuN8IO3Y/37X5trpFILC0RS6N9CO/frCDuloq3C06c565VpDrem7j
	+zqhjXZ5sQqaz7OjTEyqBmdkM2Ccl2owhIrNM
X-Gm-Gg: ASbGncuquaqnTTICjS0Munuu9rNBItHKibcx9bo6r3abvdv3gfJN/K+/fC4cTF7uQKs
	W9Aq9UTQtpq9LEfADbplLP4OxrZR94AgyUs4y4dQRI57p7YlbqEK8lMhQBgYS689+f6PPzGwAnL
	TzzuYRjMrdQkDzphGFOpGgqhBZiTe92A==
X-Google-Smtp-Source: AGHT+IE/sYhNrB2G0vEnFsQl/bjTMWmctmAqMKAfLRgozrLG+p/PxjpwcwzCDgblD5E0zKXyOte0WedcqMQyrzQ8/So=
X-Received: by 2002:a05:6820:1f0f:b0:5f6:d91b:ef36 with SMTP id
 006d021491bc7-5fc0018e976mr8023181eaf.1.1738320021452; Fri, 31 Jan 2025
 02:40:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124075911.811594-1-badhri@google.com> <20250128024416.7i3i2vmw2ioy5huf@synopsys.com>
 <CAPTae5L6Worr3WsuuV-SUNJh6SOVf+RnLWt2d1LNLDYvY6uRuA@mail.gmail.com> <20250130014159.bv7gvtskyg73lxmc@synopsys.com>
In-Reply-To: <20250130014159.bv7gvtskyg73lxmc@synopsys.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Fri, 31 Jan 2025 02:39:45 -0800
X-Gm-Features: AWEUYZkoMRlFE5IHXCTlq96XrXaB6uEN6-3PGCSeX5qP1T9wvUOXSpVnZQPyjAM
Message-ID: <CAPTae5JYuogc-mHUi-VdfLAJ4E1z6myGofCvqVCfYxt--VetKA@mail.gmail.com>
Subject: Re: [PATCH v1] usb: dwc3: gadget: Prevent irq storm when TH re-executes
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jameswei@google.com" <jameswei@google.com>, 
	"stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 5:42=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Wed, Jan 29, 2025, Badhri Jagan Sridharan wrote:
> > On Mon, Jan 27, 2025 at 6:44=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > On Fri, Jan 24, 2025, Badhri Jagan Sridharan wrote:
> > > > While commit d325a1de49d6 ("usb: dwc3: gadget: Prevent losing event=
s
> > > > in event cache") makes sure that top half(TH) does not end up overw=
riting
> > > > the cached events before processing them when the TH gets invoked m=
ore
> > > > than one time, returning IRQ_HANDLED results in occasional irq stor=
m
> > > > where the TH hogs the CPU. The irq storm can be prevented if
> > > > IRQ_WAKE_THREAD is returned.
> > > >
> > > > ftrace event stub during dwc3 irq storm:
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000866: irq_handler_ex=
it: irq=3D14 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000872: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000874: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000881: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000883: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000889: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000892: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000898: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000901: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000907: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000909: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000915: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000918: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000924: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000927: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000933: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000935: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     ....
> > > >
> > > > Cc: stable@kernel.org
> > > > Fixes: d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events in e=
vent cache")
> > >
> > > I don't think this should be Cc to stable, at least not the way it is
> > > right now.
> > >
> > > > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > > > ---
> > > >  drivers/usb/dwc3/gadget.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > > > index d27af65eb08a..376ab75adc4e 100644
> > > > --- a/drivers/usb/dwc3/gadget.c
> > > > +++ b/drivers/usb/dwc3/gadget.c
> > > > @@ -4519,7 +4519,7 @@ static irqreturn_t dwc3_check_event_buf(struc=
t dwc3_event_buffer *evt)
> > > >        * losing events.
> > > >        */
> > > >       if (evt->flags & DWC3_EVENT_PENDING)
> > > > -             return IRQ_HANDLED;
> > > > +             return IRQ_WAKE_THREAD;
> > >
> > > This looks like a workaround to the issue we have. Have you tried to
> > > enable imod instead? It's the feature to help avoid these kind of iss=
ue.
> >
> > Hi Thinh,
> >
> > Thanks for the feedback ! Yes, we have been experimenting with the
> > interrupt moderation interval as well.
> > Have follow up questions though, please bear with me !
> >
> > 1. Given that when DWC3_EVENT_PENDING  is still set,
> > dwc3_check_event_buf() is still waiting for the previous cached events
> > to be processed by the dwc3_thread_interrupt(), what's the reasoning
> > behind returning IRQ_HANDLED here ? Shouldn't we be returning
> > IRQ_WAKE_THREAD anyways ?
>
> Currently dwc3 is implemented such that it will not process new events
> until the BH is done with its work. The DWC3_EVENT_PENDING flag
> indicates when the events are processed. With this expectation, we
> should not schedule the BH as the events are still being handled.


Hi Thinh,

Thanks for sharing your thoughts !
Given that the intention of the design is to keep top half
(dwc3_check_event_buf()) and bottom half (dwc3_process_event_buf())
mutually exclusive, Is there a reason why the threaded interrupt
should not be marked with IRQF_ONESHOT ? Marking it IRQF_ONESHOT makes
the threaded irq framework to ensure mutual exclusivity for us. I
was validating this and this seems to be pretty effective. Curious to
know your thoughts !

>
>
> In your case, there's a small window where the TH may be scheduled but
> the DWC3_EVENT_PENDING flag is not cleared yet. Returning
> IRQ_WAKE_THREAD may workaround your issue because the BH may already be
> running when DWC3_EVENT_PENDING is set. I'm not sure what other side
> effect this may have since we're breaking this expectation.
>
> We may enhance the dwc3 handling of event flow in the future to improve
> this. But at the moment, we should not return IRQ_WAKE_THREAD here.
>
> >
> > 2. When interrupt moderation is enabled, does DEVICE_IMODC start to
> > decrement as soon as the interrupt is masked (where I expect that the
> > interrupt line gets de-asserted by the controller) in
> > dwc3_check_event_buf()  ?
> >
> > /* Mask interrupt */
> > dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
> >    DWC3_GEVNTSIZ_INTMASK | DWC3_GEVNTSIZ_SIZE(evt->length));
> >
>
> The DEVICE_IMODC is loaded with DEVICE_IMODI and starts to decrement as
> soon as the interrupt is de-asserted from the asserted state, which
> includes when the interrupt is masked. You brought up a good question
> here. The IMOD count may already be 0 when we exit the BH. Can you try
> this experiment to update the count and let me know if it helps:


Gave this a try, unfortunately this does not seem to help ! I see what
you are trying to do though. You are trying to explicitly re-arm the
timer. I was checking the register description as well and it does not seem=
 to
guarantee that directly writing to DEVICE_IMODC restarts the counter
again.

Thanks,
Badhri


>
>
> Note: not tested.
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 0fe92c0fb520..62aaac31ca68 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -5739,7 +5739,8 @@ static irqreturn_t dwc3_process_event_buf(struct dw=
c3_event_buffer *evt)
>
>         if (dwc->imod_interval) {
>                 dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), DWC3_GEVNTCOUN=
T_EHB);
> -               dwc3_writel(dwc->regs, DWC3_DEV_IMOD(0), dwc->imod_interv=
al);
> +               dwc3_writel(dwc->regs, DWC3_DEV_IMOD(0),
> +                           (dwc->imod_interval << 16) | dwc->imod_interv=
al);
>         }
>
>         /* Keep the clearing of DWC3_EVENT_PENDING at the end */
>
>
> Thanks,
> Thinh


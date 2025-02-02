Return-Path: <linux-usb+bounces-19950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C45A24C91
	for <lists+linux-usb@lfdr.de>; Sun,  2 Feb 2025 05:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AE5E163AA0
	for <lists+linux-usb@lfdr.de>; Sun,  2 Feb 2025 04:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BBA41C79;
	Sun,  2 Feb 2025 04:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LUhPMWBN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21E425632
	for <linux-usb@vger.kernel.org>; Sun,  2 Feb 2025 04:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738468823; cv=none; b=YX3ttikWC5J5wcrcGMkBir6g7rNv2zeBw/eebncPK0sVITR2+eZ3Wr7dymC+iWLlUtlSe+Rwmll/SUbnbSl8RZdakfMY5LjVUHCpmXJwvMZ2VxW048mSKaG76uBzHpsuoSAAUt9ispf0/HiQ8CgZvxFFKwStzAKp56FJPWvOLE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738468823; c=relaxed/simple;
	bh=clKK0H6xdcXQfRlxT+DrACKlQNopTIeCzE95MH+/u6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iV7qEHXQ/bNVusK9ZJLcb+JnsJILWjPkFJpbPrRYsBYeguO3DRryoYa2MjqgLw8UPZ5aEm+/ZWvqaN8/EfJvGFi3gSMlP3pvBQhM8vP12mUIz/NGZNOR/BLuM5D5tSdz1gYqbBHv64ut2MXEY1fqnkP3sYP+l3Pp5ZUKM9AvQMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LUhPMWBN; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-724f4d99ba0so1583110a34.0
        for <linux-usb@vger.kernel.org>; Sat, 01 Feb 2025 20:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738468821; x=1739073621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LI3xeUwu8EErcVtMqGX3bpVPyaEli1w3CO9BxFmPwpw=;
        b=LUhPMWBNvQL7DBColofLHud99HQc9BrQFqyt1L0yC/MM/UfYgz9TkcymnzoTsMdrMR
         9NbHikpq+vWPT0xE+lQU8cfSO03suFYEApoI8nTz9CsLzHYqyiikfvwyImCaP0qqv7xY
         v8+XBzZGht4GY1LR6WJXemPvRunOyqYLZash1y6aKJnm1thrvOCcg20Gb7xrKm5Yprpk
         1EYQhFPrNNCoehpIxTHdcEB59mIz8rYO9wbLZAr6BAVrVDKj3W1XKFJaSMR+h/eLNKEX
         h0vYE+zzBdlqpZDU5cosc7pSHDZU/sXfMwwxpTusu4h1AIyzRxOcJ071j1hZBsehrD1e
         qGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738468821; x=1739073621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LI3xeUwu8EErcVtMqGX3bpVPyaEli1w3CO9BxFmPwpw=;
        b=dHZvXb01WSAZH2R/a2bWe3OeqFSN0XuHl6aNrWCrXl8scrUCFRjoscxp0fsPKmLWiH
         gIEKoa79BbNPFilmbOvHgAgb63ziQDSpd4XBNPHu+HXoTuH3EjQpRnM+rIlxuXMyLHyG
         6Zu8X5VxZ8wxQ3x9c+dRAk/VVnImLRWZMdlbrXj8V+F4epZLalqL5Ok6XiiMf429YcNA
         TrGhbgc7DNGFHzhYG6GPJ4tj06cbjL0kr2iYzQxX+gd+5ArVWyMWPdEc46e4Iul6vuId
         OvgZ8T1q5LRnOffQ2PdAWls1GJ51gJ5ZXf86t+qlnT8WD/YJ6alfZjlYbnWk5t2Ikjah
         m4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS5SkRpCywg9G3XrakBfTJwSgU4exM/Or4iNm3InJV8WbRZQeYMxq/1hQ2r+O447slMp7KEl7wpkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgoOE00kDLrxy5ziosoJpxoCGG9ECC+QYQJWtMaH0TiHXAbpxm
	s6EKFWTQQIMOhetdCvqzwMcqDKBR2c191QtaY7Au6rYHYCU/oAyTi0lbSoVR0FLUKryUPAgeTNi
	OKEKxRyrpUX/JaUqb5kxYtx6EdSILPh0Puia4
X-Gm-Gg: ASbGncso0h3fA+Rq+aT/M8tuUOayMP2Ale2goQX7jTdaLnwDqDd0PHl3SCyAL0Ue4UB
	WvDU+p4lwH+PfH0ZO9NxS34IJp5dSoGPZdwwCgUNutonRRFflQD4bUkto1a2+RcDVbG3Tu+rNZj
	DyZzmxpne+frHAa21HYui5EOnV4U/HNg==
X-Google-Smtp-Source: AGHT+IHsjNOFn4gqTs2pplnvwIrczYC0kJUvkdvfX4d+0MN/8x9F9B5MAZ4xvcUgFFaryzccLo1ls+bbZLxsmhlg2lc=
X-Received: by 2002:a05:6871:3a8a:b0:29e:509c:3711 with SMTP id
 586e51a60fabf-2b32f14f238mr10039807fac.15.1738468820698; Sat, 01 Feb 2025
 20:00:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124075911.811594-1-badhri@google.com> <20250128024416.7i3i2vmw2ioy5huf@synopsys.com>
 <CAPTae5L6Worr3WsuuV-SUNJh6SOVf+RnLWt2d1LNLDYvY6uRuA@mail.gmail.com>
 <20250130014159.bv7gvtskyg73lxmc@synopsys.com> <CAPTae5JYuogc-mHUi-VdfLAJ4E1z6myGofCvqVCfYxt--VetKA@mail.gmail.com>
 <20250201000926.veukjr6wmhrgl6me@synopsys.com>
In-Reply-To: <20250201000926.veukjr6wmhrgl6me@synopsys.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Sat, 1 Feb 2025 19:59:44 -0800
X-Gm-Features: AWEUYZnxbvWspX02bTb7xvaZoZn6rpvcyFtGB4y0YscQu6nKJg-DiYiewQo0a8g
Message-ID: <CAPTae5Lw8pB=SuGgkfTyk5BNPWwgCVvYssdLwT7vFKgMepsZig@mail.gmail.com>
Subject: Re: [PATCH v1] usb: dwc3: gadget: Prevent irq storm when TH re-executes
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jameswei@google.com" <jameswei@google.com>, 
	"stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 4:09=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Fri, Jan 31, 2025, Badhri Jagan Sridharan wrote:
> > On Wed, Jan 29, 2025 at 5:42=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > On Wed, Jan 29, 2025, Badhri Jagan Sridharan wrote:
> > > > On Mon, Jan 27, 2025 at 6:44=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@=
synopsys.com> wrote:
> > > > >
> > > > > On Fri, Jan 24, 2025, Badhri Jagan Sridharan wrote:
> > > > > > While commit d325a1de49d6 ("usb: dwc3: gadget: Prevent losing e=
vents
> > > > > > in event cache") makes sure that top half(TH) does not end up o=
verwriting
> > > > > > the cached events before processing them when the TH gets invok=
ed more
> > > > > > than one time, returning IRQ_HANDLED results in occasional irq =
storm
> > > > > > where the TH hogs the CPU. The irq storm can be prevented if
> > > > > > IRQ_WAKE_THREAD is returned.
> > > > > >
> > > > > > ftrace event stub during dwc3 irq storm:
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000866: irq_handle=
r_exit: irq=3D14 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000872: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000874: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000881: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000883: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000889: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000892: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000898: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000901: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000907: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000909: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000915: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000918: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000924: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000927: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000933: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000935: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     ....
> > > > > >
> > > > > > Cc: stable@kernel.org
> > > > > > Fixes: d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events =
in event cache")
> > > > >
> > > > > I don't think this should be Cc to stable, at least not the way i=
t is
> > > > > right now.
> > > > >
> > > > > > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > > > > > ---
> > > > > >  drivers/usb/dwc3/gadget.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadge=
t.c
> > > > > > index d27af65eb08a..376ab75adc4e 100644
> > > > > > --- a/drivers/usb/dwc3/gadget.c
> > > > > > +++ b/drivers/usb/dwc3/gadget.c
> > > > > > @@ -4519,7 +4519,7 @@ static irqreturn_t dwc3_check_event_buf(s=
truct dwc3_event_buffer *evt)
> > > > > >        * losing events.
> > > > > >        */
> > > > > >       if (evt->flags & DWC3_EVENT_PENDING)
> > > > > > -             return IRQ_HANDLED;
> > > > > > +             return IRQ_WAKE_THREAD;
> > > > >
> > > > > This looks like a workaround to the issue we have. Have you tried=
 to
> > > > > enable imod instead? It's the feature to help avoid these kind of=
 issue.
> > > >
> > > > Hi Thinh,
> > > >
> > > > Thanks for the feedback ! Yes, we have been experimenting with the
> > > > interrupt moderation interval as well.
> > > > Have follow up questions though, please bear with me !
> > > >
> > > > 1. Given that when DWC3_EVENT_PENDING  is still set,
> > > > dwc3_check_event_buf() is still waiting for the previous cached eve=
nts
> > > > to be processed by the dwc3_thread_interrupt(), what's the reasonin=
g
> > > > behind returning IRQ_HANDLED here ? Shouldn't we be returning
> > > > IRQ_WAKE_THREAD anyways ?
> > >
> > > Currently dwc3 is implemented such that it will not process new event=
s
> > > until the BH is done with its work. The DWC3_EVENT_PENDING flag
> > > indicates when the events are processed. With this expectation, we
> > > should not schedule the BH as the events are still being handled.
> >
> >
> > Hi Thinh,
> >
> > Thanks for sharing your thoughts !
> > Given that the intention of the design is to keep top half
> > (dwc3_check_event_buf()) and bottom half (dwc3_process_event_buf())
> > mutually exclusive, Is there a reason why the threaded interrupt
> > should not be marked with IRQF_ONESHOT ? Marking it IRQF_ONESHOT makes
> > the threaded irq framework to ensure mutual exclusivity for us. I
> > was validating this and this seems to be pretty effective. Curious to
> > know your thoughts !
>
>
> We shouldn't do that. There are designs with phy driver or connector
> driver or other devices that share the same interrupt line.
>
> >
> > >
> > >
> > > In your case, there's a small window where the TH may be scheduled bu=
t
> > > the DWC3_EVENT_PENDING flag is not cleared yet. Returning
> > > IRQ_WAKE_THREAD may workaround your issue because the BH may already =
be
> > > running when DWC3_EVENT_PENDING is set. I'm not sure what other side
> > > effect this may have since we're breaking this expectation.
> > >
> > > We may enhance the dwc3 handling of event flow in the future to impro=
ve
> > > this. But at the moment, we should not return IRQ_WAKE_THREAD here.
> > >
> > > >
> > > > 2. When interrupt moderation is enabled, does DEVICE_IMODC start to
> > > > decrement as soon as the interrupt is masked (where I expect that t=
he
> > > > interrupt line gets de-asserted by the controller) in
> > > > dwc3_check_event_buf()  ?
> > > >
> > > > /* Mask interrupt */
> > > > dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
> > > >    DWC3_GEVNTSIZ_INTMASK | DWC3_GEVNTSIZ_SIZE(evt->length));
> > > >
> > >
> > > The DEVICE_IMODC is loaded with DEVICE_IMODI and starts to decrement =
as
> > > soon as the interrupt is de-asserted from the asserted state, which
> > > includes when the interrupt is masked. You brought up a good question
> > > here. The IMOD count may already be 0 when we exit the BH. Can you tr=
y
> > > this experiment to update the count and let me know if it helps:
> >
> >
> > Gave this a try, unfortunately this does not seem to help ! I see what
> > you are trying to do though. You are trying to explicitly re-arm the
> > timer. I was checking the register description as well and it does not =
seem to
> > guarantee that directly writing to DEVICE_IMODC restarts the counter
> > again.
> >
>
> Hmm... Can you try this instead:

Thanks, this seems to be working !
I also sent out the following as there isn't a way to enable interrupt
moderation through the device tree node:
https://lore.kernel.org/all/20250202035100.31235-1-badhri@google.com/
https://lore.kernel.org/all/20250202035100.31235-2-badhri@google.com/

>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 0fe92c0fb520..c1b5a3742ab4 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -5737,14 +5737,20 @@ static irqreturn_t dwc3_process_event_buf(struct =
dwc3_event_buffer *evt)
>         dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
>                     DWC3_GEVNTSIZ_SIZE(evt->length));
>
> +       /*
> +        * Keep the clearing of DWC3_EVENT_PENDING after the interrupt un=
mask
> +        * but before the clearing of DWC3_GEVNTCOUNT_EHB.
> +        */
> +       evt->flags &=3D ~DWC3_EVENT_PENDING;
> +
> +       /* Ensure the flag is updated before clearing DWC3_GEVNTCOUNT_EHB=
 */
> +       wmb();

I still have one more question though :)
Wondering why not move this code about the DWC3_GEVNTSIZ write where
the interrupt is actually unmasked that way this would also work for
systems which dont have interrupt moderation enabled right ?

Thanks,
Badhri

> +
>         if (dwc->imod_interval) {
>                 dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), DWC3_GEVNTCOUN=
T_EHB);
>                 dwc3_writel(dwc->regs, DWC3_DEV_IMOD(0), dwc->imod_interv=
al);
>         }
>
> -       /* Keep the clearing of DWC3_EVENT_PENDING at the end */
> -       evt->flags &=3D ~DWC3_EVENT_PENDING;
> -
>         return ret;
>  }
>
>
> This should solve the issue for controllers with IMOD enabled.
>
> Thanks,
> Thinh


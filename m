Return-Path: <linux-usb+bounces-24359-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 378BFAC66A5
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 12:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A5061BA487C
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 10:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46A927979C;
	Wed, 28 May 2025 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1JZHIkqL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8802E2459E6
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748426862; cv=none; b=CNrkyW+f3uJS/h+a+3rUaAQh3hd3USY2wIwzC2cU1FRCfupySOS7M+t8eicjGAsPMetoQzpSI2Ch7QTvOXuc7qzCMzB1R5xgY6w12pmyvGQC3Oy1bi7WIUtkV/roUW+q0es7389FEA6hfIEAmObJdL9u7uMG9R/JnguEOrrjtT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748426862; c=relaxed/simple;
	bh=qQFe6rVqcyQFoEiSf7r6q/+IaWuCcw8oKuk3h3oThjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFYPa0bwQPNQEt15BGcIbQiCZr0T8/B3bB2Yu/D3HnRD9v3b1d/7LmdxFvGVZ0rO7y3BXGUSPirvgcHQneKPhAaX2yprQowr9nmHCTvfqLleLER7iSkTlIQN+dWnDd9ZZ0HcToZf/7mHF9rTdiZEe3/EpHHq0Q/fNPE6Ns3QdAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1JZHIkqL; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55320f715bdso6838e87.0
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748426858; x=1749031658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUgR3I1/9djOJDjMSGNUDP/fcCUlqLXDyS64tD1xt3Y=;
        b=1JZHIkqLWVhOWCdz0fL3pInpVQwVIG15ju/3FQ9RpTHLQKPs96S5efC9/9ML6cPV50
         q9VifqyjFG+MnrAZe7xPuuJr5K8to72EV8gYXV16SY39NnnkxO2W9MXN28yeLmOEZL6h
         okUEQPr8FDjNDgA071ZsZZ7hv9VTQIHipAkX5lg1oKU6bmU0L14KaWfFYiPUpEK5z4dv
         P0Mo4P8XutwhoH5W7FI5/5RF12JGEd7zbmNTBGXrkdyLTvV/63negFJxmyvHhRRk2Ttm
         9bsqS/2pISTjbWQaRnhlKlRI1XKsN4MGhS48lNPXUfKOm64nIBjMdydgtgDd8x22/NlA
         tzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748426858; x=1749031658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUgR3I1/9djOJDjMSGNUDP/fcCUlqLXDyS64tD1xt3Y=;
        b=TzhdP1sEB42nPUegeok5fpoWm+h3oYDVgDNO//XClw82qHBfLRVVP3wIzmO8qPJEf8
         O2FfFTRcecprMQ2eNjU5QqPYI/Dgo3XJrqMReN2UJH2MxtnSiH/qNKZ6w3vdBvy3lhVY
         ihKLSYPuHOp8kN1BxK7+3JicIHCTBB/R1hI85SnN/g1VDyxdh6pXsAQ2QEJ5vp70uT6W
         PU7WprW11efr3A/jTarRx4ApvfCcMlMkk8MDCEC1b9WgLp4oyuka9ngQadKBrN8lRIpP
         uWZ3/WzAkG1jebShJbDItYfCYaEMy96x8oUQNzOWsPh9M1Ml12/ZYYfYyTpgwotFeCKs
         nyog==
X-Forwarded-Encrypted: i=1; AJvYcCVpcS2MKWg6UGGK8l9Bk1k+CpiW5nZgq+MVwOdaRhEMAq3XHZ9sm5VM/wb8DZfoJrygVQpMsL/ew3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpKioK+F/fP1BseE3MQM1hiCb47BQHCXjToiqdzSXdrwHfNO1G
	N7CzZaUQWQYDKwZKgpKzag/SeOhPOI6bc6HDb445fp7aVzbUodWM2dYg1dixl84AdANXvR6O0Le
	yIaev7M/PqyhSuuoSHFexK9QrZa+gahWB45qHW22q
X-Gm-Gg: ASbGnct7xm26L2oJX63r37A9zt0S/0axEkhTIELEvXcpobBpRar4RjgAPfy8zBj2UTB
	am0728PzuuOgR9Z1ewVyhCqQ0mglZBrJwh5PQq6OtLrT3SrPr2O0qHMAj20b8ln8MfFmNxtphfH
	pOkL3O3PKI09aqt5WgxbitbHvgr+FiQhmPlsvFisabVJ3HuQogHB4S9mx+GwM/pvK36pRzUkE=
X-Google-Smtp-Source: AGHT+IHFgfvj33yIaJRpjmrIG2/RZ8tg1z4PPfBAXTOJNZYZOUlkuXVbhA7VckM+dh4T6BrZ+JmJGE4kZIR/yrgc69A=
X-Received: by 2002:ac2:5d6c:0:b0:550:e93a:cfa5 with SMTP id
 2adb3069b0e04-5532ef807bfmr142417e87.1.1748426857497; Wed, 28 May 2025
 03:07:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416100515.2131853-1-khtsai@google.com> <20250419012408.x3zxum5db7iconil@synopsys.com>
 <CAKzKK0qi9Kze76G8NGGoE=-VTrtf47BbTWCA9XWbKK1N=rh9Ew@mail.gmail.com> <2025052819-affluent-reputably-83bb@gregkh>
In-Reply-To: <2025052819-affluent-reputably-83bb@gregkh>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Wed, 28 May 2025 18:07:10 +0800
X-Gm-Features: AX0GCFuXGaTl7wE46Hh7sCuJ_xdh4lOpJTWk67IkPD9e8iv8YV7PJr9cWZPAsPA
Message-ID: <CAKzKK0rezBC_9zwzkmeejGXtO3W+fTDOKsS26CsvhW+WwKRySA@mail.gmail.com>
Subject: Re: [PATCH v4] usb: dwc3: Abort suspend on soft disconnect failure
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 4:23=E2=80=AFPM gregkh@linuxfoundation.org
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 28, 2025 at 03:35:15PM +0800, Kuen-Han Tsai wrote:
> > On Sat, Apr 19, 2025 at 9:24=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > On Wed, Apr 16, 2025, Kuen-Han Tsai wrote:
> > > > When dwc3_gadget_soft_disconnect() fails, dwc3_suspend_common() kee=
ps
> > > > going with the suspend, resulting in a period where the power domai=
n is
> > > > off, but the gadget driver remains connected.  Within this time fra=
me,
> > > > invoking vbus_event_work() will cause an error as it attempts to ac=
cess
> > > > DWC3 registers for endpoint disabling after the power domain has be=
en
> > > > completely shut down.
> > > >
> > > > Abort the suspend sequence when dwc3_gadget_suspend() cannot halt t=
he
> > > > controller and proceeds with a soft connect.
> > > >
> > > > Fixes: 9f8a67b65a49 ("usb: dwc3: gadget: fix gadget suspend/resume"=
)
> > > > CC: stable@vger.kernel.org
> > > > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> > > > ---
> > > >
> > > > Kernel panic - not syncing: Asynchronous SError Interrupt
> > > > Workqueue: events vbus_event_work
> > > > Call trace:
> > > >  dump_backtrace+0xf4/0x118
> > > >  show_stack+0x18/0x24
> > > >  dump_stack_lvl+0x60/0x7c
> > > >  dump_stack+0x18/0x3c
> > > >  panic+0x16c/0x390
> > > >  nmi_panic+0xa4/0xa8
> > > >  arm64_serror_panic+0x6c/0x94
> > > >  do_serror+0xc4/0xd0
> > > >  el1h_64_error_handler+0x34/0x48
> > > >  el1h_64_error+0x68/0x6c
> > > >  readl+0x4c/0x8c
> > > >  __dwc3_gadget_ep_disable+0x48/0x230
> > > >  dwc3_gadget_ep_disable+0x50/0xc0
> > > >  usb_ep_disable+0x44/0xe4
> > > >  ffs_func_eps_disable+0x64/0xc8
> > > >  ffs_func_set_alt+0x74/0x368
> > > >  ffs_func_disable+0x18/0x28
> > > >  composite_disconnect+0x90/0xec
> > > >  configfs_composite_disconnect+0x64/0x88
> > > >  usb_gadget_disconnect_locked+0xc0/0x168
> > > >  vbus_event_work+0x3c/0x58
> > > >  process_one_work+0x1e4/0x43c
> > > >  worker_thread+0x25c/0x430
> > > >  kthread+0x104/0x1d4
> > > >  ret_from_fork+0x10/0x20
> > > >
> > > > ---
> > > > Changelog:
> > > >
> > > > v4:
> > > > - correct the mistake where semicolon was forgotten
> > > > - return -EAGAIN upon dwc3_gadget_suspend() failure
> > > >
> > > > v3:
> > > > - change the Fixes tag
> > > >
> > > > v2:
> > > > - move declarations in separate lines
> > > > - add the Fixes tag
> > > >
> > > > ---
> > > >  drivers/usb/dwc3/core.c   |  9 +++++++--
> > > >  drivers/usb/dwc3/gadget.c | 22 +++++++++-------------
> > > >  2 files changed, 16 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > > > index 66a08b527165..f36bc933c55b 100644
> > > > --- a/drivers/usb/dwc3/core.c
> > > > +++ b/drivers/usb/dwc3/core.c
> > > > @@ -2388,6 +2388,7 @@ static int dwc3_suspend_common(struct dwc3 *d=
wc, pm_message_t msg)
> > > >  {
> > > >       u32 reg;
> > > >       int i;
> > > > +     int ret;
> > > >
> > > >       if (!pm_runtime_suspended(dwc->dev) && !PMSG_IS_AUTO(msg)) {
> > > >               dwc->susphy_state =3D (dwc3_readl(dwc->regs, DWC3_GUS=
B2PHYCFG(0)) &
> > > > @@ -2406,7 +2407,9 @@ static int dwc3_suspend_common(struct dwc3 *d=
wc, pm_message_t msg)
> > > >       case DWC3_GCTL_PRTCAP_DEVICE:
> > > >               if (pm_runtime_suspended(dwc->dev))
> > > >                       break;
> > > > -             dwc3_gadget_suspend(dwc);
> > > > +             ret =3D dwc3_gadget_suspend(dwc);
> > > > +             if (ret)
> > > > +                     return ret;
> > > >               synchronize_irq(dwc->irq_gadget);
> > > >               dwc3_core_exit(dwc);
> > > >               break;
> > > > @@ -2441,7 +2444,9 @@ static int dwc3_suspend_common(struct dwc3 *d=
wc, pm_message_t msg)
> > > >                       break;
> > > >
> > > >               if (dwc->current_otg_role =3D=3D DWC3_OTG_ROLE_DEVICE=
) {
> > > > -                     dwc3_gadget_suspend(dwc);
> > > > +                     ret =3D dwc3_gadget_suspend(dwc);
> > > > +                     if (ret)
> > > > +                             return ret;
> > > >                       synchronize_irq(dwc->irq_gadget);
> > > >               }
> > > >
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
> > >
> > > In any case, I think this should be good. Thanks for the fix:
> > >
> > > Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > >
> > > Thanks,
> > > Thinh
> >
> > Hi Greg,
> >
> > It looks like this patch hasn't been cherry-picked into the usb-next
> > branch yet. Am I missing something?
>
> It's somehow not in my queue anymore, sorry.  Can you please resend it
> and I'll pick it up after -rc1 is out.
>
> thanks,
>
> greg k-h

Hi Greg,

Sent out the v5 patch, which includes Thinh Nguyen's Acked-by tag. Thanks!
https://lore.kernel.org/linux-usb/20250528100315.2162699-1-khtsai@google.co=
m/T/#u

Regards,
Kuen-Han


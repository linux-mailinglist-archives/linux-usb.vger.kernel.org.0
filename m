Return-Path: <linux-usb+bounces-23259-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1089CA95026
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 13:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36AB8171634
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 11:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A842641E3;
	Mon, 21 Apr 2025 11:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KRnYRcml"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE1263F3E
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 11:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745234771; cv=none; b=Zo6o3RWElbP+SzPxPGAJs7bYvU67hGeZr/Px7aJlwgfIJ2kWr1crgZVmwZrM/ANwCb57q3i2dRoooXjqJxuL3nRNhJhfbYpwJeobYnEjoo133ebpHhEpR1bPnXbWqryUNxyi2vBvd+aChxsMwYJYIj1N1uUqyBwHfL4sCMiDfOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745234771; c=relaxed/simple;
	bh=zHcWarPj9NjR3xEtkYaqxlJfwvkaDX9lLrQsKXg/rjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TN3t+KANAlqJRZwONN0Ds5oeWd8qUs2LaBmEc3mMj0CponpZMUp9tL1jAAcM4nLwFeMliXUOz+Y+tSiW4UdhUf3ZljCf1elqSYwVBk0MTXMPtDXz5btxZayyA++yZ2lDwxoxVzx3od//5zxMT4/6bynRASMm/qMysnHfEC4rxuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KRnYRcml; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54e655818b0so5212e87.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745234766; x=1745839566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12ulIlL+bStUTIpncUPTjhwEK2bBCc519N9u/ukXq2U=;
        b=KRnYRcmly1Y9j/ulMUHgMrSTuBzTDllSSObq7k7w7jMYsB9ADYIDjwirapXdfxFN3t
         384x8YWRvINVqtKfmyYSnADLXNX01TQ/uxAvyrb4D4HLx7zS+brtkROKGFot55oAJxME
         VlPsdSq3kjyVRRIEdw332PQvl8v3OcgVItRFAAFuXYQRH0bK0KHDN+BVqdNxUQwOrXh2
         WNoHTRyP9nEruGcjcdBR10/0ypa+DUL37WO7BbKkER2umRiF0G1+/L9L1DoScuZfRqwZ
         tSVvFOOFRKQiDU/8t4yjzHt8Qu4srvESQ8YZqga+LWOjFEABCS7fFqYcAQw3w4VImEGL
         BZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745234766; x=1745839566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12ulIlL+bStUTIpncUPTjhwEK2bBCc519N9u/ukXq2U=;
        b=HPlp/PkGNm04D65OYUUOj3lupdA5Xg4zCtKYS3Fy+yW6yekNUtGGXKoJu1BCeGbHf5
         DQZK7Z0M1yhiusuE6tkmHXJc9nIeClw/4q1EuBSv4XMFAu4gHAcX2zf/Yo1SQwxMikHM
         7Jx+IydM/UCE6X0a+N9qNrbfjBRMUTRl67e85v/xhuzOkeh9YaMECqQQKyyCmcgBZhWQ
         x9YlDKZWEpu5YXLqRdoybqndA9Df2SfoEJOvilASXdTHkVOn5dgZPz27sayf+QOdPmGc
         RyTyqBW+7Q3G7iXIcMqYyyFwChc3X8hCkkN5ftIo0uhC7n9FuzwisagjlVYCUjS6MJDQ
         juew==
X-Forwarded-Encrypted: i=1; AJvYcCXpvvPVQUMxrtAFsP+ycQMCm51+9wDUWmYddzLa6HjXanXr+mtHKe3B0JsGzDAiSG+vWfxoXqg5kIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiRyz0yrw0Ovj//JCSo8PKetCgxmJzD9slRSlib9lDmxdw4y2w
	LIfyuwAFkh9oQ9loGfrqKlJqyI6mSkaFuLs6JoxCLwd14aU5OL0Kv/rFhUzh9hVV3G9Yk6NSaxe
	4Z4ASyJIEGZtuPPtstJ7O1nkyvxxzqQz133EA
X-Gm-Gg: ASbGnctTfv6511h2c1ItZ7H/5jQH6EUTfYVXH0LJMsY4TOyR/t7os/1NMgkLqOaLVfs
	3DrMnN71I4Pa/QWDWMp0Od9QCJrOBaT0IW8MujCj5bFUQ0lAQmpkva+E6KsONo2tGnxLZ1ffPwP
	AI9yHHTS8dPiGKO/D3Rh4IO7Gfr0wMZ+68lCw/n5/xkJ1NjR1khW6Ztw1k17E=
X-Google-Smtp-Source: AGHT+IFEdze/a99TFCtvLVk5Rmo1yzKGRrpY13nJyWYeXkfaum583hJP2CO4rOYArfuDXtsh6chVGi7ekLd/CoQxvFQ=
X-Received: by 2002:a19:5f0f:0:b0:549:73a8:c258 with SMTP id
 2adb3069b0e04-54d6e168ca4mr515392e87.0.1745234765451; Mon, 21 Apr 2025
 04:26:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416100515.2131853-1-khtsai@google.com> <20250419012408.x3zxum5db7iconil@synopsys.com>
In-Reply-To: <20250419012408.x3zxum5db7iconil@synopsys.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Mon, 21 Apr 2025 19:25:37 +0800
X-Gm-Features: ATxdqUFlg1rMsWTAwoJOmoAmk_rGgxuPXSGtKm4qaRrSNgRpxrJoYCc9QRhljnU
Message-ID: <CAKzKK0qCag3STZUqaX5Povu0Mzh5Ntfew5RW64dTtHVcVPELYQ@mail.gmail.com>
Subject: Re: [PATCH v4] usb: dwc3: Abort suspend on soft disconnect failure
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 9:24=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Wed, Apr 16, 2025, Kuen-Han Tsai wrote:
> > When dwc3_gadget_soft_disconnect() fails, dwc3_suspend_common() keeps
> > going with the suspend, resulting in a period where the power domain is
> > off, but the gadget driver remains connected.  Within this time frame,
> > invoking vbus_event_work() will cause an error as it attempts to access
> > DWC3 registers for endpoint disabling after the power domain has been
> > completely shut down.
> >
> > Abort the suspend sequence when dwc3_gadget_suspend() cannot halt the
> > controller and proceeds with a soft connect.
> >
> > Fixes: 9f8a67b65a49 ("usb: dwc3: gadget: fix gadget suspend/resume")
> > CC: stable@vger.kernel.org
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> > ---
> >
> > Kernel panic - not syncing: Asynchronous SError Interrupt
> > Workqueue: events vbus_event_work
> > Call trace:
> >  dump_backtrace+0xf4/0x118
> >  show_stack+0x18/0x24
> >  dump_stack_lvl+0x60/0x7c
> >  dump_stack+0x18/0x3c
> >  panic+0x16c/0x390
> >  nmi_panic+0xa4/0xa8
> >  arm64_serror_panic+0x6c/0x94
> >  do_serror+0xc4/0xd0
> >  el1h_64_error_handler+0x34/0x48
> >  el1h_64_error+0x68/0x6c
> >  readl+0x4c/0x8c
> >  __dwc3_gadget_ep_disable+0x48/0x230
> >  dwc3_gadget_ep_disable+0x50/0xc0
> >  usb_ep_disable+0x44/0xe4
> >  ffs_func_eps_disable+0x64/0xc8
> >  ffs_func_set_alt+0x74/0x368
> >  ffs_func_disable+0x18/0x28
> >  composite_disconnect+0x90/0xec
> >  configfs_composite_disconnect+0x64/0x88
> >  usb_gadget_disconnect_locked+0xc0/0x168
> >  vbus_event_work+0x3c/0x58
> >  process_one_work+0x1e4/0x43c
> >  worker_thread+0x25c/0x430
> >  kthread+0x104/0x1d4
> >  ret_from_fork+0x10/0x20
> >
> > ---
> > Changelog:
> >
> > v4:
> > - correct the mistake where semicolon was forgotten
> > - return -EAGAIN upon dwc3_gadget_suspend() failure
> >
> > v3:
> > - change the Fixes tag
> >
> > v2:
> > - move declarations in separate lines
> > - add the Fixes tag
> >
> > ---
> >  drivers/usb/dwc3/core.c   |  9 +++++++--
> >  drivers/usb/dwc3/gadget.c | 22 +++++++++-------------
> >  2 files changed, 16 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index 66a08b527165..f36bc933c55b 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -2388,6 +2388,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, =
pm_message_t msg)
> >  {
> >       u32 reg;
> >       int i;
> > +     int ret;
> >
> >       if (!pm_runtime_suspended(dwc->dev) && !PMSG_IS_AUTO(msg)) {
> >               dwc->susphy_state =3D (dwc3_readl(dwc->regs, DWC3_GUSB2PH=
YCFG(0)) &
> > @@ -2406,7 +2407,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, =
pm_message_t msg)
> >       case DWC3_GCTL_PRTCAP_DEVICE:
> >               if (pm_runtime_suspended(dwc->dev))
> >                       break;
> > -             dwc3_gadget_suspend(dwc);
> > +             ret =3D dwc3_gadget_suspend(dwc);
> > +             if (ret)
> > +                     return ret;
> >               synchronize_irq(dwc->irq_gadget);
> >               dwc3_core_exit(dwc);
> >               break;
> > @@ -2441,7 +2444,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, =
pm_message_t msg)
> >                       break;
> >
> >               if (dwc->current_otg_role =3D=3D DWC3_OTG_ROLE_DEVICE) {
> > -                     dwc3_gadget_suspend(dwc);
> > +                     ret =3D dwc3_gadget_suspend(dwc);
> > +                     if (ret)
> > +                             return ret;
> >                       synchronize_irq(dwc->irq_gadget);
> >               }
> >
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index 89a4dc8ebf94..630fd5f0ce97 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -4776,26 +4776,22 @@ int dwc3_gadget_suspend(struct dwc3 *dwc)
> >       int ret;
> >
> >       ret =3D dwc3_gadget_soft_disconnect(dwc);
> > -     if (ret)
> > -             goto err;
> > -
> > -     spin_lock_irqsave(&dwc->lock, flags);
> > -     if (dwc->gadget_driver)
> > -             dwc3_disconnect_gadget(dwc);
> > -     spin_unlock_irqrestore(&dwc->lock, flags);
> > -
> > -     return 0;
> > -
> > -err:
> >       /*
> >        * Attempt to reset the controller's state. Likely no
> >        * communication can be established until the host
> >        * performs a port reset.
> >        */
> > -     if (dwc->softconnect)
> > +     if (ret && dwc->softconnect) {
> >               dwc3_gadget_soft_connect(dwc);
> > +             return -EAGAIN;
>
> This may make sense to have -EAGAIN for runtime suspend. I supposed this
> should be fine for system suspend since it doesn't do anything special
> for this error code.
>
> When you tested runtime suspend, did you observe that the device
> successfully going into suspend on retry?

Hi Thinh,

Yes, the dwc3 device can be suspended using either
pm_runtime_suspend() or dwc3_gadget_pullup(), the latter of which
ultimately invokes pm_runtime_put().

One question: Do you know how to naturally cause a run stop failure?
Based on the spec, the controller cannot halt until the event buffer
becomes empty. If the driver doesn't acknowledge the events, this
should lead to the run stop failure. However, since I cannot naturally
reproduce this problem, I am simulating this scenario by modifying
dwc3_gadget_run_stop() to return a timeout error directly.

Regards,
Kuen-Han


>
> In any case, I think this should be good. Thanks for the fix:
>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>
> Thanks,
> Thinh
>
> > +     }
> >
> > -     return ret;
> > +     spin_lock_irqsave(&dwc->lock, flags);
> > +     if (dwc->gadget_driver)
> > +             dwc3_disconnect_gadget(dwc);
> > +     spin_unlock_irqrestore(&dwc->lock, flags);
> > +
> > +     return 0;
> >  }
> >
> >  int dwc3_gadget_resume(struct dwc3 *dwc)
> > --
> > 2.49.0.604.gff1f9ca942-goog
> >


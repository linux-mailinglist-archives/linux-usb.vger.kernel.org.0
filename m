Return-Path: <linux-usb+bounces-22030-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB3FA6D352
	for <lists+linux-usb@lfdr.de>; Mon, 24 Mar 2025 04:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5945616DEA8
	for <lists+linux-usb@lfdr.de>; Mon, 24 Mar 2025 03:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78050176AA1;
	Mon, 24 Mar 2025 03:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cd9aa4K6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBB779F5
	for <linux-usb@vger.kernel.org>; Mon, 24 Mar 2025 03:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742786737; cv=none; b=hyZTL9ZA1cu5YTu/fXsejCFoDMqWI56YLTq6J0uKJsdjZrT84TbVTIkdx5Uxyt7etMScOZUt9nQZtUPEQb4c/UDJvHX80h+MVTnM9/AEJcwN/LeY1Zaqv2ZaiUMJaGYvxDhC6H5zr7JgRoCx+8C0nskMq2Vc5EllcOWrlKJpkXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742786737; c=relaxed/simple;
	bh=2RsNrHBPeiTV/KGoBuTX4+LkDKeG1yy/Gh87Th+pOyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUKMkilX9dIR09JZsNkkM2Akr7Nb0QFDPNZGmPgYU2Gr61D62dtHtbhGME+jbuEssErNvBGnOxW+RKLJPrsLbnkygki3w2rI2MljBFrwF+1CTA8cqtvZQxeLlopltCns0vrI3ikeyYDLLKPaOEncwrDk9N1UNJoocny8SzjZHCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cd9aa4K6; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5498c5728aeso5724e87.0
        for <linux-usb@vger.kernel.org>; Sun, 23 Mar 2025 20:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742786733; x=1743391533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93QQCUzi6u14I2syzV0j3AvYvvOWRX6mB9orIqjNnIs=;
        b=cd9aa4K6E6DrJlNTSTy+QSYIBDjx+WwsXym938jeAwaRGOe7+eCFG7ZpqUKgqwjpaL
         inG24+aepceR3V/5PLs0Ot9d3CGQGVjvC4z5y2yxUx0L1pmPEBWaN2riZvCj/s6WA52Z
         JJ/nV3qk6Ms8zRwkQYSUsLr6RVkEBf2IeqPZAkBn0f3BVSYzEwP/Bl7OhdqvFiV6xNrs
         VyzjXGZTBFfGSRACRMcvQ9McOnRsKIATYU4xw2sC+dpm8MyXP2Ee7Tsr8+E8miWzNTFp
         FjGFqxUx2I4o4T81ueSExArr/nvXUJcTTRYGVSYF/7n7jLzvA2/3UkSw0TP8C0dj0Lrx
         XqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742786733; x=1743391533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93QQCUzi6u14I2syzV0j3AvYvvOWRX6mB9orIqjNnIs=;
        b=RrB/14epQ9fRX6u1MJbFS9ppXKEmbHeIxVtNLJbr1mbb4NxDt126cJtJEutWxi1IHE
         2/XGJoUzlnyfu/Qfiel7+3DGqnOPuHzN8mVcLXTLX1tUKsgnthVvDMOhAwD4wm9jK1XD
         8jUccNOenwjFkWqyt+AgARIt8jvx9cy2riwi5xsebX2cA793GyHFqb1mjAk3DFPh5ls9
         yB8sM/u6ZdxDYx0uPbAUoOHYBcrJuV3FHldTsCnA6LEgOVUKGh4hgrJlRBfjPFRAhZkH
         V3As7ML+87Tnw+zbxl/D9w2WeAx3nQ2BkhOwHIDWMuaOi46Z1De3w66T+dsOqZXb9ZGw
         ENNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Bxk/hW3JYfWx1Xmq1BFuDldtLyI6S/m3Ln4IBXTpTn5CdZd5VpiEZOS0pjR7OHSYh64v1MtM2ug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqlg2C52KD/k40FXOvBkqX1479b+YE70dP5JY0eajh0nYjEDQP
	ASR0/eTl+NDba0WeXB/qGJBY1E6yRXdSDZlQKwDayWlJM49dBa4mcdj1nge5Sk3UsoxBmAkNcVu
	FZ+3MAcTP0QqYQJukcdGNdmDk9LYPLOIMF81c
X-Gm-Gg: ASbGncvNMPAj8S/ui6WW8dHLAxcIcqgtRPBcQCA0UlZ/f50tuY4JsnlthFbnOvvDKXp
	rv1gUj48lOZzICAo/X2SlVCGApikXFRlyLsnBReUAXuJPC03nVT23brJGdYMxH/UL/Zopzfc1GA
	RD0MCd8MGurDkkbxEd9NzuCboapzS5pyqPPIx4l88osdkeuygo0vwo
X-Google-Smtp-Source: AGHT+IFyLONDsmo4q+s/Se+asT70Fizp6jQ0wtmTB8UY4hyRCcY4MwRiME7C7lDD3pd9NG8mZH/C3OyNJ5NWWIzys4Q=
X-Received: by 2002:ac2:4c39:0:b0:549:4bc4:d3f7 with SMTP id
 2adb3069b0e04-54adef08baemr145746e87.5.1742786732985; Sun, 23 Mar 2025
 20:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320135734.3778611-1-khtsai@google.com> <20250321220346.wwt3vfwmrcq3qwzj@synopsys.com>
In-Reply-To: <20250321220346.wwt3vfwmrcq3qwzj@synopsys.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Mon, 24 Mar 2025 11:25:06 +0800
X-Gm-Features: AQ5f1Jqct093Fmcmrd_6vJLJFARrA4kA9RxtRRr-REHnftM_9zxYRo89GNiEeME
Message-ID: <CAKzKK0o__XbUhbFAn-uh-r-dLDCVOUr4JDYGDYnM2K0v_FrWPw@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: Abort suspend on soft disconnect failure
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2025 at 6:03=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Thu, Mar 20, 2025, Kuen-Han Tsai wrote:
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
> > CC: stable@vger.kernel.org
>
> Please add Fixes tag.

Sent out v2 version of the patch.
https://lore.kernel.org/linux-usb/20250324031758.865242-1-khtsai@google.com=
/

>
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
> >  drivers/usb/dwc3/core.c   | 10 +++++++---
> >  drivers/usb/dwc3/gadget.c | 22 +++++++++-------------
> >  2 files changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index 66a08b527165..d64d17677bdb 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -2387,7 +2387,7 @@ static int dwc3_core_init_for_resume(struct dwc3 =
*dwc)
> >  static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> >  {
> >       u32 reg;
> > -     int i;
> > +     int i, ret;
>
> Minor nit: Can we keep declarations in separate lines.

Fixed.

>
> >
> >       if (!pm_runtime_suspended(dwc->dev) && !PMSG_IS_AUTO(msg)) {
> >               dwc->susphy_state =3D (dwc3_readl(dwc->regs, DWC3_GUSB2PH=
YCFG(0)) &
> > @@ -2406,7 +2406,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, =
pm_message_t msg)
> >       case DWC3_GCTL_PRTCAP_DEVICE:
> >               if (pm_runtime_suspended(dwc->dev))
> >                       break;
> > -             dwc3_gadget_suspend(dwc);
> > +             ret =3D dwc3_gadget_suspend(dwc);
> > +             if (ret)
> > +                     return ret
> >               synchronize_irq(dwc->irq_gadget);
> >               dwc3_core_exit(dwc);
> >               break;
> > @@ -2441,7 +2443,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, =
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
> > index 89a4dc8ebf94..316c1589618e 100644
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
> > +             return ret;
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
> > 2.49.0.395.g12beb8f557-goog
> >
>
> The rest looks good.
>
> Thanks,
> Thinh

Thanks,
Kuen-Han


Return-Path: <linux-usb+bounces-22231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE446A73379
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 14:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF0033B82FF
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 13:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9821B215791;
	Thu, 27 Mar 2025 13:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oIuTPQr4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C5C21516D
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 13:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743082697; cv=none; b=mYoAx+nrgL3l2iAsH5glYK7jiq5HLRi1hU6+jsQ/F20rJRpDy6TOz4QcAPmsChZ4O71MNXzj+Cn+ePDsUUEas1VpC0P5DH1mE+mLpfVtLanUqdAw7Cw2j24DaCUnLOQwnfEmDCBlkMW3JC95Be886r1Ow5sJUtPpLvqfby9xhpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743082697; c=relaxed/simple;
	bh=kIIRNRsBasgXeAvgGmKLFKBXnbMcQtaA2EQf2AEY3So=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jk0ImA3h4iLda2LKBBZAbOlbPpgoCNpn4/SMCZP2hx4+W/4w7dfrG5MejeM+HkES3p+bWpZT79/ViM1aJYu0pUeFADgWFxW+RKlpZmYqO6xaU2kbaf+orcMNEtz0I/X/HVlnTr6tG8gbHl9s3xRWXAhMMj/i1sH0cg8kaGhRCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oIuTPQr4; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549924bc82aso6253e87.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 06:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743082692; x=1743687492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3I6kidT8yoyCNPF/vMyXkNYcuQny2fArQtHsJ+2nUIY=;
        b=oIuTPQr4QqqFwixub5fa3X32MADwbIyqkrp0ks+mJv2UFOvoUtsvl966bTsmFehcaY
         eOtwatJiKDpi7/hlemrj/aqjiG70SkBmaGzqtSX1p2n84BUux+RRU/G2ZP2yjfZXTDy1
         zC1GW9+rI8hS4GE7ci0q0ymgzDEryOjJmTpp1I0ka8oBmlwLRYiuOM4RKFsfzpDpvHzv
         wApvvtpwOPe/uYRAZMdJUQbXMH1eIqdW7NofZ1oNHQAo/C/rdZsdb5vdXW3ni/bMG/rq
         Tz/Xzp3lYkeAXEsdpYRJSlzYH9t7lQufpzx/Vket5gwQcgnyRAvFDJCcWgG08/HT7QMM
         Uf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743082692; x=1743687492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3I6kidT8yoyCNPF/vMyXkNYcuQny2fArQtHsJ+2nUIY=;
        b=qPLfpdpC8g31kFfixoAkcuBR948DjMsiNoTvboiJU/TgT7UvuoUtgXoHj7d8zpOrme
         G7havLic37wqxLGa98nIGlYc858hLxVJi0PrZ3ptyb85b0IL0LWq0b5MWHOtRKlk60mV
         LDDr45731GBZLRDgGUYtPv2sgvKwOpqxEi80qbQz9TcGOzOqI2SNZ3FY0SjfbhtgWD6B
         7zHcDC2/GVK1mRi+3NBk3Ab52Z3J74fpT50mo5+I5IskiwCGiNHrG9oPAWzpFosKziKk
         V76ncPNPeE0nnPsMTxh/vT3X44bMXE2Dk6XLDiO+kNYEVdw9BBip0mwVmQNLC0Onuc+I
         /EVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa7EHkGF2K8pCZYuLPoQBwa84/sFrucU1m6GB5euPkkgVoKJ8xf0hoKOfOOQU7RqDdlor0Q+nYMqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9QsOcsnNF7Kad0WXCfW+EieJCPUtIGwOiUMGEduv6nnKk66Yg
	kZz6ZclS6OUAa2WqNBhd5xgrmX9JICH3D4eGzZhbNHJW13Tmp77YKOmWzp8qgje2DjQpGJ0Uzo/
	U4F42+XmvdFV62I9Eg99pYuRfAt+5GAZoBxM7
X-Gm-Gg: ASbGnct0p02djiRr2mwvhZ9gjAtKAlMiM2jhoWyn3gg7dRIW/G7aUdTriQFFqwJJyqD
	DwDzeNhjzbi5tLqLcIePNpC8YioZ8HvCGUKFkD6Rai5yVc96gG+ARmAj+BVSq5rTWbWSBjJCTJr
	/K6pseDY/Uvg7HXcPFZtEnq+ha7xM=
X-Google-Smtp-Source: AGHT+IG6DwR/h1hseW+7qTgS+WfavwNgWJNajwGW+BUDRmh8Zg28wiVit57ecvcqd2quEurKXBnbllnrF4W1FOLRxq8=
X-Received: by 2002:a05:6512:3259:b0:542:6b39:1d57 with SMTP id
 2adb3069b0e04-54b04672ef8mr130900e87.3.1743082692126; Thu, 27 Mar 2025
 06:38:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324031758.865242-1-khtsai@google.com> <20250326230111.e4jn3jy2xx2lrote@synopsys.com>
In-Reply-To: <20250326230111.e4jn3jy2xx2lrote@synopsys.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Thu, 27 Mar 2025 21:37:44 +0800
X-Gm-Features: AQ5f1Jr6Jvsxqs-qzrtxsHRpqIbJn4OSyozSZIdMsZf8d3jJM3fkvYIeG7rreZo
Message-ID: <CAKzKK0o_a+MSeatqJRXwcPLkHiakxaieMRE6q=8dcoGsA7Pmqg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: Abort suspend on soft disconnect failure
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 7:01=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Mon, Mar 24, 2025, Kuen-Han Tsai wrote:
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
> > Fixes: c8540870af4c ("usb: dwc3: gadget: Improve dwc3_gadget_suspend()
>
> Keep Fixes tag in a single line. I think this issue goes further back,
> perhaps the Fixes tag better reference here?
>
> 9f8a67b65a49 ("usb: dwc3: gadget: fix gadget suspend/resume")

Fixed! I really appreciate your patience with this and the detailed code re=
view!

Sent out the v3 patch.
https://lore.kernel.org/linux-usb/20250327133233.2566528-1-khtsai@google.co=
m/

Thanks,
Kuen-Han

>
> Thanks,
> Thinh
>
> > and dwc3_gadget_resume()")
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
> > v2:
> > - move declarations in separate lines
> > - add the Fixes tag
> >
> >  drivers/usb/dwc3/core.c   |  9 +++++++--
> >  drivers/usb/dwc3/gadget.c | 22 +++++++++-------------
> >  2 files changed, 16 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index 66a08b527165..1cf1996ae1fb 100644
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
> > +                     return ret
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


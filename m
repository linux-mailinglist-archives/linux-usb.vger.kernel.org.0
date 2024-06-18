Return-Path: <linux-usb+bounces-11408-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEBD90DF10
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 00:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AD5A1C22EF2
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 22:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9155517838C;
	Tue, 18 Jun 2024 22:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hSS+7wxc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4672F176FC5
	for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 22:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718749206; cv=none; b=KwKIDq5+E2WrcKD2nRclzwgWTvpMoBqt160WR3GPKIWjWkv4vB8LlbQOelEnhIpU89hhAEcZc6KC78VpDbc/OALCyvwtt2seKKj85j2hfcrhSbEFkiMIxZih4YV6Bp814JOWuTAlXxoEO4lPaJqsTxk3LC8/YsGg9bZyj6KPIJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718749206; c=relaxed/simple;
	bh=35h6ze1zJZ+OgWBD4gckSCnHdtaUNLMCu8GabLGhIh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nSdqBIkEDwiiV34dU0y7eaGBb+BCSZNDDtDWXnQBQ6OTOK3at9o0kNzZS6sw8FEY+qaJe0uio61hx5zUb2tCwmBT3oVHB1RDo3Fllr5C7yooImM5McbOhPfH3vN8G0fWhOJnI1mF4ZLsnceO5AnW10tM953n2d4zwMavk01whhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=hSS+7wxc; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6f1c4800easo739039466b.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 15:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1718749202; x=1719354002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMFwqDR8TJSRy7VIYztyOJK3wl/e3SP4rLA6DqZsekc=;
        b=hSS+7wxcaxfU5nG/xiaMthy1nb3vq82huLu04EwsJ7Cq8f5NsQEEgze8Zftt/Bvf9X
         7PAudpN+A7EL8bLeLW0N80hCAG60vU5rF97eX3gqG3VOq5C7X7q8HAi7I8eGbgDNStKj
         rPHqDBM9iRUeUTSu8+J+ZjOwdAQ4eZxO523jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718749202; x=1719354002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMFwqDR8TJSRy7VIYztyOJK3wl/e3SP4rLA6DqZsekc=;
        b=EKb60egdf6cHkplzy+rZSEd93n6lBJWWxHYRHjbIDNVGAmo2WB9vFhzzuEQr2igzy0
         53QK7TPwCI8y6+QfqU+IXNUgJcBVIP3WSGlYH1/xCTp4inWO3G1BO+wLNr2m+qjfMy+N
         sqNXfW3vCRvN452RraRrgugXwUo7q0EOyEX63Kcw+Y5uA0oTco7hvsX1/0TdxIH4ydCJ
         vmQZVl/iOF4tAQbPNsDXF9oiUE6vW3bc/8+JQfbodBUqH38SiSjFF60TeJdZAvU2R/9Y
         +9sfcSQ43roBnjoBkMYL2fKF6KYLRi4povN2kvx919KxnIrzgoB5s+P6u/8+L/JM4SKZ
         vLpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZibziyBkBjP4b9JZoh1faKULNP73MpO2Zb7XlKv0YBRSi26EMAmFjZAoICtjwMdDK3LwSpGMDiQG65pPx2e5dMZFddvucpbg
X-Gm-Message-State: AOJu0Yz9GDxV72mTh6KblDzSHDOEm6tFqaNHMsZTFI3nzd7grI9dQjsi
	LzUytUtVI/I/CEAiqE1cB4RQVzmUfGB72xlRp4WbRMDoBjvKEcu+2Qs6Jh48NpzC+Wbglp1BQe0
	joLUjV9QCu3ovR4fQQxOxfEP0rt18eJS6vLbpgQ==
X-Google-Smtp-Source: AGHT+IEcnwdEEzm35b0Ly3AyKEbVIyLPgApanb5AxSOTbcBB3uQd9HQSmoRkPjvhwNQrN0vYJ/7DI5//7+ZO0EQ+wHQ=
X-Received: by 2002:a17:906:ba84:b0:a6f:4c39:8aeb with SMTP id
 a640c23a62f3a-a6fab779ba8mr34922566b.50.1718749202428; Tue, 18 Jun 2024
 15:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618031918.2585799-1-Meng.Li@windriver.com> <20240618215356.hw6ar6guxbhlf5y7@synopsys.com>
In-Reply-To: <20240618215356.hw6ar6guxbhlf5y7@synopsys.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 19 Jun 2024 00:19:51 +0200
Message-ID: <CAOf5uwm82WzuqOHfBHLkursywfA8JNYp8RPPh+8K9DamVtyD=w@mail.gmail.com>
Subject: Re: [v2 PATCH] usb: dwc3: core: remove lock of otg mode during gadget
 suspend/resume to avoid deadlock
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Meng Li <Meng.Li@windriver.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"quic_uaggarwa@quicinc.com" <quic_uaggarwa@quicinc.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "xu.yang_2@nxp.com" <xu.yang_2@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jun 18, 2024 at 11:55=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsy=
s.com> wrote:
>
> On Tue, Jun 18, 2024, Meng Li wrote:
> > When config CONFIG_USB_DWC3_DUAL_ROLE is selected, and trigger system
> > to enter suspend status with below command:
> > echo mem > /sys/power/state
> > There will be a deadlock issue occurring. Detailed invoking path as
> > below:
> > dwc3_suspend_common()
> >     spin_lock_irqsave(&dwc->lock, flags);              <-- 1st
> >     dwc3_gadget_suspend(dwc);
> >         dwc3_gadget_soft_disconnect(dwc);
> >             spin_lock_irqsave(&dwc->lock, flags);      <-- 2nd


In resume path the spinlock was taken too and I see that there is a call
dwc3_gadget_soft_connect that call the dwc3_core_soft_reset that can poll
using msleep for time.  I don't know if this is a valid fix but seems
does not fix
only commit c7ebd8149ee5

Michael

> > This issue is exposed by commit c7ebd8149ee5 ("usb: dwc3: gadget: Fix
> > NULL pointer dereference in dwc3_gadget_suspend") that removes the code
> > of checking whether dwc->gadget_driver is NULL or not. It causes the
> > following code is executed and deadlock occurs when trying to get the
> > spinlock. In fact, the root cause is the commit 5265397f9442("usb: dwc3=
:
> > Remove DWC3 locking during gadget suspend/resume") that forgot to remov=
e
> > the lock of otg mode. So, remove the redundant lock of otg mode during
> > gadget suspend/resume.
> >
> > Fixes: 5265397f9442 ("usb: dwc3: Remove DWC3 locking during gadget susp=
end/resume")
> > Cc: Xu Yang <xu.yang_2@nxp.com>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Meng Li <Meng.Li@windriver.com>
> >
> > ---
> > v1->v2:
> >  - improve commit log, correct the Fixes commit id.
> >
> > ---
> >  drivers/usb/dwc3/core.c | 6 ------
> >  1 file changed, 6 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index 7ee61a89520b..9d47c3aa5777 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -2250,7 +2250,6 @@ static int dwc3_core_init_for_resume(struct dwc3 =
*dwc)
> >
> >  static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> >  {
> > -     unsigned long   flags;
> >       u32 reg;
> >       int i;
> >
> > @@ -2293,9 +2292,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, =
pm_message_t msg)
> >                       break;
> >
> >               if (dwc->current_otg_role =3D=3D DWC3_OTG_ROLE_DEVICE) {
> > -                     spin_lock_irqsave(&dwc->lock, flags);
> >                       dwc3_gadget_suspend(dwc);
> > -                     spin_unlock_irqrestore(&dwc->lock, flags);
> >                       synchronize_irq(dwc->irq_gadget);
> >               }
> >
> > @@ -2312,7 +2309,6 @@ static int dwc3_suspend_common(struct dwc3 *dwc, =
pm_message_t msg)
> >
> >  static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
> >  {
> > -     unsigned long   flags;
> >       int             ret;
> >       u32             reg;
> >       int             i;
> > @@ -2366,9 +2362,7 @@ static int dwc3_resume_common(struct dwc3 *dwc, p=
m_message_t msg)
> >               if (dwc->current_otg_role =3D=3D DWC3_OTG_ROLE_HOST) {
> >                       dwc3_otg_host_init(dwc);
> >               } else if (dwc->current_otg_role =3D=3D DWC3_OTG_ROLE_DEV=
ICE) {
> > -                     spin_lock_irqsave(&dwc->lock, flags);
> >                       dwc3_gadget_resume(dwc);
> > -                     spin_unlock_irqrestore(&dwc->lock, flags);
> >               }
> >
> >               break;
> > --
> > 2.34.1
> >
>
> Did you use "git format-patch -v"? The $subject version prefix order is
> different. In any case,
>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>
> Thanks,
> Thinh


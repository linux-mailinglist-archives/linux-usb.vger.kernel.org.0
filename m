Return-Path: <linux-usb+bounces-11410-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8799590DF77
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 00:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 224DF1F22596
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 22:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5840D181CE9;
	Tue, 18 Jun 2024 22:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DMDyEiz/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E24B16D9A0
	for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 22:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718751340; cv=none; b=XhSbChBrI/cAH0gL9UZbK3C+AnKRV49z7Fdk9B/bNx6auMtJBZqi5jUD44xQ3wdyAM81X2AKW7hFtGy+H9A5eiBzyX4rx+1pBHIeW28SVRmBpaR7YprK+mNBHTsvVc4ipohOgc6p0011xyHHhxIXzE+IwnZ9hzoNG0N1+gXK5Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718751340; c=relaxed/simple;
	bh=D1tRdAKZDqpLuUq/sWIz8ql07/BTm6xKt3Z9oAMp6iM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5vAW99bxOjVcjjn52fd5OZGh4+z7tmAOG/NT/gCc3y2dQmNZq/ONnJSaJM4NEyRZWgmY6CuKxtHoMM+WfUu9pFHNdFQdazGSJuxtHOf9P2Sq1wnfGbTIRkzSOjc4UdAe1PURGzYvW4/bJVP4aUHFBGMPxM1fDJDiYHs++OkFNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=DMDyEiz/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a63359aaacaso943055666b.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 15:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1718751337; x=1719356137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJD/E9Ovg/cSnjv8KM9svPbnQ7kNxbwBE/45ubiQqZY=;
        b=DMDyEiz/VrlgWSNda+uuXuVMdbGDmKl3dRhdp1pK0mfhjuzhH+kn+UC3rK1UB+8jVk
         WBAt3Wo1HsGhBd0yWekaXSOGrs2Grih3OjAGyLc7EN1ASpOsk/hW3DnZ6l17eYjBEwfV
         kYBTGmzHQsNWxrWl6xD1EtbLdZWeg3QKTPqJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718751337; x=1719356137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJD/E9Ovg/cSnjv8KM9svPbnQ7kNxbwBE/45ubiQqZY=;
        b=FCrxYzGwpBsVjYF6W4ZoWM/MTd0PhjxKqhfbpFobPS1c6A3VHhJmpoeuNXC0aviaNK
         1BoMurUUu+t9GGiZWlvOrNTF962w/acjFaq13YmdhN1sN+VIl+DmYZ6XJqxGij6a9i7w
         MTi8wz0IEEtE7d4XzHDU1192PXiFRxNSsxrbBvJF8xTPmil+tsCt+9vud2UQZeOJ8AvA
         R3l9QmVEjtx5C+hQ5p5vMd60XVxs4QvrgJFHSwo+rxNW3xESMlaraDFC9IihWcCZ+ntw
         4I3jV8fJYKBL8o1OwDNxRUbb64m6lgoBzkwWRUgzYGN+UJ8QXmEVOEmYjLXPgQM7d1oo
         VwXg==
X-Forwarded-Encrypted: i=1; AJvYcCXQq0Hr5nXHJRdRS4dLhRKCQQArVSlnq9YJC5q+9G3iBB++Y/tSLkTEmWwJZKeHZIogZZvPs66OGEVqtqbbs1V7Kn+WUdtGJe9d
X-Gm-Message-State: AOJu0YwuUqylbPhyDshzfMr+8IfHDb2sHEPAthAOSz19WQNtdt4z7Nwu
	eCGD2ZlpAyRNHmFKfsuOQn2BGCP8xQe7MfW8obToYkWImD9nFKds1RMdZmxZoElMPbxJdXPLFSk
	8UIH7TUi6U5oF+xm/KHPJouNorMW9bj7srr3oxg==
X-Google-Smtp-Source: AGHT+IFgVInZzKQHDm8TqVJvHRVFbJx5zk2+BBDPwSSrB8G1I/mg5O2bHMbqVD/wDllu9jb7tOh1KNGeONCG7UePAi0=
X-Received: by 2002:a17:906:13d8:b0:a6f:4dfc:5f31 with SMTP id
 a640c23a62f3a-a6fab7d0af8mr38727266b.73.1718751337307; Tue, 18 Jun 2024
 15:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618031918.2585799-1-Meng.Li@windriver.com>
 <20240618215356.hw6ar6guxbhlf5y7@synopsys.com> <CAOf5uwm82WzuqOHfBHLkursywfA8JNYp8RPPh+8K9DamVtyD=w@mail.gmail.com>
 <20240618224211.peey3dhfa2qvhpef@synopsys.com>
In-Reply-To: <20240618224211.peey3dhfa2qvhpef@synopsys.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 19 Jun 2024 00:55:25 +0200
Message-ID: <CAOf5uw=pmKOgA1ct766Q-F6c4P21bNV-i_acEisxO9gxg0gQDA@mail.gmail.com>
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

On Wed, Jun 19, 2024 at 12:42=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsy=
s.com> wrote:
>
> Hi,
>
> On Wed, Jun 19, 2024, Michael Nazzareno Trimarchi wrote:
> > Hi
> >
> > On Tue, Jun 18, 2024 at 11:55=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@syn=
opsys.com> wrote:
> > >
> > > On Tue, Jun 18, 2024, Meng Li wrote:
> > > > When config CONFIG_USB_DWC3_DUAL_ROLE is selected, and trigger syst=
em
> > > > to enter suspend status with below command:
> > > > echo mem > /sys/power/state
> > > > There will be a deadlock issue occurring. Detailed invoking path as
> > > > below:
> > > > dwc3_suspend_common()
> > > >     spin_lock_irqsave(&dwc->lock, flags);              <-- 1st
> > > >     dwc3_gadget_suspend(dwc);
> > > >         dwc3_gadget_soft_disconnect(dwc);
> > > >             spin_lock_irqsave(&dwc->lock, flags);      <-- 2nd
> >
> >
> > In resume path the spinlock was taken too and I see that there is a cal=
l
> > dwc3_gadget_soft_connect that call the dwc3_core_soft_reset that can po=
ll
> > using msleep for time.  I don't know if this is a valid fix but seems
> > does not fix
> > only commit c7ebd8149ee5
> >
>
> Meng did take the resume path into account. Can you clarify what you
> meant with "does not fix only commit c7ebd8149ee5"?

I have seen that is suppose to fix something introduced by that commit
but I think
that resume path was already broken before

spinlock_irqsave()
dwc3_gadget_resume -> dwc3_gadget_soft_connect -> dwc3_core_soft_reset
(can sleep)

Michael
>
> Thanks,
> Thinh
>
> >
> > > > This issue is exposed by commit c7ebd8149ee5 ("usb: dwc3: gadget: F=
ix
> > > > NULL pointer dereference in dwc3_gadget_suspend") that removes the =
code
> > > > of checking whether dwc->gadget_driver is NULL or not. It causes th=
e
> > > > following code is executed and deadlock occurs when trying to get t=
he
> > > > spinlock. In fact, the root cause is the commit 5265397f9442("usb: =
dwc3:
> > > > Remove DWC3 locking during gadget suspend/resume") that forgot to r=
emove
> > > > the lock of otg mode. So, remove the redundant lock of otg mode dur=
ing
> > > > gadget suspend/resume.
> > > >
> > > > Fixes: 5265397f9442 ("usb: dwc3: Remove DWC3 locking during gadget =
suspend/resume")
> > > > Cc: Xu Yang <xu.yang_2@nxp.com>
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Meng Li <Meng.Li@windriver.com>
> > > >
> > > > ---
> > > > v1->v2:
> > > >  - improve commit log, correct the Fixes commit id.
> > > >
> > > > ---
> > > >  drivers/usb/dwc3/core.c | 6 ------
> > > >  1 file changed, 6 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > > > index 7ee61a89520b..9d47c3aa5777 100644
> > > > --- a/drivers/usb/dwc3/core.c
> > > > +++ b/drivers/usb/dwc3/core.c
> > > > @@ -2250,7 +2250,6 @@ static int dwc3_core_init_for_resume(struct d=
wc3 *dwc)
> > > >
> > > >  static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> > > >  {
> > > > -     unsigned long   flags;
> > > >       u32 reg;
> > > >       int i;
> > > >
> > > > @@ -2293,9 +2292,7 @@ static int dwc3_suspend_common(struct dwc3 *d=
wc, pm_message_t msg)
> > > >                       break;
> > > >
> > > >               if (dwc->current_otg_role =3D=3D DWC3_OTG_ROLE_DEVICE=
) {
> > > > -                     spin_lock_irqsave(&dwc->lock, flags);
> > > >                       dwc3_gadget_suspend(dwc);
> > > > -                     spin_unlock_irqrestore(&dwc->lock, flags);
> > > >                       synchronize_irq(dwc->irq_gadget);
> > > >               }
> > > >
> > > > @@ -2312,7 +2309,6 @@ static int dwc3_suspend_common(struct dwc3 *d=
wc, pm_message_t msg)
> > > >
> > > >  static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
> > > >  {
> > > > -     unsigned long   flags;
> > > >       int             ret;
> > > >       u32             reg;
> > > >       int             i;
> > > > @@ -2366,9 +2362,7 @@ static int dwc3_resume_common(struct dwc3 *dw=
c, pm_message_t msg)
> > > >               if (dwc->current_otg_role =3D=3D DWC3_OTG_ROLE_HOST) =
{
> > > >                       dwc3_otg_host_init(dwc);
> > > >               } else if (dwc->current_otg_role =3D=3D DWC3_OTG_ROLE=
_DEVICE) {
> > > > -                     spin_lock_irqsave(&dwc->lock, flags);
> > > >                       dwc3_gadget_resume(dwc);
> > > > -                     spin_unlock_irqrestore(&dwc->lock, flags);
> > > >               }
> > > >
> > > >               break;
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > Did you use "git format-patch -v"? The $subject version prefix order =
is
> > > different. In any case,
> > >
> > > Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > >
> > > Thanks,
> > > Thinh



--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com


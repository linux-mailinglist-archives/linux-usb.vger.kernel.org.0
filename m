Return-Path: <linux-usb+bounces-18959-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 690BCA00B44
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2025 16:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B14811883C2F
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2025 15:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94761FA8E9;
	Fri,  3 Jan 2025 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8Fjf//j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785AB11CA0;
	Fri,  3 Jan 2025 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735917496; cv=none; b=fYurEi5kpAADQ6DXKSnBAT1vAL1lfQdjRNesFumu0p0RC2oRdXL5Ggy5e86lSSsYr8T206GN8XMsMLzkJquNbvdlY4YRO3+nqvZvhoRpl3AoSC2WnV59fIYwmR5g0db50RT+XAx3QdM2nFkj8foQH+QAc6sHxCpSzfKThz1fv68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735917496; c=relaxed/simple;
	bh=WZwc83IUvK2gOPjeDNV+6n+heEOQ3nLuhlJu2FehhZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWci1z1M/gw1PqDDDFLvfqkb6Im7qgvm4ufTTE3SgxdyQTbHLRNhcHEmS5t6IicmblnmTkGK+xrAqwQDWhhw4p+KFf+SCDYsYs7y1WazT3S71vGCxtze4Xq19KmUxTSkV/ZjuZ6pVoKvUzJ7bHUoSqaYuRl0sxIFfdE/vWRhw28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8Fjf//j; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436a39e4891so33757295e9.1;
        Fri, 03 Jan 2025 07:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735917493; x=1736522293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttOXOVgGg1mkNlgpRrO1bpYUhrH7wmqSfYY8pH6ZaU0=;
        b=I8Fjf//jKaUEU9A3H8IqjI14KnQDdBcpX581f/yQ9E9NOLmEoONfLptDbRTvxv/Q27
         jKF/4QXdimR6CNJ0NKpouYtR/eNHLdkFwxP4nRHS7/565K4imBJ1+8EO6Bkciv6y6jlW
         x3kL5kyDY41g9g4CQfuGXt97jnwyKPPeU3cnIga6HFGlBxAm++uoG8IT7ib0h+Ei7VA2
         nvqmQDbYHCZ9JQjoKQVZWulUKTGBpVl+ACv2zq/blcdL/agPl9/rRfGT/lzopiusmWAM
         tkiQAkPk0TW6YbakKJDNubgBArqorieVYePgIUl3ucGOzAM++YTizJz7LE9GiC6FUT2W
         bn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735917493; x=1736522293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttOXOVgGg1mkNlgpRrO1bpYUhrH7wmqSfYY8pH6ZaU0=;
        b=vIuVGEBrP7/eiUy9Su8snIWuWb5+2zu4cZwaBeH8l4Wy+sHL8824qXgiVX0sEgfWQT
         Z1gk11f5qrVmCmgDy9Ee7hyZewtRnRLG1iqyf+qH4MiA1hCrODtemJ8v55p6JlAHLhvQ
         YhCEQYtvXm6Db+xHs0sGicZEcu/eYp7dEnKPTxN+hBQriLhkDAf5AUjiTwkN6ysmuO3w
         RGARdHJMZCLd4FjHlrWZB32wsOrU1u1pGrKaaW/dU6X/uNT+jyR05B8tRhdXIzfg/+l7
         Qw/TVFaXnT4vh+3tU+6W/UPnv8M/M/4Uj0ooGQ2E4icblaYguHLcQzELhon25h4Dia9w
         Gzwg==
X-Forwarded-Encrypted: i=1; AJvYcCURkghRUmUcM7kTc1WD90Hnf0Ui5s/DxX8Fhn8hOHhl7XuDg9I/oNOv0cJ60wCYa6342hnukW7jXhUo498=@vger.kernel.org, AJvYcCVVrVdi8AKekfKgW007oIyFD/RwCFOdo9VhI18r8dxPcSR0HMj5f27Dqd9XT7aaHUOaSMWKvSXkHJqA@vger.kernel.org
X-Gm-Message-State: AOJu0YwMWCchKW5C/SPdqBSZK+7KDi0wRKHfBfa3tA1kgvE+lasRzghC
	F/h6HWjC6I2A+HZgZ05CVSZAHcKH+DxD6eWBu89mu2v5iuR9NcKBlCAYaCplcqvuYVKw+0LCKf7
	o6csWbNx+PwqCjPkjsiJzfOCFdss=
X-Gm-Gg: ASbGnct8CgSppq7tfxhvdPyBVBn3T03ZRyF6HfhDsEpjdugaUpNGtACFG/nmZk5V6tC
	LojNf5a4ptcFC6HZa35oMFgMGmY+LP1/uU6gx8Q==
X-Google-Smtp-Source: AGHT+IHACpLQg7BbF2wtRHOvi1CU8BldWFRKe5fKLX3Rx5DrbUiLxO3nvFcriJd++jV6n8CjKSHrPoxsYFKzswwkVFw=
X-Received: by 2002:a05:6000:2ae:b0:385:f560:7911 with SMTP id
 ffacd0b85a97d-38a221f300cmr43372894f8f.10.1735917492583; Fri, 03 Jan 2025
 07:18:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231161539.20192-1-xndchn@gmail.com> <20241231161539.20192-2-xndchn@gmail.com>
 <5ad65964-dcf7-47d2-8e5f-bf82066e55f4@linuxfoundation.org>
In-Reply-To: <5ad65964-dcf7-47d2-8e5f-bf82066e55f4@linuxfoundation.org>
From: xndcn <xndchn@gmail.com>
Date: Fri, 3 Jan 2025 23:18:01 +0800
Message-ID: <CAJ=gGT3pAnKUCve1OV5SXVArz6HUdizu9wjM5tPJ_CrQ=sF=nw@mail.gmail.com>
Subject: Re: [PATCH 1/2] usbip: Fix seqnum sign extension issue in vhci_tx_urb
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:USB OVER IP DRIVER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks.

> How did you find the problem?
> Why does it make sense to cast it to u32?

After running with usbip enough time, I happened to see logs like this:
> [ 293.863125] vhci_hcd vhci_hcd.0: Device attached
> [ 294.081110] usb 1-1: new high-speed USB device number 2 using vhci_hcd
> [ 294.193163] usb 1-1: SetAddress Request (2) to port 0
> [ 294.204334] vhci_hcd: cannot find a urb of seqnum 2147483648 max seqnum=
 -2147483648
> [ 294.204850] vhci_hcd: stop threads
> [ 294.204851] vhci_hcd: release socket
> [ 294.204853] vhci_hcd: disconnect device

Then I notice that on 64bit platform, when
atomic_inc_return(&vhci_hcd->seqnum) returns (2147483647 + 1, or
0x80000000),
priv->seqnum (which is unsigned long, i.e. u64 on 64bit) will be
extends to 0xffffffff80000000
So we can fix the issue by cast it to u32.

On Fri, Jan 3, 2025 at 6:06=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.or=
g> wrote:
>
> On 12/31/24 09:15, Xiong Nandi wrote:
> > The atomic_inc_return function returns an int, while priv->seqnum is an
> > unsigned long. So we must cast the result to u32 to prevent potential
> > sign extension and size mismatch issues.
> >
>
> How did you find the problem?
> > Signed-off-by: Xiong Nandi <xndchn@gmail.com>
> > ---
> >   drivers/usb/usbip/vhci_hcd.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.=
c
> > index b03e5021c25b..f3f260e01791 100644
> > --- a/drivers/usb/usbip/vhci_hcd.c
> > +++ b/drivers/usb/usbip/vhci_hcd.c
> > @@ -675,7 +675,7 @@ static void vhci_tx_urb(struct urb *urb, struct vhc=
i_device *vdev)
> >
> >       spin_lock_irqsave(&vdev->priv_lock, flags);
> >
> > -     priv->seqnum =3D atomic_inc_return(&vhci_hcd->seqnum);
> > +     priv->seqnum =3D (u32)atomic_inc_return(&vhci_hcd->seqnum);
>
> Why does it make sense to cast it to u32?
>
> >       if (priv->seqnum =3D=3D 0xffff)
> >               dev_info(&urb->dev->dev, "seqnum max\n");
>
>
> thanks,
> -- Shuah


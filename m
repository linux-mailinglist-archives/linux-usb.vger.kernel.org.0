Return-Path: <linux-usb+bounces-12019-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 470A4928700
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2024 12:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 719FE1C220FE
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2024 10:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4334F144D0E;
	Fri,  5 Jul 2024 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SDdrtNMW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F064B13C8F9
	for <linux-usb@vger.kernel.org>; Fri,  5 Jul 2024 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720176241; cv=none; b=dROS1z4sTZlA7LlSGKzLwsnHCUrga9p1K5+3QbCyjIdo35/4yGxAg/E05cd5Dt8nrPKF7Um2kg6UPitJiq5ThklQAQ2eBF2J0W3zbYwqNdC/jJcv7PAXKjMePAesEBFfar37n3352vXPs0qXQZ4QIz1xKOVTkOw1zqEOC29o6oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720176241; c=relaxed/simple;
	bh=ljzA3N6wt7rcICUMsNWVDlzWEFK3z0y5N2ESrfl+Tsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/xVTc+tI6Dx2pPJb0XK4FYxMZ3GW97VfeAPhGNSdQoy4YnsA2JEuzbJiPy0Orc0WH/i3BRMfffYBK0zOcrhMf1Smfo0DD9qffomQy4BR55ad0LuaYOFg0VaGb5LiJLJsC0SuMqAWM5jJeCHUW40U7jilD0jq6vvU9b8urjiQS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SDdrtNMW; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ea2ce7abaso1447958e87.0
        for <linux-usb@vger.kernel.org>; Fri, 05 Jul 2024 03:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720176238; x=1720781038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgBAlOC3VbLiSmieUmjaxIeAZ1/JlUdjNUoF6VvNn0c=;
        b=SDdrtNMWqVVZRs5cQhbufG4iNOV0Z4ZYquYhA5Ga5mb83WqM50hGNXud4RerVYDbid
         pAierXdoMbG6cPH99dl5GgyHx1Gq8qYuuXcOFogm0HRvLGQRVyNaZFfE1JSVX3EBtgFR
         euy0/LOA9uKNJ/sznXHrYDjNO1F8YPrOylh0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720176238; x=1720781038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgBAlOC3VbLiSmieUmjaxIeAZ1/JlUdjNUoF6VvNn0c=;
        b=ad6B1Jgp25AugDaChoWf4n/FmaEj1X5u9dh9BZL6wJK/M1gHuBduCeX+lQuUm4ZEDk
         RrvuvzfSEMm9FvqLpd6vJnCWXnN0lyMJPTGE+HokucZXuc3BzK5GjIGK9m25ANRgjgOB
         pLwKvUg6pEhT8R481/wLa+Bq90JaBaG/9+GRjYkc3A//rtNPHBx1zqxWRqw04XSWuXUA
         VqENhsxax/L1eFQaojI7JDmd8KJTe/vjaTFNFvNQc/rEanxAsjIeB3ABet1Mw0cvMHFP
         mKq6dP7RuDJpDEKTKyFeOnvxo+XGGGQOWj1pFSePDT3wVKMsT3bAnrUjLRfnWVaUaRbt
         ir2A==
X-Forwarded-Encrypted: i=1; AJvYcCVw+1A94K6lLmJ0L7V7MQz7z4PnxbLNS0pB4QPmCfVVMxN8UKt+wWtiBKlyGfzkwN7CPZjQ4uPQ/76wDK6Nwm+oEZDYqI6GUePw
X-Gm-Message-State: AOJu0Yy1ZNLSdaOZVJFZitFeBzh6IQlWu+O5n3TfI5XSVCm5zOBd2Dtm
	45cFga9Mh9H1fJsfTE52TZusfKorGHQxka5lMZQXc1tpKiQWp7kvUfBfIla9prMEudqbGpInm6u
	XCAA6GEnRkCu2H62r2iryZbkK89o+J2lhQMw=
X-Google-Smtp-Source: AGHT+IGpMJ5mvHM5xAeZkXRESMux+cA04BWcw60nKPoDLkrKWQKziZ2J5vIXeRiucNA9qGPO5AFG5Fn8MZa1DGKtctI=
X-Received: by 2002:a19:380b:0:b0:52e:9cf1:a2ae with SMTP id
 2adb3069b0e04-52ea06b0ea3mr2781621e87.51.1720176237937; Fri, 05 Jul 2024
 03:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240705091902.789643-1-ukaszb@chromium.org> <2024070534-sculpture-spooky-daa6@gregkh>
In-Reply-To: <2024070534-sculpture-spooky-daa6@gregkh>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 5 Jul 2024 12:43:46 +0200
Message-ID: <CALwA+Nakqb1re4H8YO8FnaYGOKP-jWLhvtnkvYAvdkRato-cRw@mail.gmail.com>
Subject: Re: [PATCH v1] usbip: Add USB_SPEED_SUPER_PLUS as valid arg
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2024 at 11:40=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 05, 2024 at 09:19:02AM +0000, =C5=81ukasz Bartosik wrote:
> > Add USB_SPEED_SUPER_PLUS as valid argument to allow
> > to attach USB SuperSpeed+ devices.
> >
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  drivers/usb/usbip/vhci_sysfs.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sy=
sfs.c
> > index e2847cd3e6e3..d5865460e82d 100644
> > --- a/drivers/usb/usbip/vhci_sysfs.c
> > +++ b/drivers/usb/usbip/vhci_sysfs.c
> > @@ -283,6 +283,7 @@ static int valid_args(__u32 *pdev_nr, __u32 *rhport=
,
> >       case USB_SPEED_HIGH:
> >       case USB_SPEED_WIRELESS:
> >       case USB_SPEED_SUPER:
> > +     case USB_SPEED_SUPER_PLUS:
> >               break;
> >       default:
> >               pr_err("Failed attach request for unsupported USB speed: =
%s\n",
> > @@ -349,7 +350,7 @@ static ssize_t attach_store(struct device *dev, str=
uct device_attribute *attr,
> >       vhci_hcd =3D hcd_to_vhci_hcd(hcd);
> >       vhci =3D vhci_hcd->vhci;
> >
> > -     if (speed =3D=3D USB_SPEED_SUPER)
> > +     if (speed >=3D USB_SPEED_SUPER)
>
> It's an enum, are you sure this will work?
>

Gcc (gcc (Debian 13.2.0-13) 13.2.0) which I used to compile the patch
does not complain about this change at all:
  make
  ...
  CC [M]  drivers/usb/usbip/vhci_sysfs.o
  LD [M]  drivers/usb/usbip/vhci-hcd.o



Without the patch I was getting the following error when trying to
attach a device:
vhci_hcd: Failed attach request for unsupported USB speed: super-speed-plus

With the patch USB SS+ device attaches successfully:
[248223.654445] vhci_hcd vhci_hcd.0: pdev(0) rhport(0) sockfd(3)
[248223.660701] vhci_hcd vhci_hcd.0: devid(65538) speed(6)
speed_str(super-speed-plus)
[248223.668540] vhci_hcd vhci_hcd.0: Device attached
[248223.936363] usb 2-1: SetAddress Request (2) to port 0
[248223.941698] usb 2-1: new SuperSpeed USB device number 2 using vhci_hcd
[248224.138020] usb 2-1: LPM exit latency is zeroed, disabling LPM.
[248224.331984] usb 2-1: New USB device found, idVendor=3D18d1,
idProduct=3D0010, bcdDevice=3D 0.10
[248224.340416] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[248224.347805] usb 2-1: Product: Linux USB Debug Target
[248224.352984] usb 2-1: Manufacturer: Linux Foundation
[248224.358162] usb 2-1: SerialNumber: 0001

I hope this will resolve your doubts.

Thanks,
Lukasz

> thanks,
>
> greg k-h


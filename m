Return-Path: <linux-usb+bounces-11473-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D49910152
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 12:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99D921C210B3
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 10:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E54E1A8C27;
	Thu, 20 Jun 2024 10:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKNF+H6y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C2C19939B
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718878773; cv=none; b=PwdFkvXPC6WiVLw0AqkSK0mNIkf8GJ7P1pL5dk7XIa199wFh55HTc+5R1h/jMt8l1ERw+zM1MDqJakyUuOTIRkePDgcR7NlLCAqBUbC4h/LFXCHJrN1NDkCXG5Ru0XcMjzqYijoNWwwJgpIylYDVHSzaSH1Ou94yGcoT3EOgj5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718878773; c=relaxed/simple;
	bh=CBCmgdJBlp6luEP7+2Gk8pP26lLZa5Y21gVaKk+plaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ty4ESOCigDDQFQKUawvQBvvLcPeC6AFccc+fL8q/HCyvjlOR7Q/HNKxVDojAngt7kJmTGxvWY+22RV6U5ygf4F6iFwziBlPF/NzQgtpBer7wddso/0pP5vVJujI2Wf24Y1022HzzjOnlbS3cmcUQZiHPFvv91JGMfKfArxoU7AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKNF+H6y; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52bc29c79fdso678642e87.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718878770; x=1719483570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHRbFtOu4ZdNqP7gZOHXJSlLSBwI8u7FABOLT3hSwfY=;
        b=NKNF+H6yh+8BQr/lZPmDW3pJNpPaV28PArpNuYOkZkafD1+2m+9TMtsrReBnnKpgGn
         jFofP/aYdUWo7D/XcXh9ITL6A1neG+e7VpoA7Lv4u6T3MegRxaGFrfMMatmMzX8+ybGK
         RA2gUd6IutWZCLXS+os6ugW3KWOswbSoGpjL9ozNE8i9co9eGu6lKhnFUVmgYuqaZCLK
         d/+rnEzqQIM5RYHduwUwa7RHnRCfr9dJdivKtKb/Ifbt85UshLMSoY4g0JepiU+iyS46
         /cLCsCOB6eK3R4HS0E5TJOvB0lFqyj/2eVWvSGRCUG+FlgKYexOz6Mxlp3K3ybdlYzxO
         sGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718878770; x=1719483570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHRbFtOu4ZdNqP7gZOHXJSlLSBwI8u7FABOLT3hSwfY=;
        b=rq7yFlXvjBe98IIQztKZq8I2EpubEz8Bx7XFm4pgPtJSUxVD6oLCjmvl3l4msbHuSH
         U675fN/SvCx7QinQvSIokHiW3TjXYIuDdV1BkhZHkz9QSFzYVe9Y1ytxatcG+3qm+VlS
         ddRbh/Nn5bkv+z4P33Owd3GX7IRVlIG47mX/JjLK0g1YTiM/l5cmC5yIwASvA9SlHoDY
         aSiU6z/4N59X2o+hQKsT2R5tjcY9hs6oqD639uu7qjqlFwoUE+cLCMmonaHR2kCMcYSH
         NEz9mse6gJfxrgWflTLStOTtvks4a8aMKLOIg2SDxvTyOhZZXAWRat6nWRE6MTO/Vvur
         jxvA==
X-Gm-Message-State: AOJu0YyCg+GDHtCfvDWSfs5X6t4fdCE3qYAT7PgCCPgFZcsBAvZsnVXp
	0P62cny+ehRDzEf4Em3/Oh2qsFUcXOrdhaJ1G/gCXD2Yy9bxw29EtRHYzHT9x/ekR+/rbnpSoXk
	6jMki/zUnhVed3XrX5GjeIuJfLeY=
X-Google-Smtp-Source: AGHT+IHJ8eYRaMcA7Sc4X7MAFTBLWue0yxdw5UGnjxMRdpMq1BWoAY2h5PdrJ9Ro8Q+5xEFvY8MJn8rTlIDk0BpQgKE=
X-Received: by 2002:a05:6512:3da3:b0:52b:c33a:aa7c with SMTP id
 2adb3069b0e04-52ccaa599d0mr4450934e87.65.1718878769820; Thu, 20 Jun 2024
 03:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKSBH7F7LhCykPdKYRi0DvLX5yYjKtbOZbEOKhDXfvrQJA-XKA@mail.gmail.com>
 <2024062016-robust-distance-ea98@gregkh> <CAKSBH7H=TEFtsQLr3=L-Eh9odeEej2j028G2RcbM0H=CTZWrQQ@mail.gmail.com>
 <2024062010-facing-refining-c204@gregkh> <CAKSBH7HeKuP7gA7hk-RFFdnQpaSAOF46JRnQeqFgcA1deG3D6w@mail.gmail.com>
 <2024062042-sandal-unending-44cd@gregkh>
In-Reply-To: <2024062042-sandal-unending-44cd@gregkh>
From: Giacinto Cifelli <gciofono@gmail.com>
Date: Thu, 20 Jun 2024 12:19:18 +0200
Message-ID: <CAKSBH7ERGhRvbtQ-TSGyxjR0wNWG4bF5xQosNtmpzq3frGHjMA@mail.gmail.com>
Subject: Re: usb composition without class
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 11:58=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Thu, Jun 20, 2024 at 11:25:43AM +0200, Giacinto Cifelli wrote:
> > On Thu, Jun 20, 2024 at 8:41=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > > > > On Thu, Jun 20, 2024 at 07:58:13AM +0200, Giacinto Cifelli wrote:
> > > > > > greetings,
> > > > > >
> > > > > > question:
> > > > > >
> > > > > > on a system (yocto), I have a usb composition that doesn't assi=
gn the
> > > > > > class for the interfaces:
> > > > > >     |__ Port 3: Dev 3, If 10, Class=3D, Driver=3Dcdc_mbim, 480M
> > > > > >     |__ Port 3: Dev 3, If 8, Class=3D, Driver=3Dcdc_acm, 480M
> > > > > >     |__ Port 3: Dev 3, If 6, Class=3D, Driver=3Dcdc_acm, 480M
> > > > > >     |__ Port 3: Dev 3, If 4, Class=3D, Driver=3Dcdc_acm, 480M
> > > > > >     |__ Port 3: Dev 3, If 2, Class=3D, Driver=3Dcdc_acm, 480M
> > > > > >     |__ Port 3: Dev 3, If 11, Class=3D, Driver=3Dcdc_mbim, 480M
> > > > > >     |__ Port 3: Dev 3, If 0, Class=3D, Driver=3Dcdc_acm, 480M
> > > > > >     |__ Port 3: Dev 3, If 9, Class=3D, Driver=3Dcdc_acm, 480M
> > > > > >     |__ Port 3: Dev 3, If 7, Class=3D, Driver=3Dcdc_acm, 480M
> > > > > >     |__ Port 3: Dev 3, If 5, Class=3D, Driver=3Dcdc_acm, 480M
> > > > > >     |__ Port 3: Dev 3, If 3, Class=3D, Driver=3Dcdc_acm, 480M
> > > > > >     |__ Port 3: Dev 3, If 1, Class=3D, Driver=3Dcdc_acm, 480M
> > > > > > Kernel: Linux version 6.1.35 (oe-user@oe-host) (x86_64-poky-lin=
ux-gcc
> > > > > > (GCC) 11.4.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP
> > > > > > PREEMPT_DYNAMIC Thu Jun 22 18:03:13 UTC 2023
> > > > > >
> > > > > > instead of (arch):
> > > > > >     |__ Port 004: Dev 004, If 0, Class=3DCommunications, Driver=
=3Dcdc_acm, 5000M
> > > > > >     |__ Port 004: Dev 004, If 1, Class=3DCDC Data, Driver=3Dcdc=
_acm, 5000M
> > > > > >     |__ Port 004: Dev 004, If 2, Class=3DCommunications, Driver=
=3Dcdc_acm, 5000M
> > > > > >     |__ Port 004: Dev 004, If 3, Class=3DCDC Data, Driver=3Dcdc=
_acm, 5000M
> > > > > >     |__ Port 004: Dev 004, If 4, Class=3DCommunications, Driver=
=3Dcdc_acm, 5000M
> > > > > >     |__ Port 004: Dev 004, If 5, Class=3DCDC Data, Driver=3Dcdc=
_acm, 5000M
> > > > > >     |__ Port 004: Dev 004, If 6, Class=3DCommunications, Driver=
=3Dcdc_acm, 5000M
> > > > > >     |__ Port 004: Dev 004, If 7, Class=3DCDC Data, Driver=3Dcdc=
_acm, 5000M
> > > > > >     |__ Port 004: Dev 004, If 8, Class=3DCommunications, Driver=
=3Dcdc_acm, 5000M
> > > > > >     |__ Port 004: Dev 004, If 9, Class=3DCDC Data, Driver=3Dcdc=
_acm, 5000M
> > > > > >     |__ Port 004: Dev 004, If 10, Class=3DCommunications, Drive=
r=3Dcdc_mbim, 5000M
> > > > > >     |__ Port 004: Dev 004, If 11, Class=3DCDC Data, Driver=3Dcd=
c_mbim, 5000M
> > > > > > Kernel: Linux 6.6.34-1-lts #1 SMP PREEMPT_DYNAMIC Sun, 16 Jun 2=
024
> > > > > > 14:45:31 +0000 x86_64 GNU/Linux
> > > > > >
> > > > > > This lack of class creates too many /dev/ttyACMx ports, and
> > > > > > ModemManager tries to access them all, perhaps also blocking th=
e
> > > > > > device, and the whole system doesn't work.
> > > > > >
> > > > > > For completeness, the device is:
> > > > > >     Bus 002 Device 004: ID 1e2d:0065 Gemalto M2M GmbH LTE Modem
> > > > > > which is supported without any customs in the cdc-acm and cdc_m=
bim drivers.
> > > > > >
> > > > > > I spotted only two options not compiled-in in the yocto .config
> > > > > > (compared with the arch one), but I strongly doubt this is rela=
ted:
> > > > > >     CONFIG_USB_G_MULTI
> > > > > >     CONFIG_USB_G_MULTI_CDC
> > > > > >
> > > > > > Would you know why the class is not assigned?
> > > > >
> > > > > This is just a userspace issue, right?
> > > >
> > > > I think the class is assigned by the kernel/driver.
> > > >
> > > > > Or are you saying that somehow
> > > > > the same device plugged into two different systems works differen=
tly?
> > > >
> > > > correct: the same device works differently in the two systems...  i=
n
> > > > the sense of the class not assigned.
> > >
> > > It's not that it is not assigned, it's that something isn't figuring =
it
> > > out properly.
> > >
> > > Can you provide the output of 'lsusb -v -d 1e2d:0065' for both system=
s?
> >
> > they seem ok with -v, I don't understand it.
>
> Nope, there are major differences, let's look at the start:
>
> -yocto:
> +arch:
>
> -Bus 001 Device 003: ID 1e2d:0065 Cinterion LTE Modem
> +Bus 002 Device 004: ID 1e2d:0065 Gemalto M2M GmbH LTE Modem
>
> Ok, this means that for your yocto system you probably do NOT have an
> updated hw.ids package installed for lsusb to use to figure out a lot of
> different things in text form.

this could actually be the issue.  I'll look into it.

> Things like:
>
>    bLength                18
>    bDescriptorType         1
> -  bcdUSB               2.00
> -  bDeviceClass          239
> -  bDeviceSubClass         2
> -  bDeviceProtocol         1
> -  bMaxPacketSize0        64
> -  idVendor           0x1e2d
> -  idProduct          0x0065
> +  bcdUSB               3.10
> +  bDeviceClass          239 Miscellaneous Device
> +  bDeviceSubClass         2 [unknown]
> +  bDeviceProtocol         1 Interface Association
> +  bMaxPacketSize0         9
> +  idVendor           0x1e2d Gemalto M2M GmbH
> +  idProduct          0x0065 LTE Modem
>
>
> Class protocol defintions and the like.
>
> But what's MOST important here is that right away, you see that on your
> yocto device you are running at a 2.0 USB speed, not a 3.1 speed, right?
>
> Perhaps that's the problem here?  The device looks quite different for
> when it is in a 3.1 supported system, with different configurations
> possible, and a different length entirely:
>
>    Configuration Descriptor:
>      bLength                 9
>      bDescriptorType         2
> -    wTotalLength       0x01a9
> +    wTotalLength       0x0215
>
> Are you _SURE_ this is the same device?  I would suggest getting your
> yocto system updated and running at full USB 3 speeds and see if that
> fixes the issues here.

thanks for the hints, I will do my homework and let you know if I
could fix the issue,
It is not the same device, it is the same HW and FW, because it is
soldered on the yocto system.
As for usb2 vs usb3, it shouldn't be the issue, but i will find a usb2
hub or machine to confirm this, too.

thank you again, Greg,
Kind Regards,
Giacinto


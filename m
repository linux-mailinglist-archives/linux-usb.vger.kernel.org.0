Return-Path: <linux-usb+bounces-11466-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F111F90FCBC
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 08:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A4D01F2512B
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 06:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8472C3BBC0;
	Thu, 20 Jun 2024 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDiBYJJR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5E026AFB
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718865174; cv=none; b=LmERp7+dbjcB59Z7s/Veeg8i5uls1Y4sf8EKwhAdJsceVpvqPw9JZ8OZZ40quADr1Lh5MToXU/CN+7NvzTHlRloE2eNyS0ddgH/OMCpzLq5oGuNhFVCKnanrSdICjYmSWWzG5Q4F2fCELQ9TXtxYtVuYC8j9uORrQGPXALnVkro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718865174; c=relaxed/simple;
	bh=Hgv7I0OJ+llwY8RAbVdIT2E8GVxJcgGN1Hl+hVr9HzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvVCCXPONvLN7V5MwpSWOAT7+DyL2apA9PIv5fkjI8ArMm8mEWZ1xwmrhE9G2ovLP41U1R9vApdkjBeZjLiZIZLvrPS8Cqu+CtFJHEItbUQhTXjJVwQffh4KtpTKVkdUrqAMkYJze+uKci70sjFZAgUqayTKuEEFDUSEQs5gK04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDiBYJJR; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6ef64b092cso51151966b.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 23:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718865171; x=1719469971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPAby3B1MhKR45lEMjLAvO+B2aq7tJJGL5K30GdzaEY=;
        b=YDiBYJJR1O2NgE6K/oIcddLUKrnYIsl9VMbSgtRMoCk6oMCF+3m7EwcNCNMItWO67N
         tpl4RJczmz9PNFwfYCQjUkzQp8CQhSDvJ4aKD4ID51OIHTT+9xwZJ1zFvFeuEVGJqVhH
         yXZ+X3TKW2k3LDulKL/ZuEDqvNhGNNY/Ey+jlurbZT2H4c6wWh1sanLBz8OVFXRAwX5t
         CIvy3t+xCiXlhcPPAcTpbpNpHXgIJfoi3LOn6AtY+0KM1Ly9LyEhjNiHoTS0Gxrx0SxS
         kYXm9iI/ftoFxtJBrSDtF5z/bCXpoMqxQNKfJXmrQ2SZ8Uvu/UdO7ScHu7Ej+OhzYTht
         EYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718865171; x=1719469971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPAby3B1MhKR45lEMjLAvO+B2aq7tJJGL5K30GdzaEY=;
        b=H2gsKHPqdmC3vWR82cNqW3cu2CB8NbaVMO8+HDCPryiaXsO3as5gzi6p1nSzbX4htL
         Blisx8aJlxWqWZB32uygKpPH2FCUIx63qjT37HEO0PwSbwZBqxkghgI31kVMUmdSzKP1
         Hps4T4Rk69u0ixvwI8d3Q/4l6ytQKSgmAJ2bFRrGOymLHjiKsfLUbrE+jSou8cDuVAsq
         GyVfLrwyUi9khn+iCzSrYaTcbIj6i10zzGBKi2HUkaB/aQr3fAXWNhuHg9UDb875/UJv
         q7x3LGOnZ7SutTrTYkAifTcPr5xCVpKcfKOaE8UMdGCDsXANrdCfc2GHNZ77hPxrdZyX
         ESZQ==
X-Gm-Message-State: AOJu0Yyhsn80Ml47zpMnrTo11/ZOf7z+0UeUUbg4SO8Lqc3Kf4GUFRHS
	q97UJomAlOaSLsgg3fz3vqE0QuaNEfqcL9rnLPo+o6ZU/DkjSKoKfa8fBLot0DLbeGFm62BctD4
	CfVKh2V36wP46rcA0Rytdmh6JG+U=
X-Google-Smtp-Source: AGHT+IFSJW17iTwCFzLIzqxQ9gFWbmbbysnqz7OHWk/M5RA2sM5R6/BCcjvsgZa8BQtTtQ7fD4y76bihZyw3BmQiyQY=
X-Received: by 2002:a17:906:1289:b0:a6f:e1a:3ee0 with SMTP id
 a640c23a62f3a-a6fab62f455mr246735766b.30.1718865170383; Wed, 19 Jun 2024
 23:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKSBH7F7LhCykPdKYRi0DvLX5yYjKtbOZbEOKhDXfvrQJA-XKA@mail.gmail.com>
 <2024062016-robust-distance-ea98@gregkh>
In-Reply-To: <2024062016-robust-distance-ea98@gregkh>
From: Giacinto Cifelli <gciofono@gmail.com>
Date: Thu, 20 Jun 2024 08:32:39 +0200
Message-ID: <CAKSBH7H=TEFtsQLr3=L-Eh9odeEej2j028G2RcbM0H=CTZWrQQ@mail.gmail.com>
Subject: Re: usb composition without class
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 8:06=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> On Thu, Jun 20, 2024 at 07:58:13AM +0200, Giacinto Cifelli wrote:
> > greetings,
> >
> > question:
> >
> > on a system (yocto), I have a usb composition that doesn't assign the
> > class for the interfaces:
> >     |__ Port 3: Dev 3, If 10, Class=3D, Driver=3Dcdc_mbim, 480M
> >     |__ Port 3: Dev 3, If 8, Class=3D, Driver=3Dcdc_acm, 480M
> >     |__ Port 3: Dev 3, If 6, Class=3D, Driver=3Dcdc_acm, 480M
> >     |__ Port 3: Dev 3, If 4, Class=3D, Driver=3Dcdc_acm, 480M
> >     |__ Port 3: Dev 3, If 2, Class=3D, Driver=3Dcdc_acm, 480M
> >     |__ Port 3: Dev 3, If 11, Class=3D, Driver=3Dcdc_mbim, 480M
> >     |__ Port 3: Dev 3, If 0, Class=3D, Driver=3Dcdc_acm, 480M
> >     |__ Port 3: Dev 3, If 9, Class=3D, Driver=3Dcdc_acm, 480M
> >     |__ Port 3: Dev 3, If 7, Class=3D, Driver=3Dcdc_acm, 480M
> >     |__ Port 3: Dev 3, If 5, Class=3D, Driver=3Dcdc_acm, 480M
> >     |__ Port 3: Dev 3, If 3, Class=3D, Driver=3Dcdc_acm, 480M
> >     |__ Port 3: Dev 3, If 1, Class=3D, Driver=3Dcdc_acm, 480M
> > Kernel: Linux version 6.1.35 (oe-user@oe-host) (x86_64-poky-linux-gcc
> > (GCC) 11.4.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP
> > PREEMPT_DYNAMIC Thu Jun 22 18:03:13 UTC 2023
> >
> > instead of (arch):
> >     |__ Port 004: Dev 004, If 0, Class=3DCommunications, Driver=3Dcdc_a=
cm, 5000M
> >     |__ Port 004: Dev 004, If 1, Class=3DCDC Data, Driver=3Dcdc_acm, 50=
00M
> >     |__ Port 004: Dev 004, If 2, Class=3DCommunications, Driver=3Dcdc_a=
cm, 5000M
> >     |__ Port 004: Dev 004, If 3, Class=3DCDC Data, Driver=3Dcdc_acm, 50=
00M
> >     |__ Port 004: Dev 004, If 4, Class=3DCommunications, Driver=3Dcdc_a=
cm, 5000M
> >     |__ Port 004: Dev 004, If 5, Class=3DCDC Data, Driver=3Dcdc_acm, 50=
00M
> >     |__ Port 004: Dev 004, If 6, Class=3DCommunications, Driver=3Dcdc_a=
cm, 5000M
> >     |__ Port 004: Dev 004, If 7, Class=3DCDC Data, Driver=3Dcdc_acm, 50=
00M
> >     |__ Port 004: Dev 004, If 8, Class=3DCommunications, Driver=3Dcdc_a=
cm, 5000M
> >     |__ Port 004: Dev 004, If 9, Class=3DCDC Data, Driver=3Dcdc_acm, 50=
00M
> >     |__ Port 004: Dev 004, If 10, Class=3DCommunications, Driver=3Dcdc_=
mbim, 5000M
> >     |__ Port 004: Dev 004, If 11, Class=3DCDC Data, Driver=3Dcdc_mbim, =
5000M
> > Kernel: Linux 6.6.34-1-lts #1 SMP PREEMPT_DYNAMIC Sun, 16 Jun 2024
> > 14:45:31 +0000 x86_64 GNU/Linux
> >
> > This lack of class creates too many /dev/ttyACMx ports, and
> > ModemManager tries to access them all, perhaps also blocking the
> > device, and the whole system doesn't work.
> >
> > For completeness, the device is:
> >     Bus 002 Device 004: ID 1e2d:0065 Gemalto M2M GmbH LTE Modem
> > which is supported without any customs in the cdc-acm and cdc_mbim driv=
ers.
> >
> > I spotted only two options not compiled-in in the yocto .config
> > (compared with the arch one), but I strongly doubt this is related:
> >     CONFIG_USB_G_MULTI
> >     CONFIG_USB_G_MULTI_CDC
> >
> > Would you know why the class is not assigned?
>
> This is just a userspace issue, right?

I think the class is assigned by the kernel/driver.

> Or are you saying that somehow
> the same device plugged into two different systems works differently?

correct: the same device works differently in the two systems...  in
the sense of the class not assigned.
The device boots in the same way, the difference is not in the device.

>
> Note that 6.6 is a year older than 6.1 so perhaps you just need to
> update your system running 6.1?  Odds are there's a quirk for this
> device in newer kernels.

I have checked, and there aren't for this device, which was working
properly already with the kernels 4.19.x.
I haven't submitted any for this modem, but if it turns out that
patches are needed, I will be glad to submit them.
Only at the moment I have no idea about what is going wrong.

>
> Also, 6.1.35 is VERY old and obsolete and full of known security holes
> that have been fixed.  Please update to the latest 6.1.y release as soon
> as possible.

I think in Yocto they have the habit of adding patches without
changing the version number.
But in any case I will start to migrate the system... it will take
some time, thou.
I feel, however, that this won't solve the issue at hand.

Any idea why the class is not assigned?

>
> thanks,
>
> greg k-h

Kind Regards,
Giacinto


Return-Path: <linux-usb+bounces-11727-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F175891A332
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 11:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB8D5286942
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 09:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3795E13C801;
	Thu, 27 Jun 2024 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PW7mBIe4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BD213C69A
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719482123; cv=none; b=UKIwVE1ISInfazZnx7lCxiZBvlMYR81Kb36g/ZY2WNZQSv/WlJmjZV1WGZAJU9sHBEx8a/KSMJBOV0FyfHRvSDcLNVdo6nx8MPZ0DPzUF2JAsZhtw38prAVjeOj18qUMhBPY4/tyPMO/TExqqYtpnnLpu20AXkOsOwx9OugmfQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719482123; c=relaxed/simple;
	bh=/s7SckjmZc+VSBf3UPhqDhT1S2dLZagGFzusIuAepew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Krmotr9vjyEy6eW+zThhtFy11J9mCYTR3E9oZJT7qsTjdHBTnZBM7sDqP03PYGWIEFIwdWqpNdf0xooSR1TlsmgEheP3VbQfiqpUeRb/R/YTpa+PnlxUahT1Q4ljMO4s20fB9To5Em34kDnrqMs9ViQkIwHlRin1/6KCmSM33ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PW7mBIe4; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cf4ca8904so3429583e87.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 02:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719482120; x=1720086920; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=msy4C0HgnSUUBHZbrV6UcSB9u8psh1MaoVcJV4XMHmg=;
        b=PW7mBIe4ClS6ox7krbK0/emmLZyLv8Y6PPy6PUzOUI267cMV6co8BifTDFMC/H2qzz
         p4XHMfY5B3TW6jhSV7hj90bRUmlnuCOV/1L2o5HGM3Z6TMI7AcH/CzrtjrTdKFC+a0zT
         W8wzmbqHNhvOyxCGUrGjODBc3BIB+MDeQS4IsQas0BFQi1AVsuaS3pZ0uu32FJC+lPzH
         jOVxqeBN4Lza7x8BGxdWaAMn2atrQXTuJqo7NdUpqFqaJYmTga4TCYN+8xs6hWvywtfP
         a+IGjbkihCmA2cA/hyg7I72zc+Kw+SmPRKXXg1Ci4ySSZQ9ByYYpF9nzF9Sd+HfugwZw
         7jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719482120; x=1720086920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msy4C0HgnSUUBHZbrV6UcSB9u8psh1MaoVcJV4XMHmg=;
        b=PXyB2rq6l+03MVAnfpepKnzmFSKvR9lXfkqXVtPkG21y5WPHBbWcgRfOFk/ClVz9+2
         Lo+CqMt/V7hQK1a8iATFf9qP74IA2jjOEq7Il6IiGPCmdxHoiNduGxmgCPyBhd475wb5
         gYkioFrAgX4NRJHf+Am7XsxJmX9f4vw/2xlF70jKpjd7caRF9Do2dZwyqYYFIIE5pTIn
         G7yyhNLQ1FvDkLFZAsGiYC4VS/hn1iyYGPQSFt4ahPojooXdv3wqWgphMmFAvY7suaot
         u0HskFWb3OOsDpSioJcbQ67adJ4savrHL6w21f6mBs9+wELVoMwQOiLna2+yqiF8KRBz
         0l3g==
X-Forwarded-Encrypted: i=1; AJvYcCU753hjz0qUTKuy0qBjvbP4YiSYZuOg5DZc5aYbOUDVon1tRwv9MocJ3uq7q8a9CLKxbwt5MPaw59Nwo23eKFhPg6lbCNYqEFex
X-Gm-Message-State: AOJu0YyIUoSVjPmMaYmR6Ox2bM4OCHQIA1Vm69FBNolm5YixOvu2gah6
	JC5STkfmUN4tUyfmCE0Crm/pfr2DlBCeVHHlssRtvdNfEK3V1SkwioTJY+u2pc84neDKGDWZ18G
	IiD503w7eT5/+IIpcHDJyttuy6iM=
X-Google-Smtp-Source: AGHT+IFG2/6ZfjXNXKKvzAsc/lG2v6xSJHsW/mcj9GkfMkQLDjyvRZWx91bWVNUZ5USzZhQe9aL4vZZUVxo50daaRGE=
X-Received: by 2002:a19:3815:0:b0:52c:de76:109a with SMTP id
 2adb3069b0e04-52ce0680ac3mr7571961e87.67.1719482119911; Thu, 27 Jun 2024
 02:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530080053.1094657-1-dnlplm@gmail.com> <Zn0SAXwM45_XF1VX@hovoldconsulting.com>
In-Reply-To: <Zn0SAXwM45_XF1VX@hovoldconsulting.com>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Thu, 27 Jun 2024 11:51:05 +0200
Message-ID: <CAGRyCJFsr8BLBtwyLv3oFgpwS2cqGKu8GRhFOKY4CJAx2sGdEg@mail.gmail.com>
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit generic core-dump composition
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Johan,

Il giorno gio 27 giu 2024 alle ore 09:17 Johan Hovold
<johan@kernel.org> ha scritto:
>
> On Thu, May 30, 2024 at 10:00:53AM +0200, Daniele Palmas wrote:
> > Add the following core-dump composition, used in different Telit modems:
> >
> > 0x9000: tty (sahara)
> > T:  Bus=03 Lev=01 Prnt=03 Port=07 Cnt=01 Dev#= 41 Spd=480  MxCh= 0
> > D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> > P:  Vendor=1bc7 ProdID=9000 Rev=00.00
> > S:  Manufacturer=Telit Cinterion
> > S:  Product=FN990-dump
> > S:  SerialNumber=e815bdde
> > C:  #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=2mA
> > I:  If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=10 Driver=option
> > E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> > E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> >
> > Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> > ---
> >  drivers/usb/serial/option.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> > index 8a5846d4adf6..a58dd4ef461b 100644
> > --- a/drivers/usb/serial/option.c
> > +++ b/drivers/usb/serial/option.c
> > @@ -1433,6 +1433,8 @@ static const struct usb_device_id option_ids[] = {
> >         .driver_info = NCTRL(2) },
> >       { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x701b, 0xff),    /* Telit LE910R1 (ECM) */
> >         .driver_info = NCTRL(2) },
> > +     { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x9000, 0xff),    /* Telit generic core-dump device */
> > +       .driver_info = NCTRL(0) },
>
> ZLP not needed like for the other flashing device entries?

not needed for this one.

Thanks,
Daniele

>
> >       { USB_DEVICE(TELIT_VENDOR_ID, 0x9010),                          /* Telit SBL FN980 flashing device */
> >         .driver_info = NCTRL(0) | ZLP },
> >       { USB_DEVICE(TELIT_VENDOR_ID, 0x9200),                          /* Telit LE910S1 flashing device */
>
> Johan


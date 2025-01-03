Return-Path: <linux-usb+bounces-18960-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07450A00B67
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2025 16:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAC82160AF4
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2025 15:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42521FA24A;
	Fri,  3 Jan 2025 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDZtRwCr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723BD2563;
	Fri,  3 Jan 2025 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735917932; cv=none; b=l1ij4jxCnhUgPDcmp/5T0ctaZ3MTbWG5rEfxkwd5NwHYlvNa3avzswnP3P3SZkC2YGsirKWKCRqu4hwpWxP4aiCoJpwoW+g6oE3Ac2nQKc69E5ku041/T/u2OTlaUYYafsExFYyIcNP9TB/qjXwNGVinXtj22g+Px3khlCQIIiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735917932; c=relaxed/simple;
	bh=0uHImOZM+dee4NkIrqqMVAFd7J4SSfvlroEbqeryXjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTOajvAMb+gLyqHtOjv9U/OaO7jKNMwBngzUzGkWWfrfSqgubXSTAzfVQDd0LlX8IR+B9NanbyG25AJLErlzgfYc9bnVW8tENqAGeey7cpfaumSKK2iv4CZzCDoxiMRXmespDI2cR8d776D+TvS5ApYUjfgwcwAC84XeChKVdZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDZtRwCr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so9736224f8f.0;
        Fri, 03 Jan 2025 07:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735917929; x=1736522729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sfFEnFRNPi9vxQb+YLyu/+m+8NOg3EnXrkyzPEin3M=;
        b=jDZtRwCrg3irEG9+j7DSzZaueAnXuPz8hrVY8CZKj8UoPMYAQdFUTOsvrVJu0bGYyC
         SVfHcPx/PmCAkPNAoPpMmr6M5btCH55iJKe3Y8Bfth9CbQv/OTfo5AURp/2ed2gTVpvv
         qrp3K/W+1GFkW1TR5EFQ3BUvzFfKfmlD/09Hedn+tF8IPJEEGHAUxiN+9TSbG26kZZlT
         nqpICvvq506S6yFSLSMN+T3uzJ4NbYQzlAQ9JCXMbEOsl1gMeqTwHOJ00zl7C+HHjlFI
         OPW8jfry5QcHtVfvD7Zs1qyHuUCY7+Jez8baK0skWHM45zhWWQLUzq7d/CZFY97X8sHs
         2tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735917929; x=1736522729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sfFEnFRNPi9vxQb+YLyu/+m+8NOg3EnXrkyzPEin3M=;
        b=PbXRGPDbmes09r5HZdyqtzVmF2Bf4riBxvwczTFByubjQeMkiW4/L1xlMFQq7t5bpV
         vURm2kfthvLPu33Xk8RaYUtG3BVQTkRAe8KCcFZG4TTGUBSch946mmMmp8gKGsuON9Hk
         tbcW5nKziyLVmRMXlXNqY0uQnsae4NgBIv61lmC2wbNDlH4EIu/bHqSFEIn+ZwTK2CWU
         2YvfKlCTuju8cvjq5IzuUFmpqj5DWzeUF6O6ppQ8VQvx+3qfuRk4hP1DJWXwn6xRkoQO
         KyrS7BuiU6ps5muPK0WCVGXCDdfToA1CVQlZZ6d/xUzGVv/11IJI9PHWNYsW37f59hFQ
         yrXw==
X-Forwarded-Encrypted: i=1; AJvYcCUAV2Ny2P609Fd1/b2OHLgndFZPho4GdVAotSU93s4Yg7pFV0O4JbkZ8h0BX0u98mkZmslD2M9RxpYu@vger.kernel.org, AJvYcCUFommvsI1yHTJNIFjUwjqAbcvAsIGvXzIFI5d0Tvui+rdY/uUiTprWWMjisfifIRFPFmYFKxWafWDBn1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI4XlhkTgvpQbA4L08lqF/aLvpfA8TRiXV/yJyOKipTNc5bb+I
	txMBSHfgOzLs+iqKXlZmOUL9Ugkvi0+kpBmaAh3+EzDCe1mWGsJpMjIHc/GwiGOMSF9Kbh1pC3i
	yPA3c9Z55HIOtVSKj6t21yTkA2dg=
X-Gm-Gg: ASbGncvvB5yWwm3lHYCNRefXPFsI7m5GTwuAD1sjVt83IetkR+abZWwEjvzE/40P06G
	PryN5Fnw0+FVzYdrHLDLftZtmIlIV3za+ZxWzwA==
X-Google-Smtp-Source: AGHT+IFq7YckZ5ZtaSuwSqp7j1nwm+Pw84ksLSSRmN6cZWPjKxkqNFb44egmVo98NbiS0t35RcmbHUk8+kT1xeDv35Q=
X-Received: by 2002:a05:6000:1564:b0:38a:624b:e7fe with SMTP id
 ffacd0b85a97d-38a624bee1bmr7882808f8f.7.1735917928650; Fri, 03 Jan 2025
 07:25:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231161539.20192-1-xndchn@gmail.com> <20241231161539.20192-3-xndchn@gmail.com>
 <da4b2710-f36e-40ad-addb-6b114e60b187@linuxfoundation.org>
In-Reply-To: <da4b2710-f36e-40ad-addb-6b114e60b187@linuxfoundation.org>
From: xndcn <xndchn@gmail.com>
Date: Fri, 3 Jan 2025 23:25:17 +0800
Message-ID: <CAJ=gGT1Nap1ooH21-N1TJ2o5XUUAFNeCCeXdzohFVKSaxZEOdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] usbip: Correct format specifier for seqnum from %d to %u
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:USB OVER IP DRIVER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks.

> How did you find the problem? Include log from the tool
> or compiler output.

As said in [Patch 1/2], I saw this log:
> [ 294.204334] vhci_hcd: cannot find a urb of seqnum 2147483648 max seqnum=
 -2147483648
then I found there are also logs with wrong format specifier for seqnum

> seqnum is unsigned long - don't you have to use %ul?
pdu->u.cmd_unlink.seqnum is defined as u32 actually.
In usbip driver, all seqnum in protocol struct (struct
usbip_header_basic and struct usbip_header_cmd_unlink), is defined as
u32.
In other driver specific priv struct, seqnum is defined as unsigned long.
It seems only the u32 seqnum have wrong format specifier

On Fri, Jan 3, 2025 at 6:09=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.or=
g> wrote:
>
> On 12/31/24 09:15, Xiong Nandi wrote:
> > The seqnum field in USBIP protocol is an unsigned value.
> > So we fix the format specifier from %d to %u to correctly
> > display the value.
> >
>
> How did you find the problem? Include log from the tool
> or compiler output.
>
> > Signed-off-by: Xiong Nandi <xndchn@gmail.com>
> > ---
> >   drivers/usb/usbip/stub_rx.c | 2 +-
> >   drivers/usb/usbip/stub_tx.c | 2 +-
> >   drivers/usb/usbip/vhci_rx.c | 6 +++---
> >   drivers/usb/usbip/vudc_tx.c | 2 +-
> >   4 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> > index 6338d818bc8b..9aa30ef76f3b 100644
> > --- a/drivers/usb/usbip/stub_rx.c
> > +++ b/drivers/usb/usbip/stub_rx.c
> > @@ -269,7 +269,7 @@ static int stub_recv_cmd_unlink(struct stub_device =
*sdev,
> >               return 0;
> >       }
> >
> > -     usbip_dbg_stub_rx("seqnum %d is not pending\n",
> > +     usbip_dbg_stub_rx("seqnum %u is not pending\n",
> >                         pdu->u.cmd_unlink.seqnum);
>
> seqnum is unsigned long - don't you have to use %ul?
> >
> >       /*
> > diff --git a/drivers/usb/usbip/stub_tx.c b/drivers/usb/usbip/stub_tx.c
> > index b1c2f6781cb3..7eb2e074012a 100644
> > --- a/drivers/usb/usbip/stub_tx.c
> > +++ b/drivers/usb/usbip/stub_tx.c
> > @@ -201,7 +201,7 @@ static int stub_send_ret_submit(struct stub_device =
*sdev)
> >
> >               /* 1. setup usbip_header */
> >               setup_ret_submit_pdu(&pdu_header, urb);
> > -             usbip_dbg_stub_tx("setup txdata seqnum: %d\n",
> > +             usbip_dbg_stub_tx("setup txdata seqnum: %u\n",
> >                                 pdu_header.base.seqnum);
> >
> >               if (priv->sgl) {
> > diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> > index 7f2d1c241559..a75f4a898a41 100644
> > --- a/drivers/usb/usbip/vhci_rx.c
> > +++ b/drivers/usb/usbip/vhci_rx.c
> > @@ -66,7 +66,7 @@ static void vhci_recv_ret_submit(struct vhci_device *=
vdev,
> >       spin_unlock_irqrestore(&vdev->priv_lock, flags);
> >
> >       if (!urb) {
> > -             pr_err("cannot find a urb of seqnum %u max seqnum %d\n",
> > +             pr_err("cannot find a urb of seqnum %u max seqnum %u\n",
> >                       pdu->base.seqnum,
> >                       atomic_read(&vhci_hcd->seqnum));
> >               usbip_event_add(ud, VDEV_EVENT_ERROR_TCP);
> > @@ -162,10 +162,10 @@ static void vhci_recv_ret_unlink(struct vhci_devi=
ce *vdev,
> >                * already received the result of its submit result and g=
ave
> >                * back the URB.
> >                */
> > -             pr_info("the urb (seqnum %d) was already given back\n",
> > +             pr_info("the urb (seqnum %u) was already given back\n",
> >                       pdu->base.seqnum);
> >       } else {
> > -             usbip_dbg_vhci_rx("now giveback urb %d\n", pdu->base.seqn=
um);
> > +             usbip_dbg_vhci_rx("now giveback urb %u\n", pdu->base.seqn=
um);
> >
> >               /* If unlink is successful, status is -ECONNRESET */
> >               urb->status =3D pdu->u.ret_unlink.status;
> > diff --git a/drivers/usb/usbip/vudc_tx.c b/drivers/usb/usbip/vudc_tx.c
> > index 3ccb17c3e840..30c11bf9f4e7 100644
> > --- a/drivers/usb/usbip/vudc_tx.c
> > +++ b/drivers/usb/usbip/vudc_tx.c
> > @@ -107,7 +107,7 @@ static int v_send_ret_submit(struct vudc *udc, stru=
ct urbp *urb_p)
> >
> >       /* 1. setup usbip_header */
> >       setup_ret_submit_pdu(&pdu_header, urb_p);
> > -     usbip_dbg_stub_tx("setup txdata seqnum: %d\n",
> > +     usbip_dbg_stub_tx("setup txdata seqnum: %u\n",
> >                         pdu_header.base.seqnum);
> >       usbip_header_correct_endian(&pdu_header, 1);
> >
> thanks,
> -- Shuah


Return-Path: <linux-usb+bounces-12111-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D02B992CFCE
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 12:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82BC128BE04
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 10:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD1D19048D;
	Wed, 10 Jul 2024 10:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nV8xyR/C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF9619048B
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720608626; cv=none; b=jHEQlfYU5tiN9S9vfzo6hS5R88fzSZe6CG1qPiIV3UBHQSjL1vvge14Akn7UicQijzav+WWiv5K70GUNae3qEfm0758RS95dCrWargSWXuUClRkd3Xww1QJTiEMxnln9H76buzMl4wtPr1q8XMvJXuIvUB1Ghyc8IEFT4/VeTxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720608626; c=relaxed/simple;
	bh=i7CSWNQWSBb5QVaqACvy6fhXtiishbPOrh0hdBypJnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DkVIffWjMUHDQOD7haaiziZ4lWfCuqddgll9qfZBUM9uS2H/PPL+27Ainic58ccGhucmIiI2tvWqGx64eMQY8so+JsqRrqGZv9eZa/ePbMxrQC6d2n0OjA0R28DQEcj5J0Zyh1fudow9Ac/Mat7KoKuwyHlz/uFzIfwSAkDS0HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nV8xyR/C; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ea7bdde68so5538712e87.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 03:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720608622; x=1721213422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rAwS+UQr65lkvj2GXDyVuos1V01g26GHnUtj2lCW+8=;
        b=nV8xyR/CUErO0uOmz95WKm1xzrAntIGFuPUVONKWDQhwXHqADSqEXyUaaF2ANNX+if
         lVE85fW+R7EG5pHExH8D/ngiDVbu+MNIGZf3iaQnIDKOu2D1gr/LGNLCC+7dp759K9yL
         KUjwL/Eed1qfJXYBjY5c860R9iGRBZTjp2WBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720608622; x=1721213422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rAwS+UQr65lkvj2GXDyVuos1V01g26GHnUtj2lCW+8=;
        b=NeV83Vao8ofZnu7/gRCC2X5cmo2vryY8XX8LHfUAbVAKMlY89SP0hV/k6T+MpAK+s9
         g14/eIQ/kevviCGfvVw6lvkKET/y421hWw8fDwJ5hz3q+A0DFx9GYvItADEXBgPYMbCW
         SYzFDJ3iy2jMBx/Rtf1MxvTLZevchFkYT1G2AF7LUpUnWPv8QDhuBGKPJgwn9A+DM2Hw
         ck85vjQchEpPrv0d7FXwnUOzC7V/ggWCA+H/UjpwQV9WfkI4E1aTX8Hq8k2JKLZdS5O3
         XKsrdaK4lZ2ceMNIl7y77PByU1LmHR7i8lep5I350VvjjjubjDWAF5CZTle3aHFZwOVM
         G97Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVOmRuXhNhQK8rabCc3EF60H5dWcB0oM4Y9wBrEYIQCWHSQYI/T96Qa8cVSM3IFzYEADbG7jIGiIA3U+hHJA6Hjgr+nJK7kVOz
X-Gm-Message-State: AOJu0YyiWSI/uDcXFkc2YEwRTOH4vJhITiUv86hByt1QgAVqiw8NRShr
	edzmPrKzjACVKkm6S53VEZYzy/G8oF+JNiwpzhI5W0Pd2Xw5Cf3NQVVfBi6g+2VhBj/2C3Nvijv
	9+CvdrdjLkKPBfXbnpXh+kNyCY74qdFAFVh4=
X-Google-Smtp-Source: AGHT+IHSCdDzJwMkWu4MZg08gC5bLfQUtPN0L/W6NIS2hI6xWeefEu1yS0wys6kJBEPf8RpK2ohSibYzpPMUrH8xjmw=
X-Received: by 2002:a05:6512:3191:b0:52e:767a:ada7 with SMTP id
 2adb3069b0e04-52eb99d1644mr3383291e87.50.1720608622129; Wed, 10 Jul 2024
 03:50:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240705091902.789643-1-ukaszb@chromium.org> <2024070534-sculpture-spooky-daa6@gregkh>
 <CALwA+Nakqb1re4H8YO8FnaYGOKP-jWLhvtnkvYAvdkRato-cRw@mail.gmail.com> <5cea8570-318d-47af-a669-cc89253de803@linuxfoundation.org>
In-Reply-To: <5cea8570-318d-47af-a669-cc89253de803@linuxfoundation.org>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Wed, 10 Jul 2024 12:50:10 +0200
Message-ID: <CALwA+NYjE3REBAJR6y+UMdZC2otozBtrFZ_eFY4yN2DjOboP1Q@mail.gmail.com>
Subject: Re: [PATCH v1] usbip: Add USB_SPEED_SUPER_PLUS as valid arg
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 9:27=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.or=
g> wrote:
>
> On 7/5/24 04:43, =C5=81ukasz Bartosik wrote:
> > On Fri, Jul 5, 2024 at 11:40=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> >>
> >> On Fri, Jul 05, 2024 at 09:19:02AM +0000, =C5=81ukasz Bartosik wrote:
> >>> Add USB_SPEED_SUPER_PLUS as valid argument to allow
> >>> to attach USB SuperSpeed+ devices.
> >>>
> >>> Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> >>> ---
> >>>   drivers/usb/usbip/vhci_sysfs.c | 3 ++-
> >>>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_=
sysfs.c
> >>> index e2847cd3e6e3..d5865460e82d 100644
> >>> --- a/drivers/usb/usbip/vhci_sysfs.c
> >>> +++ b/drivers/usb/usbip/vhci_sysfs.c
> >>> @@ -283,6 +283,7 @@ static int valid_args(__u32 *pdev_nr, __u32 *rhpo=
rt,
> >>>        case USB_SPEED_HIGH:
> >>>        case USB_SPEED_WIRELESS:
> >>>        case USB_SPEED_SUPER:
> >>> +     case USB_SPEED_SUPER_PLUS:
> >>>                break;
> >>>        default:
> >>>                pr_err("Failed attach request for unsupported USB spee=
d: %s\n",
> >>> @@ -349,7 +350,7 @@ static ssize_t attach_store(struct device *dev, s=
truct device_attribute *attr,
> >>>        vhci_hcd =3D hcd_to_vhci_hcd(hcd);
> >>>        vhci =3D vhci_hcd->vhci;
> >>>
> >>> -     if (speed =3D=3D USB_SPEED_SUPER)
> >>> +     if (speed >=3D USB_SPEED_SUPER)
> >>
> >> It's an enum, are you sure this will work?
> >>
> >
> > Gcc (gcc (Debian 13.2.0-13) 13.2.0) which I used to compile the patch
> > does not complain about this change at all:
> >    make
> >    ...
> >    CC [M]  drivers/usb/usbip/vhci_sysfs.o
> >    LD [M]  drivers/usb/usbip/vhci-hcd.o
> >
> >
> >
> > Without the patch I was getting the following error when trying to
> > attach a device:
> > vhci_hcd: Failed attach request for unsupported USB speed: super-speed-=
plus
> >
> > With the patch USB SS+ device attaches successfully:
> > [248223.654445] vhci_hcd vhci_hcd.0: pdev(0) rhport(0) sockfd(3)
> > [248223.660701] vhci_hcd vhci_hcd.0: devid(65538) speed(6)
> > speed_str(super-speed-plus)
> > [248223.668540] vhci_hcd vhci_hcd.0: Device attached
> > [248223.936363] usb 2-1: SetAddress Request (2) to port 0
> > [248223.941698] usb 2-1: new SuperSpeed USB device number 2 using vhci_=
hcd
> > [248224.138020] usb 2-1: LPM exit latency is zeroed, disabling LPM.
> > [248224.331984] usb 2-1: New USB device found, idVendor=3D18d1,
> > idProduct=3D0010, bcdDevice=3D 0.10
> > [248224.340416] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2,
> > SerialNumber=3D3
> > [248224.347805] usb 2-1: Product: Linux USB Debug Target
> > [248224.352984] usb 2-1: Manufacturer: Linux Foundation
> > [248224.358162] usb 2-1: SerialNumber: 0001
> >
> > I hope this will resolve your doubts.
> >
>
> What about the other places that check for USB_SPEED_SUPER?
> take a look at attach_store() that checks for USB_SPEED_SUPER
> and picks the correct vdev.
>

This patch already updates attach_store() to select the correct vdev.
Please see lines:
-     if (speed =3D=3D USB_SPEED_SUPER)
+     if (speed >=3D USB_SPEED_SUPER)

Also there are two other places where USB_SPEED_SUPER is used:
1) vhci_hcd.c:1158: hcd->self.root_hub->speed =3D USB_SPEED_SUPER - IMHO
no need for a change as it is ok to attach USB3.1 device (taking into
account it is backwards compatible) to USB3.0 HC
2) vudc_transfer.c:34: case USB_SPEED_SUPER - this seems to be
unrelated to this patch

Thanks,
Lukasz

> This change is incomplete and will break things.
>
> thanks,
> -- Shuah
>


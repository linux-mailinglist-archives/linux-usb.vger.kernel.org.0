Return-Path: <linux-usb+bounces-31202-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D85CA65BF
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 08:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55C22305D336
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 07:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97338205AB6;
	Fri,  5 Dec 2025 07:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KP0N3Dgy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD53F9C0
	for <linux-usb@vger.kernel.org>; Fri,  5 Dec 2025 07:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764919133; cv=none; b=vGayXYVHlWAMt+KrOsRybU7mBT9TmQpLFsLX1qQP7y6fGYNZnImlwF3cGbKXBhEst4x/slukCUhLMHHaEroPRtIAmMazTf3N3y1SXg6iHwm6jlW+cu4FqJGffjrOrPzcH2LhCqY5r/SMEcBU5sgLAKU9U8sSm88/UdBEwIQEM+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764919133; c=relaxed/simple;
	bh=H+jFPI0S97n+0KcHdOJh1s8XUKfPm1xmB3IOk9O5RxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hq618MaN0I48mm1XalcpEjOG9HCGfZ3J9e4H+FMfn+3PTe9hPYsb7ve64rGrQf9/C2TQaTYhRZCsdfHcqA4XFPfrJ0t2tRIfCe+OTshSJ2uOUAKSOiR3wXQ66kUGJO83NbP05j4iMuT/AjLFh3SU7v4Q2ilEPMKo1n1P9vmOnHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KP0N3Dgy; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b79ea617f55so325788366b.3
        for <linux-usb@vger.kernel.org>; Thu, 04 Dec 2025 23:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764919130; x=1765523930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsMHGvD/L2cl1gvl2dpYshqQ2m4skfcwhzojI9XPoqo=;
        b=KP0N3DgyX+BOKhBbs/qpvir8R6jOj2XOa28SwTPBlCzLUtPTE74bmA/eEME4mhNgi2
         xTiHyMcXp2T/k6mYwZY5Qc+KNYq4ofZosRP9j3qiPwfvEgHak0R2y4h61MypMNOtaEDx
         NuZk9zmbZALcSzhMMADNlPZVfUv68588Ck+LRTTKkul4erd9+LeWT0Hm/rdzMikZxxMr
         5EEUytFW/0XNRGJuJ+aU1ycyRdbUNJDgP65vnqWgoAxKGvMviY1RG22Y2XE4rJGkFSu7
         28ZZZkpKU/X0b7GaaOv+apFKCzaFiS3JNesxuL0MTxOa6/iIFO2vgvpaT9PxtNiUS9Kh
         Hmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764919130; x=1765523930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MsMHGvD/L2cl1gvl2dpYshqQ2m4skfcwhzojI9XPoqo=;
        b=DmwX5KXKxieBWvBa0mIi59lopV3rSuBa8OjnaELi8PPfcPeLvJ7buQt3N1MnCIaAET
         m2Qzt55kuTpA/gZNy2Yu8Y4OjuJRYFwRVsWeTSXLMZg8HWnmYXc5VF9I1Ef4AnD7Qwm/
         4WKYgfcpT8M7OiVIBM+YS8hG6NvROPiQAFV57/ubs1U0lTJhaVTMRPA63e8039pbSwTr
         ilb4ApW1I+02ln6ph4oW8nNC8+JxcKndRQMGuJq2FX1c/WNLaOA4sSrthm8e4bpWvD5q
         Cp5sPSY581P/iOGtbW0MOrFrtqTEeE7YMii0oifSxRfaItuRVBWeyBvgLFv2BRcf0+7Q
         3GDA==
X-Forwarded-Encrypted: i=1; AJvYcCXckqmYw+1s7xXtIYIDtnUNjfan0B/U7HAbvLolTpVbWBhDhjvJ3RbbQkFFghIscyt+58XhQouksTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXiv/C6QRxeRgZcDgVecrF6ptusj1L2FyGHsWokt3MnDx7siWt
	WfGhtg/5MTWqJEp9SHnOKSI2H5U/xA8H22hG23TpjxT8B1GThfg3ZRR9KI/JwRCJqPdNSQfc5X/
	uPRKNsnO2mk56/Hejk80XITB73CGvyknBank=
X-Gm-Gg: ASbGnctDvrtNvvRrHV5t8MlK1fIrnpybYrQR/NVH8a3kWY9IOPhLKA+l786hjdRQF0V
	CtW8iDOangEZGSrz8ED2hZfE4QS/P93YfjS6cyS3pRsypllp9J8KXV9KwveMgt2UV+xfZ+PG+hI
	JCJbKs8fmEPQvM031YBJWAZEzzj+MFFASfRW6y+KukjInf9uIUMFekeHB3xZPJIalii5mk1yy9f
	H4JWzVU6GTjE4mQXP2rLjxWG6TpGGsF19QfaBDGuGS03Xd72osFymDCsbDpCqIUCroVTrKMhQiP
	cLOivQ==
X-Google-Smtp-Source: AGHT+IG2mKxnkeYmMnLA0TQvguPs7mX3UyCdCsEyyCmkkoxC/g3P6ESxGW8keTfKSpgzrnT0UodfOldwiY2ryYSIIe8=
X-Received: by 2002:a17:906:114d:b0:b79:fc29:ebd2 with SMTP id
 a640c23a62f3a-b79fc29ec72mr248521166b.3.1764919129567; Thu, 04 Dec 2025
 23:18:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <2025101544-galore-sculpture-b243@gregkh> <CAAcb1K85GK6m_bVUeSfX1GP4=mxzwfmHtaRX0EYD_jgGfQRk9Q@mail.gmail.com>
 <4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com> <CAAcb1K_a2dkj5wv__1BW-fu_Zg=z00OmQzJmekQ-GH4svYQ-GQ@mail.gmail.com>
 <f0d0f71c-bc47-4348-85a6-d728a67c982a@linux.intel.com> <CAAcb1K-o7DY3Kvqdr+=MN8OsgRZr+g43-zC6YSLG0hbNxEQUeg@mail.gmail.com>
 <8fe27842-8155-44db-b262-a148b5ce5436@linux.intel.com> <CAAcb1K9MDvqJgVbV29ax8tQhXoepJr5ABuh1NHoNpmFdnGxVHw@mail.gmail.com>
 <65b65e02-e51e-4e7e-ae9e-78d755eb8566@linux.intel.com> <ba3692e7-6818-41af-8748-71a91cb13db5@linux.intel.com>
 <CAAcb1K9X+ZgigmiQ9btvV5vs+1UmxyZC39RCnS0tVZZUuYjToQ@mail.gmail.com>
 <9dc78bbb-b9db-4ab3-8cd9-bac40e0c8653@linux.intel.com> <CAAcb1K_piCRo07Jf3Bzd9tzH9HKxPFisPARGE6OZOhd55-NLyQ@mail.gmail.com>
 <CAAcb1K9QEzaDnTKZJ1AiZ18iLL50z91F6BOB=uj47ma2NLwM8g@mail.gmail.com> <aa85ca5c-1594-4775-8d88-141690c2ab56@linux.intel.com>
In-Reply-To: <aa85ca5c-1594-4775-8d88-141690c2ab56@linux.intel.com>
From: Milan Oravec <migo.oravec@gmail.com>
Date: Fri, 5 Dec 2025 08:18:38 +0100
X-Gm-Features: AWmQ_bmgnprjLSK4ulSEmopHIZzZURbFg1JpGrZgh8X3JTsRCk3jiCe4125NPxo
Message-ID: <CAAcb1K9hiyWaUOk_KHLDEWc9055zWLa0RFQfpU7N=E_zFoXPPg@mail.gmail.com>
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Mathias, thank you very much for looking into it. I was reading
DbC messages on debug host with this script:

=3D=3D=3D=3D=3D start of bash scripts =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
#!/bin/bash

while true ; do
        while [ ! -d /sys/class/tty/ttyUSB0 ] ; do
                :
        done
cat /dev/ttyUSB0
done
=3D=3D=3D=3D=3D end of bash scripts =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

but I will try it with minicom as you suggested and report back.

Thank you! Kind regards,
Milan

On Thu, Dec 4, 2025 at 9:46=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 10/31/25 15:15, Milan Oravec wrote:
> > I'm sorry but I can't provide better feedback. When the USB cable is
> > connected during initramfs loading DbC is connected, but the system
> > stops booting with no messages in the DbC host. When I let USB
> > connected prior to the boot, DbC is not initialized. What should I try
> > else? Any ideas? Thank you!
> >
>
> I was able to set up a similar system, and I could reproduce this.
>
> I think that firmware/BIOS is controlling xHCI and uses it for debugging =
before kernel loads,
> so if cable is connected too early then it gets stuck in firmware control=
.
>
> I can see on the host side that a usb device is connected almost immediat=
ely after
> power on, and it has a different vendor and product ID than what early xd=
bc driver sets:
>
> host log if cable is connected before power on:
>
>    [3474920.221407] usb 4-1: new SuperSpeed USB device number 65 using xh=
ci_hcd
>    [3474920.233582] usb 4-1: LPM exit latency is zeroed, disabling LPM.
>    [3474920.233673] usb 4-1: New USB device found, idVendor=3D8087, idPro=
duct=3D0b21, bcdDevice=3D 0.00
>    [3474920.233677] usb 4-1: New USB device strings: Mfr=3D0, Product=3D0=
, SerialNumber=3D0
>
> host log if cable is connected when loading kernel:
>
>    [3475961.148597] usb 4-1: new SuperSpeed USB device number 73 using xh=
ci_hcd
>    [3475961.160775] usb 4-1: LPM exit latency is zeroed, disabling LPM.
>    [3475961.161016] usb 4-1: New USB device found, idVendor=3D1d6b, idPro=
duct=3D0010, bcdDevice=3D 0.10
>    [3475961.161020] usb 4-1: New USB device strings: Mfr=3D1, Product=3D2=
, SerialNumber=3D3
>    [3475961.161022] usb 4-1: Product: Linux USB GDB Target
>    [3475961.161023] usb 4-1: Manufacturer: Linux Foundation
>    [3475961.161025] usb 4-1: SerialNumber: 0001
>    [3475961.162413] usb_debug 4-1:1.0: xhci_dbc converter detected
>    [3475961.162480] usb 4-1: xhci_dbc converter now attached to ttyUSB2
>
> when actual xhci driver is later loaded it resets the controller, which t=
hen gives
> linux kernel full control.
>
> Maybe we should reset xHCI in early xdbc driver as well.
>
> Regarding "system stops booting with no messages in the DbC host" issue,
> it appears either messages or whole boot is blocked if nobody is reading =
the
> messages.
>
> try to read them and see if it helps.
> "minicom -D /dev/ttyUSB2" on host worked for me
>
> Thanks
> Mathias
>


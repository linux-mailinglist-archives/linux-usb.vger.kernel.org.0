Return-Path: <linux-usb+bounces-31238-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BACCAB3B1
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 11:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5BED3032FFC
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 10:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB6A28489B;
	Sun,  7 Dec 2025 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VO6oeVmP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6113D76
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 10:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765104468; cv=none; b=i0i5fy6fsDnARLK6/FyEDO/AT0Gevgu42mCJxHD72WtU6/bO7Woa8Rp3LpRnXuYNTjztHIMBVl2JGK8PAyAIcDX9sOm9ibr1/+WdOpCP7nEL/a9Ze3Fzw6YoVqq171nUyH7BDxcEW7EbnHrN56IyQuGYA9SB68jURN/YsgxIPYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765104468; c=relaxed/simple;
	bh=xP+0SVtVspi0+G79aNp9AyFHmC9yiDXopoang1jkb5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKucF3oKoNGqyeDzPTU7BginlOzRMyqpaOeH2PkEijMIA4SWbyH7zCbagy3a4IzGX9pzO76W7I5w/oJJ9Yhkk1jSaOS828dTIM1uaFygUjiermcF5WeV53uektz6jOXFDZ5EQTqOAR3vh13y+KghIIcDQf3AK+MdfC3seb9m6lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VO6oeVmP; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4510974a8cdso1925151b6e.0
        for <linux-usb@vger.kernel.org>; Sun, 07 Dec 2025 02:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765104465; x=1765709265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gFTWgF5R594M9CAV4R1m+SIXDgDwwP/nrl26geopHY=;
        b=VO6oeVmP5emiL5bZpceYyaJm9eLmfNpqgCa978BFerJAQ8Ly0poapGJs3XjaKl76kK
         Ku5tadIw7zvXghK3kDUUdLPv1yr6aZAKtEBQPWNN9PYWx9zMGyBU0g/7smBhD6/8+3mX
         8WpyJ98fgCPJewLWtjt42outCMKnXzOSfUV4GlLKUeFqKvbvFMX9I3xcK7NngxnUX38C
         VijmyV4SfLzzzMCJ0RihZy13gNjSsVAAqqlpzbhizWoDMIDdkSiHpsKqYBDczVFl38Z6
         lQlbzF28cqDqvtzlWAZzKYnDp/0gy3Q+DTV+fC/FeRCrH7acd7AxIVZYmZ+AGr8kCJKB
         7BhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765104465; x=1765709265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7gFTWgF5R594M9CAV4R1m+SIXDgDwwP/nrl26geopHY=;
        b=ueLjPFNS1eEYq3vNptiq24ZH4EonJ4Px/gVkb9AZJLwhabw6wMxnv2JdEitSi947PI
         xOc15t0gbg6A9CjWQth9321YoDwzhx0pyvvNwr83fptLLI9DLTi/IVQNIKv7DuhSvW2d
         l8H1M+DcieRUHkc9z2+uuePwW3SxJ5nLgq7lP72s5W02iPiijJZTOn9ReDtMFqxxn5v0
         s+odZ0JGsVAFpWfZN3p6H+3MhNwQrfij9rrhBpNwJRRfZgYgCGQkfavIMonRMzUrpEVO
         UolYHeKxKnD+dGQxl4Em/dws33830OGDtlIUAUMUUP2NkUMXKEGcmB5Lw3jHYunumxRU
         Rp+w==
X-Gm-Message-State: AOJu0Yw5QwE8VwgrvCO3I0bRMxSYQ1HpvHC+RIIS+/yM5jNujki2nyss
	Iv8JumDRMcFaxiQASAPrU+FtHfI/2ATbeHURcqUPaag6y4aA1iHY2KivHtwZER37yBU0OtObbgO
	EZZtHUuMIVcCcbZjVOA/S8ynzvDyjC6A6myCnztELHQ==
X-Gm-Gg: ASbGnctAlq9Wx0ZzCfweiudea++onwopslACZypzLtNeEMS2bPmZp3answ0bKNJ0D8G
	/ifKDAA/+x7Gm71OOgLYXq/+SCMvrQDdMsCjjiu1TuwCAVasvqMZayFhGrrym/OWGnMzmdcBmna
	fcqKVF8+vYnY1DteX7GSb1NHWpAwFEoVv64pO8pLHRVMQYzx4heGuRsHcH3CynNnCMMbJpBwBiw
	70YHa/flQ7g/VKgX5wbOcHT2smL78XoE3o7kYMksoyxlqhRUKFoXTN7RJKMof7Bhy7FvlAC
X-Google-Smtp-Source: AGHT+IGHwp9fLSkW3X2v68K70UtwVPYj7VQfoCv0ml/ie/Bj5RT0WLBhWSufbUsum2cNscbM/C2ejRg+0ybP0r/3+Dg=
X-Received: by 2002:a05:6808:6507:b0:450:b215:8f22 with SMTP id
 5614622812f47-4539e098cc9mr1889509b6e.55.1765104465284; Sun, 07 Dec 2025
 02:47:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025120708-header-startling-ffaf@gregkh> <20251207012059.7899-1-johannes.bruederl@gmail.com>
 <20251207084012.7c232e52.michal.pecio@gmail.com> <CAP=XvD+dNNDj75DYjjByE3o7F8i-QxusAdz-5+hG24fCesWYRw@mail.gmail.com>
 <20251207104505.1d5f3718.michal.pecio@gmail.com>
In-Reply-To: <20251207104505.1d5f3718.michal.pecio@gmail.com>
From: =?UTF-8?Q?Johannes_Br=C3=BCderl?= <johannes.bruederl@gmail.com>
Date: Sun, 7 Dec 2025 11:47:34 +0100
X-Gm-Features: AQt7F2py01xPCU7ZUjfuTuVkF92Yyvzr36_aUtaq2WYZeELrkvR5rjuPGiEYRa4
Message-ID: <CAP=XvDJJP2orxYcgiKzp0FrQE2UMiXndZe8Z6BdBRFvkujWu5w@mail.gmail.com>
Subject: Re: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that hang
 on BOS descriptor
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 7, 2025 at 10:45=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Sun, 7 Dec 2025 10:22:41 +0100, Johannes Br=C3=BCderl wrote:
> > Here's the BOS Descriptor section when running w/ root.
> > This is without this patch, so it "reconnected" with SuperSpeed (5Gbps)=
.
> >
> > Binary Object Store Descriptor:
> >   bLength                 5
> >   bDescriptorType        15
> >   wTotalLength       0x0016
> >   bNumDeviceCaps          2
> >   USB 2.0 Extension Device Capability:
> >     bLength                 7
> >     bDescriptorType        16
> >     bDevCapabilityType      2
> >     bmAttributes   0x00000000
> >       (Missing must-be-set LPM bit!)
> >   SuperSpeed USB Device Capability:
> >     bLength                10
> >     bDescriptorType        16
> >     bDevCapabilityType      3
> >     bmAttributes         0x00
> >     wSpeedsSupported   0x000e
> >       Device can operate at Full Speed (12Mbps)
> >       Device can operate at High Speed (480Mbps)
> >       Device can operate at SuperSpeed (5Gbps)
> >     bFunctionalitySupport   3
> >       Lowest fully-functional device speed is SuperSpeed (5Gbps)
> >     bU1DevExitLat           0 micro seconds
> >     bU2DevExitLat           0 micro seconds
> >
> > (Missing must-be-set LPM bit!) seems to be weird? As it looks like
> > just nulled data.
>
> OK, so it's broken during enumeration and after enumeration.
>
> But that's the "fallback" case after hanging during SS+ enumeration,
> which we would like to prevent from happening. What about 5gbps ports,
> does it work correctly at SS or still report zero LPM?
>
> And running at SS+ with the patch applied, does the device produce
> sensible BOS descriptor? The previous one did.
>
> What if you extend the patch to also apply at SS? It won't fix LPM
> during enumeration, but would it fix the descriptor seen by lsusb?

Hello Michal,

very good questions.. the result was surprising to me.

1) How does it do on 5GBps port?

Without patch:

[ 1522.177297] usb 6-1: new SuperSpeed USB device number 4 using xhci_hcd
[ 1527.440481] usb 6-1: unable to get BOS descriptor or descriptor too shor=
t
[ 1527.465514] usb 6-1: unable to read config index 0 descriptor/start: -71
[ 1527.465520] usb 6-1: can't read configurations, error -71
[ 1527.648035] usb 6-1: new SuperSpeed USB device number 5 using xhci_hcd
[ 1527.839295] usb 6-1: LPM exit latency is zeroed, disabling LPM.

Looks like the BOS descriptor cannot be read either.

Any, very interesting:

Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0016
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000000
      (Missing must-be-set LPM bit!)
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   3
      Lowest fully-functional device speed is SuperSpeed (5Gbps)
    bU1DevExitLat           0 micro seconds
    bU2DevExitLat           0 micro seconds

Very interesting - even reading it "manually" via lsusb - seems to
fail, even at SS.

2) Does it produce a sensible BOS descriptor post-patch at SS+ ? It
looks like it.
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x002a
  bNumDeviceCaps          3
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x0000f41e
      BESL Link Power Management (LPM) Supported
      Baseline BESL value    400 us
      Deep BESL value      10000 us
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
  SuperSpeedPlus USB Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x00000001
      Sublink Speed Attribute count 2
      Sublink Speed ID count 1
    wFunctionalitySupport   0x1100
      Min functional Speed Attribute ID: 0
      Min functional RX lanes: 1
      Min functional TX lanes: 1
    bmSublinkSpeedAttr[0]   0x000a4030
      Speed Attribute ID: 0 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[1]   0x000a40b0
      Speed Attribute ID: 0 10Gb/s Symmetric TX SuperSpeedPlus

3) What if I apply the patch to SS as well?

Connect:
[    3.293251] usb 6-1: new SuperSpeed USB device number 2 using xhci_hcd
[    3.349030] usb 6-1: skipping BOS descriptor
[    3.429817] usb 6-1: New USB device found, idVendor=3D0fd9,
idProduct=3D009c, bcdDevice=3D 0.02
[    3.429825] usb 6-1: New USB device strings: Mfr=3D6, Product=3D7, Seria=
lNumber=3D3
[    3.429828] usb 6-1: Product: Elgato 4K X
[    3.429830] usb 6-1: Manufacturer: Elgato
[    3.429833] usb 6-1: SerialNumber: A7SNB517214G5K
[    9.019651] usb 6-1: 3:2: failed to get current value for ch 0 (-22)
[    9.028103] usb 6-1: Found UVC 1.00 device Elgato 4K X (0fd9:009c)

sudo lsusb -v -d 0fd9:009c
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0016
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000000
      (Missing must-be-set LPM bit!)
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   3
      Lowest fully-functional device speed is SuperSpeed (5Gbps)
    bU1DevExitLat           0 micro seconds
    bU2DevExitLat           0 micro seconds

Again (Missing must-be-set LPM bit!).

So.. if i summarize it correctly: on SS, BOS fetch seems to fail
immediately when connecting, but also "later" when I use lsusb.
But, on SS+, if i skip BOS fetch on connect, it works when done later...

For what it's worth: I've recorded a few hours of Gameplay with the
patch, and rebooted a couple times, it seems to do the trick.

BR,
Johannes


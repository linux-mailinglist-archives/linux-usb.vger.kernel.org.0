Return-Path: <linux-usb+bounces-19253-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3535A0B828
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 14:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEB9A1658A4
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 13:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE1C1CAA66;
	Mon, 13 Jan 2025 13:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLceS+Kc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AC6BA4B;
	Mon, 13 Jan 2025 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774979; cv=none; b=oKbeGy4s/NGZUa+CWBs1cAGhpW2QRnE/XH7MrGiJJ+6bzKaEafYo0lGvrkruvkXevwPxsdpyAWfNNYO9OBPd3CRCC8Bc+iuAG+TVW9KH9VwOm3B/EHH5JUWDx3X2NHXLJdx+h73qbDdT+SsOzGb1ORbC9L3dYPSLMNnaJHCShfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774979; c=relaxed/simple;
	bh=71L+W0h5TdU6E8Avzu9ibQzFJplCEwz1FP2YjnTwvmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3KP3nWlwjEku2EtbxA7pJLcDX/Pef9YH0GnO9b+NrLQjR0v8AwXMXyGuDeAT5uvLRGM6xjDyp6St8fjjlUoBixNay1t+tDP71pItvCqco2nh6RyvHT6RR8zvHC0ojiuffeJQ45yhHG+mhwBG3GINdmu4Y+VaGTMJkOEDoAyHfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLceS+Kc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso2277653f8f.0;
        Mon, 13 Jan 2025 05:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736774975; x=1737379775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YT6gGaBfcX0S/XtfuSOyEOtTxo2D9TBTGAvaOd32fc=;
        b=nLceS+KczwyXXUWtiQXJBdABmS6d8aKfQ/JjH2uozrs9SfUXMmSwkh3yWcfCl0QGU3
         lkDy08MqHzjr+xAw8bFmxmUFFO6ezAEvNIHluio8G51AiD1OalORC3jSmhsH8qi45by/
         M2nXPgObQOMvSxgbpjWK8K6NNfOAvj6KUQZFVWA8v3a9MhWNW2HUR9GwY34MfTj/72jC
         juRJ+eMDaZhUn9iAdVrVIhOoWAaXFeBMnUGEbHwFP0M2FEmzgceDdJvyqWpRwRTvOWjC
         xdbcADGGTu7SoYH2Ly65UPoxPsfhpkBoYOPynP1WN/sydRq9XR/ogTQjqgNqtemJQxjU
         p6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736774975; x=1737379775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YT6gGaBfcX0S/XtfuSOyEOtTxo2D9TBTGAvaOd32fc=;
        b=YvIL54wsE776KHmF+8J3525Znz7ApOfaCTBvLodW3tMpOGUODxHRQFkZkh1Ybc6GNo
         O5rngz8Xwp9M7BeMYQlYkDd5lErNy+wmzAsAM/Te4DK0iZiBg2i6X4tzEBvwJeywVqZJ
         O4Fi3neVFw22LUPrG7lfxMZjWqQRYX6l7txTYU+8HWHfuV5+5stRAfGhOAlmyFoZYTK9
         5AQimkSwxNEIqNvb9X74KoYaakymAgSF4CwdZCjsdRKSr3OP9KxllvX4sbX2M5hm+pSI
         liFHw01U/waU9OpNl4eZoDc6wIF+pU/C3LF2S0/RH/872vu+MdBVS8QF2KnCpxfbdTs4
         g6xg==
X-Forwarded-Encrypted: i=1; AJvYcCUBbXyQx8ktIYptreS1zgDQx3zGVtwNRVsG9SyKG6NeP90kowKhRrlrnP8pRA8onFDHYvJEHdrNIFd6@vger.kernel.org, AJvYcCVwPuf9VMbdYo1HD2tQkDAql92aBXQDt2LF90IwSv40SOLEsng4KPwcv21YY3Ic+Xu4gMgMA5JqsuyFN/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW/j5qblZn0QFftOy2r0KmIKX+AjRD/NMUr7fcqZwqgz6x7fsC
	wakTma2G/90jZL+W8KIpEujiscwZDtpm6nVBlUpIjiU3VmfuaRMVpC5/Nk6D7WeMJf6iAdO9vUi
	+xugCP/WDivrwPAAU/m0eSBXVH3WtHx3v
X-Gm-Gg: ASbGncuda6F7AZ4pqT+qJ+V0bBpH2h9cRasLRCZkL0XY8qoMUiHPwyNaR1pE5DApbD1
	cLS+rC77HzEl0H2yPn8nJsIwoARwt7bNSrVccMg==
X-Google-Smtp-Source: AGHT+IHo+zbxCDb5KD4dwZiuf5dhaK5FlNNyB97WgmpCwZmmP6aB8SkL32msCHKm9YILO07OMpDMHdsOuIqRcEOdJrA=
X-Received: by 2002:a05:6000:1fa8:b0:38a:a083:9200 with SMTP id
 ffacd0b85a97d-38aa083947dmr6046440f8f.44.1736774975193; Mon, 13 Jan 2025
 05:29:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231161539.20192-1-xndchn@gmail.com> <20241231161539.20192-2-xndchn@gmail.com>
 <5ad65964-dcf7-47d2-8e5f-bf82066e55f4@linuxfoundation.org>
 <CAJ=gGT3pAnKUCve1OV5SXVArz6HUdizu9wjM5tPJ_CrQ=sF=nw@mail.gmail.com> <2ff39cff-af3c-4020-81b3-4238efe6c2e3@linuxfoundation.org>
In-Reply-To: <2ff39cff-af3c-4020-81b3-4238efe6c2e3@linuxfoundation.org>
From: xndcn <xndchn@gmail.com>
Date: Mon, 13 Jan 2025 21:29:23 +0800
X-Gm-Features: AbW1kvbvPFRAJAsO_mSweDy13kD00YuGPhi5dfdbYbL83gkclwLvrsT4Ey6Yw08
Message-ID: <CAJ=gGT3Z85Hshfw5eb5JgM0CA-V_O1MW1hbfbdyp8Be0bG6SvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] usbip: Fix seqnum sign extension issue in vhci_tx_urb
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:USB OVER IP DRIVER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

without the patch:
> [ 384.276605] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
> [ 384.278487] vhci_hcd vhci_hcd.0: new USB bus registered, assigned bus n=
umber 1
> [ 384.278509] vhci_hcd: created sysfs vhci_hcd.0
> [ 384.278532] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.12
> [ 384.278535] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
> [ 384.278536] usb usb1: Product: USB/IP Virtual Host Controller
> [ 384.278538] usb usb1: Manufacturer: Linux 6.12.0-00971-g158f238aa69d-di=
rty vhci_hcd
> [ 384.278539] usb usb1: SerialNumber: vhci_hcd.0
> [ 384.278630] hub 1-0:1.0: USB hub found
> [ 384.278637] hub 1-0:1.0: 8 ports detected
> [ 384.278740] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
> [ 384.278781] vhci_hcd vhci_hcd.0: new USB bus registered, assigned bus n=
umber 2
> [ 384.278788] usb usb2: We don't know the algorithms for LPM for this hos=
t, disabling LPM.
> [ 384.278801] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.12
> [ 384.278802] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
> [ 384.278803] usb usb2: Product: USB/IP Virtual Host Controller
> [ 384.278804] usb usb2: Manufacturer: Linux 6.12.0-00971-g158f238aa69d-di=
rty vhci_hcd
> [ 384.278805] usb usb2: SerialNumber: vhci_hcd.0
> [ 384.278866] hub 2-0:1.0: USB hub found
> [ 384.278869] hub 2-0:1.0: 8 ports detected
> [ 384.279071] insmod (400) used greatest stack depth: 11960 bytes left
> [ 550.127351] vhci_hcd vhci_hcd.0: pdev(0) rhport(0) sockfd(3)
> [ 550.127356] vhci_hcd vhci_hcd.0: devid(0) speed(3) speed_str(high-speed=
)
> [ 550.127359] vhci_hcd vhci_hcd.0: Device attached
> [ 550.341007] usb 1-1: new high-speed USB device number 2 using vhci_hcd
> [ 550.452995] usb 1-1: SetAddress Request (2) to port 0
> [ 550.464332] vhci_hcd: cannot find a urb of seqnum 2147483648 max seqnum=
 -2147483648
> [ 550.464842] vhci_hcd: stop threads
> [ 550.464843] vhci_hcd: release socket
> [ 550.464845] vhci_hcd: disconnect device

and with this patch:
> [ 746.253823] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
> [ 746.254660] vhci_hcd vhci_hcd.0: new USB bus registered, assigned bus n=
umber 1
> [ 746.254669] vhci_hcd: created sysfs vhci_hcd.0
> [ 746.254895] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.12
> [ 746.254897] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
> [ 746.254898] usb usb1: Product: USB/IP Virtual Host Controller
> [ 746.254899] usb usb1: Manufacturer: Linux 6.12.0-00971-g158f238aa69d-di=
rty vhci_hcd
> [ 746.254899] usb usb1: SerialNumber: vhci_hcd.0
> [ 746.254964] hub 1-0:1.0: USB hub found
> [ 746.254985] hub 1-0:1.0: 8 ports detected
> [ 746.255042] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
> [ 746.255066] vhci_hcd vhci_hcd.0: new USB bus registered, assigned bus n=
umber 2
> [ 746.255072] usb usb2: We don't know the algorithms for LPM for this hos=
t, disabling LPM.
> [ 746.255081] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.12
> [ 746.255082] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
> [ 746.255083] usb usb2: Product: USB/IP Virtual Host Controller
> [ 746.255089] usb usb2: Manufacturer: Linux 6.12.0-00971-g158f238aa69d-di=
rty vhci_hcd
> [ 746.255089] usb usb2: SerialNumber: vhci_hcd.0
> [ 746.255118] hub 2-0:1.0: USB hub found
> [ 746.255120] hub 2-0:1.0: 8 ports detected
> [ 756.967922] vhci_hcd vhci_hcd.0: pdev(0) rhport(0) sockfd(3)
> [ 756.967928] vhci_hcd vhci_hcd.0: devid(0) speed(3) speed_str(high-speed=
)
> [ 756.967933] vhci_hcd vhci_hcd.0: Device attached
> [ 757.184367] usb 1-1: new high-speed USB device number 2 using vhci_hcd
> [ 757.296479] usb 1-1: SetAddress Request (2) to port 0
> [ 757.309845] usb 1-1: New USB device found, idVendor=3D1234, idProduct=
=3D1234, bcdDevice=3D 2.80
> [ 757.309848] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D3
> [ 757.309849] usb 1-1: Product: foo
> [ 757.309850] usb 1-1: Manufacturer: bar
> [ 757.309851] usb 1-1: SerialNumber: 0

to make the bug easier to reproduce ,I have changed the initial value of se=
gnum:

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 8dac1edc74d4..92a60e89b459 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -1192,7 +1192,7 @@ static int vhci_start(struct usb_hcd *hcd)
                vdev->rhport =3D rhport;
        }

- atomic_set(&vhci_hcd->seqnum, 0);
+ atomic_set(&vhci_hcd->seqnum, 2147483646);

        hcd->power_budget =3D 0; /* no limit */
        hcd->uses_new_polling =3D 1;

On Fri, Jan 10, 2025 at 12:02=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.=
org> wrote:
>
> On 1/3/25 08:18, xndcn wrote:
> > Thanks.
> >
> >> How did you find the problem?
> >> Why does it make sense to cast it to u32?
> >
> > After running with usbip enough time, I happened to see logs like this:
> >> [ 293.863125] vhci_hcd vhci_hcd.0: Device attached
> >> [ 294.081110] usb 1-1: new high-speed USB device number 2 using vhci_h=
cd
> >> [ 294.193163] usb 1-1: SetAddress Request (2) to port 0
> >> [ 294.204334] vhci_hcd: cannot find a urb of seqnum 2147483648 max seq=
num -2147483648
> >> [ 294.204850] vhci_hcd: stop threads
> >> [ 294.204851] vhci_hcd: release socket
> >> [ 294.204853] vhci_hcd: disconnect device
> >
> > Then I notice that on 64bit platform, when
> > atomic_inc_return(&vhci_hcd->seqnum) returns (2147483647 + 1, or
> > 0x80000000),
> > priv->seqnum (which is unsigned long, i.e. u64 on 64bit) will be
> > extends to 0xffffffff80000000
> > So we can fix the issue by cast it to u32.
> >
>
> Can you send me the dmesg without and with your patch?
>
> thanks,
> -- Shuah
>


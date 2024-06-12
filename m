Return-Path: <linux-usb+bounces-11160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD54990487D
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 03:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA3D81C228F7
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 01:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A60F4A15;
	Wed, 12 Jun 2024 01:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTV8i3jD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D86FAD54
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 01:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718156401; cv=none; b=GBuCi9r7TRfDQkFtBtQ6dWvXW/dWFjW1M//tD+xmSaXBJprhHod0aCwJLTrSmpIMff5lq4g9/5/9/ymeUllFU3ZPjymJ78xbrCrR7RyVET5T6Opa8lhLFqJJ1JGWBfWaBNqC3aEjLO/gIpFtmM3x73qFu6T4Kf4Qz2UnNy4bgSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718156401; c=relaxed/simple;
	bh=XvZawrNFaMNQsYNLGlsvIyMOSBnBG888WsL7h0MV0MU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KR4zI3VqzN+d6PxD6wuj/sghNvQR+S1DXdiPqcWpMCzlFiVIB/rbzE2l3aI1Xo0WnkRH71M93SkYK0AvTcLmyMvxX8Z9IS8OPtz4nMqBSU6Q4wHx3+BjzOARKrBZgP+atAb+6FKgw0Nl3hrue8Bcl1oOFgspJ7pJGFu8elhMmA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTV8i3jD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35e1fcd0c0fso5112225f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 18:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718156398; x=1718761198; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FFQ/yvQKHlBYG8ZQI/GY926VHTRG6IwMI8ctNgOKzA=;
        b=lTV8i3jD1DGZ300+m9IZ1iUqkVRPPInIyu0z8uZ5WeRkokItj1U4RMam3VpT5iRwvx
         6jxyCd3kBhOtFmz3DYGZNv+oW275p917GdVQ0vwDfbhLL8IToIrsD6xKtldCdHPtwkiX
         5cEtz1XtB+yQmxrMoCJV3UZvRpzAIfXe49txNkgbVyqknIpApEQCCSurpUMmd1KB4ZQ7
         WglPFP0FI5j2J9Xyr5UVkgD59K7UY0ETOA5tSKh01zWsCrvSjvHvm9jMvb5RMLAfsLL5
         wkDuT4cVhQ2RIZr13grAtaUlFlj4DPXUKRDlVtXxO9+sctbSneKapJ9yTDi/wpbK+3vN
         lIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718156398; x=1718761198;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9FFQ/yvQKHlBYG8ZQI/GY926VHTRG6IwMI8ctNgOKzA=;
        b=iIhFBxK4lqXpI1My6XYu2Hq5bKTPuqO+FII7/eh5AGSn9AfR8fJZVqLqkL+sP0axt/
         5UrlwJj94GVFQjTxc9pGlTtyvQqhdQLyC6vyHvtRGNjNQUnSqN0VTO9WS8JPWayCmiAi
         zz8qBrdwt7WhFf7y42r/Q9QBzMQT7fdfpgj8Xit/bJ4sLbR2kbgGtXBVpBtILnm0hbw4
         Ppzpeitaa4AUEHFX7pjVJ91KTHI35ML1llYYpH958LNCN89Zn+szRzMFYPW8tzaFsuTu
         yzfhzJjXTFxZiybclf/p56IxcA+KuKaYLXduLrZgw0pjuuIZ8059aR4a0YboO6rfjiWS
         bZ8A==
X-Forwarded-Encrypted: i=1; AJvYcCWeICt67AHe9b+4Pq5qORW55JDSpimLYWlGQJzbYEncNRD8x+0ocP2RNRW2gaT+K5AWzasDhZwqU4VaJt5SgaigtzhnCV5oXqyK
X-Gm-Message-State: AOJu0YymuWM8rwj3SGyflXFjRLW6dNjRPpRv3kOUtPY6Vbzt3Xw+ldyv
	Nnhk2t2fJhqFmY+XLzIwIs1YKeVXd8HysCt6QR8DW34J2atjCXZe
X-Google-Smtp-Source: AGHT+IFV0V4efSNGhgnTTCrNTvviY/Y01WU+Yfts58e70GY29QqZybypEUMK3wwYKjxcBlqZYnRf9w==
X-Received: by 2002:a5d:4d87:0:b0:35e:8364:f4d4 with SMTP id ffacd0b85a97d-35fe892484dmr183912f8f.58.1718156398221;
        Tue, 11 Jun 2024 18:39:58 -0700 (PDT)
Received: from hermes.prahal.homelinux.net (91-175-163-178.subs.proxad.net. [91.175.163.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5fc47ebsm15114676f8f.108.2024.06.11.18.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 18:39:57 -0700 (PDT)
Message-ID: <25ee57cfbe5c2ab6522ae4e0992f68c4c9a70766.camel@gmail.com>
Subject: Re: add NO_REPORT_LUNS quirk for at least a few Seagate external
 drives to fix smartctl with uas
From: Alban Browaeys <alban.browaeys@gmail.com>
To: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Date: Wed, 12 Jun 2024 03:39:56 +0200
In-Reply-To: <48c94250-64b3-4a19-9c87-0f48a2ceb425@suse.com>
References: <9791b3eee4fc52b45f1ea9b9724bf977bf5c38d4.camel@gmail.com>
	 <48c94250-64b3-4a19-9c87-0f48a2ceb425@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 11 juin 2024 =C3=A0 10:21 +0200, Oliver Neukum a =C3=A9crit=C2=A0:
>=20
>=20
> On 10.06.24 21:25, Alban Browaeys wrote:
> > I found that for "smartctl" to work on my two Seagate Expansion
> > external USB3=C2=A0 I had to add the "j" usb-storage quirks ie
> > "US_FL_NO_REPORT_LUNS".
> > (They are years apart).
>=20
> Hi,
>=20
> does the attached patch do the job?
>=20
> 	Regards
> 		Oliver

No, it does not work.
smartctl is still broken with the US_FL_NO_REPORT_LUNS in
drivers/usb/storage/unusual_uas.h.

But if I add back the "j" usb.quirks flag back with:
echo -n "0x0bc2:0x2037:j" | sudo tee  /sys/module/usb_storage/parameters/qu=
irks
and then:
echo -n "2-2:1.0" | sudo tee /sys/bus/usb/drivers/uas/unbind
echo -n "2-2:1.0" | sudo tee /sys/bus/usb/drivers/uas/bind
then smartctl works.

I tested on tw kernels with the two different seagate drives.

sudo grep Seagate /sys/devices/ -r |& grep Seagate
/sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/manufacturer:Seagate
/sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/2-2:1.0/host8/target8:0:0/8:0=
:0:0/vendor:Seagate

head /sys/devices/pci0000\:00/0000\:00\:14.0/usb2/2-2/quirks=20
0x0

=20


lrwxrwxrwx 1 root root  9 12 juin  03:14 usb-
Seagate_Expansion_HDD_00000000NACSHZWL-0:0 -> ../../sdc
lrwxrwxrwx 1 root root 10 12 juin  03:14 usb-Seagate_Expansion_HDD_00000000=
NACSHZWL-0:0-part1 -> ../../sdc1

sudo smartctl -i /dev/sdc
smartctl 7.4 2023-08-01 r5530 [x86_64-linux-6.10.0-rc3+] (local build)
Copyright (C) 2002-23, Bruce Allen, Christian Franke, www.smartmontools.org

Read Device Identity failed: scsi error unsupported field in scsi command

If this is a USB connected device, look at the various --device=3DTYPE vari=
ants
A mandatory SMART command failed: exiting. To continue, add one or more '-T=
 permissive' options.


lsusb -t
/:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/12p, 480=
M
    |__ Port 001: Dev 002, If 0, Class=3DVendor Specific Class, Driver=3D[n=
one], 12M
    |__ Port 001: Dev 002, If 1, Class=3DAudio, Driver=3D[none], 12M
    |__ Port 001: Dev 002, If 2, Class=3DAudio, Driver=3D[none], 12M
    |__ Port 005: Dev 003, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        |__ Port 002: Dev 005, If 0, Class=3DVendor Specific Class, Driver=
=3Dcp210x, 12M
        |__ Port 003: Dev 008, If 0, Class=3DWireless, Driver=3Dbtusb, 12M
        |__ Port 003: Dev 008, If 1, Class=3DWireless, Driver=3Dbtusb, 12M
    |__ Port 009: Dev 004, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        |__ Port 003: Dev 009, If 0, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 1.5M
        |__ Port 003: Dev 009, If 1, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 1.5M
        |__ Port 004: Dev 010, If 0, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 1.5M
        |__ Port 004: Dev 010, If 1, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 1.5M
/:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 5000=
M
    |__ Port 002: Dev 002, If 0, Class=3DMass Storage, Driver=3Duas, 5000M
    |__ Port 003: Dev 003, If 0, Class=3DMass Storage, Driver=3Dusb-storage=
, 5000M
    |__ Port 005: Dev 004, If 0, Class=3DHub, Driver=3Dhub/4p, 5000M
    |__ Port 006: Dev 005, If 0, Class=3DMass Storage, Driver=3Dusb-storage=
, 5000M

with the "j" usb.quirks flag:
sudo smartctl -i /dev/sdc
smartctl 7.4 2023-08-01 r5530 [x86_64-linux-6.10.0-rc3+] (local build)
Copyright (C) 2002-23, Bruce Allen, Christian Franke,
www.smartmontools.org

=3D=3D=3D START OF INFORMATION SECTION =3D=3D=3D
Model Family:     Seagate Barracuda 2.5 5400
Device Model:     ST4000LM024-2AN17V
Serial Number:    WCKAEWZZ
LU WWN Device Id: 5 000c50 0e732b6d8
Firmware Version: 0001
User Capacity:    4=E2=80=AF000=E2=80=AF787=E2=80=AF030=E2=80=AF016 bytes [=
4,00 TB]
Sector Sizes:     512 bytes logical, 4096 bytes physical
Rotation Rate:    5526 rpm
Form Factor:      2.5 inches
Device is:        In smartctl database 7.3/5528
ATA Version is:   ACS-3 T13/2161-D revision 5
SATA Version is:  SATA 3.1, 6.0 Gb/s (current: 6.0 Gb/s)
Local Time is:    Wed Jun 12 03:30:47 2024 CEST
SMART support is: Available - device has SMART capability.
SMART support is: Enabled



Regards,
Alban


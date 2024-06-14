Return-Path: <linux-usb+bounces-11308-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 889B190801B
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 02:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBD3B1F22AC0
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 00:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D238184E;
	Fri, 14 Jun 2024 00:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLSeCw9A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869A4383
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 00:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718324305; cv=none; b=BEq3y3P+7UFG0dOi+Q1wywSZAOVUWyumB5RrUg1MKhAMjial1FPCzThVho1/R6jGrR/Q/AQZPcGE4sgBhwKgwH2w1DvvIBKdBaIvjw4Way2uH+4jZq026ePuGsQikEBm+ynGDULlXNXSJ9pIPxDw8z3awUb2PFCfX7SYQ2xbekI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718324305; c=relaxed/simple;
	bh=xmzixQ+dkCRgUtE2CORdKQdJyNqTrdkW8WpnoXIQ28U=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j5gWv55/e6eOVOyjO7uaRXa4AyNa/day1Kwr+AMcdMbIjPNAPUSPipZfR1Vv/SwKL8qXounRGOvviolK66sHmaNJyVkB3XLeDtkv2pRweZyos+N4srLPXrn42pEm5zD7QnTTHo6HMiM0CfHZ5L0z9BH1DkovXGIBQup/xM8yt/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLSeCw9A; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52bc274f438so2023037e87.0
        for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 17:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718324302; x=1718929102; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cly7QS5MUChlr8Ke0/SKST1oX08FgmuTupmLMhY5wn4=;
        b=QLSeCw9ALU7Qu0gnJXBc0kKQvToPyms5cTHUN3YYO8CIjLSxJn55EfL/ePbhOr+Rb7
         e83oVC2h/D9YaQVtpSN4wqseoaDGO1bqjy+EmiqfdTUwx3rdJJxkxzlJ6Vtaz9jPlF5y
         1xdGabecWakPjF9XXtSo/tfdsGsFHIi9GtY4EoHLA4SMSNpJQaq6P1MoA/nddArxZufM
         BDE5xioX6BzA1mnpuYSF5mby6U8TMgmT80VEhlnOW1t2ibqFd4mfVQYhj05ZCRdJfRMa
         DJTA394knHvqnufcJc+TzYoHDWvNpptbwmv/oYmdgJUBR2M0K8F3gSCj0mAT1V7qsjA+
         52gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718324302; x=1718929102;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cly7QS5MUChlr8Ke0/SKST1oX08FgmuTupmLMhY5wn4=;
        b=YSMOrGMs465clqCQY0JEcYdNV5z4blp4AERNAdBpx1m1ajiQhs2DYBcHjl+7OO1MnO
         z99CWgtoqNPYz2MEcpVewgZSDzWF4P9nTGFWgs7PqkrLYLHx6rR4gtMzgfXuet2RtA90
         05x2tSJ2kjIUYaVLOsFIDXElaY8mrxCF9UqU6Tauzm9Ze3ilN8bPvkEbNNDdFnH+o1Nx
         ISnl/CWggkq81dGsq0NVeDvwsGkqG0I5hUb3Dyd6yx6dtB7BI2tAv4VFUfJo2Uwt+VAS
         wiwzDgcx7W0KnQiN3sMAREh5sHhhnnwfMVyj2a4xGowPhGqzXmRVKgdXB6cwK4d3yhFc
         I+gA==
X-Forwarded-Encrypted: i=1; AJvYcCXe7MTsn8v7dJ4x5B6DrpRdpO5ElL0ILI7ukUvhewf8GJS2fCqmI+7ChzRK+c5AXU813YPdx9PxPZP/ITnc9gO7Vj7oUPDncLdp
X-Gm-Message-State: AOJu0Yz/Ov4iqQxK6OYIRUZccHPfLG76/QkjUQjByru4wd5JI3UKjHl8
	CZTLQMtm71CyijZUIQm4kzmK79/goidNWN87Ryjn3B1AXkp2xgDGi6rDuQ==
X-Google-Smtp-Source: AGHT+IG1fZ7RTabCc1BtLEI9bIJTClXw9Ze2g/yT9IQwfvqjaytTAyeBiWzh34NrDm+DLm90n01KTQ==
X-Received: by 2002:a05:6512:2204:b0:52c:8a3a:fe2c with SMTP id 2adb3069b0e04-52ca6e9418bmr824353e87.45.1718324301203;
        Thu, 13 Jun 2024 17:18:21 -0700 (PDT)
Received: from hermes.prahal.homelinux.net (91-175-163-178.subs.proxad.net. [91.175.163.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f6127d6dsm40579695e9.26.2024.06.13.17.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 17:18:20 -0700 (PDT)
Message-ID: <db0adddf85d29d50c3930342bd4b09fc287091b8.camel@gmail.com>
Subject: Re: add NO_REPORT_LUNS quirk for at least a few Seagate external
 drives to fix smartctl with uas
From: Alban Browaeys <alban.browaeys@gmail.com>
To: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Date: Fri, 14 Jun 2024 02:18:19 +0200
In-Reply-To: <45b88a576be459f37ed8f329d53221640ce3617e.camel@gmail.com>
References: <9791b3eee4fc52b45f1ea9b9724bf977bf5c38d4.camel@gmail.com>
	 <48c94250-64b3-4a19-9c87-0f48a2ceb425@suse.com>
	 <25ee57cfbe5c2ab6522ae4e0992f68c4c9a70766.camel@gmail.com>
	 <45b88a576be459f37ed8f329d53221640ce3617e.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 12 juin 2024 =C3=A0 17:13 +0200, Alban Browaeys a =C3=A9crit=C2=
=A0:
> Le mercredi 12 juin 2024 =C3=A0 03:39 +0200, Alban Browaeys a =C3=A9crit=
=C2=A0:
> > Le mardi 11 juin 2024 =C3=A0 10:21 +0200, Oliver Neukum a =C3=A9crit=C2=
=A0:
> > >=20
> > >=20
> > > On 10.06.24 21:25, Alban Browaeys wrote:
> > > > I found that for "smartctl" to work on my two Seagate Expansion
> > > > external USB3=C2=A0 I had to add the "j" usb-storage quirks ie
> > > > "US_FL_NO_REPORT_LUNS".
> > > > (They are years apart).
> > >=20
> > > Hi,
> > >=20
> > > does the attached patch do the job?
> > >=20
> > > 	Regards
> > > 		Oliver
> >=20
> > No, it does not work.
> > smartctl is still broken with the US_FL_NO_REPORT_LUNS in
> > drivers/usb/storage/unusual_uas.h.
> >=20
> > But if I add back the "j" usb.quirks flag back with:
> > echo -n "0x0bc2:0x2037:j" | sudo tee=C2=A0
> > /sys/module/usb_storage/parameters/quirks
> > and then:
> > echo -n "2-2:1.0" | sudo tee /sys/bus/usb/drivers/uas/unbind
> > echo -n "2-2:1.0" | sudo tee /sys/bus/usb/drivers/uas/bind
> > then smartctl works.
> >=20
> > I tested on tw kernels with the two different seagate drives.
> >=20
> > sudo grep Seagate /sys/devices/ -r |& grep Seagate
> > /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/manufacturer:Seagate
> > /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/2-
> > 2:1.0/host8/target8:0:0/8:0:0:0/vendor:Seagate
> >=20
> > head /sys/devices/pci0000\:00/0000\:00\:14.0/usb2/2-2/quirks=20
> > 0x0
> >=20
> > =C2=A0
> >=20
> >=20
> > lrwxrwxrwx 1 root root=C2=A0 9 12 juin=C2=A0 03:14 usb-
> > Seagate_Expansion_HDD_00000000NACSHZWL-0:0 -> ../../sdc
> > lrwxrwxrwx 1 root root 10 12 juin=C2=A0 03:14 usb-
> > Seagate_Expansion_HDD_00000000NACSHZWL-0:0-part1 -> ../../sdc1
> >=20
> > sudo smartctl -i /dev/sdc
> > smartctl 7.4 2023-08-01 r5530 [x86_64-linux-6.10.0-rc3+] (local
> > build)
> > Copyright (C) 2002-23, Bruce Allen, Christian Franke,
> > www.smartmontools.org
> >=20
> > Read Device Identity failed: scsi error unsupported field in scsi
> > command
> >=20
> > If this is a USB connected device, look at the various --
> > device=3DTYPE
> > variants
> > A mandatory SMART command failed: exiting. To continue, add one or
> > more '-T permissive' options.
> >=20
> >=20
> > lsusb -t
> > /:=C2=A0 Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd=
/12p,
> > 480M
> > =C2=A0=C2=A0=C2=A0 |__ Port 001: Dev 002, If 0, Class=3DVendor Specific=
 Class,
> > Driver=3D[none], 12M
> > =C2=A0=C2=A0=C2=A0 |__ Port 001: Dev 002, If 1, Class=3DAudio, Driver=
=3D[none], 12M
> > =C2=A0=C2=A0=C2=A0 |__ Port 001: Dev 002, If 2, Class=3DAudio, Driver=
=3D[none], 12M
> > =C2=A0=C2=A0=C2=A0 |__ Port 005: Dev 003, If 0, Class=3DHub, Driver=3Dh=
ub/4p, 480M
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 002: Dev 005, If 0,=
 Class=3DVendor Specific Class,
> > Driver=3Dcp210x, 12M
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 003: Dev 008, If 0,=
 Class=3DWireless, Driver=3Dbtusb,
> > 12M
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 003: Dev 008, If 1,=
 Class=3DWireless, Driver=3Dbtusb,
> > 12M
> > =C2=A0=C2=A0=C2=A0 |__ Port 009: Dev 004, If 0, Class=3DHub, Driver=3Dh=
ub/4p, 480M
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 003: Dev 009, If 0,=
 Class=3DHuman Interface Device,
> > Driver=3Dusbhid, 1.5M
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 003: Dev 009, If 1,=
 Class=3DHuman Interface Device,
> > Driver=3Dusbhid, 1.5M
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 004: Dev 010, If 0,=
 Class=3DHuman Interface Device,
> > Driver=3Dusbhid, 1.5M
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 004: Dev 010, If 1,=
 Class=3DHuman Interface Device,
> > Driver=3Dusbhid, 1.5M
> > /:=C2=A0 Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd=
/6p,
> > 5000M
> > =C2=A0=C2=A0=C2=A0 |__ Port 002: Dev 002, If 0, Class=3DMass Storage, D=
river=3Duas,
> > 5000M
> > =C2=A0=C2=A0=C2=A0 |__ Port 003: Dev 003, If 0, Class=3DMass Storage, D=
river=3Dusb-
> > storage, 5000M
> > =C2=A0=C2=A0=C2=A0 |__ Port 005: Dev 004, If 0, Class=3DHub, Driver=3Dh=
ub/4p, 5000M
> > =C2=A0=C2=A0=C2=A0 |__ Port 006: Dev 005, If 0, Class=3DMass Storage, D=
river=3Dusb-
> > storage, 5000M
> >=20
> > with the "j" usb.quirks flag:
> > sudo smartctl -i /dev/sdc
> > smartctl 7.4 2023-08-01 r5530 [x86_64-linux-6.10.0-rc3+] (local
> > build)
> > Copyright (C) 2002-23, Bruce Allen, Christian Franke,
> > www.smartmontools.org
> >=20
> > =3D=3D=3D START OF INFORMATION SECTION =3D=3D=3D
> > Model Family:=C2=A0=C2=A0=C2=A0=C2=A0 Seagate Barracuda 2.5 5400
> > Device Model:=C2=A0=C2=A0=C2=A0=C2=A0 ST4000LM024-2AN17V
> > Serial Number:=C2=A0=C2=A0=C2=A0 WCKAEWZZ
> > LU WWN Device Id: 5 000c50 0e732b6d8
> > Firmware Version: 0001
> > User Capacity:=C2=A0=C2=A0=C2=A0 4=E2=80=AF000=E2=80=AF787=E2=80=AF030=
=E2=80=AF016 bytes [4,00 TB]
> > Sector Sizes:=C2=A0=C2=A0=C2=A0=C2=A0 512 bytes logical, 4096 bytes phy=
sical
> > Rotation Rate:=C2=A0=C2=A0=C2=A0 5526 rpm
> > Form Factor:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.5 inches
> > Device is:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 In smartctl databa=
se 7.3/5528
> > ATA Version is:=C2=A0=C2=A0 ACS-3 T13/2161-D revision 5
> > SATA Version is:=C2=A0 SATA 3.1, 6.0 Gb/s (current: 6.0 Gb/s)
> > Local Time is:=C2=A0=C2=A0=C2=A0 Wed Jun 12 03:30:47 2024 CEST
> > SMART support is: Available - device has SMART capability.
> > SMART support is: Enabled
> >=20
> >=20
>=20
>=20
>=20
> Your patch had:
> +UNUSUAL_DEV(0x0bc2, 0x2037, 0x0000, 0x9999,
> +		"Seagate",
> +		"RSS LLC Expansion HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_LUNS),
> +
> +/* Reported-by: Alban Browaeys <alban.browaeys@gmail.com> */
> +UNUSUAL_DEV(0x0bc2, 0x231a, 0x0000, 0x9999,
> +		"Seagate",
> +		"RSS LLC Expansion Portable",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_LUNS),
> +
>=20
> but:
> head /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/manufacturer
> Seagate
>=20
> head /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/product
> Expansion HDD
>=20
> head /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/id*
> =3D=3D> /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/idProduct <=3D=3D
> 2037
>=20
> =3D=3D> /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/idVendor <=3D=3D
> 0bc2
> head /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/quirks
> 0x0
>=20
>=20
>=20
> and:
>=20
> head /sys/devices/platform/usb@fe900000/fe900000.usb/xhci-
> hcd.0.auto/usb2/2-1/2-1.2/2-1.2.1/2-1.2.1.4/manufacturer
> Seagate
> head /sys/devices/platform/usb@fe900000/fe900000.usb/xhci-
> hcd.0.auto/usb2/2-1/2-1.2/2-1.2.1/2-1.2.1.4/product
> Expansion
> head /sys/devices/platform/usb@fe900000/fe900000.usb/xhci-
> hcd.0.auto/usb2/2-1/2-1.2/2-1.2.1/2-1.2.1.4/id*
> =3D=3D> /sys/devices/platform/usb@fe900000/fe900000.usb/xhci-
> hcd.0.auto/usb2/2-1/2-1.2/2-1.2.1/2-1.2.1.4/idProduct <=3D=3D
> 231a
>=20
> =3D=3D> /sys/devices/platform/usb@fe900000/fe900000.usb/xhci-
> hcd.0.auto/usb2/2-1/2-1.2/2-1.2.1/2-1.2.1.4/idVendor <=3D=3D
> 0bc2
>=20
>=20
> I replace the product name with the one from sysfs in your patch but
> the patch still does not work.
> +UNUSUAL_DEV(0x0bc2, 0x2037, 0x0000, 0x9999,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "Seagate",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "Expansion HDD",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 US_FL_NO_REPORT_LUNS),
>=20
> +UNUSUAL_DEV(0x0bc2, 0x231a, 0x0000, 0x9999,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "Seagate",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "Expansion",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 US_FL_NO_REPORT_LUNS),
>=20
>=20
>=20
> How could I see if the quirk is applied?
> Does sysfs:
> head /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/quirks
> 0x0
> tells it was not?
>=20
>=20
> On the 0x2037 box:
> lsusb -t
> /:=C2=A0 Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/1=
2p,
> 480M
> =C2=A0=C2=A0=C2=A0 |__ Port 001: Dev 002, If 0, Class=3DVendor Specific C=
lass,
> Driver=3D[none], 12M
> =C2=A0=C2=A0=C2=A0 |__ Port 001: Dev 002, If 1, Class=3DAudio, Driver=3D[=
none], 12M
> =C2=A0=C2=A0=C2=A0 |__ Port 001: Dev 002, If 2, Class=3DAudio, Driver=3D[=
none], 12M
> =C2=A0=C2=A0=C2=A0 |__ Port 005: Dev 003, If 0, Class=3DHub, Driver=3Dhub=
/4p, 480M
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 002: Dev 005, If 0, C=
lass=3DVendor Specific Class,
> Driver=3Dcp210x, 12M
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 003: Dev 008, If 0, C=
lass=3DWireless, Driver=3Dbtusb,
> 12M
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 003: Dev 008, If 1, C=
lass=3DWireless, Driver=3Dbtusb,
> 12M
> =C2=A0=C2=A0=C2=A0 |__ Port 009: Dev 004, If 0, Class=3DHub, Driver=3Dhub=
/4p, 480M
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 003: Dev 009, If 0, C=
lass=3DHuman Interface Device,
> Driver=3Dusbhid, 1.5M
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 003: Dev 009, If 1, C=
lass=3DHuman Interface Device,
> Driver=3Dusbhid, 1.5M
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 004: Dev 010, If 0, C=
lass=3DHuman Interface Device,
> Driver=3Dusbhid, 1.5M
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 004: Dev 010, If 1, C=
lass=3DHuman Interface Device,
> Driver=3Dusbhid, 1.5M
> /:=C2=A0 Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/6=
p,
> 5000M
> =C2=A0=C2=A0=C2=A0 |__ Port 002: Dev 002, If 0, Class=3DMass Storage, Dri=
ver=3Duas,
> 5000M
> =C2=A0=C2=A0=C2=A0 |__ Port 003: Dev 003, If 0, Class=3DMass Storage, Dri=
ver=3Dusb-
> storage, 5000M
> =C2=A0=C2=A0=C2=A0 |__ Port 005: Dev 004, If 0, Class=3DHub, Driver=3Dhub=
/4p, 5000M
> =C2=A0=C2=A0=C2=A0 |__ Port 006: Dev 005, If 0, Class=3DMass Storage, Dri=
ver=3Dusb-
> storage, 5000M
>=20
>=20
> lsusb
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 001 Device 002: ID 046d:08ae Logitech, Inc. QuickCam for
> Notebooks
> Bus 001 Device 003: ID 05e3:0610 Genesys Logic, Inc. Hub
> Bus 001 Device 004: ID 05e3:0610 Genesys Logic, Inc. Hub
> Bus 001 Device 005: ID 10c4:ea60 Silicon Labs CP210x UART Bridge
> Bus 001 Device 008: ID 0a12:0001 Cambridge Silicon Radio, Ltd
> Bluetooth Dongle (HCI mode)
> Bus 001 Device 009: ID 17ef:608c Lenovo Lenovo Calliope USB Keyboard
> Bus 001 Device 010: ID 046d:c517 Logitech, Inc. LX710 Cordless
> Desktop Laser
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 002 Device 002: ID 0bc2:2037 Seagate RSS LLC Expansion HDD
> Bus 002 Device 003: ID 1058:1078 Western Digital Technologies, Inc.
> Elements Portable (WDBUZG)
> Bus 002 Device 004: ID 05e3:0626 Genesys Logic, Inc. Hub
> Bus 002 Device 005: ID 08e4:017a Pioneer Corp. BD-XD07 BD/DVD/CD
> Writer
>=20
>=20
>=20
> Mind I have not test the 0x231a device on 6.9 branch yet as the
> kernel
> build with the patch change is till building. I only tested the
> 0x2037
> one on 6.10.0-rc3.
>=20
>=20
>=20
> Regards,
> Alban
>=20

Note: Should I add Hans de Goede to the recipients, or only when the
patch is ready?



I read the code but I cannot find where the flags are applied in the
uas driver (drivers/usb/storage/uas.c).

In usb-storage the flow is:
storage_probe drivers/usb/storage/usb.c
> uas_use_uas_driver if true exit
> usb_stor_probe1
	> get_device_info
		> usb_stor_adjust_quirks
			> usb-storage.quirks applied

but for my uas diver when usb-storage driver probe it exits in
storage_probe before usb_stor_probe1 because uas_use_uas is true.


When uas probe:
uas_init drivers/usb/storage/uas.c
> usb_register
	> usb_device_match+0x43/0xa0
		> usb_match_id+0x70/0xb0
			> usb_match_device+0x13a/0x210
				usb_match_device: SUCCESS id_table idVendor 0xbc2 idProduct 0x2037 driv=
er_info 0x10000000 devive id vendor 0xbc2 device id product 0x2037
but then I see no code to apply the flag US_FL_NO_REPORT_LUNS.
Could you help me find it?

I don't understand how the usb-storage.quirks "j" flag could help if
the uas has no code to apply the flag.



I alos see in the code that I was supposed to add more info:

for 0x0bc2 0x2037:
- /sys/kernel/debug/usb/devices
T:  Bus=3D02 Lev=3D01 Prnt=3D01 Port=3D01 Cnt=3D01 Dev#=3D  2 Spd=3D5000 Mx=
Ch=3D 0
D:  Ver=3D 3.20 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D 9 #Cfgs=3D  1
P:  Vendor=3D0bc2 ProdID=3D2037 Rev=3D19.01
S:  Manufacturer=3DSeagate
S:  Product=3DExpansion HDD
S:  SerialNumber=3D00000000NACSHZWL
C:* #Ifs=3D 1 Cfg#=3D 1 Atr=3D80 MxPwr=3D896mA
I:  If#=3D 0 Alt=3D 0 #EPs=3D 2 Cls=3D08(stor.) Sub=3D06 Prot=3D50 Driver=
=3Duas
E:  Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
I:* If#=3D 0 Alt=3D 1 #EPs=3D 4 Cls=3D08(stor.) Sub=3D06 Prot=3D62 Driver=
=3Duas
E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
E:  Ad=3D83(I) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
E:  Ad=3D04(O) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms

- lsusb -v
Bus 002 Device 002: ID 0bc2:2037 Seagate RSS LLC Expansion HDD
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0=20
  bMaxPacketSize0         9
  idVendor           0x0bc2 Seagate RSS LLC
  idProduct          0x2037 Expansion HDD
  bcdDevice           19.01
  iManufacturer           1 Seagate
  iProduct                2 Expansion HDD
  iSerial                 3 00000000NACSHZWL
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0079
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              896mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           4
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        Command pipe (0x01)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        MaxStreams             32
        Status pipe (0x02)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-in pipe (0x03)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               7
        MaxStreams             32
        Data-out pipe (0x04)
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0016
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000f0e
      BESL Link Power Management (LPM) Supported
    BESL value     3840 us=20
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
    bU2DevExitLat          32 micro seconds
Device Status:     0x000c
  (Bus Powered)
  U1 Enabled
  U2 Enabled


for 0x0bc2 0x231a
- /sys/kernel/debug/usb/devices
T:  Bus=3D02 Lev=3D04 Prnt=3D05 Port=3D03 Cnt=3D02 Dev#=3D  8 Spd=3D5000 Mx=
Ch=3D 0
D:  Ver=3D 3.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D 9 #Cfgs=3D  1
P:  Vendor=3D0bc2 ProdID=3D231a Rev=3D 7.10
S:  Manufacturer=3DSeagate
S:  Product=3DExpansion
S:  SerialNumber=3DNAADEE3G
C:* #Ifs=3D 1 Cfg#=3D 1 Atr=3D80 MxPwr=3D896mA
I:  If#=3D 0 Alt=3D 0 #EPs=3D 2 Cls=3D08(stor.) Sub=3D06 Prot=3D50 Driver=
=3Duas
E:  Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
I:* If#=3D 0 Alt=3D 1 #EPs=3D 4 Cls=3D08(stor.) Sub=3D06 Prot=3D62 Driver=
=3Duas
E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
E:  Ad=3D83(I) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
E:  Ad=3D04(O) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms


- lsusb -v
Bus 002 Device 008: ID 0bc2:231a Seagate RSS LLC Expansion Portable
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass            0=20
  bDeviceSubClass         0=20
  bDeviceProtocol         0=20
  bMaxPacketSize0         9
  idVendor           0x0bc2 Seagate RSS LLC
  idProduct          0x231a Expansion Portable
  bcdDevice            7.10
  iManufacturer           1 Seagate
  iProduct                2 Expansion
  iSerial                 3 NAADEE3G
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0079
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              896mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           4
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        Command pipe (0x01)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        MaxStreams             32
        Status pipe (0x02)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-in pipe (0x03)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               7
        MaxStreams             32
        Data-out pipe (0x04)
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0016
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000f0e
      BESL Link Power Management (LPM) Supported
    BESL value     3840 us=20
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
    bU2DevExitLat          32 micro seconds
Device Status:     0x0000
  (Bus Powered)



Cheers,
Alban


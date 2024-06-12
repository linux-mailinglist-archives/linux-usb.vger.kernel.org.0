Return-Path: <linux-usb+bounces-11213-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 142CE905696
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 17:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13FEA1C2373C
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 15:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AB217FAB5;
	Wed, 12 Jun 2024 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfWlAx3S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE217FAAF
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718205198; cv=none; b=FR20ciiZP8qKwZnlbswZYGb7hBSOtorADOCknkhNUTTqIY39B+FddTxZTqb7U/VVx/RgtVrSCVXna3BGtcVWsJNNlz23LjwseFv7uoNCXYACLYUySg9rbeec6jn6OwUWlDMmNZtbGQsKMc4dbxg/v3O+wEb2bEEky3pXQWCOkqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718205198; c=relaxed/simple;
	bh=Dptd+mRtLcSpQPmfm4/7W36vRn9dxyqo0Pzuc/nbcp0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T0TLqVYGwoHR18dlxBLBCKUzdpVXLKgJIhXNYnP86dhybGZZhBgvTg4VkJ1jmtx3TSORSvJOcD/4qXpyBkYUP9TEOFCLi+MwueU1v5KpHPro/CXv68CJ9Sfqd48wKNAM7ZzmtGz4gv41cTX7rMX1aGU/ME25fD3ChCj5Y5oddzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfWlAx3S; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35f1c567ae4so276995f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 08:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718205195; x=1718809995; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1r5Wwk6FxbFjD4SUzMqYBHW8Gf1+vzlkAOo1W9fu7k=;
        b=bfWlAx3SHnKDYzFiOuLkKCxisdzek2ew8zAsBrTS2W4WNDVmOgkDGug+CkapTBemXM
         p31Vsey5yMhVxpleg6S5UQiVnNZZntiUMiZBXGtzSkof+lOK0JogxgA8yqUPQ7lAYe/0
         hAVA4VqL+vJCxiY1UJ0d/W4/IcNOdoflSTDmn2fmdNMMp4MS9bX93I9JQnyuZS9Y4pgW
         omDkgWY9hCcf1c9NlpVH6M/ojk+SCJwIhvz79qweRFCO75jCvNzagpkJDQQaq/fcs6S0
         5er5kAknFWdXJW8x1LCp6d4i24KQTWGAvjGALeOrDHf9M+Em+ZfXcViPdtV+7h6MjmkI
         a6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718205195; x=1718809995;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X1r5Wwk6FxbFjD4SUzMqYBHW8Gf1+vzlkAOo1W9fu7k=;
        b=ScOhqe7+l1pgo8P+8qQFjaxhksM4SA9LZ7B3DEdCcsUcxAPu4KU9bR7V6mpIycrL9K
         tPg/P8p7IL2XULqqNHGjt4cWzxU7KZB3yxsgx2TNZpn3eU89unhcjCJgKGBIMF1rbN9Y
         66n4nUIKCWjcRa3k9/8ZmWiuX+vRfeXwCUkoBxEcUKMMtLbTrCgdT2V3N+CDyygIjp7j
         yvRkN7vy9U3FZCdI562NDhE3DENn0pLCPoPyLsnNwSXdjK5DolH1HaDqvWoEsGEPfaGY
         IRkUYmNGfcVC+u9gsXThkH1ipLHMxtPefdRjvcsQzmRThy6UmhZf/NmVIJi2dvYSl0AI
         PxZw==
X-Forwarded-Encrypted: i=1; AJvYcCX3wezbq497+esnpEOxfHVOv/2cOOfY9xpiMN4WlZFQ2l+E5kx14Go0hFV9Y8WIVvcc8UAKja+Zs6HmCsPpbggEl4atD85fNhYT
X-Gm-Message-State: AOJu0YwZPx6Iap0pehpqR6QBcOgijYRfcUHzPd7C9edBMFpYsZHZv9tD
	J8DkU9inAP5YbYyELIEZkBd7gR4Nzbayy6lOx8zhvcKu8U/Zi6dr8kwPBaXr
X-Google-Smtp-Source: AGHT+IGwXYgc+lJulHptoBTuZAC7RFKMUCtpmnlwwnqHA5Loymg40C34pVVNcjQSA8WCRZ5wHMzJVw==
X-Received: by 2002:a5d:678b:0:b0:35f:1128:2514 with SMTP id ffacd0b85a97d-35fdf7ad04emr1360910f8f.32.1718205194943;
        Wed, 12 Jun 2024 08:13:14 -0700 (PDT)
Received: from hermes.prahal.homelinux.net (91-175-163-178.subs.proxad.net. [91.175.163.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f254fb3c2sm8252223f8f.49.2024.06.12.08.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 08:13:14 -0700 (PDT)
Message-ID: <45b88a576be459f37ed8f329d53221640ce3617e.camel@gmail.com>
Subject: Re: add NO_REPORT_LUNS quirk for at least a few Seagate external
 drives to fix smartctl with uas
From: Alban Browaeys <alban.browaeys@gmail.com>
To: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Date: Wed, 12 Jun 2024 17:13:15 +0200
In-Reply-To: <25ee57cfbe5c2ab6522ae4e0992f68c4c9a70766.camel@gmail.com>
References: <9791b3eee4fc52b45f1ea9b9724bf977bf5c38d4.camel@gmail.com>
	 <48c94250-64b3-4a19-9c87-0f48a2ceb425@suse.com>
	 <25ee57cfbe5c2ab6522ae4e0992f68c4c9a70766.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 12 juin 2024 =C3=A0 03:39 +0200, Alban Browaeys a =C3=A9crit=C2=
=A0:
> Le mardi 11 juin 2024 =C3=A0 10:21 +0200, Oliver Neukum a =C3=A9crit=C2=
=A0:
> >=20
> >=20
> > On 10.06.24 21:25, Alban Browaeys wrote:
> > > I found that for "smartctl" to work on my two Seagate Expansion
> > > external USB3=C2=A0 I had to add the "j" usb-storage quirks ie
> > > "US_FL_NO_REPORT_LUNS".
> > > (They are years apart).
> >=20
> > Hi,
> >=20
> > does the attached patch do the job?
> >=20
> > 	Regards
> > 		Oliver
>=20
> No, it does not work.
> smartctl is still broken with the US_FL_NO_REPORT_LUNS in
> drivers/usb/storage/unusual_uas.h.
>=20
> But if I add back the "j" usb.quirks flag back with:
> echo -n "0x0bc2:0x2037:j" | sudo tee=C2=A0
> /sys/module/usb_storage/parameters/quirks
> and then:
> echo -n "2-2:1.0" | sudo tee /sys/bus/usb/drivers/uas/unbind
> echo -n "2-2:1.0" | sudo tee /sys/bus/usb/drivers/uas/bind
> then smartctl works.
>=20
> I tested on tw kernels with the two different seagate drives.
>=20
> sudo grep Seagate /sys/devices/ -r |& grep Seagate
> /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/manufacturer:Seagate
> /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/2-
> 2:1.0/host8/target8:0:0/8:0:0:0/vendor:Seagate
>=20
> head /sys/devices/pci0000\:00/0000\:00\:14.0/usb2/2-2/quirks=20
> 0x0
>=20
> =C2=A0
>=20
>=20
> lrwxrwxrwx 1 root root=C2=A0 9 12 juin=C2=A0 03:14 usb-
> Seagate_Expansion_HDD_00000000NACSHZWL-0:0 -> ../../sdc
> lrwxrwxrwx 1 root root 10 12 juin=C2=A0 03:14 usb-
> Seagate_Expansion_HDD_00000000NACSHZWL-0:0-part1 -> ../../sdc1
>=20
> sudo smartctl -i /dev/sdc
> smartctl 7.4 2023-08-01 r5530 [x86_64-linux-6.10.0-rc3+] (local
> build)
> Copyright (C) 2002-23, Bruce Allen, Christian Franke,
> www.smartmontools.org
>=20
> Read Device Identity failed: scsi error unsupported field in scsi
> command
>=20
> If this is a USB connected device, look at the various --device=3DTYPE
> variants
> A mandatory SMART command failed: exiting. To continue, add one or
> more '-T permissive' options.
>=20
>=20
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
> with the "j" usb.quirks flag:
> sudo smartctl -i /dev/sdc
> smartctl 7.4 2023-08-01 r5530 [x86_64-linux-6.10.0-rc3+] (local
> build)
> Copyright (C) 2002-23, Bruce Allen, Christian Franke,
> www.smartmontools.org
>=20
> =3D=3D=3D START OF INFORMATION SECTION =3D=3D=3D
> Model Family:=C2=A0=C2=A0=C2=A0=C2=A0 Seagate Barracuda 2.5 5400
> Device Model:=C2=A0=C2=A0=C2=A0=C2=A0 ST4000LM024-2AN17V
> Serial Number:=C2=A0=C2=A0=C2=A0 WCKAEWZZ
> LU WWN Device Id: 5 000c50 0e732b6d8
> Firmware Version: 0001
> User Capacity:=C2=A0=C2=A0=C2=A0 4=E2=80=AF000=E2=80=AF787=E2=80=AF030=E2=
=80=AF016 bytes [4,00 TB]
> Sector Sizes:=C2=A0=C2=A0=C2=A0=C2=A0 512 bytes logical, 4096 bytes physi=
cal
> Rotation Rate:=C2=A0=C2=A0=C2=A0 5526 rpm
> Form Factor:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.5 inches
> Device is:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 In smartctl database=
 7.3/5528
> ATA Version is:=C2=A0=C2=A0 ACS-3 T13/2161-D revision 5
> SATA Version is:=C2=A0 SATA 3.1, 6.0 Gb/s (current: 6.0 Gb/s)
> Local Time is:=C2=A0=C2=A0=C2=A0 Wed Jun 12 03:30:47 2024 CEST
> SMART support is: Available - device has SMART capability.
> SMART support is: Enabled
>=20
>=20



Your patch had:
+UNUSUAL_DEV(0x0bc2, 0x2037, 0x0000, 0x9999,
+		"Seagate",
+		"RSS LLC Expansion HDD",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_LUNS),
+
+/* Reported-by: Alban Browaeys <alban.browaeys@gmail.com> */
+UNUSUAL_DEV(0x0bc2, 0x231a, 0x0000, 0x9999,
+		"Seagate",
+		"RSS LLC Expansion Portable",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_LUNS),
+

but:
head /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/manufacturer
Seagate

head /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/product
Expansion HDD

head /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/id*
=3D=3D> /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/idProduct <=3D=3D
2037

=3D=3D> /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/idVendor <=3D=3D
0bc2
head /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/quirks
0x0



and:

head /sys/devices/platform/usb@fe900000/fe900000.usb/xhci-hcd.0.auto/usb2/2=
-1/2-1.2/2-1.2.1/2-1.2.1.4/manufacturer=20
Seagate
head /sys/devices/platform/usb@fe900000/fe900000.usb/xhci-hcd.0.auto/usb2/2=
-1/2-1.2/2-1.2.1/2-1.2.1.4/product=20
Expansion
head /sys/devices/platform/usb@fe900000/fe900000.usb/xhci-hcd.0.auto/usb2/2=
-1/2-1.2/2-1.2.1/2-1.2.1.4/id*
=3D=3D> /sys/devices/platform/usb@fe900000/fe900000.usb/xhci-hcd.0.auto/usb=
2/2-1/2-1.2/2-1.2.1/2-1.2.1.4/idProduct <=3D=3D
231a

=3D=3D> /sys/devices/platform/usb@fe900000/fe900000.usb/xhci-hcd.0.auto/usb=
2/2-1/2-1.2/2-1.2.1/2-1.2.1.4/idVendor <=3D=3D
0bc2


I replace the product name with the one from sysfs in your patch but the pa=
tch still does not work.
+UNUSUAL_DEV(0x0bc2, 0x2037, 0x0000, 0x9999,
+               "Seagate",
+               "Expansion HDD",
+               USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+               US_FL_NO_REPORT_LUNS),

+UNUSUAL_DEV(0x0bc2, 0x231a, 0x0000, 0x9999,
+               "Seagate",
+               "Expansion",
+               USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+               US_FL_NO_REPORT_LUNS),



How could I see if the quirk is applied?
Does sysfs:
head /sys/devices/pci0000:00/0000:00:14.0/usb2/2-2/quirks
0x0
tells it was not?


On the 0x2037 box:
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


lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 046d:08ae Logitech, Inc. QuickCam for Notebooks
Bus 001 Device 003: ID 05e3:0610 Genesys Logic, Inc. Hub
Bus 001 Device 004: ID 05e3:0610 Genesys Logic, Inc. Hub
Bus 001 Device 005: ID 10c4:ea60 Silicon Labs CP210x UART Bridge
Bus 001 Device 008: ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth Don=
gle (HCI mode)
Bus 001 Device 009: ID 17ef:608c Lenovo Lenovo Calliope USB Keyboard
Bus 001 Device 010: ID 046d:c517 Logitech, Inc. LX710 Cordless Desktop Lase=
r
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 002: ID 0bc2:2037 Seagate RSS LLC Expansion HDD
Bus 002 Device 003: ID 1058:1078 Western Digital Technologies, Inc. Element=
s Portable (WDBUZG)
Bus 002 Device 004: ID 05e3:0626 Genesys Logic, Inc. Hub
Bus 002 Device 005: ID 08e4:017a Pioneer Corp. BD-XD07 BD/DVD/CD Writer



Mind I have not test the 0x231a device on 6.9 branch yet as the kernel
build with the patch change is till building. I only tested the 0x2037
one on 6.10.0-rc3.



Regards,
Alban



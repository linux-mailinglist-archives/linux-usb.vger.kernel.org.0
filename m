Return-Path: <linux-usb+bounces-31715-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 296FCCDA4B9
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 19:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DDA7302EF7D
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 18:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43436349AF7;
	Tue, 23 Dec 2025 18:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXkB4wo1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74873491D6
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 18:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766515865; cv=none; b=HspRCZNWifX28p3IR53y0VjhqboSR7PayEqwGI3v8IE7gqfHZXy0PzA1vCn0Q+DRZb17o0DLNpzqc2OKoG3YF/vmE0Euq612RwxdY08Y3TY5C2XvvHnSTsl2cQbMuT/Y6YmhdOHX0ifEX65Fh3LWBSY02ZfTa6V1IZcmNcDz3HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766515865; c=relaxed/simple;
	bh=wlrLr1IZZ2h65kGErRDL1UaH7BdC6RfNx9O0/6Po38Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=BSA6/NHGCRFHuxRkl3ta9fg2cK8zKOIpXbhI+b0rOyX1sA/1fYW6JOieZmnUSzRfPbNLdtGF/cAQvJE2jXwGcTax1sW7odJiVsmUpoh+oA19/AjBrOMIxeYmq57a3U3fbUbN4WbPvtvHLol7dvvPczbcZZ8MdWi4LW5dNbMtcLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXkB4wo1; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9412512e9f3so1474837241.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 10:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766515862; x=1767120662; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uJ7LemT4K4n/P9bJrgEzXe1ko93Hmu7gEePV9aD8i0=;
        b=mXkB4wo1UfnbpoaHCuMojnYwD5rn7IYOJrL4uWddt0Jp9EQrPFOd63Z+s7vab6Kkje
         6ukxaZUWwa9odJt4LdhsRijiSyAFhTl5v4EKYQEkd3fJIBIrW9ZsDji55T6UYwU6CFXx
         zthXzYGRgml4ObxIdUjIyNIjrg/zdu8URI5kGeEyQLNeawSZ3/glbB7rPEHmnOMJS89R
         E/DplHpSbsY0w32gctGp3NXOHsnM7XXGGZMmI5L6CXfaRutscdv3o6TyuJfHUc85bUYA
         JmUHXbn31sSneByw+qLOVwlVdHI7nZbNE4Rpqa3//sMDl8e95ZGonFN/ZN/VXUjjwsYB
         w80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766515862; x=1767120662;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/uJ7LemT4K4n/P9bJrgEzXe1ko93Hmu7gEePV9aD8i0=;
        b=BqTeNjFOzb+K6OiG2NOX18Ats2JuKPhPovDMuFTYkWX1H8Mm5Q7TFRbr6t1rTLlprL
         ca66CsqdX3AJkAKkwqDXzzKpQMOTImiYugPWUnbon/nVrk8K4mlBEQtJPxgC7p6cZon6
         qCj5YBHXqUManXGHVx6zsrGu0vyYWAwjFpNgLWbllhWaG2mMQW4ecGsQHMP1n1B7UtUE
         bYEDqjaDdwYjC2aUpUvclsE5E4KoTKZjMflgzBGyhJJJz9aQNi4D/x7B2iUVXLBZoXYb
         FunprnEFYhdqlulWXtu6hRGbxq+WO0VL1bI/1hioBMgcDOPopxA9oQFNel6wUQ9NK9vd
         mrFA==
X-Gm-Message-State: AOJu0YyaixZe5/Yfu/jfRlzpb8R2z3MJ6iwGn170tFO2q+iHRKM671hr
	yH5QXC8ANRAjp9g7HmjZBn5P39aQc0Zn5hQz/4wmBpFMzerbo6hzjQBhpAYiGWmE+iboD29Dy/G
	du9BJibYRpm1vIAeu1IPpze+Q75WbwDyb2e76zb0=
X-Gm-Gg: AY/fxX5oibFnOQzBuClK7gfleYVmLv3vNlTjrS1kQ/JFVlQ3fKhYARiiRM/xVDnZg4P
	KBJ8bgtIl92allWvnLtet/rdLrHvpZojoUqkhzE8Fc4UFpeJ/VWcOoJll4m5RM22Yy3GSApSJz8
	ECxeGPytms56amyYu0JaqJSguPsV8FUCOytOFF/d4M49ZxkgLCiVO0YJooAaYgFly93gWhUjMyC
	k8lioaI3ZNxyDA0/NeOLspeHXVLyorvN6MpvqjygM0e5py5nMv3xRg8cx5/FfH30B5F4w==
X-Google-Smtp-Source: AGHT+IGhmAOdZ1A6U0vPKRCLaUkqFeqcNkFZ9ocpnq0TJX5/qPyhIp3JatqPJhFXW0fRLZpH3MCsjL9Y2kmwEKwictg=
X-Received: by 2002:a05:6102:8006:b0:5db:47c2:f926 with SMTP id
 ada2fe7eead31-5eb1a67d71bmr4548071137.15.1766515861125; Tue, 23 Dec 2025
 10:51:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFkb6ArxO79Po_kdoQ9P7-GSrzy9gs8THnfkxJ9x67Dcvg6ZfQ@mail.gmail.com>
In-Reply-To: <CAFkb6ArxO79Po_kdoQ9P7-GSrzy9gs8THnfkxJ9x67Dcvg6ZfQ@mail.gmail.com>
From: Steve Bravura <stevebravura52@gmail.com>
Date: Tue, 23 Dec 2025 20:50:48 +0200
X-Gm-Features: AQt7F2q7CCK-GPJQC2OfliljGFukZyqgRdxAXoVB3-SVemAkJ3jC8ASedp9vEPA
Message-ID: <CAFkb6Aos7pJc_X_W+yqh-oCTothAGdqamU4wTXgmzBuPy750pQ@mail.gmail.com>
Subject: Re: Intermittent mount failures with SanDisk SSD PLUS over USB
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I wanted to add something important:


sometimes, when I connect the Hikvision SSD, with the 70609-CM321
SATA->USB adapter cable, it is not seen at all, wether by gnome-disks
or Thunar oe lablk, as if i didnt connect it




this is while it is still connected:


vlad@vlad:~$ sudo dmesg | tail -100
[  428.265776] sd 2:0:0:0: [sdb] Mode Sense: 43 00 00 00
[  428.266013] sd 2:0:0:0: [sdb] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[  428.326807] sd 2:0:0:0: [sdb] Preferred minimum I/O size 512 bytes
[  428.326812] sd 2:0:0:0: [sdb] Optimal transfer size 33553920 bytes
[  428.347106]  sdb: sdb1
[  428.347209] sd 2:0:0:0: [sdb] Attached SCSI disk
[  429.960018] EXT4-fs (sdb1): mounted filesystem
695f6948-f448-4cd3-abec-51e9842bb6cb r/w with ordered data mode. Quota
mode: none.
[  433.115100] EXT4-fs (sdb1): unmounting filesystem
695f6948-f448-4cd3-abec-51e9842bb6cb.
[  433.231186] sd 2:0:0:0: [sdb] Synchronizing SCSI cache
[  433.575528] sd 2:0:0:0: [sdb] Synchronize Cache(10) failed: Result:
hostbyte=3DDID_ERROR driverbyte=3DDRIVER_OK
[  433.611262] usb 2-1: USB disconnect, device number 6
[  454.029833] usb 2-3: new SuperSpeed USB device number 7 using xhci_hcd
[  454.054443] usb 2-3: New USB device found, idVendor=3D0bda,
idProduct=3D9210, bcdDevice=3D20.01
[  454.054463] usb 2-3: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[  454.054473] usb 2-3: Product: RTL9210B-CG
[  454.054480] usb 2-3: Manufacturer: Realtek
[  454.054486] usb 2-3: SerialNumber: 012345679039
[  454.057359] usb 2-3: Enable of device-initiated U1 failed.
[  454.057850] usb 2-3: Enable of device-initiated U2 failed.
[  454.072008] usb 2-3: Enable of device-initiated U1 failed.
[  454.072575] usb 2-3: Enable of device-initiated U2 failed.
[  454.075213] scsi host2: uas
[  454.078852] scsi 2:0:0:0: Direct-Access     Realtek  RTL9210B-CG
  1.00 PQ: 0 ANSI: 6
[  454.112835] sd 2:0:0:0: Attached scsi generic sg1 type 0
[  454.119771] sd 2:0:0:0: [sdb] 250069680 512-byte logical blocks:
(128 GB/119 GiB)
[  454.121212] sd 2:0:0:0: [sdb] Write Protect is off
[  454.121217] sd 2:0:0:0: [sdb] Mode Sense: 37 00 00 08
[  454.124538] sd 2:0:0:0: [sdb] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[  454.189972] sd 2:0:0:0: [sdb] Preferred minimum I/O size 512 bytes
[  454.189977] sd 2:0:0:0: [sdb] Optimal transfer size 33553920 bytes
[  454.249751]  sdb: sdb1
[  454.250136] sd 2:0:0:0: [sdb] Attached SCSI disk
[  457.806272] usb 2-1: new SuperSpeed USB device number 8 using xhci_hcd
[  457.835935] usb 2-1: New USB device found, idVendor=3D0bda,
idProduct=3D9210, bcdDevice=3Df0.01
[  457.835956] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[  457.835966] usb 2-1: Product: HIKSEMI
[  457.835973] usb 2-1: Manufacturer: HIKSEMI
[  457.835980] usb 2-1: SerialNumber: 012345687271
[  457.866829] usb 2-1: Enable of device-initiated U1 failed.
[  457.867548] usb 2-1: Enable of device-initiated U2 failed.
[  457.896984] usb 2-1: Enable of device-initiated U1 failed.
[  457.897738] usb 2-1: Enable of device-initiated U2 failed.
[  457.900990] scsi host3: uas
[  458.306632] scsi 3:0:0:0: Direct-Access              HIKSEMI
  1.00 PQ: 0 ANSI: 6
[  458.336953] sd 3:0:0:0: Attached scsi generic sg2 type 0
[  458.340562] sd 3:0:0:0: [sdc] 500118192 512-byte logical blocks:
(256 GB/238 GiB)
[  458.341847] sd 3:0:0:0: [sdc] Write Protect is off
[  458.341864] sd 3:0:0:0: [sdc] Mode Sense: 37 00 00 08
[  458.344822] sd 3:0:0:0: [sdc] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[  458.410433] sd 3:0:0:0: [sdc] Preferred minimum I/O size 512 bytes
[  458.410438] sd 3:0:0:0: [sdc] Optimal transfer size 33553920 bytes
[  458.462009]  sdc: sdc1 sdc2 sdc3
[  458.462430] sd 3:0:0:0: [sdc] Attached SCSI disk
[  460.044940] EXT4-fs (sdc3): mounted filesystem
5d00f980-676e-4e9c-9fc3-3c2d00b8de43 r/w with ordered data mode. Quota
mode: none.
[  462.275665] EXT4-fs (sdb1): mounted filesystem
977e0186-c13d-48d0-a35a-a855506d972a r/w with ordered data mode. Quota
mode: none.
[  463.744375] EXT4-fs (sdc2): mounted filesystem
5477566d-a2c7-475c-860e-7906972aff69 r/w with ordered data mode. Quota
mode: none.
[  497.413263] EXT4-fs (sdc2): unmounting filesystem
5477566d-a2c7-475c-860e-7906972aff69.
[  498.523959] EXT4-fs (sdc3): unmounting filesystem
5d00f980-676e-4e9c-9fc3-3c2d00b8de43.
[  507.189293]  sdc: sdc1 sdc2
[  509.216710]  sdc: sdc1
[  512.945637]  sdc:
[  522.390285] EXT4-fs (sdc1): mounted filesystem
09a911d3-ca28-40da-86ff-6d9c388e76c5 r/w with ordered data mode. Quota
mode: none.
[  522.396179] EXT4-fs (sdc1): unmounting filesystem
09a911d3-ca28-40da-86ff-6d9c388e76c5.
[  528.505960] EXT4-fs (sdc1): mounted filesystem
09a911d3-ca28-40da-86ff-6d9c388e76c5 r/w with ordered data mode. Quota
mode: none.
[  530.058139] EXT4-fs (sdc1): unmounting filesystem
09a911d3-ca28-40da-86ff-6d9c388e76c5.
[  535.545246] EXT4-fs (sdc1): mounted filesystem
09a911d3-ca28-40da-86ff-6d9c388e76c5 r/w with ordered data mode. Quota
mode: none.
[  663.656402] EXT4-fs (sdb1): unmounting filesystem
977e0186-c13d-48d0-a35a-a855506d972a.
[  663.796268] sd 2:0:0:0: [sdb] Synchronizing SCSI cache
[  664.127987] sd 2:0:0:0: [sdb] Synchronize Cache(10) failed: Result:
hostbyte=3DDID_ERROR driverbyte=3DDRIVER_OK
[  664.179958] usb 2-3: USB disconnect, device number 7
[  668.638287] EXT4-fs (sdc1): unmounting filesystem
09a911d3-ca28-40da-86ff-6d9c388e76c5.
[  668.860144] sd 3:0:0:0: [sdc] Synchronizing SCSI cache
[  669.183946] sd 3:0:0:0: [sdc] Synchronize Cache(10) failed: Result:
hostbyte=3DDID_ERROR driverbyte=3DDRIVER_OK
[  669.271762] usb 2-1: USB disconnect, device number 8
[  704.527222] usb 2-3: new SuperSpeed USB device number 9 using xhci_hcd
[  704.551795] usb 2-3: New USB device found, idVendor=3D0bda,
idProduct=3D9210, bcdDevice=3D20.01
[  704.551817] usb 2-3: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[  704.551826] usb 2-3: Product: RTL9210B-CG
[  704.551833] usb 2-3: Manufacturer: Realtek
[  704.551840] usb 2-3: SerialNumber: 012345679039
[  704.559440] usb 2-3: Enable of device-initiated U1 failed.
[  704.559730] usb 2-3: Enable of device-initiated U2 failed.
[  704.577253] usb 2-3: Enable of device-initiated U1 failed.
[  704.577719] usb 2-3: Enable of device-initiated U2 failed.
[  704.580415] scsi host2: uas
[  704.584041] scsi 2:0:0:0: Direct-Access     Realtek  RTL9210B-CG
  1.00 PQ: 0 ANSI: 6
[  704.617465] sd 2:0:0:0: Attached scsi generic sg1 type 0
[  704.624590] sd 2:0:0:0: [sdb] 250069680 512-byte logical blocks:
(128 GB/119 GiB)
[  704.626068] sd 2:0:0:0: [sdb] Write Protect is off
[  704.626072] sd 2:0:0:0: [sdb] Mode Sense: 37 00 00 08
[  704.629356] sd 2:0:0:0: [sdb] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[  704.695621] sd 2:0:0:0: [sdb] Preferred minimum I/O size 512 bytes
[  704.695625] sd 2:0:0:0: [sdb] Optimal transfer size 33553920 bytes
[  704.739053]  sdb: sdb1
[  704.739229] sd 2:0:0:0: [sdb] Attached SCSI disk
[  705.771471] EXT4-fs (sdb1): mounted filesystem
977e0186-c13d-48d0-a35a-a855506d972a r/w with ordered data mode. Quota
mode: none.
[  707.152615] EXT4-fs (sdb1): unmounting filesystem
977e0186-c13d-48d0-a35a-a855506d972a.
[  707.277325] sd 2:0:0:0: [sdb] Synchronizing SCSI cache
[  707.625619] sd 2:0:0:0: [sdb] Synchronize Cache(10) failed: Result:
hostbyte=3DDID_ERROR driverbyte=3DDRIVER_OK
[  707.669257] usb 2-3: USB disconnect, device number 9
vlad@vlad:~$




vlad@vlad:~$ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda           8:0    0 238.5G  0 disk
=E2=94=9C=E2=94=80sda1        8:1    0   976M  0 part /boot/efi
=E2=94=9C=E2=94=80sda2        8:2    0 225.2G  0 part /
=E2=94=94=E2=94=80sda3        8:3    0  12.3G  0 part [SWAP]
nvme0n1     259:0    0 931.5G  0 disk
=E2=94=94=E2=94=80nvme0n1p1 259:1    0 931.5G  0 part /mnt/D
vlad@vlad:~$





vlad@vlad:~$ lsusb -t
/:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/12p, 480=
M
    |__ Port 002: Dev 002, If 0, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
    |__ Port 002: Dev 002, If 1, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
    |__ Port 002: Dev 002, If 2, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
    |__ Port 002: Dev 002, If 3, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
    |__ Port 007: Dev 003, If 0, Class=3DWireless, Driver=3Dbtusb, 12M
    |__ Port 007: Dev 003, If 1, Class=3DWireless, Driver=3Dbtusb, 12M
    |__ Port 008: Dev 004, If 0, Class=3DVendor Specific Class, Driver=3D[n=
one], 12M
    |__ Port 009: Dev 005, If 0, Class=3DVideo, Driver=3Duvcvideo, 480M
    |__ Port 009: Dev 005, If 1, Class=3DVideo, Driver=3Duvcvideo, 480M
/:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 5000=
M
vlad@vlad:~$





vlad@vlad:~$ sudo lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen
Core Processor Host Bridge/DRAM Registers [8086:5914] (rev 08)
00:02.0 VGA compatible controller [0300]: Intel Corporation UHD
Graphics 620 [8086:5917] (rev 07)
00:04.0 Signal processing controller [1180]: Intel Corporation Xeon
E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem
[8086:1903] (rev 08)
00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP USB
3.0 xHCI Controller [8086:9d2f] (rev 21)
00:14.2 Signal processing controller [1180]: Intel Corporation Sunrise
Point-LP Thermal subsystem [8086:9d31] (rev 21)
00:15.0 Signal processing controller [1180]: Intel Corporation Sunrise
Point-LP Serial IO I2C Controller #0 [8086:9d60] (rev 21)
00:15.1 Signal processing controller [1180]: Intel Corporation Sunrise
Point-LP Serial IO I2C Controller #1 [8086:9d61] (rev 21)
00:16.0 Communication controller [0780]: Intel Corporation Sunrise
Point-LP CSME HECI #1 [8086:9d3a] (rev 21)
00:17.0 SATA controller [0106]: Intel Corporation Sunrise Point-LP
SATA Controller [AHCI mode] [8086:9d03] (rev 21)
00:1c.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI
Express Root Port #4 [8086:9d13] (rev f1)
00:1d.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI
Express Root Port #9 [8086:9d18] (rev f1)
00:1e.0 Signal processing controller [1180]: Intel Corporation Sunrise
Point-LP Serial IO UART Controller #0 [8086:9d27] (rev 21)
00:1e.6 SD Host controller [0805]: Intel Corporation Sunrise Point-LP
Secure Digital IO Controller [8086:9d2d] (rev 21)
00:1f.0 ISA bridge [0601]: Intel Corporation Sunrise Point LPC/eSPI
Controller [8086:9d4e] (rev 21)
00:1f.2 Memory controller [0580]: Intel Corporation Sunrise Point-LP
PMC [8086:9d21] (rev 21)
00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-LP HD
Audio [8086:9d71] (rev 21)
00:1f.4 SMBus [0c05]: Intel Corporation Sunrise Point-LP SMBus
[8086:9d23] (rev 21)
00:1f.6 Ethernet controller [0200]: Intel Corporation Ethernet
Connection (4) I219-V [8086:15d8] (rev 21)
01:00.0 Network controller [0280]: Intel Corporation Wireless 8265 /
8275 [8086:24fd] (rev 78)
02:00.0 Non-Volatile memory controller [0108]: Sandisk Corp WD Blue
SN580 NVMe SSD (DRAM-less) [15b7:5041] (rev 01)
vlad@vlad:~$






vlad@vlad:~$ sudo lsusb -v

Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         1 Single TT
  bMaxPacketSize0        64
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0002 2.0 root hub
  bcdDevice            6.12
  iManufacturer           3 Linux 6.12.57+deb13-amd64 xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:00:14.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0019
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
Hub Descriptor:
  bLength              11
  bDescriptorType      41
  nNbrPorts            12
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
    TT think time 8 FS bits
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  DeviceRemovable    0x98 0x07
  PortPwrCtrlMask    0xff 0xff
 Hub Port Status:
   Port 1: 0000.0100 power
   Port 2: 0000.0103 power enable connect
   Port 3: 0000.0100 power
   Port 4: 0000.0100 power
   Port 5: 0000.0100 power
   Port 6: 0000.0100 power
   Port 7: 0000.0107 power suspend enable connect
   Port 8: 0000.0107 power suspend enable connect
   Port 9: 0000.0507 highspeed power suspend enable connect
   Port 10: 0000.0100 power
   Port 11: 0000.0100 power
   Port 12: 0000.0100 power
Device Status:     0x0001
  Self Powered

Bus 001 Device 002: ID 24ae:1008 Shenzhen Rapoo Technology Co., Ltd.
Rapoo 2.4G Wireless Device
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0x24ae Shenzhen Rapoo Technology Co., Ltd.
  idProduct          0x1008 Rapoo 2.4G Wireless Device
  bcdDevice            1.02
  iManufacturer           1 RAPOO
  iProduct                2 Rapoo 2.4G Wireless Device
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x006d
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      2 Mouse
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode           33 Unknown
          bNumDescriptors         1
          bDescriptorType        34 (null)
          wDescriptorLength      73
          Report Descriptors:
            ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      1 Keyboard
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode           33 Unknown
          bNumDescriptors         1
          bDescriptorType        34 (null)
          wDescriptorLength      65
          Report Descriptors:
            ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      1 Keyboard
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode           33 Unknown
          bNumDescriptors         1
          bDescriptorType        34 (null)
          wDescriptorLength     109
          Report Descriptors:
            ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode           33 Unknown
          bNumDescriptors         1
          bDescriptorType        34 (null)
          wDescriptorLength      31
          Report Descriptors:
            ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval              10
Device Status:     0x0000
  (Bus Powered)

Bus 001 Device 003: ID 8087:0a2b Intel Corp. Bluetooth wireless interface
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          224 Wireless
  bDeviceSubClass         1 Radio Frequency
  bDeviceProtocol         1 Bluetooth
  bMaxPacketSize0        64
  idVendor           0x8087 Intel Corp.
  idProduct          0x0a2b Bluetooth wireless interface
  bcdDevice            0.10
  iManufacturer           0
  iProduct                0
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00b1
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0009  1x 9 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0009  1x 9 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0011  1x 17 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0011  1x 17 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0019  1x 25 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0019  1x 25 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0021  1x 33 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0021  1x 33 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0031  1x 49 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0031  1x 49 bytes
        bInterval               1
Device Status:     0x0001
  Self Powered

Bus 001 Device 004: ID 138a:003f Validity Sensors, Inc. VFS495
Fingerprint Reader
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass        18 [unknown]
  bDeviceProtocol       255
  bMaxPacketSize0         8
  idVendor           0x138a Validity Sensors, Inc.
  idProduct          0x003f VFS495 Fingerprint Reader
  bcdDevice            1.04
  iManufacturer           0
  iProduct                0
  iSerial                 1 0030eacc9da1
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x002e
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           4
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               4
Device Status:     0x0000
  (Bus Powered)

Bus 001 Device 005: ID 04ca:706e Lite-On Technology Corp. HP HD Camera
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x04ca Lite-On Technology Corp.
  idProduct          0x706e HP HD Camera
  bcdDevice            0.05
  iManufacturer           3 DGHJCA19IAD38E
  iProduct                1 HP HD Camera
  iSerial                 2 200901010001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x02e8
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          4 USB Camera
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0
      iFunction               5 HP HD Camera
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0
      iInterface              5 HP HD Camera
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x004e
        dwClockFrequency       15.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x0000000e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier          0
        bControlSize            2
        bmControls     0x0000177f
          Brightness
          Contrast
          Hue
          Saturation
          Sharpness
          Gamma
          White Balance Temperature
          Backlight Compensation
          Gain
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0
        bmVideoStandards     0x09
          None
          SECAM - 625/50
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               4
        iTerminal               0
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {1229a78c-47b4-4094-b0ce-db07386fb938}
        bNumControls            2
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            2
        bmControls( 0)       0x00
        bmControls( 1)       0x06
        iExtension              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               6
        VideoControl Endpoint Descriptor:
          bLength                 5
          bDescriptorType        37
          bDescriptorSubtype      3 (EP_INTERRUPT)
          wMaxTransferSize       16
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      VideoStreaming Interface Descriptor:
        bLength                            15
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         2
        wTotalLength                   0x01fb
        bEndpointAddress                 0x81  EP 1 IN
        bmInfo                              0
        bTerminalLink                       3
        bStillCaptureMethod                 1
        bTriggerSupport                     1
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        1
        bNumFrameDescriptors                5
        guidFormat
{32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x01
          Still image supported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 73728000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x01
          Still image supported
        wWidth                            320
        wHeight                           180
        dwMinBitRate                 13824000
        dwMaxBitRate                 27648000
        dwMaxVideoFrameBufferSize      115200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x01
          Still image supported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                 18432000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x01
          Still image supported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                 24422400
        dwMaxBitRate                 48844800
        dwMaxVideoFrameBufferSize      203520
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x01
          Still image supported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 55296000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        2
        bNumFrameDescriptors                8
        bFlags                              1
          Fixed-size samples: Yes
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 1 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x01
          Still image supported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 73728000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x01
          Still image supported
        wWidth                            320
        wHeight                           180
        dwMinBitRate                 13824000
        dwMaxBitRate                 27648000
        dwMaxVideoFrameBufferSize      115200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x01
          Still image supported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                 18432000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x01
          Still image supported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                 24422400
        dwMaxBitRate                 48844800
        dwMaxVideoFrameBufferSize      203520
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x01
          Still image supported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 55296000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x01
          Still image supported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 97689600
        dwMaxBitRate                195379200
        dwMaxVideoFrameBufferSize      814080
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         7
        bmCapabilities                   0x01
          Still image supported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                124416000
        dwMaxBitRate                248832000
        dwMaxVideoFrameBufferSize     1036800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         8
        bmCapabilities                   0x01
          Still image supported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                221184000
        dwMaxBitRate                442368000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0080  1x 128 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0b00  2x 768 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0c00  2x 1024 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       6
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1380  3x 896 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       7
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1400  3x 1024 bytes
        bInterval               1
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)

Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Negotiated speed: SuperSpeed (5Gbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         3
  bMaxPacketSize0         9
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0003 3.0 root hub
  bcdDevice            6.12
  iManufacturer           3 Linux 6.12.57+deb13-amd64 xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:00:14.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x001f
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
        bMaxBurst               0
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x000f
  bNumDeviceCaps          1
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x02
      Latency Tolerance Messages (LTM) Supported
    wSpeedsSupported   0x0008
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat         512 micro seconds
Hub Descriptor:
  bLength              12
  bDescriptorType      42
  nNbrPorts             6
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
  bPwrOn2PwrGood       50 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  bHubDecLat          0.0 micro seconds
  wHubDelay             0 nano seconds
  DeviceRemovable    0x10
 Hub Port Status:
   Port 1: 0031.0203 C_BH_RESET C_RESET C_CONNECT 5Gbps power U0 enable con=
nect
   Port 2: 0000.02a0 5Gbps power Rx.Detect
   Port 3: 0000.02a0 5Gbps power Rx.Detect
   Port 4: 0000.02a0 5Gbps power Rx.Detect
   Port 5: 0000.02a0 5Gbps power Rx.Detect
   Port 6: 0000.02a0 5Gbps power Rx.Detect
Device Status:     0x0001
  Self Powered
vlad@vlad:~$









vlad@vlad:~$ lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 24ae:1008 Shenzhen Rapoo Technology Co., Ltd.
Rapoo 2.4G Wireless Device
Bus 001 Device 003: ID 8087:0a2b Intel Corp. Bluetooth wireless interface
Bus 001 Device 004: ID 138a:003f Validity Sensors, Inc. VFS495
Fingerprint Reader
Bus 001 Device 005: ID 04ca:706e Lite-On Technology Corp. HP HD Camera
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 010: ID 174c:1153 ASMedia Technology Inc. ASM1153 SATA
3Gb/s bridge
vlad@vlad:~$


Return-Path: <linux-usb+bounces-5084-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F7782E40D
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 00:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B29421C22428
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 23:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF3F1BC3F;
	Mon, 15 Jan 2024 23:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="EOCjJnRA";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="6kcx6Pip"
X-Original-To: linux-usb@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9961BC39
	for <linux-usb@vger.kernel.org>; Mon, 15 Jan 2024 23:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=clisp.org
ARC-Seal: i=1; a=rsa-sha256; t=1705361746; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=cT/AqyqWB0/9BiT+QP3Gs0O8byOhqrjbQF2iAPtuIpY5LU2ciXFe3VZTysGq5EZugb
    xK1RM8lgN3/ED6504bUCFyCakM4fJIM+R50HQo+8KjIZFE9k5ZLCkGMAMzFOMERuFx/P
    myWr3tzwfGeOwBQYtOhv6puX2nWwXIh0/jjYuhC0dQApAfBx0IzvB2gMpypfWQ6yWUKy
    a4NFtA1J3Nzlwk1K7La1a2sRCQn+xANszuHFJhS0Uy5xrb/Bj/xJWZ0rEwhygOuOAlSH
    a+22BucrOjWBlZ3Jrkw107LoTZogfSpUFLxPr7hSR+Fwuktf+Fgtu0RmFmRjWMxfcc8B
    SGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1705361746;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=OLpwULOWmIbw+P9yzjqudOz60Fyvle/dX6SSPNzSwH4=;
    b=gACzP/RnRdi+eZu+vqsFlyg71USmp4svBKG4Xf9kYI7lTytb2feULLA9s/TOsBBwLb
    EmjE87coINFgLo6GSlRlVqqyGfYxzFN0BcMzGSPEnY5dTuAESNQ8HM8xMZYHwsNAsSjm
    BFwnlGGpxZ/DR8iDmgHsdCsvSd9c3xbP+FtDRBBMFGymGimaf70Q2AxO4oAL/nIwVp3e
    1Y1mDBDv8oYNcZO67T61YboxJkOUYXh5h6XBpBodOoKEJ+rKz+teH5KMkc02sR/AjztW
    dj3lJksHkzIIzg5FPVBqos8S71FZqWOM9zPzOTOmekgcuJSv3QauEEcFancLnhowFGap
    dYTg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1705361746;
    s=strato-dkim-0002; d=clisp.org;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=OLpwULOWmIbw+P9yzjqudOz60Fyvle/dX6SSPNzSwH4=;
    b=EOCjJnRAJ/uhKlovjDDN4FQC5aAUccv9ql1Kl2Zt8BaY7kwBRi9dbkNJmEo/LS1bUF
    PrKA4ByHrUBjI45+muqUtjyGugnRJoc59qwle3q83wJK+EitcJNKUzHUHwKRqg/WBiPr
    +Voch3l0tH0XMZwfLXTHLwyte7Pguo6huzR0/K4RgXvS6mzGOemFAc/ldveFy2sUvW+R
    g4mCtvOHUVWibt1ZPcFNLz8PjgV135yVaIQ4PqhOQYg5drLrCCdl1P72D098Agpm/MGI
    B4M41vapceTFGNiCd58jT1x8xS88Kf52qgpg7M5QsKqJqamnRD7U/Lt+XqV8flVjv58v
    t1JA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1705361746;
    s=strato-dkim-0003; d=clisp.org;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=OLpwULOWmIbw+P9yzjqudOz60Fyvle/dX6SSPNzSwH4=;
    b=6kcx6PipjpPWsL40shpP3ksc/Y37j1MxpyMZQ2FnUzGX89svpXEhYR/mOkTKvlBPdR
    QxdvDsA3VfquATqRNYCg==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpOSiKRZGkz7dVdJFqfXgrss7axLYw=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.10.2 AUTH)
    with ESMTPSA id c5619e00FNZkLQs
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 16 Jan 2024 00:35:46 +0100 (CET)
From: Bruno Haible <bruno@clisp.org>
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: "SilverStone TS16" external SSD enclosing needs an UAS quirk
Date: Tue, 16 Jan 2024 00:35:46 +0100
Message-ID: <3750407.VQhiAETyHQ@nimes>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

TL;DR
=2D----
In my experience, the "SilverStone TS16" external SSD enclosing
needs an UAS quirk
  usb-storage.quirks=3D0bda:9210:u
as part of the kernel command line. I hope you can add it
to the file linux/drivers/usb/storage/unusual_uas.h .

Long story
=2D---------

In August 2023 I bought a new PC (Fujitsu ESPRIMO G7012A),
attached an SSD through an external SSD enclosing of type
"SilverStone TS16" [1], and used this SSD for the root and
data partitions of a Linux (Ubuntu 22.04, Linux 5.15.0-ubuntu)
installation.
The system crashed about 1 or 2 times per day, on average,
but especially upon intensive data I/O from this SSD
(namely, when working with a 50 GB VirtualBox image file).

When it crashed, I saw this in the kernel log:
=2D------------------------------------------------------------------------=
=2D------
[58783.826555] sd 3:0:0:0: [sdb] tag#13 uas_eh_abort_handler 0 uas-tag 3 in=
flight: CMD=20
[58783.826561] sd 3:0:0:0: [sdb] tag#13 CDB: Read(10) 28 00 a7 a4 21 00 00 =
00 80 00
[58783.826565] sd 3:0:0:0: [sdb] tag#10 uas_eh_abort_handler 0 uas-tag 5 in=
flight: CMD OUT=20
[58783.826567] sd 3:0:0:0: [sdb] tag#10 CDB: Write(10) 2a 00 56 fd d6 28 00=
 00 28 00
[58783.826669] sd 3:0:0:0: [sdb] tag#8 uas_eh_abort_handler 0 uas-tag 4 inf=
light: CMD OUT=20
[58783.826670] sd 3:0:0:0: [sdb] tag#8 CDB: Write(10) 2a 00 5c 7c 75 c0 00 =
00 88 00
[58783.874555] sd 3:0:0:0: [sdb] tag#3 uas_eh_abort_handler 0 uas-tag 7 inf=
light: CMD OUT=20
[58783.874560] sd 3:0:0:0: [sdb] tag#3 CDB: Write(10) 2a 00 23 62 1d 68 00 =
00 20 00
[58783.874658] sd 3:0:0:0: [sdb] tag#2 uas_eh_abort_handler 0 uas-tag 6 inf=
light: CMD OUT=20
[58783.874660] sd 3:0:0:0: [sdb] tag#2 CDB: Write(10) 2a 00 24 7c 12 90 00 =
00 08 00
[58783.874738] sd 3:0:0:0: [sdb] tag#1 uas_eh_abort_handler 0 uas-tag 2 inf=
light: CMD OUT=20
[58783.874740] sd 3:0:0:0: [sdb] tag#1 CDB: Write(10) 2a 00 24 7e 38 98 00 =
00 08 00
[58784.302551] sd 3:0:0:0: [sdb] tag#0 uas_eh_abort_handler 0 uas-tag 8 inf=
light: CMD OUT=20
[58784.302561] sd 3:0:0:0: [sdb] tag#0 CDB: Write(10) 2a 00 be 9c 85 20 00 =
00 08 00
[58785.682531] sd 3:0:0:0: [sdb] tag#17 uas_eh_abort_handler 0 uas-tag 14 i=
nflight: CMD OUT=20
[58785.682537] sd 3:0:0:0: [sdb] tag#17 CDB: Write(10) 2a 00 17 c2 82 70 00=
 00 08 00
[58785.682634] sd 3:0:0:0: [sdb] tag#16 uas_eh_abort_handler 0 uas-tag 13 i=
nflight: CMD OUT=20
[58785.682636] sd 3:0:0:0: [sdb] tag#16 CDB: Write(10) 2a 00 17 c2 81 b8 00=
 00 08 00
[58785.682710] sd 3:0:0:0: [sdb] tag#15 uas_eh_abort_handler 0 uas-tag 11 i=
nflight: CMD OUT=20
[58785.682711] sd 3:0:0:0: [sdb] tag#15 CDB: Write(10) 2a 00 17 c2 7b 98 00=
 00 08 00
[58785.682787] sd 3:0:0:0: [sdb] tag#14 uas_eh_abort_handler 0 uas-tag 10 i=
nflight: CMD OUT=20
[58785.682789] sd 3:0:0:0: [sdb] tag#14 CDB: Write(10) 2a 00 17 c2 7a e0 00=
 00 08 00
[58785.682864] sd 3:0:0:0: [sdb] tag#12 uas_eh_abort_handler 0 uas-tag 12 i=
nflight: CMD OUT=20
[58785.682865] sd 3:0:0:0: [sdb] tag#12 CDB: Write(10) 2a 00 17 c2 7f e8 00=
 00 08 00
[58785.682942] sd 3:0:0:0: [sdb] tag#11 uas_eh_abort_handler 0 uas-tag 9 in=
flight: CMD OUT=20
[58785.682944] sd 3:0:0:0: [sdb] tag#11 CDB: Write(10) 2a 00 17 c2 74 00 00=
 00 08 00
[58805.074324] sd 3:0:0:0: [sdb] tag#18 uas_eh_abort_handler 0 uas-tag 15 i=
nflight: CMD IN=20
[58805.074329] sd 3:0:0:0: [sdb] tag#18 CDB: Read(10) 28 00 be 8f 72 80 00 =
00 20 00
[58813.770230] sd 3:0:0:0: [sdb] tag#9 uas_eh_abort_handler 0 uas-tag 1 inf=
light: CMD=20
[58813.770235] sd 3:0:0:0: [sdb] tag#9 CDB: Synchronize Cache(10) 35 00 00 =
00 00 00 00 00 00 00
[58813.794245] scsi host3: uas_eh_device_reset_handler start
[58819.134207] xhci_hcd 0000:04:00.4: Timeout while waiting for setup devic=
e command
[58824.514145] xhci_hcd 0000:04:00.4: Timeout while waiting for setup devic=
e command
[58824.726112] usb 4-2.1: device not accepting address 3, error -62
[58830.146082] xhci_hcd 0000:04:00.4: Timeout while waiting for setup devic=
e command
[58835.518040] xhci_hcd 0000:04:00.4: Timeout while waiting for setup devic=
e command
[58835.726001] usb 4-2.1: device not accepting address 3, error -62
[58836.070158] usb 4-2.1: Device not responding to setup address.
[58836.286161] usb 4-2.1: Device not responding to setup address.
[58836.493991] usb 4-2.1: device not accepting address 3, error -71
[58836.842156] usb 4-2.1: Device not responding to setup address.
[58837.058154] usb 4-2.1: Device not responding to setup address.
[58837.265983] usb 4-2.1: device not accepting address 3, error -71
[58837.266075] scsi host3: uas_eh_device_reset_handler FAILED err -19
[58837.266082] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266084] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266085] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266087] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266088] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266089] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266090] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266091] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266092] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266093] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266094] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266095] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266096] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266098] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266099] sd 3:0:0:0: Device offlined - not ready after error recovery
[58837.266109] sd 3:0:0:0: [sdb] tag#9 FAILED Result: hostbyte=3DDID_TIME_O=
UT driverbyte=3DDRIVER_OK cmd_age=3D83s
[58837.266112] sd 3:0:0:0: [sdb] tag#9 CDB: Synchronize Cache(10) 35 00 00 =
00 00 00 00 00 00 00
[58837.266112] usb 4-2.1: USB disconnect, device number 3
[58837.266117] blk_update_request: I/O error, dev sdb, sector 2523966464 op=
 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
[58837.266130] Aborting journal on device sdb7-8.
[58837.266132] sd 3:0:0:0: [sdb] tag#18 FAILED Result: hostbyte=3DDID_TIME_=
OUT driverbyte=3DDRIVER_OK cmd_age=3D63s
[58837.266135] sd 3:0:0:0: [sdb] tag#18 CDB: Read(10) 28 00 be 8f 72 80 00 =
00 20 00
[58837.266136] blk_update_request: I/O error, dev sdb, sector 3197072000 op=
 0x0:(READ) flags 0x0 phys_seg 4 prio class 0
[58837.266145] sd 3:0:0:0: [sdb] tag#11 FAILED Result: hostbyte=3DDID_TIME_=
OUT driverbyte=3DDRIVER_OK cmd_age=3D81s
[58837.266147] sd 3:0:0:0: [sdb] tag#11 CDB: Write(10) 2a 00 17 c2 74 00 00=
 00 08 00
[58837.266148] blk_update_request: I/O error, dev sdb, sector 398619648 op =
0x1:(WRITE) flags 0x0 phys_seg 1 prio class 0
=2D------------------------------------------------------------------------=
=2D------

This pointed to the UAS driver. Wikipedia [2] says:
  "The kernel has a built-in blacklist for devices with "quirks" defined
   in unusual_uas.h.[20] Temporary additional quirks can be added via procfs
   or kernel command line (usb-storage.quirks).[21]"

So, that's what I did: I added an option
  usb-storage.quirks=3D0bda:9210:u
to the kernel command line in /boot/grub/grub.cfg =E2=80=94 and thus reached
an uptime of 90 days. The effect of this change in the 'lshw' output
was to replace the lines
                         capabilities: usb-3.20 scsi
                         configuration: driver=3Duas maxpower=3D896mA speed=
=3D10000Mbit/s
with the lines
                         capabilities: usb-3.20 scsi emulated scsi-host
                         configuration: driver=3Dusb-storage maxpower=3D896=
mA speed=3D10000Mbit/s

When I rebooted after 90 days, Ubuntu's automatic upgrades had erased my
modifications to /boot/grub/grub.cfg, and as a consequence the crashes
started to occur again.


Do you need more info from me, in order to add an entry to
linux/drivers/usb/storage/unusual_uas.h ?


[1] https://www.amazon.com/-/en/dp/B09KMPYD9C/ref=3Dsr_1_1
[2] https://en.wikipedia.org/wiki/USB_Attached_SCSI





Return-Path: <linux-usb+bounces-23657-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBDAA7DBA
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 02:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 417A51B65D24
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 00:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5614D748D;
	Sat,  3 May 2025 00:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/Nw0L3B"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE471186A
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 00:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746231832; cv=none; b=oJJjpB1m2hZmeQOoJ+VJ1uJAh8VZuPgXhim6lGShGoBOUGbEEswBn3wSEtH6ZD3ci2dQ0WCKhvHws9r0Py5ihzWUq+ADqzskXzJwYE3AG4iIixufpGDMug2+Er0+1UnVOnR0D4vV1Mf36OYZvbJgv0dhuEhi7IzGyD8m/UzX3N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746231832; c=relaxed/simple;
	bh=4oY3px4hV+WH+awyZqKdGu1V7WGd7l4g4GycmmCki5E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Na4FYLu0GfkG0IIrsWOSgWxCF7ONPdNz+EdP4m2KCg4mYTbepWIKl684b0WWsJd3Kv2PwB/LA8MJQDcigLpFZW/3OUZ7KB68m3QgHyVXTvKmY+HE5igqFHE7T/QyOsrmvEVDOK83n5XsGiAUa56okBxBnl1GbjneKWrglQty+Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/Nw0L3B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44CC3C4CEED
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 00:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746231832;
	bh=4oY3px4hV+WH+awyZqKdGu1V7WGd7l4g4GycmmCki5E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=g/Nw0L3BZTZD6yhpAqsgiO9C7AvAbw+OEVRWf2V5YGGvlkfwV5IjkKj/k++AQ0DJk
	 EFPQMJ92QIj2aO6AX+ek2eidC9q9pKfaOlZCtSb10nO3/u4AJHbhYbfCuwVyigX7bW
	 Fb1XHTE7Y8vS6rDACvwGq0U2M7W6Hzb6qBHrcNVuGAshh9fbI5LMNJiT7DWZQRd9wo
	 iF+rLjrcO5oiVQ57ueesfRlkbCN2yQxUZezzNvVVZl7b5mM1Gxy7L8lRI9vNEtO34n
	 9QQdlMJ5ysC0uIBxwugoHbC/bAAVXLuo4HgYLgDNkUNGbUYx9nYsVZr7/aIeh1uWEq
	 9S12TPfMQoVJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3C31EC41612; Sat,  3 May 2025 00:23:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sat, 03 May 2025 00:23:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-Q0ZGxWEs2N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #23 from Claudio Wunder (cwunder@gnome.org) ---
I was finally able to capture a zip from debugfs before unbind/bind.

Here's the file:
https://gist.github.com/ovflowd/0b0aa5c748683eca33909dc3ed7c66f7#file-debug=
fs-new-zip

And the logs:

```
May 03 01:53:29 angel-thesis kernel: xhci_hcd 0000:6a:00.0: Event TRB for s=
lot
19 ep 0 with no TDs queued
May 03 01:53:29 angel-thesis kernel: usb 8-3: Device not responding to setup
address.
May 03 01:53:44 angel-thesis kernel: xhci_hcd 0000:6a:00.0: ERROR unknown e=
vent
type 4
May 03 01:53:44 angel-thesis kernel: xhci_hcd 0000:6a:00.0: Abort failed to
stop command ring: -110
May 03 01:53:44 angel-thesis kernel: xhci_hcd 0000:6a:00.0: xHCI host
controller not responding, assume dead
May 03 01:53:44 angel-thesis kernel: xhci_hcd 0000:6a:00.0: HC died; cleani=
ng
up
May 03 01:53:44 angel-thesis kernel: xhci_hcd 0000:6a:00.0: Timeout while
waiting for setup device command
May 03 01:53:44 angel-thesis kernel: usb 7-2: USB disconnect, device number=
 11
May 03 01:53:44 angel-thesis kernel: usb 7-2.3: USB disconnect, device numb=
er
12
May 03 01:53:44 angel-thesis kernel: usb 7-2.3.1: USB disconnect, device nu=
mber
14
May 03 01:53:44 angel-thesis kernel: usb 7-2.3.2: USB disconnect, device nu=
mber
15
May 03 01:53:44 angel-thesis kernel: usb 7-2.5: USB disconnect, device numb=
er
13
May 03 01:53:44 angel-thesis kernel: usb 7-3: USB disconnect, device number=
 16
May 03 01:53:44 angel-thesis kernel: usb 7-3.1: USB disconnect, device numb=
er
17
May 03 01:53:44 angel-thesis kernel: usb 7-3.3: USB disconnect, device numb=
er
18
May 03 01:53:44 angel-thesis kernel: usb 7-3.4: USB disconnect, device numb=
er
19
May 03 01:53:44 angel-thesis kernel: usb 7-3.4.2: USB disconnect, device nu=
mber
21
May 03 01:53:44 angel-thesis kernel: usb 7-3.5: USB disconnect, device numb=
er
20
May 03 01:53:44 angel-thesis kernel: usb 7-5: USB disconnect, device number=
 2
May 03 01:53:44 angel-thesis kernel: usb 7-5.2: USB disconnect, device numb=
er 4
May 03 01:53:44 angel-thesis kernel: usb 8-3: device not accepting address =
5,
error -62
May 03 01:53:44 angel-thesis kernel: usb 8-3: USB disconnect, device number=
 5
May 03 01:53:44 angel-thesis kernel: usb 8-3.4: USB disconnect, device numb=
er 6
May 03 01:53:44 angel-thesis kernel: usb usb8-port3: couldn't allocate
usb_device
May 03 01:53:44 angel-thesis kernel: usb 8-2: USB disconnect, device number=
 4
May 03 01:53:44 angel-thesis kernel: usb 8-5: USB disconnect, device number=
 2
May 03 01:53:44 angel-thesis kernel: usb 7-7: USB disconnect, device number=
 3
May 03 01:53:44 angel-thesis kernel: usb 7-11: USB disconnect, device numbe=
r 5
```

Here's unbind:

```
May 03 02:16:07 angel-thesis kernel: xhci_hcd 0000:6a:00.0: remove, state 1
May 03 02:16:07 angel-thesis kernel: usb usb8: USB disconnect, device numbe=
r 1
May 03 02:16:07 angel-thesis kernel: xhci_hcd 0000:6a:00.0: USB bus 8
deregistered
May 03 02:16:07 angel-thesis kernel: xhci_hcd 0000:6a:00.0: remove, state 1
May 03 02:16:07 angel-thesis kernel: usb usb7: USB disconnect, device numbe=
r 1
May 03 02:16:07 angel-thesis kernel: xhci_hcd 0000:6a:00.0: USB bus 7
deregistered
```

Here's bind:

```
May 03 02:16:12 angel-thesis kernel: xhci_hcd 0000:6a:00.0: xHCI Host
Controller
May 03 02:16:12 angel-thesis kernel: xhci_hcd 0000:6a:00.0: new USB bus
registered, assigned bus number 7
May 03 02:16:12 angel-thesis kernel: xhci_hcd 0000:6a:00.0: hcc params
0x0200ef81 hci version 0x110 quirks 0x0000000200000010
May 03 02:16:12 angel-thesis kernel: xhci_hcd 0000:6a:00.0: xHCI Host
Controller
May 03 02:16:12 angel-thesis kernel: xhci_hcd 0000:6a:00.0: new USB bus
registered, assigned bus number 8
May 03 02:16:12 angel-thesis kernel: xhci_hcd 0000:6a:00.0: Host supports U=
SB
3.2 Enhanced SuperSpeed
May 03 02:16:12 angel-thesis kernel: usb usb7: New USB device found,
idVendor=3D1d6b, idProduct=3D0002, bcdDevice=3D 6.14
May 03 02:16:12 angel-thesis kernel: usb usb7: New USB device strings: Mfr=
=3D3,
Product=3D2, SerialNumber=3D1
May 03 02:16:12 angel-thesis kernel: usb usb7: Product: xHCI Host Controller
May 03 02:16:12 angel-thesis kernel: usb usb7: Manufacturer: Linux
6.14.4-103.bazzite.fc42.x86_64 xhci-hcd
May 03 02:16:12 angel-thesis kernel: usb usb7: SerialNumber: 0000:6a:00.0
May 03 02:16:12 angel-thesis kernel: usb usb8: We don't know the algorithms=
 for
LPM for this host, disabling LPM.
May 03 02:16:12 angel-thesis kernel: usb usb8: New USB device found,
idVendor=3D1d6b, idProduct=3D0003, bcdDevice=3D 6.14
May 03 02:16:12 angel-thesis kernel: usb usb8: New USB device strings: Mfr=
=3D3,
Product=3D2, SerialNumber=3D1
May 03 02:16:12 angel-thesis kernel: usb usb8: Product: xHCI Host Controller
May 03 02:16:12 angel-thesis kernel: usb usb8: Manufacturer: Linux
6.14.4-103.bazzite.fc42.x86_64 xhci-hcd
May 03 02:16:12 angel-thesis kernel: usb usb8: SerialNumber: 0000:6a:00.0
May 03 02:16:12 angel-thesis kernel: usb 7-2: new high-speed USB device num=
ber
2 using xhci_hcd
May 03 02:16:13 angel-thesis kernel: usb 7-2: New USB device found,
idVendor=3D2109, idProduct=3D4817, bcdDevice=3D 1.73
May 03 02:16:13 angel-thesis kernel: usb 7-2: New USB device strings: Mfr=
=3D1,
Product=3D2, SerialNumber=3D0
May 03 02:16:13 angel-thesis kernel: usb 7-2: Product: USB2.0 Hub=20=20=20=
=20=20=20=20=20=20=20=20=20=20
May 03 02:16:13 angel-thesis kernel: usb 7-2: Manufacturer: VIA Labs, Inc.=
=20=20=20=20=20=20
May 03 02:16:13 angel-thesis kernel: usb 8-2: new SuperSpeed USB device num=
ber
2 using xhci_hcd
May 03 02:16:13 angel-thesis kernel: usb 8-2: New USB device found,
idVendor=3D2109, idProduct=3D3817, bcdDevice=3D 1.73
May 03 02:16:13 angel-thesis kernel: usb 8-2: New USB device strings: Mfr=
=3D1,
Product=3D2, SerialNumber=3D0
May 03 02:16:13 angel-thesis kernel: usb 8-2: Product: USB3.0 Hub=20=20=20=
=20=20=20=20=20=20=20=20=20=20
May 03 02:16:13 angel-thesis kernel: usb 8-2: Manufacturer: VIA Labs, Inc.=
=20=20=20=20=20=20
May 03 02:16:13 angel-thesis kernel: usb 7-3: new high-speed USB device num=
ber
3 using xhci_hcd
May 03 02:16:13 angel-thesis kernel: usb 7-3: New USB device found,
idVendor=3D2109, idProduct=3D2817, bcdDevice=3D 7.74
May 03 02:16:14 angel-thesis kernel: usb 7-3: New USB device strings: Mfr=
=3D1,
Product=3D2, SerialNumber=3D3
May 03 02:16:14 angel-thesis kernel: usb 7-3: Product: USB2.0 Hub=20=20=20=
=20=20=20=20=20=20=20=20=20=20
May 03 02:16:14 angel-thesis kernel: usb 7-3: Manufacturer: VIA Labs, Inc.=
=20=20=20=20=20=20
May 03 02:16:14 angel-thesis kernel: usb 7-3: SerialNumber: 000000000
May 03 02:16:14 angel-thesis kernel: usb 8-3: new SuperSpeed USB device num=
ber
3 using xhci_hcd
May 03 02:16:14 angel-thesis kernel: usb 8-3: New USB device found,
idVendor=3D2109, idProduct=3D0817, bcdDevice=3D 7.74
May 03 02:16:14 angel-thesis kernel: usb 8-3: New USB device strings: Mfr=
=3D1,
Product=3D2, SerialNumber=3D3
May 03 02:16:14 angel-thesis kernel: usb 8-3: Product: USB3.0 Hub=20=20=20=
=20=20=20=20=20=20=20=20=20=20
May 03 02:16:14 angel-thesis kernel: usb 8-3: Manufacturer: VIA Labs, Inc.=
=20=20=20=20=20=20
May 03 02:16:14 angel-thesis kernel: usb 8-3: SerialNumber: 000000000
May 03 02:16:14 angel-thesis kernel: usb 7-5: new high-speed USB device num=
ber
4 using xhci_hcd
May 03 02:16:14 angel-thesis kernel: usb 7-5: New USB device found,
idVendor=3D174c, idProduct=3D2074, bcdDevice=3D 0.01
May 03 02:16:14 angel-thesis kernel: usb 7-5: New USB device strings: Mfr=
=3D2,
Product=3D3, SerialNumber=3D0
May 03 02:16:14 angel-thesis kernel: usb 7-5: Product: ASM107x
May 03 02:16:14 angel-thesis kernel: usb 7-5: Manufacturer: ASUS TEK.
May 03 02:16:14 angel-thesis kernel: usb 7-2.3: new high-speed USB device
number 5 using xhci_hcd
May 03 02:16:14 angel-thesis kernel: usb 7-2.3: New USB device found,
idVendor=3D1a40, idProduct=3D0801, bcdDevice=3D 1.00
May 03 02:16:14 angel-thesis kernel: usb 7-2.3: New USB device strings: Mfr=
=3D0,
Product=3D1, SerialNumber=3D0
May 03 02:16:14 angel-thesis kernel: usb 7-2.3: Product: USB 2.0 Hub
May 03 02:16:15 angel-thesis kernel: usb 8-5: new SuperSpeed USB device num=
ber
4 using xhci_hcd
May 03 02:16:15 angel-thesis kernel: usb 8-5: New USB device found,
idVendor=3D174c, idProduct=3D3074, bcdDevice=3D 0.01
May 03 02:16:15 angel-thesis kernel: usb 8-5: New USB device strings: Mfr=
=3D2,
Product=3D3, SerialNumber=3D0
May 03 02:16:15 angel-thesis kernel: usb 8-5: Product: ASM107x
May 03 02:16:15 angel-thesis kernel: usb 8-5: Manufacturer: ASUS TEK.
May 03 02:16:15 angel-thesis kernel: usb 7-7: new high-speed USB device num=
ber
6 using xhci_hcd
May 03 02:16:15 angel-thesis kernel: usb 7-7: New USB device found,
idVendor=3D1e71, idProduct=3D300e, bcdDevice=3D 2.00
May 03 02:16:15 angel-thesis kernel: usb 7-7: New USB device strings: Mfr=
=3D1,
Product=3D2, SerialNumber=3D3
May 03 02:16:15 angel-thesis kernel: usb 7-7: Product: NZXT Kraken Base
May 03 02:16:15 angel-thesis kernel: usb 7-7: Manufacturer: NZXT Inc.
May 03 02:16:15 angel-thesis kernel: usb 7-7: SerialNumber:
E7474745ABA22D589754E50CB2A69D11
May 03 02:16:15 angel-thesis kernel: nzxt_kraken3 0003:1E71:300E.0016: hidr=
aw1:
USB HID v1.11 Device [NZXT Inc. NZXT Kraken Base] on usb-0000:6a:00.0-7/inp=
ut1
May 03 02:16:15 angel-thesis kernel: usb 7-3.1: new full-speed USB device
number 7 using xhci_hcd
May 03 02:16:15 angel-thesis kernel: usb 8-3.4: new SuperSpeed USB device
number 5 using xhci_hcd
May 03 02:16:15 angel-thesis kernel: usb 8-3.4: New USB device found,
idVendor=3D2109, idProduct=3D0211, bcdDevice=3D 5.84
May 03 02:16:15 angel-thesis kernel: usb 8-3.4: New USB device strings: Mfr=
=3D1,
Product=3D2, SerialNumber=3D0
May 03 02:16:15 angel-thesis kernel: usb 8-3.4: Product: USB3.0 Hub=20=20=
=20=20=20=20=20=20=20=20=20=20=20
May 03 02:16:15 angel-thesis kernel: usb 8-3.4: Manufacturer: VIA Labs, Inc=
.=20=20=20=20
May 03 02:16:15 angel-thesis kernel: usb 7-3.1: New USB device found,
idVendor=3D046d, idProduct=3Dc548, bcdDevice=3D 5.01
May 03 02:16:16 angel-thesis kernel: usb 7-3.1: New USB device strings: Mfr=
=3D1,
Product=3D2, SerialNumber=3D0
May 03 02:16:16 angel-thesis kernel: usb 7-3.1: Product: USB Receiver
May 03 02:16:16 angel-thesis kernel: usb 7-3.1: Manufacturer: Logitech
May 03 02:16:16 angel-thesis kernel: input: Logitech USB Receiver as
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.0/usb=
7/7-3/7-3.1/7-3.1:1.0/0003:046D:C548.0017/input/input26
May 03 02:16:16 angel-thesis kernel: usb 7-2.5: new high-speed USB device
number 8 using xhci_hcd
May 03 02:16:16 angel-thesis kernel: hid-generic 0003:046D:C548.0017:
input,hidraw2: USB HID v1.11 Keyboard [Logitech USB Receiver] on
usb-0000:6a:00.0-3.1/input0
May 03 02:16:16 angel-thesis kernel: usb 7-2.5: New USB device found,
idVendor=3D2109, idProduct=3D8817, bcdDevice=3D 0.01
May 03 02:16:16 angel-thesis kernel: usb 7-2.5: New USB device strings: Mfr=
=3D1,
Product=3D2, SerialNumber=3D3
May 03 02:16:16 angel-thesis kernel: usb 7-2.5: Product: USB Billboard Devi=
ce=20=20=20
May 03 02:16:16 angel-thesis kernel: usb 7-2.5: Manufacturer: VIA Labs, Inc=
.=20=20=20=20
May 03 02:16:16 angel-thesis kernel: usb 7-2.5: SerialNumber: 0000000000000=
001
May 03 02:16:16 angel-thesis kernel: input: Logitech USB Receiver Mouse as
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.0/usb=
7/7-3/7-3.1/7-3.1:1.1/0003:046D:C548.0018/input/input27
May 03 02:16:16 angel-thesis kernel: input: Logitech USB Receiver Consumer
Control as
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.0/usb=
7/7-3/7-3.1/7-3.1:1.1/0003:046D:C548.0018/input/input28
May 03 02:16:16 angel-thesis kernel: input: Logitech USB Receiver System
Control as
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.0/usb=
7/7-3/7-3.1/7-3.1:1.1/0003:046D:C548.0018/input/input29
May 03 02:16:16 angel-thesis kernel: hid-generic 0003:046D:C548.0018:
input,hidraw3: USB HID v1.11 Mouse [Logitech USB Receiver] on
usb-0000:6a:00.0-3.1/input1
May 03 02:16:16 angel-thesis kernel: usb 7-5.2: new high-speed USB device
number 9 using xhci_hcd
May 03 02:16:16 angel-thesis kernel: hid-generic 0003:046D:C548.0019:
hiddev97,hidraw4: USB HID v1.11 Device [Logitech USB Receiver] on
usb-0000:6a:00.0-3.1/input2
May 03 02:16:16 angel-thesis kernel: usb 7-5.2: New USB device found,
idVendor=3D046d, idProduct=3Dc54d, bcdDevice=3D14.02
May 03 02:16:16 angel-thesis kernel: usb 7-5.2: New USB device strings: Mfr=
=3D1,
Product=3D2, SerialNumber=3D3
May 03 02:16:16 angel-thesis kernel: usb 7-5.2: Product: USB Receiver
May 03 02:16:16 angel-thesis kernel: usb 7-5.2: Manufacturer: Logitech
May 03 02:16:16 angel-thesis kernel: usb 7-5.2: SerialNumber: 327534813432
May 03 02:16:16 angel-thesis kernel: input: Logitech USB Receiver as
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.0/usb=
7/7-5/7-5.2/7-5.2:1.0/0003:046D:C54D.001A/input/input30
May 03 02:16:16 angel-thesis kernel: hid-generic 0003:046D:C54D.001A:
input,hidraw5: USB HID v1.11 Mouse [Logitech USB Receiver] on
usb-0000:6a:00.0-5.2/input0
May 03 02:16:16 angel-thesis kernel: usb 7-2.3.1: new full-speed USB device
number 10 using xhci_hcd
May 03 02:16:16 angel-thesis kernel: input: Logitech USB Receiver Keyboard =
as
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.0/usb=
7/7-5/7-5.2/7-5.2:1.1/0003:046D:C54D.001B/input/input31
May 03 02:16:16 angel-thesis kernel: hid-generic 0003:046D:C54D.001B:
input,hidraw7: USB HID v1.11 Keyboard [Logitech USB Receiver] on
usb-0000:6a:00.0-5.2/input1
May 03 02:16:16 angel-thesis kernel: hid-generic 0003:046D:C54D.001C:
hiddev98,hidraw8: USB HID v1.11 Device [Logitech USB Receiver] on
usb-0000:6a:00.0-5.2/input2
May 03 02:16:16 angel-thesis kernel: usb 7-2.3.1: config 1 has an invalid
interface number: 5 but max is 3
May 03 02:16:16 angel-thesis kernel: usb 7-2.3.1: config 1 has no interface
number 3
May 03 02:16:16 angel-thesis kernel: usb 7-2.3.1: New USB device found,
idVendor=3D19f7, idProduct=3D004e, bcdDevice=3D 1.54
May 03 02:16:16 angel-thesis kernel: usb 7-2.3.1: New USB device strings:
Mfr=3D1, Product=3D2, SerialNumber=3D3
May 03 02:16:16 angel-thesis kernel: usb 7-2.3.1: Product: R=C3=98DECaster =
Duo
May 03 02:16:16 angel-thesis kernel: usb 7-2.3.1: Manufacturer: R=C3=98DE
May 03 02:16:16 angel-thesis kernel: usb 7-11: new full-speed USB device nu=
mber
11 using xhci_hcd
May 03 02:16:16 angel-thesis kernel: usb 7-2.3.1: 1:1: cannot get freq at ep
0x82
May 03 02:16:16 angel-thesis kernel: usb 7-2.3.1: 1:2: cannot get freq at ep
0x82
May 03 02:16:16 angel-thesis kernel: usb 7-2.3.1: 2:1: cannot get freq at ep
0x2
May 03 02:16:17 angel-thesis kernel: usb 7-11: config 1 has an invalid
interface number: 2 but max is 1
May 03 02:16:17 angel-thesis kernel: usb 7-11: config 1 has no interface nu=
mber
1
May 03 02:16:17 angel-thesis kernel: usb 7-11: New USB device found,
idVendor=3D0b05, idProduct=3D18f3, bcdDevice=3D 1.00
May 03 02:16:17 angel-thesis kernel: usb 7-11: New USB device strings: Mfr=
=3D1,
Product=3D2, SerialNumber=3D3
May 03 02:16:17 angel-thesis kernel: usb 7-11: Product: AURA LED Controller
May 03 02:16:17 angel-thesis kernel: usb 7-11: Manufacturer: AsusTek Comput=
er
Inc.
May 03 02:16:17 angel-thesis kernel: usb 7-11: SerialNumber: 9876543210
May 03 02:16:17 angel-thesis kernel: hid-generic 0003:0B05:18F3.001D:
hiddev99,hidraw9: USB HID v1.11 Device [AsusTek Computer Inc. AURA LED
Controller] on usb-0000:6a:00.0-11/input2
May 03 02:16:17 angel-thesis mtp-probe[94519]: checking bus 7, device 11:
"/sys/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.=
0/usb7/7-11"
May 03 02:16:17 angel-thesis mtp-probe[94520]: checking bus 7, device 6:
"/sys/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.=
0/usb7/7-7"
May 03 02:16:17 angel-thesis kernel: usb 7-3.3: new high-speed USB device
number 12 using xhci_hcd
May 03 02:16:17 angel-thesis mtp-probe[94537]: checking bus 7, device 9:
"/sys/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.=
0/usb7/7-5/7-5.2"
May 03 02:16:17 angel-thesis mtp-probe[94545]: checking bus 7, device 6:
"/sys/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.=
0/usb7/7-7"
May 03 02:16:17 angel-thesis kernel: usb 7-3.3: New USB device found,
idVendor=3D2e1a, idProduct=3D4c03, bcdDevice=3D 2.00
May 03 02:16:17 angel-thesis kernel: usb 7-3.3: New USB device strings: Mfr=
=3D1,
Product=3D2, SerialNumber=3D0
May 03 02:16:17 angel-thesis kernel: usb 7-3.3: Product: Insta360 Link 2C
May 03 02:16:17 angel-thesis kernel: usb 7-3.3: Manufacturer: Insta360
May 03 02:16:17 angel-thesis kernel: usb 7-3.3: Found UVC 1.10 device Insta=
360
Link 2C (2e1a:4c03)
May 03 02:16:17 angel-thesis kernel: usb 7-2.3.2: new full-speed USB device
number 13 using xhci_hcd
May 03 02:16:17 angel-thesis kernel: usb 7-3.3: Warning! Unlikely big volume
range (=3D32767), cval->res is probably wrong.
May 03 02:16:17 angel-thesis kernel: usb 7-3.3: [9] FU [Mic Capture Volume]=
 ch
=3D 1, val =3D -32768/-1/1
May 03 02:16:17 angel-thesis kernel: usb 7-2.3.2: New USB device found,
idVendor=3D31e3, idProduct=3D1322, bcdDevice=3D 2.30
May 03 02:16:18 angel-thesis kernel: usb 7-2.3.2: New USB device strings:
Mfr=3D1, Product=3D2, SerialNumber=3D3
May 03 02:16:18 angel-thesis kernel: usb 7-2.3.2: Product: Wooting 60HE+
May 03 02:16:18 angel-thesis kernel: usb 7-2.3.2: Manufacturer: Wooting
May 03 02:16:18 angel-thesis kernel: usb 7-2.3.2: SerialNumber:
A02B2422W05T01100S02H23388
May 03 02:16:18 angel-thesis kernel: usb 7-3.4: new high-speed USB device
number 14 using xhci_hcd
May 03 02:16:18 angel-thesis kernel: hid-generic 0003:31E3:1322.001E:
hiddev101,hidraw10: USB HID v1.11 Device [Wooting Wooting 60HE+] on
usb-0000:6a:00.0-2.3.2/input0
May 03 02:16:18 angel-thesis kernel: input: Wooting Wooting 60HE+ as
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.0/usb=
7/7-2/7-2.3/7-2.3.2/7-2.3.2:1.1/0003:31E3:1322.001F/input/input32
May 03 02:16:18 angel-thesis kernel: hid-generic 0003:31E3:1322.001F:
input,hidraw11: USB HID v1.11 Keyboard [Wooting Wooting 60HE+] on
usb-0000:6a:00.0-2.3.2/input1
May 03 02:16:18 angel-thesis kernel: usb 7-3.4: New USB device found,
idVendor=3D2109, idProduct=3D2211, bcdDevice=3D 5.84
May 03 02:16:18 angel-thesis kernel: usb 7-3.4: New USB device strings: Mfr=
=3D1,
Product=3D2, SerialNumber=3D0
May 03 02:16:18 angel-thesis kernel: usb 7-3.4: Product: USB2.0 Hub=20=20=
=20=20=20=20=20=20=20=20=20=20=20
May 03 02:16:18 angel-thesis kernel: usb 7-3.4: Manufacturer: VIA Labs, Inc=
.=20=20=20=20
May 03 02:16:18 angel-thesis kernel: hid-generic 0003:31E3:1322.0020:
hiddev102,hidraw12: USB HID v1.11 Device [Wooting Wooting 60HE+] on
usb-0000:6a:00.0-2.3.2/input2
May 03 02:16:18 angel-thesis kernel: input: Wooting Wooting 60HE+ System
Control as
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.0/usb=
7/7-2/7-2.3/7-2.3.2/7-2.3.2:1.3/0003:31E3:1322.0021/input/input33
May 03 02:16:18 angel-thesis kernel: input: Wooting Wooting 60HE+ Consumer
Control as
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.0/usb=
7/7-2/7-2.3/7-2.3.2/7-2.3.2:1.3/0003:31E3:1322.0021/input/input34
May 03 02:16:18 angel-thesis kernel: input: Wooting Wooting 60HE+ Mouse as
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.0/usb=
7/7-2/7-2.3/7-2.3.2/7-2.3.2:1.3/0003:31E3:1322.0021/input/input35
May 03 02:16:18 angel-thesis kernel: hid-generic 0003:31E3:1322.0021:
input,hidraw13: USB HID v1.11 Mouse [Wooting Wooting 60HE+] on
usb-0000:6a:00.0-2.3.2/input3
May 03 02:16:18 angel-thesis kernel: hid-generic 0003:31E3:1322.0022:
hiddev103,hidraw14: USB HID v1.11 Device [Wooting Wooting 60HE+] on
usb-0000:6a:00.0-2.3.2/input4
May 03 02:16:18 angel-thesis kernel: usb 7-3.5: new high-speed USB device
number 15 using xhci_hcd
May 03 02:16:18 angel-thesis mtp-probe[94588]: checking bus 7, device 10:
"/sys/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.=
0/usb7/7-2/7-2.3/7-2.3.1"
May 03 02:16:18 angel-thesis mtp-probe[94589]: checking bus 7, device 13:
"/sys/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.=
0/usb7/7-2/7-2.3/7-2.3.2"
May 03 02:16:18 angel-thesis mtp-probe[94633]: checking bus 7, device 10:
"/sys/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.=
0/usb7/7-2/7-2.3/7-2.3.1"
May 03 02:16:18 angel-thesis kernel: usb 7-3.5: New USB device found,
idVendor=3D2109, idProduct=3D8884, bcdDevice=3D 0.01
May 03 02:16:18 angel-thesis kernel: usb 7-3.5: New USB device strings: Mfr=
=3D1,
Product=3D2, SerialNumber=3D3
May 03 02:16:18 angel-thesis kernel: usb 7-3.5: Product: USB Billboard Devi=
ce=20=20=20
May 03 02:16:18 angel-thesis kernel: usb 7-3.5: Manufacturer: VIA Labs, Inc=
.=20=20=20=20
May 03 02:16:18 angel-thesis kernel: usb 7-3.5: SerialNumber: 0000000000000=
001
May 03 02:16:18 angel-thesis mtp-probe[94639]: checking bus 7, device 7:
"/sys/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.=
0/usb7/7-3/7-3.1"
May 03 02:16:18 angel-thesis mtp-probe[94640]: checking bus 7, device 12:
"/sys/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.=
0/usb7/7-3/7-3.3"
May 03 02:16:18 angel-thesis mtp-probe[94679]: checking bus 7, device 12:
"/sys/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.=
0/usb7/7-3/7-3.3"
May 03 02:16:18 angel-thesis mtp-probe[94686]: checking bus 7, device 9:
"/sys/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.=
0/usb7/7-5/7-5.2"
May 03 02:16:18 angel-thesis mtp-probe[94687]: checking bus 7, device 11:
"/sys/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6a:00.=
0/usb7/7-11"
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


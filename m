Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D50C30F5D3
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 16:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237163AbhBDPIR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 10:08:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:48486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236742AbhBDPHR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Feb 2021 10:07:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 83B6D64DE7
        for <linux-usb@vger.kernel.org>; Thu,  4 Feb 2021 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612451195;
        bh=66JbydqupNlZQ7OmVsqXWf2HlFLQE3/nbC8Ig9yOzqg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LNUpvBjsaQfi8/26GIlJOn9jBgpwrESuqWAdnVRzy3h11Re81xF6fhT5Lp/JT/Epl
         6JDphcPKNAJ8ehh5sma9cRp6WA91b3KvM4L5V94lRXQpN1TQ3vwRMV8VQeEPhJEaWC
         ZqH3OK3uSeHbmx3PDL9AsGsKBE7IgqtJmFL72zwsQeZWa47ULx74Y6pdhxEbuRoMw9
         /J4BXrC+eaFQmRHW44kIqEhUAR8Hcw08zo12ynPjiGEuHpglXN9GSgQy+79Gx0ge75
         s7o9rjzUyMSdihy2JLdu2n8/VdVSeyNX7Se7V3+IjFj5p7rpniHPYdvwkykDabCHVv
         mXeIutc4J93pw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 6FF2365335; Thu,  4 Feb 2021 15:06:35 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210801] TopSeed Technology Corp. eHome Infrared Transceiver
 spams log with Error: urb status = -71
Date:   Thu, 04 Feb 2021 15:06:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hpj@urpla.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210801-208809-gzDIwMhwzH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210801-208809@https.bugzilla.kernel.org/>
References: <bug-210801-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210801

--- Comment #9 from Hans-Peter Jansen (hpj@urpla.net) ---
Plugging in the rc controller with dynamic debug enabled:

```

Feb 04 15:44:50 xrated kernel: usb 3-10.4: new full-speed USB device number=
 64
using xhci_hcd
Feb 04 15:44:50 xrated kernel: usb 3-10.4: config 1 interface 0 altsetting 0
endpoint 0x1 has an invalid bInterval 0, changing to 10
Feb 04 15:44:50 xrated kernel: usb 3-10.4: config 1 interface 0 altsetting 0
endpoint 0x81 has an invalid bInterval 0, changing to 10
Feb 04 15:44:50 xrated kernel: usb 3-10.4: New USB device found, idVendor=
=3D1784,
idProduct=3D0006, bcdDevice=3D 1.01
Feb 04 15:44:50 xrated kernel: usb 3-10.4: New USB device strings: Mfr=3D1,
Product=3D2, SerialNumber=3D3
Feb 04 15:44:50 xrated kernel: usb 3-10.4: Product: eHome Infrared Transcei=
ver
Feb 04 15:44:50 xrated kernel: usb 3-10.4: Manufacturer: TopSeed Technology
Corp.
Feb 04 15:44:50 xrated kernel: usb 3-10.4: SerialNumber: TS002j0C
Feb 04 15:44:50 xrated kernel: mceusb 3-10.4:1.0: mceusb_dev_probe called
Feb 04 15:44:50 xrated kernel: mceusb 3-10.4:1.0: acceptable interrupt outb=
ound
endpoint found
Feb 04 15:44:50 xrated kernel: mceusb 3-10.4:1.0: acceptable interrupt inbo=
und
endpoint found
Feb 04 15:44:50 xrated kernel: Registered IR keymap rc-rc6-mce
Feb 04 15:44:50 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: 9f 0c 00 fd
(len=3D4 sz=3D4)
Feb 04 15:44:50 xrated kernel: mceusb 3-10.4:1.0: Request receive timeout o=
f 12
ms
Feb 04 15:44:50 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:50 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
976, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:50 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: 9f 0d (len=3D2
sz=3D2)
Feb 04 15:44:50 xrated kernel: mceusb 3-10.4:1.0: Get receive timeout
Feb 04 15:44:50 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:50 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
980, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:50 xrated kernel: rc rc0: Media Center Ed. eHome Infrared Remo=
te
Transceiver (1784:0006) as
/devices/pci0000:00/0000:00:14.0/usb3/3-10/3-10.4/3-10.4:1.0/rc/rc0
Feb 04 15:44:50 xrated kernel: rc rc0: lirc_dev: driver mceusb registered at
minor =3D 0, raw IR receiver, raw IR transmitter
Feb 04 15:44:50 xrated kernel: input: Media Center Ed. eHome Infrared Remote
Transceiver (1784:0006) as
/devices/pci0000:00/0000:00:14.0/usb3/3-10/3-10.4/3-10.4:1.0/rc/rc0/input48
Feb 04 15:44:50 xrated kernel: mceusb 3-10.4:1.0: Flushing receive buffers
Feb 04 15:44:50 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: ff 22 (len=3D2
sz=3D2)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
980, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: 00 ff aa (len=
=3D3
sz=3D3)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Device resume requested
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
980, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: ff 18 (len=3D2
sz=3D2)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
981, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: 9f 05 (len=3D2
sz=3D2)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Unknown command 0x9f 0x05
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
981, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: 9f 16 (len=3D2
sz=3D2)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
980, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: 9f 07 (len=3D2
sz=3D2)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Get carrier mode and freq
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
981, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: 9f 13 (len=3D2
sz=3D2)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Get transmit blaster mask
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
980, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: 9f 0d (len=3D2
sz=3D2)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Get receive timeout
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
981, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: 9f 15 (len=3D2
sz=3D2)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Get receive sensor
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
980, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: ff 11 00 (len=
=3D3
sz=3D3)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
980, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: ff 11 01 (len=
=3D3
sz=3D3)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
981, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Registered TopSeed Techno=
logy
Corp. eHome Infrared Transceiver with mce emulator interface version 1
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: 2 tx ports (0x0 cabled) a=
nd 2
rx sensors (0x0 active)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated mtp-probe[12138]: checking bus 3, device 64:
"/sys/devices/pci0000:00/0000:00:14.0/usb3/3-10/3-10.4"
Feb 04 15:44:51 xrated mtp-probe[12138]: bus: 3, device: 64 was not an MTP
device
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated upowerd[5598]: treating change event as add on
/sys/devices/pci0000:00/0000:00:14.0/usb3/3-10/3-10.4
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: 9f 0c 00 fd
(len=3D4 sz=3D4)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Request receive timeout o=
f 12
ms
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
975, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx data[0]: 9f 0d (len=3D2
sz=3D2)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Get receive timeout
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: mce write urb stat=
us =3D
-71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: tx done status =3D -71 (w=
ait =3D
980, expire =3D 1000 (1000ms), urb->actual_length =3D 0, urb->status =3D -7=
1)
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated systemd-logind[2071]: Watching system buttons on
/dev/input/event25 (Media Center Ed. eHome Infrared Remote Transceiver
(1784:0006))
Feb 04 15:44:51 xrated upowerd[5598]: treating change event as add on
/sys/devices/pci0000:00/0000:00:14.0/usb3/3-10/3-10.4/3-10.4:1.0
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated mtp-probe[12161]: checking bus 3, device 64:
"/sys/devices/pci0000:00/0000:00:14.0/usb3/3-10/3-10.4"
Feb 04 15:44:51 xrated mtp-probe[12161]: bus: 3, device: 64 was not an MTP
device
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kcminit[12165]: Initializing  "kcm_mouse" :=20
"kcminit_mouse"
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:51 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:44:52 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
...
Feb 04 15:45:00 xrated kernel: usb 3-10.4: USB disconnect, device number 64
Feb 04 15:45:00 xrated kernel: mceusb 3-10.4:1.0: Error: urb status =3D -71
Feb 04 15:45:00 xrated kernel: mceusb 3-10.4:1.0: mceusb_dev_disconnect cal=
led
```

lsusb:
```
Bus 005 Device 002: ID 8087:8001 Intel Corp. Integrated Hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 8087:8009 Intel Corp.=20
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 006 Device 002: ID 11b0:6368 ATECH FLASH TECHNOLOGY Multi-Reader
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 005: ID 046a:010d Cherry GmbH MX-Board 3.0 Keyboard
Bus 003 Device 003: ID 046a:0114 Cherry GmbH CHERRY Wireless Device
Bus 003 Device 065: ID 1784:0006 TopSeed Technology Corp. eHome Infrared
Transceiver
Bus 003 Device 063: ID 0bda:0307 Realtek Semiconductor Corp. Card Reader
Bus 003 Device 060: ID 046d:085b Logitech, Inc. Logitech Webcam C925e
Bus 003 Device 059: ID 0451:8043 Texas Instruments, Inc. Hub
Bus 003 Device 058: ID 0451:8043 Texas Instruments, Inc. Hub
Bus 003 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 007 Device 004: ID 0d46:3014 Kobil Systems GmbH Smart Token
Bus 007 Device 002: ID 05e3:0608 Genesys Logic, Inc. Hub
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 002: ID 046d:c52f Logitech, Inc. Unifying Receiver
Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
```

lsusb -vt:
```
/:  Bus 07.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/4p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        ID 05e3:0608 Genesys Logic, Inc. Hub
        |__ Port 4: Dev 4, If 0, Class=3DChip/SmartCard, Driver=3Dusbfs, 12M
            ID 0d46:3014 Kobil Systems GmbH Smart Token
/:  Bus 06.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
    |__ Port 4: Dev 2, If 0, Class=3DMass Storage, Driver=3Dusb-storage, 50=
00M
        ID 11b0:6368 ATECH FLASH TECHNOLOGY=20
/:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/8p, 480M
        ID 8087:8001 Intel Corp. Integrated Hub
/:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
    ID 1d6b:0001 Linux Foundation 1.1 root hub
    |__ Port 1: Dev 2, If 0, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 12M
        ID 046d:c52f Logitech, Inc. Unifying Receiver
    |__ Port 1: Dev 2, If 1, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 12M
        ID 046d:c52f Logitech, Inc. Unifying Receiver
/:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/14p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 10: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        ID 1a40:0101 Terminus Technology Inc. Hub
        |__ Port 3: Dev 58, If 0, Class=3DHub, Driver=3Dhub/3p, 480M
            ID 0451:8043 Texas Instruments, Inc. Hub
            |__ Port 3: Dev 59, If 0, Class=3DHub, Driver=3Dhub/3p, 480M
                ID 0451:8043 Texas Instruments, Inc. Hub
                |__ Port 3: Dev 63, If 0, Class=3DMass Storage,
Driver=3Dusb-storage, 480M
                    ID 0bda:0307 Realtek Semiconductor Corp. Card Reader
                |__ Port 1: Dev 60, If 0, Class=3DVideo, Driver=3Duvcvideo,=
 480M
                    ID 046d:085b Logitech, Inc.=20
                |__ Port 1: Dev 60, If 3, Class=3DAudio, Driver=3Dsnd-usb-a=
udio,
480M
                    ID 046d:085b Logitech, Inc.=20
                |__ Port 1: Dev 60, If 1, Class=3DVideo, Driver=3Duvcvideo,=
 480M
                    ID 046d:085b Logitech, Inc.=20
                |__ Port 1: Dev 60, If 2, Class=3DAudio, Driver=3Dsnd-usb-a=
udio,
480M
                    ID 046d:085b Logitech, Inc.=20
        |__ Port 4: Dev 65, If 0, Class=3DVendor Specific Class, Driver=3Dm=
ceusb,
12M
            ID 1784:0006 TopSeed Technology Corp. eHome Infrared Transceiver
    |__ Port 13: Dev 3, If 0, Class=3DHuman Interface Device, Driver=3Dusbh=
id, 12M
        ID 046a:0114 Cherry GmbH=20
    |__ Port 13: Dev 3, If 1, Class=3DHuman Interface Device, Driver=3Dusbh=
id, 12M
        ID 046a:0114 Cherry GmbH=20
    |__ Port 14: Dev 5, If 0, Class=3DHuman Interface Device, Driver=3Dusbh=
id, 1.5M
        ID 046a:010d Cherry GmbH MX-Board 3.0 Keyboard
    |__ Port 14: Dev 5, If 1, Class=3DHuman Interface Device, Driver=3Dusbh=
id, 1.5M
        ID 046a:010d Cherry GmbH MX-Board 3.0 Keyboard
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
    ID 1d6b:0001 Linux Foundation 1.1 root hub
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/6p, 480M
        ID 8087:8009 Intel Corp.=20
```

The device is connected to a USB 2.0 hub from LogiLink, which is connected =
to a
USB 3.0 port on the ATX plance of the motherboard.

```
00:00.0 Host bridge: Intel Corporation 4th Gen Core Processor DRAM Controll=
er
(rev 06)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor
PCI Express x16 Controller (rev 06)
00:01.1 PCI bridge: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor
PCI Express x8 Controller (rev 06)
00:14.0 USB controller: Intel Corporation 9 Series Chipset Family USB xHCI
Controller
00:16.0 Communication controller: Intel Corporation 9 Series Chipset Family=
 ME
Interface #1
00:19.0 Ethernet controller: Intel Corporation Ethernet Connection (2) I218=
-V
00:1a.0 USB controller: Intel Corporation 9 Series Chipset Family USB EHCI
Controller #2
00:1b.0 Audio device: Intel Corporation 9 Series Chipset Family HD Audio
Controller
00:1c.0 PCI bridge: Intel Corporation 9 Series Chipset Family PCI Express R=
oot
Port 1 (rev d0)
00:1c.3 PCI bridge: Intel Corporation 82801 PCI Bridge (rev d0)
00:1c.6 PCI bridge: Intel Corporation 9 Series Chipset Family PCI Express R=
oot
Port 7 (rev d0)
00:1d.0 USB controller: Intel Corporation 9 Series Chipset Family USB EHCI
Controller #1
00:1f.0 ISA bridge: Intel Corporation Z97 Chipset LPC Controller
00:1f.2 SATA controller: Intel Corporation 9 Series Chipset Family SATA
Controller [AHCI Mode]
00:1f.3 SMBus: Intel Corporation 9 Series Chipset Family SMBus Controller
01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 76=
0]
(rev a1)
01:00.1 Audio device: NVIDIA Corporation GK104 HDMI Audio Controller (rev a=
1)
02:00.0 PCI bridge: Pericom Semiconductor PI7C9X111SL PCIe-to-PCI Reversible
Bridge (rev 02)
03:04.0 USB controller: VIA Technologies, Inc. VT82xx/62xx UHCI USB 1.1
Controller (rev 62)
03:04.1 USB controller: VIA Technologies, Inc. VT82xx/62xx UHCI USB 1.1
Controller (rev 62)
03:04.2 USB controller: VIA Technologies, Inc. USB 2.0 (rev 65)
05:00.0 PCI bridge: ASMedia Technology Inc. ASM1083/1085 PCIe to PCI Bridge
(rev 04)
07:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD
Controller SM981/PM981/PM983
```

uname -a:=20
Linux xrated 5.10.11-2-preempt #1 SMP PREEMPT Thu Jan 28 10:32:01 UTC 2021
(b4718b3) x86_64 x86_64 x86_64 GNU/Linu

I'm preparing 5.10.13, which has some interesting changes in this area, as =
you
know, Sean ;-), and as you might have notices, my reponsiveness is sucking
rocks ATM. Sorry.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

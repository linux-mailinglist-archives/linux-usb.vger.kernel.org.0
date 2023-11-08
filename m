Return-Path: <linux-usb+bounces-2727-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 669CB7E600D
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 22:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C83EF1C20986
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 21:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81927374DE;
	Wed,  8 Nov 2023 21:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6mGi/rs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD70118C3A
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 21:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 562CCC433C8
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 21:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699479521;
	bh=lHsaEX2MfOg0s9XjJ7jxJrEAWhx6EKbTM9hQYx9QLcM=;
	h=From:To:Subject:Date:From;
	b=G6mGi/rsjQj241WnBe63YRB3zSsAdwQWQ8RostZSvWKzIaJnMpTI3Pdhqy4merZnk
	 oUpKVv4rWjrTIfB87Zg+Rv+RyJ+3C8XttOY0bRty6G/+yO0qc3eqoK5wRwj8md4SoA
	 4+qGIcSoD3ZOw94cnKEDvqP4JlaLzag1UgVLshh8ofdGnwBCltW6pvsun2viTiy+W6
	 n/GbMER/PMl1XL+ZqgKiVjgZePMl4LrXVJQbvux34Zzlno1bQOBYKso8edLCDLGcol
	 WzvYfQL40IC9kIZ/p9Lq8I1tARuIFYaGLxGdwwTxCkj4AsPspKwGfRMW0iJ/rymRlF
	 8miO6dcFxsk/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 39BB7C4332E; Wed,  8 Nov 2023 21:38:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218118] New: USB3 port does not work on Chromebook XE303C12
 with Linux kernel 6.5.11
Date: Wed, 08 Nov 2023 21:38:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quark@disroot.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218118-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218118

            Bug ID: 218118
           Summary: USB3 port does not work on Chromebook XE303C12 with
                    Linux kernel 6.5.11
           Product: Drivers
           Version: 2.5
          Hardware: ARM
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: quark@disroot.org
        Regression: No

With kernel 6.5.11 usb3 does not work at all.=20
With kernel 6.3.8, the usb3 port works if the device was connected before
powering on the laptop; after reconnecting, the usb3 port stops working.=20
There are no such problems with Linux kernel 5.15

Linux kernel 6.5.11, dmesg | grep usb:
[    1.612078] usbcore: registered new interface driver usbfs
[    1.612102] usbcore: registered new interface driver hub
[    1.612126] usbcore: registered new device driver usb
[    1.705362] samsung-usb2-phy 12130000.phy: supply vbus not found, using
dummy regulator
[    1.705912] exynos5_usb3drd_phy 12100000.phy: supply vbus-boost not foun=
d,
using dummy regulator
[    1.737006] exynos-ehci 12110000.usb: EHCI Host Controller
[    1.737108] exynos-ehci 12110000.usb: new USB bus registered, assigned b=
us
number 1
[    1.737362] exynos-ehci 12110000.usb: irq 130, io mem 0x12110000
[    1.757630] exynos-ehci 12110000.usb: USB 2.0 started, EHCI 1.00
[    1.757808] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002,
bcdDevice=3D 6.05
[    1.757818] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    1.757825] usb usb1: Product: EHCI Host Controller
[    1.757830] usb usb1: Manufacturer: Linux 6.5.11 ehci_hcd
[    1.757835] usb usb1: SerialNumber: 12110000.usb
[    1.758868] exynos-ohci 12120000.usb: USB Host Controller
[    1.758972] exynos-ohci 12120000.usb: new USB bus registered, assigned b=
us
number 2
[    1.759045] exynos-ohci 12120000.usb: irq 130, io mem 0x12120000
[    1.831869] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001,
bcdDevice=3D 6.05
[    1.831878] usb usb2: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    1.831884] usb usb2: Product: USB Host Controller
[    1.831889] usb usb2: Manufacturer: Linux 6.5.11 ohci_hcd
[    1.831894] usb usb2: SerialNumber: 12120000.usb
[    1.832951] usbcore: registered new interface driver cdc_acm
[    1.832982] usbcore: registered new interface driver usblp
[    1.833006] usbcore: registered new interface driver cdc_wdm
[    1.833152] usbcore: registered new interface driver uas
[    1.833190] usbcore: registered new interface driver usb-storage
[    1.833211] usbcore: registered new interface driver ums-cypress
[    1.833232] usbcore: registered new interface driver ums_eneub6250
[    1.833253] usbcore: registered new interface driver ums-freecom
[    1.833274] usbcore: registered new interface driver ums-isd200
[    2.114593] usbcore: registered new interface driver vub300
[    2.114624] usbcore: registered new interface driver ushc
[    2.115336] usbcore: registered new interface driver usbhid
[    2.115344] usbhid: USB HID core driver
[    2.258696] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002,
bcdDevice=3D 6.05
[    2.258705] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    2.258713] usb usb3: Product: xHCI Host Controller
[    2.258718] usb usb3: Manufacturer: Linux 6.5.11 xhci-hcd
[    2.258723] usb usb3: SerialNumber: xhci-hcd.7.auto
[    2.259384] usb usb4: We don't know the algorithms for LPM for this host,
disabling LPM.
[    2.259514] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003,
bcdDevice=3D 6.05
[    2.259522] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    2.259528] usb usb4: Product: xHCI Host Controller
[    2.259533] usb usb4: Manufacturer: Linux 6.5.11 xhci-hcd
[    2.259538] usb usb4: SerialNumber: xhci-hcd.7.auto
[    2.377724] usb 2-1: new low-speed USB device number 2 using exynos-ohci
[    2.668653] usb 2-1: New USB device found, idVendor=3D0458, idProduct=3D=
003a,
bcdDevice=3D 1.00
[    2.668667] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[    2.668674] usb 2-1: Product: USB Optical Mouse
[    2.668679] usb 2-1: Manufacturer: Genius
[    2.675394] input: Genius USB Optical Mouse as
/devices/platform/soc/12120000.usb/usb2/2-1/2-1:1.0/0003:0458:003A.0001/inp=
ut/input3
[    2.675572] hid-generic 0003:0458:003A.0001: input,hidraw0: USB HID v1.11
Mouse [Genius USB Optical Mouse] on usb-12120000.usb-1/input0
[    4.398510] usb usb3-port1: attempt power cycle
[    6.428387] usb usb3-port1: unable to enumerate USB device


Linux kernel 6.3.8, dmesg | grep usb:
[    1.591836] usbcore: registered new interface driver usbfs
[    1.591856] usbcore: registered new interface driver hub
[    1.591877] usbcore: registered new device driver usb
[    1.658666] samsung-usb2-phy 12130000.phy: supply vbus not found, using
dummy regulator
[    1.659101] exynos5_usb3drd_phy 12100000.phy: supply vbus-boost not foun=
d,
using dummy regulator
[    1.701360] exynos-ehci 12110000.usb: EHCI Host Controller
[    1.701451] exynos-ehci 12110000.usb: new USB bus registered, assigned b=
us
number 1
[    1.701604] exynos-ehci 12110000.usb: irq 131, io mem 0x12110000
[    1.726696] exynos-ehci 12110000.usb: USB 2.0 started, EHCI 1.00
[    1.726898] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002,
bcdDevice=3D 6.03
[    1.726907] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    1.726914] usb usb1: Product: EHCI Host Controller
[    1.726919] usb usb1: Manufacturer: Linux 6.3.8 ehci_hcd
[    1.726924] usb usb1: SerialNumber: 12110000.usb
[    1.727933] exynos-ohci 12120000.usb: USB Host Controller
[    1.728028] exynos-ohci 12120000.usb: new USB bus registered, assigned b=
us
number 2
[    1.728098] exynos-ohci 12120000.usb: irq 131, io mem 0x12120000
[    1.800917] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001,
bcdDevice=3D 6.03
[    1.800926] usb usb2: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    1.800932] usb usb2: Product: USB Host Controller
[    1.800937] usb usb2: Manufacturer: Linux 6.3.8 ohci_hcd
[    1.800942] usb usb2: SerialNumber: 12120000.usb
[    1.802519] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002,
bcdDevice=3D 6.03
[    1.802528] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    1.802534] usb usb3: Product: xHCI Host Controller
[    1.802539] usb usb3: Manufacturer: Linux 6.3.8 xhci-hcd
[    1.802543] usb usb3: SerialNumber: xhci-hcd.1.auto
[    1.803101] usb usb4: We don't know the algorithms for LPM for this host,
disabling LPM.
[    1.803232] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003,
bcdDevice=3D 6.03
[    1.803240] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    1.803245] usb usb4: Product: xHCI Host Controller
[    1.803250] usb usb4: Manufacturer: Linux 6.3.8 xhci-hcd
[    1.803255] usb usb4: SerialNumber: xhci-hcd.1.auto
[    1.803794] usbcore: registered new interface driver cdc_acm
[    1.803825] usbcore: registered new interface driver usblp
[    1.803845] usbcore: registered new interface driver cdc_wdm
[    1.803993] usbcore: registered new interface driver uas
[    1.804037] usbcore: registered new interface driver usb-storage
[    1.804057] usbcore: registered new interface driver ums-cypress
[    1.804076] usbcore: registered new interface driver ums_eneub6250
[    1.804094] usbcore: registered new interface driver ums-freecom
[    1.804112] usbcore: registered new interface driver ums-isd200
[    2.086726] usb 3-1: new high-speed USB device number 2 using xhci-hcd
[    2.095970] usbcore: registered new interface driver vub300
[    2.096002] usbcore: registered new interface driver ushc
[    2.096477] usbcore: registered new interface driver usbhid
[    2.096483] usbhid: USB HID core driver
[    2.278519] usb 3-1: New USB device found, idVendor=3D090c, idProduct=3D=
1000,
bcdDevice=3D11.00
[    2.278531] usb 3-1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[    2.278537] usb 3-1: Product: Silicon-Power4G
[    2.278542] usb 3-1: Manufacturer: UFD 2.0
[    2.278548] usb 3-1: SerialNumber: 11111111111111
[    2.279485] usb-storage 3-1:1.0: USB Mass Storage device detected
[    2.279934] scsi host0: usb-storage 3-1:1.0
[    2.346703] usb 2-1: new low-speed USB device number 2 using exynos-ohci
[    2.617740] usb 2-1: New USB device found, idVendor=3D0458, idProduct=3D=
003a,
bcdDevice=3D 1.00
[    2.617755] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[    2.617762] usb 2-1: Product: USB Optical Mouse
[    2.617767] usb 2-1: Manufacturer: Genius
[    2.624432] input: Genius USB Optical Mouse as
/devices/platform/soc/12120000.usb/usb2/2-1/2-1:1.0/0003:0458:003A.0001/inp=
ut/input3
[    2.625043] hid-generic 0003:0458:003A.0001: input,hidraw0: USB HID v1.11
Mouse [Genius USB Optical Mouse] on usb-12120000.usb-1/input0
[   67.531278] usb 3-1: USB disconnect, device number 2
[   71.667630] usb usb3-port1: connect-debounce failed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


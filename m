Return-Path: <linux-usb+bounces-23214-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21388A927E7
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 20:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A176C7AECC5
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 18:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6839F261575;
	Thu, 17 Apr 2025 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bz9+RuOY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2258256C8D
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 18:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914361; cv=none; b=EACrGiXhU9YMnIEEiEz+o5M+lFlYEbDfCg670nJnE3GwPTs0TORMdBFFs02c95GYC6cU7AKY1b9ZSKCOPE73rKk3FTUgy8fp79HKbG0n5MgcolwVLhOnOKaQDj2wNtdSHg4sDAWGue0CjzI+rjf7OPtuP+AqspG7l66fylC63XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914361; c=relaxed/simple;
	bh=I0L7Xgj4OFMl6oLYR0mSt41eSqMK3K6UX+eNAWYcArc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Gj1ghL1vw7DRuNZIAJgNSgpZVQz4QwdkLgd+nWgUYoFe+wfH9V19NPHzUrHipblq6FjZvl+xWSpmIxT/SNbResV861XObgLMqBINt9pLm8pPn8W35DIjNjEUdLx13S/77UctHQcnG58crt/dqJC8/EoJeL+/Y/KGjy8vZcJBXLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bz9+RuOY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A563C4CEE4
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 18:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914360;
	bh=I0L7Xgj4OFMl6oLYR0mSt41eSqMK3K6UX+eNAWYcArc=;
	h=From:To:Subject:Date:From;
	b=bz9+RuOYz5Rl4yT0oeU1YP/n7eyqcqk2rj2iVkAVnJTNnHssq6PauEo3uBCDo/6uk
	 AA8mq6H28j8LIKSyQTIdXZuy4ts92F7ZcJ6ySGz3K/+Q6qcoyZIYoRf1i6+3HoE3iT
	 WkM7yvm0y6A/XNeH7m1Iy8ik8z6pCZfmRI+yoQryuqc9NoXXlHFTho3bx+wMAhuWAq
	 aaNhYKwe8cuX3wT5fi2YAWUJkiJ9Wd4cpbFb69IpzCzP/LWsVYy9DBrlivVAKSHPBD
	 cT0970ffY58QnEvYV5V7n6ZqI++hF56HaFQWXbzLXv4p3xLvf+GDsAjAnYQkTwkQdX
	 VPlcJuDSMlcFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 51E7CC3279F; Thu, 17 Apr 2025 18:26:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] New: USB 3.2 capture cards using incorrect USB speed
Date: Thu, 17 Apr 2025 18:26:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nrkowalski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220027-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

            Bug ID: 220027
           Summary: USB 3.2 capture cards using incorrect USB speed
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: nrkowalski@gmail.com
        Regression: No

There seems to be an issue with USB 3.2 capture cards being detected as
SuperSpeed (5Gbps) devices instead of SuperSpeed Plus (10Gbps) which severe=
ly
limits their functionality.

This issue has been reported multiple places by multiple people and a simil=
ar
bug report with a different capture card can be found here:
https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

In my particular case I'am using an Elgato 4K X plugged into my PC's USB4 p=
ort
which is directly connected to the motherboard. The capture device has been
tested working at full speed in Windows 11.

niko@Eva-Mini:~$ lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 2109:2822 VIA Labs, Inc. USB2.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 001 Device 003: ID 0406:2814 Fujitsu-ICL Computers USB Composite Device
Bus 001 Device 004: ID 8087:0032 Intel Corp. AX210 Bluetooth
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 002: ID 2109:0822 VIA Labs, Inc. USB3.1 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 008 Device 002: ID 0fd9:009c Elgato Systems GmbH Elgato 4K X

niko@Eva-Mini:~$ lsusb -tv
[...]
/:  Bus 008.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/1p, 1000=
0M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
    |__ Port 001: Dev 002, If 0, Class=3DVideo, Driver=3Duvcvideo, 5000M
        ID 0fd9:009c Elgato Systems GmbH=20
    |__ Port 001: Dev 002, If 1, Class=3DVideo, Driver=3Duvcvideo, 5000M
        ID 0fd9:009c Elgato Systems GmbH=20
    |__ Port 001: Dev 002, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 500=
0M
        ID 0fd9:009c Elgato Systems GmbH=20
    |__ Port 001: Dev 002, If 3, Class=3DAudio, Driver=3Dsnd-usb-audio, 500=
0M
        ID 0fd9:009c Elgato Systems GmbH=20

niko@Eva-Mini:~$ sudo lsusb -D /dev/bus/usb/008/002
Device: ID 0fd9:009c Elgato Systems GmbH Elgato 4K X
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0         9
  idVendor           0x0fd9 Elgato Systems GmbH
  idProduct          0x009c Elgato 4K X
  bcdDevice            0.02
  iManufacturer           6 Elgato
  iProduct                7 Elgato 4K X
  iSerial                 3 A7SNB504228NRE
  bNumConfigurations      1
[...]
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



niko@Eva-Mini:~$ dmesg | grep "usb 8-1"
[    1.249480] usb 8-1: new SuperSpeed USB device number 2 using xhci_hcd
[    1.313624] usb 8-1: LPM exit latency is zeroed, disabling LPM.
[    1.388209] usb 8-1: New USB device found, idVendor=3D0fd9, idProduct=3D=
009c,
bcdDevice=3D 0.02
[    1.388223] usb 8-1: New USB device strings: Mfr=3D6, Product=3D7,
SerialNumber=3D3
[    1.388227] usb 8-1: Product: Elgato 4K X
[    1.388230] usb 8-1: Manufacturer: Elgato
[    1.388234] usb 8-1: SerialNumber: A7SNB504228NRE
[    2.199309] usb 8-1: Found UVC 1.00 device Elgato 4K X (0fd9:009c)
[    2.332366] usb 8-1: 3:2: failed to get current value for ch 0 (-22)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


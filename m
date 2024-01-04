Return-Path: <linux-usb+bounces-4711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6031B823A2F
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 02:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D6001C24B0E
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 01:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A7B136A;
	Thu,  4 Jan 2024 01:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E52YNNrd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57939A2A
	for <linux-usb@vger.kernel.org>; Thu,  4 Jan 2024 01:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29631C433C7
	for <linux-usb@vger.kernel.org>; Thu,  4 Jan 2024 01:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704331399;
	bh=/U10U9bBymNZtdfdby63amUfqJ9OOGw+GX5Bm9ppIkM=;
	h=From:To:Subject:Date:From;
	b=E52YNNrdRBg4N0oD7WKdw+GPyTkKcgrEvafB7ArpShUryJnLpmPBqwXXTpq4tSNIR
	 8aYnDhMPL7xBNjCUs5ooEn26kYh66m2Cw16RHULCg+MwjebxDit+LjjRinehjGbgUP
	 00M0sOvkw74u2BBMLbQnaQg8Ls0+ZDbVxkckCurKiD5ZMMnVURiG/gCOBXzjWmJ0DH
	 3e2uUnv2P2IG5X1QTicFkubBBtEjyGfDy80r224kZs+MWaXnE7marC8E/bp3DWyjWF
	 ec/mwZ0UsW78JViBUn16e6MiYjUXPX3cq1itLyfCnAEBuiqTyWZ4vZIkchvQ9JT8SI
	 NrIDwWKp5A2ZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0D5FAC4332E; Thu,  4 Jan 2024 01:23:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218338] New: usb: cdc_acm: Support for Uniden BC125AT radio
 scanner
Date: Thu, 04 Jan 2024 01:23:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: felipe.aranda@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218338-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218338

            Bug ID: 218338
           Summary: usb: cdc_acm: Support for Uniden BC125AT radio scanner
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: felipe.aranda@gmail.com
        Regression: No

Uniden BC125AT radio scanner has USB interface which fails to work
with cdc_acm driver:


`dmesg`:
~~~
  usb 1-2: New USB device found, idVendor=3D1965, idProduct=3D0017, bcdDevi=
ce=3D 0.01
  usb 1-2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
  usb 1-2: Product: BC125AT
  usb 1-2: Manufacturer: Uniden America Corp.
  usb 1-2: SerialNumber: 0001
  cdc_acm 1-2:1.0: Zero length descriptor references
  cdc_acm: probe of 1-2:1.0 failed with error -22
~~~

`lsusb -v` of the device:
~~~
Bus 001 Device 012: ID 1965:0017 Uniden Corporation BC125AT
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            2 Communications
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0=20
  bMaxPacketSize0        64
  idVendor           0x1965 Uniden Corporation
  idProduct          0x0017 BC125AT
  bcdDevice            0.01
  iManufacturer           1 Uniden America Corp.
  iProduct                2 BC125AT
  iSerial                 3 0001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0030
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      0=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval              10
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0=20
      iInterface              0=20
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
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
Device Status:     0x0000
  (Bus Powered)
~~~


The code to add in /drivers/usb/class/cdc-acm.c

~~~
  { USB_DEVICE(0x1965, 0x0017), /* Uniden BC125AT */
  .driver_info =3D NO_UNION_NORMAL, /* has no union descriptor */
  },
~~~

Reference:
https://lore.kernel.org/lkml/20180706054524.670321998@linuxfoundation.org/


Thanks in advance !

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


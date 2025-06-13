Return-Path: <linux-usb+bounces-24742-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F07AD95C9
	for <lists+linux-usb@lfdr.de>; Fri, 13 Jun 2025 21:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C43189E77A
	for <lists+linux-usb@lfdr.de>; Fri, 13 Jun 2025 19:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85BE23A990;
	Fri, 13 Jun 2025 19:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eugqr4Sw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBE71993B9
	for <linux-usb@vger.kernel.org>; Fri, 13 Jun 2025 19:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749844220; cv=none; b=nfuL1BLtQdNDpol0CBJLQzl1+quR+V02zOhEMb0bcotN18PebYcbP5kDXjJFcBQk6ZcKmn2DEYmK8UfIohDwQmo+wIopa8RQ2ZlcdUWqsTBIGMWaG8Y8lwnmiyZbNi9M0umxwMp93OW8Vp6k0M8oQoK9ejhsN+VUSxSKr/CwUlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749844220; c=relaxed/simple;
	bh=5TN1U9ebRpInQhlmxgrGngSVCzw7SPkA2gaMYEUjLqI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BU6bM2duOLYfBogaNfuQeqmb1M0oHTtMnsniEjb+Iew1Y10stLhTlxo2I9WbXgyYwFrQqHM+WQPq9jHKLokhXDBLoqdeRQhvrTLURjQwqtidhEqLzht2sEg1i96fVSrFSpj7Jztcvm7xZl1wI1LgORWo4kOBrBOMh4OvKdtj9uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eugqr4Sw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01E8EC4CEE3
	for <linux-usb@vger.kernel.org>; Fri, 13 Jun 2025 19:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749844220;
	bh=5TN1U9ebRpInQhlmxgrGngSVCzw7SPkA2gaMYEUjLqI=;
	h=From:To:Subject:Date:From;
	b=Eugqr4SwF/6P/8NT1oDa0wltFvQv3BgxW+YT6L8IJAruXtdNQN63mbDCOnpO5Ukyh
	 8Sv1XMFLt7aJJQFZldRFMob9z3TIuUtvzaBy+SCfodPeybBgVPo/n7HTWVBd6iobxC
	 TRAe/jAZiGXDoMTmX/0375eRAbf3Vju4OTq1jGU40huLZeJk8HbtWr36blhRXQnLvU
	 nkcLgbZleo7aYE+dv5SIrvxgndxDSayaNj3TvuhCAUU65vpIYoerW6HH7ibpbQyIQ0
	 IJAsSeY4sNj1zcrR+t9HB0jbytMWYohoiRORfHMPvbVhsOWOPE/rS4kv5SEal2ekfy
	 756MtPuGEu/Mw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E622EC433E1; Fri, 13 Jun 2025 19:50:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220225] New: CH340 USB-serial converter wrong baud rate for
 2400 and 1200 baud
Date: Fri, 13 Jun 2025 19:50:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pkk@spth.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220225-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220225

            Bug ID: 220225
           Summary: CH340 USB-serial converter wrong baud rate for 2400
                    and 1200 baud
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pkk@spth.de
        Regression: No

I have a USB-serial converter (AFAIR I bought it as a CH340G years ago), wh=
ere
setting the baud rate to 2400 or 1200 results in it sending at 380 baud
instead. The problem is the same for Linux 6.12.27 and FreeBSD 14.2. But the
USB-serial converter works for OpenBSD 7.6.

Linux dmesg when plugging it in:

[450228.160661] usb 3-2: new full-speed USB device number 27 using xhci_hcd
[450228.310942] usb 3-2: New USB device found, idVendor=3D1a86, idProduct=
=3D7523,
bcdDevice=3D 2.54
[450228.310957] usb 3-2: New USB device strings: Mfr=3D0, Product=3D2,
SerialNumber=3D0
[450228.310964] usb 3-2: Product: USB2.0-Ser!
[450228.316943] ch341 3-2:1.0: ch341-uart converter detected
[450228.329674] ch341-uart ttyUSB3: break control not supported, using
simulated break
[450228.329889] usb 3-2: ch341-uart converter now attached to ttyUSB3

lsusb -v output on GNU/Linux:

Bus 003 Device 027: ID 1a86:7523 QinHeng Electronics CH340 serial converter
root@notebook6:~# lsusb -s 3:27 -v

Bus 003 Device 027: ID 1a86:7523 QinHeng Electronics CH340 serial converter
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0=20
  bMaxPacketSize0         8
  idVendor           0x1a86 QinHeng Electronics
  idProduct          0x7523 CH340 serial converter
  bcdDevice            2.54
  iManufacturer           0=20
  iProduct                2 USB2.0-Ser!
  iSerial                 0=20
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0027
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0x80
      (Bus Powered)
    MaxPower               96mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1 [unknown]
      bInterfaceProtocol      2=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               1
Device Status:     0x0000
  (Bus Powered)

Corresponding FreeBSD bug report:
https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=3D287509

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


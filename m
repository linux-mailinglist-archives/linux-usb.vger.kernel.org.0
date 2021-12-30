Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE9F481D10
	for <lists+linux-usb@lfdr.de>; Thu, 30 Dec 2021 15:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240109AbhL3Oac (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Dec 2021 09:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240081AbhL3Oac (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Dec 2021 09:30:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039CDC061574
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 06:30:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9845A616F8
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 14:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F084C36AEB
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640874631;
        bh=cDm5GB99YYEMsQ1zW5Qr17XUOZvH/rf3OKH+6JNztEc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LJZLtRPVWuwnMqt+h26YSVv0x6jYhcvSq6/vwWD/kbGnexwNGZr2JbPRmm27W0NBQ
         4A52yQB2wjpSgZm8O+jj/btoWSIY1i4GCdJeoIOr8roStVdAOb+1fJ4Og1gz9CERB/
         741lFoLzXAhBo4/tAdyPry+4Syk1MHowFAj4rweKr08U/cefzAlBEhD5m6ydJPqGwT
         h5rebRk2CB9arZ3bq3hBvzVTHb+54ZQXiIONieKdEiRMKZAGkYp3sKo+34NixyjhFJ
         vZSdTwq8lh07NmreL9XUIUJZA/aDPixKV6maM3SmKd26IxDSiQljPaCtkWPRTtr0n6
         KGogeVgejdZPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E5DF6C05FCD; Thu, 30 Dec 2021 14:30:30 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Thu, 30 Dec 2021 14:30:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: noodles@earth.li
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213839-208809-81GU0Ti1r6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213839-208809@https.bugzilla.kernel.org/>
References: <bug-213839-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213839

Jonathan McDowell (noodles@earth.li) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |noodles@earth.li

--- Comment #5 from Jonathan McDowell (noodles@earth.li) ---
I've just ended up with one of these devices and see the same behaviour; on
Linux (5.10.70 from Debian) only 3 ports are operational, whereas when plug=
ged
into a Windows laptop all 7 ports work. It seems this is a knock-off hub - =
it
was sold as 480Mb/s capable, but is only reporting itself as full-speed
(12Mb/s).

As Tomas reports it shows up as 2 USB hubs - lsusb -vv output as follows:

Bus 003 Device 080: ID 0a05:7211 Unknown Manufacturer hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0=20
  bDeviceProtocol         0 Full speed (or root) hub
  bMaxPacketSize0         8
  idVendor           0x0a05 Unknown Manufacturer
  idProduct          0x7211 hub
  bcdDevice            1.00
  iManufacturer           0=20
  iProduct                1 USB2.0 HUB
  iSerial                 0=20
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0019
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0=20
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval             255

Apparently the chip involved is a Micov MW7211 which is a single chip
full-speed hub solution. I've no particular interest in seeing this work, g=
iven
that it's not high-speed capable, but figured the additional information mi=
ght
be helpful as there's obviously some difference in the way Windows is drivi=
ng
the hub compared to Linux.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF835BE4A3
	for <lists+linux-usb@lfdr.de>; Tue, 20 Sep 2022 13:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiITLkq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Sep 2022 07:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiITLko (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Sep 2022 07:40:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C39D63F3D
        for <linux-usb@vger.kernel.org>; Tue, 20 Sep 2022 04:40:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E40DD62959
        for <linux-usb@vger.kernel.org>; Tue, 20 Sep 2022 11:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43BF4C433B5
        for <linux-usb@vger.kernel.org>; Tue, 20 Sep 2022 11:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663674042;
        bh=hYMSYefvwRStrXJIQg/C0VreePrJ5TpWjcJmsQnozh4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=liOWC4LqBd8D2B46o2xsB/08+cBdRFURr39IIs6Dtjgpckoh2iQPpI+/TLKP4L+fN
         wY2LTyrlCpGOMhXbirLDX7t6IOpUNeheBNcNnnpZ1mmZxFtdtZa9f8zzbq0bd6Gqmg
         HQX8gmQKamMvp0yTHE546u3/r56ex68pl48Ysilzsf8QaD9oYyEQbemXStGuCQHVDx
         X9H9zN/Gxm3EWCCJMlbqJyTFbIYK5iuavz4MrvaC6nJz04UJbcittX8LQV3FDIRS3c
         et6Tdg58Vhzo0h5gMYY64SEH8QHu4e98i9SHxyvievHHLajYqEE1/TKHJSl69OnmLs
         L6AjAPlZZbG6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 25963C433E6; Tue, 20 Sep 2022 11:40:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] USB connections through thunderbolt dock broken
Date:   Tue, 20 Sep 2022 11:40:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tty2.rs@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216497-208809-vsprxcHsma@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216497-208809@https.bugzilla.kernel.org/>
References: <bug-216497-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216497

tty2 (tty2.rs@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tty2.rs@gmail.com

--- Comment #10 from tty2 (tty2.rs@gmail.com) ---
Have the same issue after update kernel.

Laptop: HUAWEI MACHC-WAX9

Intel=C2=AE Core=E2=84=A2 i7-10510U =C3=97 8

NVIDIA GeForce MX250 / Mesa Intel=C2=AE UHD Graphics (CML GT2)

Fedora Linux 36 (Workstation Edition)

Gnome 42.4

Windows System Wayland

Linux 5.19.9-200.fc36.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Sep 15 09:49:52 UTC
2022=20
x86_64 x86_64 x86_64 GNU/Linux


$ journalctl -b | grep -E "(xhci|\: usb)"



Sep 20 11:40:25 runix kernel: usbcore: registered new interface driver usbfs
Sep 20 11:40:25 runix kernel: usbcore: registered new interface driver hub
Sep 20 11:40:25 runix kernel: usbcore: registered new device driver usb
Sep 20 11:40:25 runix kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
Sep 20 11:40:25 runix kernel: xhci_hcd 0000:00:14.0: new USB bus registered,
assigned bus number 1
Sep 20 11:40:25 runix kernel: xhci_hcd 0000:00:14.0: hcc params 0x200077c1 =
hci
version 0x110 quirks 0x0000000000009810
Sep 20 11:40:25 runix kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
Sep 20 11:40:25 runix kernel: xhci_hcd 0000:00:14.0: new USB bus registered,
assigned bus number 2
Sep 20 11:40:25 runix kernel: xhci_hcd 0000:00:14.0: Host supports USB 3.1
Enhanced SuperSpeed
Sep 20 11:40:25 runix kernel: usb usb1: New USB device found, idVendor=3D1d=
6b,
idProduct=3D0002, bcdDevice=3D 5.19
Sep 20 11:40:25 runix kernel: usb usb1: New USB device strings: Mfr=3D3,
Product=3D2, SerialNumber=3D1
Sep 20 11:40:25 runix kernel: usb usb1: Product: xHCI Host Controller
Sep 20 11:40:25 runix kernel: usb usb1: Manufacturer: Linux
5.19.9-200.fc36.x86_64 xhci-hcd
Sep 20 11:40:25 runix kernel: usb usb1: SerialNumber: 0000:00:14.0
Sep 20 11:40:25 runix kernel: usb usb2: New USB device found, idVendor=3D1d=
6b,
idProduct=3D0003, bcdDevice=3D 5.19
Sep 20 11:40:25 runix kernel: usb usb2: New USB device strings: Mfr=3D3,
Product=3D2, SerialNumber=3D1
Sep 20 11:40:25 runix kernel: usb usb2: Product: xHCI Host Controller
Sep 20 11:40:25 runix kernel: usb usb2: Manufacturer: Linux
5.19.9-200.fc36.x86_64 xhci-hcd
Sep 20 11:40:25 runix kernel: usb usb2: SerialNumber: 0000:00:14.0
Sep 20 11:40:25 runix kernel: xhci_hcd 0000:3c:00.0: xHCI Host Controller
Sep 20 11:40:25 runix kernel: xhci_hcd 0000:3c:00.0: new USB bus registered,
assigned bus number 3
Sep 20 11:40:25 runix kernel: xhci_hcd 0000:3c:00.0: hcc params 0x200077c1 =
hci
version 0x110 quirks 0x0000000200009810
Sep 20 11:40:25 runix kernel: xhci_hcd 0000:3c:00.0: xHCI Host Controller
Sep 20 11:40:25 runix kernel: xhci_hcd 0000:3c:00.0: new USB bus registered,
assigned bus number 4
Sep 20 11:40:25 runix kernel: xhci_hcd 0000:3c:00.0: Host supports USB 3.1
Enhanced SuperSpeed
Sep 20 11:40:25 runix kernel: usb usb3: New USB device found, idVendor=3D1d=
6b,
idProduct=3D0002, bcdDevice=3D 5.19
Sep 20 11:40:25 runix kernel: usb usb3: New USB device strings: Mfr=3D3,
Product=3D2, SerialNumber=3D1
Sep 20 11:40:25 runix kernel: usb usb3: Product: xHCI Host Controller
Sep 20 11:40:25 runix kernel: usb usb3: Manufacturer: Linux
5.19.9-200.fc36.x86_64 xhci-hcd
Sep 20 11:40:25 runix kernel: usb usb3: SerialNumber: 0000:3c:00.0
Sep 20 11:40:25 runix kernel: usb usb4: New USB device found, idVendor=3D1d=
6b,
idProduct=3D0003, bcdDevice=3D 5.19
Sep 20 11:40:25 runix kernel: usb usb4: New USB device strings: Mfr=3D3,
Product=3D2, SerialNumber=3D1
Sep 20 11:40:25 runix kernel: usb usb4: Product: xHCI Host Controller
Sep 20 11:40:25 runix kernel: usb usb4: Manufacturer: Linux
5.19.9-200.fc36.x86_64 xhci-hcd
Sep 20 11:40:25 runix kernel: usb usb4: SerialNumber: 0000:3c:00.0
Sep 20 11:40:25 runix kernel: usbcore: registered new interface driver
usbserial_generic
Sep 20 11:40:25 runix kernel: usbserial: USB Serial support registered for
generic
Sep 20 11:40:25 runix kernel: usbcore: registered new interface driver usbh=
id
Sep 20 11:40:25 runix kernel: usbhid: USB HID core driver
Sep 20 11:40:25 runix kernel: usb 1-3: new full-speed USB device number 2 u=
sing
xhci_hcd
Sep 20 11:40:25 runix kernel: usb 1-3: New USB device found, idVendor=3D046=
d,
idProduct=3Dc548, bcdDevice=3D 5.01
Sep 20 11:40:25 runix kernel: usb 1-3: New USB device strings: Mfr=3D1,
Product=3D2, SerialNumber=3D0
Sep 20 11:40:25 runix kernel: usb 1-3: Product: USB Receiver
Sep 20 11:40:25 runix kernel: usb 1-3: Manufacturer: Logitech
Sep 20 11:40:25 runix kernel: usb 1-10: new full-speed USB device number 3
using xhci_hcd
Sep 20 11:40:25 runix kernel: usb 1-10: New USB device found, idVendor=3D80=
87,
idProduct=3D0aaa, bcdDevice=3D 0.02
Sep 20 11:40:25 runix kernel: usb 1-10: New USB device strings: Mfr=3D0,
Product=3D0, SerialNumber=3D0
Sep 20 11:40:30 runix kernel: usbcore: registered new interface driver btusb
Sep 20 11:40:33 runix kernel: xhci_hcd 0000:08:00.0: xHCI Host Controller
Sep 20 11:40:33 runix kernel: xhci_hcd 0000:08:00.0: new USB bus registered,
assigned bus number 5
Sep 20 11:40:33 runix kernel: xhci_hcd 0000:08:00.0: hcc params 0x200077c1 =
hci
version 0x110 quirks 0x0000000200009810
Sep 20 11:40:33 runix kernel: xhci_hcd 0000:08:00.0: xHCI Host Controller
Sep 20 11:40:33 runix kernel: xhci_hcd 0000:08:00.0: new USB bus registered,
assigned bus number 6
Sep 20 11:40:33 runix kernel: xhci_hcd 0000:08:00.0: Host supports USB 3.1
Enhanced SuperSpeed
Sep 20 11:40:33 runix kernel: usb usb5: New USB device found, idVendor=3D1d=
6b,
idProduct=3D0002, bcdDevice=3D 5.19
Sep 20 11:40:33 runix kernel: usb usb5: New USB device strings: Mfr=3D3,
Product=3D2, SerialNumber=3D1
Sep 20 11:40:33 runix kernel: usb usb5: Product: xHCI Host Controller
Sep 20 11:40:33 runix kernel: usb usb5: Manufacturer: Linux
5.19.9-200.fc36.x86_64 xhci-hcd
Sep 20 11:40:33 runix kernel: usb usb5: SerialNumber: 0000:08:00.0
Sep 20 11:40:33 runix kernel: usb usb6: New USB device found, idVendor=3D1d=
6b,
idProduct=3D0003, bcdDevice=3D 5.19
Sep 20 11:40:33 runix kernel: usb usb6: New USB device strings: Mfr=3D3,
Product=3D2, SerialNumber=3D1
Sep 20 11:40:33 runix kernel: usb usb6: Product: xHCI Host Controller
Sep 20 11:40:33 runix kernel: usb usb6: Manufacturer: Linux
5.19.9-200.fc36.x86_64 xhci-hcd
Sep 20 11:40:33 runix kernel: usb usb6: SerialNumber: 0000:08:00.0
Sep 20 11:40:41 runix kernel: xhci_hcd 0000:08:00.0: Error while assigning
device slot ID
Sep 20 11:40:41 runix kernel: xhci_hcd 0000:08:00.0: Max number of devices =
this
xHCI host supports is 64.
Sep 20 11:40:41 runix kernel: usb usb5-port1: couldn't allocate usb_device
Sep 20 11:40:53 runix kernel: xhci_hcd 0000:08:00.0: Error while assigning
device slot ID
Sep 20 11:40:53 runix kernel: xhci_hcd 0000:08:00.0: Max number of devices =
this
xHCI host supports is 64.
Sep 20 11:40:53 runix kernel: usb usb6-port1: couldn't allocate usb_device
Sep 20 11:41:05 runix kernel: xhci_hcd 0000:08:00.0: Error while assigning
device slot ID
Sep 20 11:41:05 runix kernel: xhci_hcd 0000:08:00.0: Max number of devices =
this
xHCI host supports is 64.
Sep 20 11:41:05 runix kernel: usb usb6-port2: couldn't allocate usb_device

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

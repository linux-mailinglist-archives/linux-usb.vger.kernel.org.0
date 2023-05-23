Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84C0970E4C9
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 20:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237394AbjEWShV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 May 2023 14:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236914AbjEWShU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 May 2023 14:37:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4512E41
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 11:37:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 087DC62DAB
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 18:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A12FC4339C
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 18:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684867010;
        bh=GG17fZfZdmnBtgquBk1U+VdaME6WxLDnOaMI483m9GE=;
        h=From:To:Subject:Date:From;
        b=XpEoY7B1diajLTrk5brKEVeoJ0Mglc74PbDvY5DCqzeY73FMgsGXQY1QZvYGsDttw
         24Nji6vYh5C1T+4pyzZFrW+XiGvNRN6Ps4tyMttgJAW1NCHcMWt58izoUHCP1cms/d
         UahPu3mDmaNZYkTYtLu7gEuI4sBFP81MnA6XNi0uVQMZ1dq45eRQRvRvkxoaHa/rN/
         TQSQDwNyMifKh0wqgT+Vf0q/6TecN0YLc+raAT2rw7iruWO9hreBBQr9FUrOB7i89T
         qQ2HgsvGYKb/KAU8/0YV6tHJ204ymfLspQwZRi4JxO/BYLNsAPbeyZkaRAZNkEtGlI
         vyFOjTEK9XRvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 328ADC43141; Tue, 23 May 2023 18:36:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217475] New: Foxconn / Hon Hai Bluetooth adapter 0489:e0cd
 stops working on ThinkPad T14s AMD Gen1
Date:   Tue, 23 May 2023 18:36:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: berto@igalia.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217475-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217475

            Bug ID: 217475
           Summary: Foxconn / Hon Hai Bluetooth adapter 0489:e0cd stops
                    working on ThinkPad T14s AMD Gen1
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: berto@igalia.com
        Regression: No

Hi,

I'm running Linux on a ThinkPad T14s AMD Gen 1 and I'm having problems
with its Bluetooth adapter.

The adapter is a Foxconn / Hon Hai, USB ID 0489:e0cd, and it uses the
Mediatek MT7921 driver. Sometimes it just works but often if I suspend
the laptop and come back it stops working. This also happens when I
use the RF kill switch. The kernel errors vary a bit depending on the
moment but it's usually a combination of these:

kernel: Bluetooth: hci0: Failed to get device id (-108)
kernel: Bluetooth: hci0: Failed to get fw version (-108)
kernel: bluetooth hci0: firmware: direct-loading firmware
mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
kernel: Bluetooth: hci0: Execution of wmt command timed out
kernel: Bluetooth: hci0: Failed to send wmt patch dwnld (-110)
kernel: Bluetooth: hci0: Failed to set up firmware (-110)
kernel: Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command =
is
advertised, but not supported.

Interestingly I noticed that if I try to use it on a Linux VM (using
USB passthrough) it generally works better, even when it's not working
on the host and the guest and the host are running the same OS and
kernel version. Still it fails sometimes, although the error messages
tend to be a bit different:

kernel: usbcore: registered new interface driver btusb
kernel: Bluetooth: hci0: Device setup in 153593 usecs
kernel: Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command =
is
advertised, but not supported.
kernel: Bluetooth: hci0: Opcode 0x c03 failed: -110
kernel: Bluetooth: hci0: Failed to read MSFT supported features (-110)
kernel: Bluetooth: hci0: AOSP get vendor capabilities (-110)

(I also tried the adapter with a Windows VM, again using USB
passthrough, but here it works perfectly fine)

Back to the host I found out that resetting the adapter using
"usb_modeswitch -R -v 0489 -p e0cd" sometimes is enough to bring the
adapter back to life and make it work. But this doesn't always
succeed, and at some point I end up in a situation like this:

kernel: xhci_hcd 0000:06:00.4: xHCI host not responding to stop endpoint
command
kernel: xhci_hcd 0000:06:00.4: xHCI host controller not responding, assume =
dead
kernel: xhci_hcd 0000:06:00.4: HC died; cleaning up

Sometimes I can get out of it with this:

$ echo 0000:06:00.4 > /sys/bus/pci/drivers/xhci_hcd/unbind
$ echo 0000:06:00.4 > /sys/bus/pci/drivers/xhci_hcd/bind

All this has been happening since I got the laptop, but I'm testing it
now with Linux 6.3.3 and the problem is still there.

The end result is that I basically cannot rely on the USB adapter so I
have it almost always disabled.

A bit more information about the system:

$ lspci -nn | grep USB
02:00.4 USB controller [0c03]: Realtek Semiconductor Co., Ltd. RTL811x EHCI
host controller [10ec:816d] (rev 0e)
05:00.0 USB controller [0c03]: Renesas Technology Corp. uPD720202 USB 3.0 H=
ost
Controller [1912:0015] (rev 02)
06:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Renoir/Cezanne USB 3.1 [1022:1639]
06:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Renoir/Cezanne USB 3.1 [1022:1639]

$ lsusb
Bus 007 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 006 Device 003: ID 0489:e0cd Foxconn / Hon Hai Wireless_Device
Bus 006 Device 002: ID 06cb:00bd Synaptics, Inc. Prometheus MIS Touch
Fingerprint Reader
Bus 006 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 005 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 002: ID 04f2:b6cb Chicony Electronics Co., Ltd Integrated Ca=
mera
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

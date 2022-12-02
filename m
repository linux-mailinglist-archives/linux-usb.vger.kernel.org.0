Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC39640DF8
	for <lists+linux-usb@lfdr.de>; Fri,  2 Dec 2022 19:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234688AbiLBSyj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Dec 2022 13:54:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234163AbiLBSyQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Dec 2022 13:54:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C3863D5
        for <linux-usb@vger.kernel.org>; Fri,  2 Dec 2022 10:54:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5D277B82243
        for <linux-usb@vger.kernel.org>; Fri,  2 Dec 2022 18:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 143E9C433C1
        for <linux-usb@vger.kernel.org>; Fri,  2 Dec 2022 18:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670007249;
        bh=Uce11iniJU6eayIo/IrwwYXWx4CFPTc5HL8z2zzePM0=;
        h=From:To:Subject:Date:From;
        b=aKDlfgv7LDS4EIBum3DSFjKOpvgxPPaCVCxbqAU5PyiG5T2vyj1VDhF9g8xmeaKyg
         dtczIAzTGcbeUW6VXAML5+zF5U2OKYKDi4rKXSH7XCAeR6SRlgG8FgEFZv3Wh+FopS
         G8nM0fRRPu5VOjZEnQLtlXJAHlSLyG3TZZtuThoHp+g4781fiyOMSvUVrcjm2a7zwS
         hBwfZJVCnpRdVTo9SiKfcsBtzTY+CsVYMDQ2H4/vBXznaWJ07hngRxLLbfl9ah5+A9
         XLUvrHaXmg/CQAzxUJ46qqZGgumyh2sMVwKGLuDXIrwtYrYfBZPdSXZr+WAzZ18Wb1
         5VNV2qKprFTGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EBFECC433E6; Fri,  2 Dec 2022 18:54:08 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216766] New: USB enumeration lockup
Date:   Fri, 02 Dec 2022 18:54:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jan.burgmeier@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216766-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216766

            Bug ID: 216766
           Summary: USB enumeration lockup
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19.16 and 6.0.10
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: jan.burgmeier@gmx.de
        Regression: No

Hi,

Environment:
> Lenovo ThinkPad T14s Gen 1, model 20UJS00K00
> Fedora 37

after resuming from suspend the gnome-shell/gdm hangs because of fprintd an=
d I
was able to track this down to usb device enumeration hanging on reading the
"descriptors" sysfs file. Calls to lsusb also hang on the same file.

The error can be reproduced with all recend kernels, tested with various Fe=
dora
Kernels, from:
> Linux jbu-laptop 5.19.16-301.fc37.x86_64 #1 SMP PREEMPT_DYNAMIC Fri Oct 21
> 15:55:37 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
to:
> Linux jbu-laptop 6.0.10-300.fc37.x86_64 #1 SMP PREEMPT_DYNAMIC Sat Nov 26
> 16:55:13 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux


Here is the backtrace from the hanging usb read:
> (gdb) bt
> #0  0x00007ffff7e77fac in read () from /lib64/libc.so.6
> #1  0x00007ffff7f90885 in read (__nbytes=3D256, __buf=3D<optimized out>, =
__fd=3D8)
> at /usr/include/bits/unistd.h:38
> #2  initialize_device (dev=3Ddev@entry=3D0x5555555a87c0, busnum=3Dbusnum@=
entry=3D4
> '\004', devaddr=3Ddevaddr@entry=3D1 '\001',
> sysfs_dir=3Dsysfs_dir@entry=3D0x5555555a87a0 "usb4",
> wrapped_fd=3Dwrapped_fd@entry=3D-1) at os/linux_usbfs.c:967
> #3  0x00007ffff7f92989 in linux_enumerate_device (ctx=3D0x55555559f610,
> busnum=3D<optimized out>, devaddr=3D<optimized out>, sysfs_dir=3D0x555555=
5a87a0
> "usb4") at os/linux_usbfs.c:1117
> #4  0x00007ffff7f93115 in linux_udev_scan_devices (ctx=3D0x55555559f610) =
at
> os/linux_udev.c:299
> #5  linux_scan_devices (ctx=3D0x55555559f610) at os/linux_usbfs.c:458
> #6  op_init (ctx=3Dctx@entry=3D0x55555559f610) at os/linux_usbfs.c:410
> #7  0x00007ffff7f93e79 in libusb_init (ctx=3Dctx@entry=3D0x7fffffffe138) =
at
> /usr/src/debug/libusb1-1.0.25-9.fc37.x86_64/libusb/core.c:2353
> #8  0x0000555555565e23 in main (argc=3D<optimized out>, argv=3D0x7fffffff=
e398) at
> /usr/src/debug/usbutils-014-3.fc37.x86_64/lsusb.c:3895

USB4 seems to be the integrated card reader:
> [root@jbu-laptop ~]# lsusb
> Bus 007 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 006 Device 003: ID 8087:0029 Intel Corp. AX200 Bluetooth
> Bus 006 Device 002: ID 06cb:00bd Synaptics, Inc. Prometheus MIS Touch
> Fingerprint Reader
> Bus 006 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 005 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 004 Device 002: ID 058f:9540 Alcor Micro Corp. AU9540 Smartcard Reader
> Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 002 Device 002: ID 13d3:5405 IMC Networks Integrated Camera
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

The repoduction is not that easy and I'm not able to reliably reproduce the
issue mostly it works if I do the following:
 1. Connect to docking station with Monitors, Headset and webcam attached
 2. Suspend while connected to the docking station
 3. Disconnect from the docking station
 4. Resume while disconnected from the docking station

Please let me know if you need any further logs I can gather them if the ne=
xt
hang occures.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

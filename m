Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F6348DBF2
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 17:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbiAMQhw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 11:37:52 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:52574 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiAMQhv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 11:37:51 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 69407B822A8
        for <linux-usb@vger.kernel.org>; Thu, 13 Jan 2022 16:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C615C36AEB
        for <linux-usb@vger.kernel.org>; Thu, 13 Jan 2022 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642091869;
        bh=K1X3TWriVYUjSKuXUxHtYhsCDG0qd93/8K+on3ZO3ks=;
        h=From:To:Subject:Date:From;
        b=k1w+3d/zV+RsMw+/COEWVY+9GX10rZMvgNeRSRRmOgI4bFsiYYYslG3+TjS3rem0x
         ere8ev0ZHQZY4QKiZb3uyfvsQqyMWB12Yekb2RwbOKyFtKyXLSfLQx5IZ0nN3u+QEW
         NaDPLrQe1jiltT7CI4Gq6Xspe1ynPPbsl2yHR89+JWiNJhBT1zD50h/Ymz9KneJyme
         xEWF9Z0yF+xTxKk28nXIa0CO0AB/uwSCaseGL0Ty3v/zJOYiWveGDSnB5irB4LGarH
         orGGZn3ayhp5uAx0witIv4lWv+4CbfZ+X1vP7ebdmUQcMtin1kt89tWPFrB5pdzWx0
         6fOKznktMfJfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EF638CC13AA; Thu, 13 Jan 2022 16:37:48 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215490] New: Logitech Brio doesn't initialise on USB 3.0 port
 of Asus M5A97 Evo R2.0
Date:   Thu, 13 Jan 2022 16:37:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nouveau@spliet.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215490-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215490

            Bug ID: 215490
           Summary: Logitech Brio doesn't initialise on USB 3.0 port of
                    Asus M5A97 Evo R2.0
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.13
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: nouveau@spliet.org
        Regression: No

Overview:
When plugging in the Logitech Brio Pro (UVC-compatible) webcam into a USB 3=
.0
superspeed port, the device doesn't initialise properly. Dmesg contains the
following:

[ 8014.615870] usb 11-1: new SuperSpeed USB device number 2 using xhci_hcd
[ 8019.973226] usb 11-1: unable to read config index 0 descriptor/all
[ 8019.973237] usb 11-1: can't read configurations, error -110
[ 8020.269331] usb 11-1: new SuperSpeed USB device number 3 using xhci_hcd
[ 8025.644686] usb 11-1: unable to read config index 0 descriptor/all
[ 8025.644697] usb 11-1: can't read configurations, error -110
[ 8025.652808] usb usb11-port1: attempt power cycle

The same camera works in any of the USB 2.0 ports, albeit without 4K suppor=
t.
On a different machine (Asus PN50), the camera works fine in a USB superspe=
ed
port:

[222114.302378] usb 3-1: new SuperSpeed USB device number 2 using xhci_hcd
[222114.320421] usb 3-1: New USB device found, idVendor=3D046d, idProduct=
=3D085e,
bcdDevice=3D 3.17
[222114.320431] usb 3-1: New USB device strings: Mfr=3D0, Product=3D2,
SerialNumber=3D3
[222114.320434] usb 3-1: Product: Logitech BRIO
[222114.320437] usb 3-1: SerialNumber: 90A3845D
[222114.328549] input: Logitech BRIO Consumer Control as
/devices/pci0000:00/0000:00:01.2/0000:01:00.0/usb3/3-1/3-1:1.5/0003:046D:08=
5E.000A/input/input24
[222114.380587] hid-generic 0003:046D:085E.000A: input,hidraw2: USB HID v1.=
11
Device [Logitech BRIO] on usb-0000:01:00.0-1/input5
[222114.409388] mc: Linux media interface: v0.10
[222114.428046] videodev: Linux video capture interface: v2.00
[222114.459729] usb 3-1: current rate 16000 is different from the runtime r=
ate
24000
[222114.469733] usb 3-1: current rate 16000 is different from the runtime r=
ate
32000
[222114.479730] usb 3-1: current rate 16000 is different from the runtime r=
ate
48000
[222114.531631] usbcore: registered new interface driver snd-usb-audio
[222114.531771] usb 3-1: Found UVC 1.00 device Logitech BRIO (046d:085e)
[222114.557894] input: Logitech BRIO as
/devices/pci0000:00/0000:00:01.2/0000:01:00.0/usb3/3-1/3-1:1.0/input/input25
[222114.558136] usbcore: registered new interface driver uvcvideo
[222114.609743] usb 3-1: current rate 16000 is different from the runtime r=
ate
48000
[222114.629786] usb 3-1: current rate 16000 is different from the runtime r=
ate
48000
[222114.644731] usb 3-1: current rate 16000 is different from the runtime r=
ate
48000

Steps to Reproduce:
- Plug the camera's USB cable into any USB 3.0 SS port on the Asus M5A97 Evo
R2.0

Actual Results:
Error messages in the kernel log

Expected Results:
A functioning webcam

Build Date & Hardware:
- kernel 5.15.13-200.fc35.x86_64
- Asus M5A97 Evo R2.0
- Logitech Brio Pro

Additional Information:
Downstream bug report: https://bugzilla.redhat.com/show_bug.cgi?id=3D2040321

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A38B33044D
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 20:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhCGTgC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 14:36:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:46634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230458AbhCGTfd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 7 Mar 2021 14:35:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 70E046502E
        for <linux-usb@vger.kernel.org>; Sun,  7 Mar 2021 19:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615145733;
        bh=5W/bW9xvtTJHv/7BEUo/DLLsLv6TNg092wjO/Tvz78w=;
        h=From:To:Subject:Date:From;
        b=CFrIpDf6W8hXW1uJWJ7niEgi3HtE/O+qlqARUTcQLMACj9jRz3UgRsAqe0GTKZba+
         g9v0IoZAVUS0tqnk7SmhnQENyZuI0GbXauWA1OTV2Zc3yOvt0oeIEuwUG69y/G3Xak
         mDX3HQJISikOUg+d3IpPrfqIPj8s7K77VJbqXSBA4Ny1ui3/4z2Ka5QulQz3+9tsRP
         BbaFy6cvM0TEHZe+bgDfkgQzhFQ1pq7/ED3oCZErU+72r/kt6vqUfN+FHmTcOs9UaB
         Qn2MVDTivbF24NnUkFpcjSsNuVyerHKnOTHlOC7hhMG3MdO343rgRDWtx8P3Alvahg
         M90YpcT9AFS/w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 59F6E65348; Sun,  7 Mar 2021 19:35:33 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212113] New: USB stops working few minutes seemingly after
 specific actions on the PC
Date:   Sun, 07 Mar 2021 19:35:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrej.trnkoci@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212113-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212113

            Bug ID: 212113
           Summary: USB stops working few minutes seemingly after specific
                    actions on the PC
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.18-1-MANJARO
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: andrej.trnkoci@gmail.com
        Regression: No

When the problem occurs, my usb3 devices stop working and I can find follow=
ing
error in logs viewed by dmesg:

[28231.353917] xhci_hcd 0000:03:00.0: ERROR unknown event type 15
[28236.265786] xhci_hcd 0000:03:00.0: xHCI host not responding to stop endp=
oint
command.
[28236.265793] xhci_hcd 0000:03:00.0: USBSTS:
[28236.265819] xhci_hcd 0000:03:00.0: xHCI host controller not responding,
assume dead
[28236.265838] xhci_hcd 0000:03:00.0: HC died; cleaning up

I seem to be able to reproduce this problem every time I run clickable
development tool for building, installing and running ubuntu touch mobile
application using clickable
https://clickable.bhdouglass.com/en/latest/index.html. The clickable tool u=
ses
docker and possibly android debug (adb) to install and run the application.=
 The
clickable command finishes the actions without problems but after few minut=
es
my usb stops working and I can find the above error in logs.

I am not 100 percent sure if this is the trigger for this issue but last +-5
times I tried running "clickable" command on my project the problems happen=
d.
But if I run "clickable desktop" command (this command does not install the=
 app
on mobile phone just runs it in a docker container) the problem seems to ne=
ver
happen. Also if I use the ssh interface of clickable tool the problem does =
not
seem to happen at all. My guess is therefore that the problem could be caus=
ed
by the adb (android debug) tool. However it is only my speculation.

Below I provide a small subset of my system information:

Processor               : AMD A10-7850K Radeon R7, 12 Compute Cores 4C+8G
Memory          : 6025MB (1980MB used)
Machine Type            : Desktop
Operating System                : Manjaro Linux
-Display-
Resolution              : 1680x1050 pixels
OpenGL Renderer         : AMD KAVERI (DRM 2.50.0, 5.10.18-1-MANJARO, LLVM
11.1.0)

-USB Devices-
008:003         : VIA Labs, Inc. Hub
008:002         : VIA Labs, Inc. Hub
008:001         : Linux Foundation 3.0 root hub
007:004         : VIA Labs, Inc. Hub
007:003         : VIA Labs, Inc. Hub
007:002         : ASUSTek Computer, Inc. USB-AC56 802.11a/b/g/n/ac Wireless
Adapter [Realtek RTL8812AU]
007:001         : Linux Foundation 2.0 root hub
002:001         : Linux Foundation 2.0 root hub
004:001         : Linux Foundation 1.1 root hub
001:003         : Focusrite-Novation (Unknown)
001:004         : MosArt Semiconductor Corp. Wireless Keyboard/Mouse
001:002         : Terminus Technology Inc. Hub
001:001         : Linux Foundation 2.0 root hub
003:001         : Linux Foundation 1.1 root hub
006:001         : Linux Foundation 3.0 root hub
005:001         : Linux Foundation 2.0 root hub

I hope the provided information will be helpful, I will be glad to provide =
more
information if needed.

Best Regards
Andrej

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

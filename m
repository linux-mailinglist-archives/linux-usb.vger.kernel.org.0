Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37EF43D47EC
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 15:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbhGXNAz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Jul 2021 09:00:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:56252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhGXNAz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Jul 2021 09:00:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0F00960E8F
        for <linux-usb@vger.kernel.org>; Sat, 24 Jul 2021 13:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627134078;
        bh=gdk4OFMEi9RvDqMVPbCnfJpHkr/NOH3bxAMMlF/Vq2o=;
        h=From:To:Subject:Date:From;
        b=Rgy0l0fatkF2ZHF89Dqajty80JD2q9lXyr23AIjDsN0mPaSvu0cZlbh0sNVp7q50Q
         /ZUD+wDR/cxb91TUJrw0rysBhUOiQbSkLrwFjTfdkYR10rvp+WAEf/pfCOAOvOSSD4
         dA8tcuEKLZi34cTOuQ+7UZ+6WjP7pAUXTD55JF9BNNcfli/SQE9H29FL4ldjkbk4kw
         9299Du9gbLUzSVmWd8lvq7ejNbnjhfTzzzf5Uv5rwb1iOwP5+q4uMBoDXKIaI1YQNJ
         ofxTYtgb7iijXCXKQ64wXKXz7hzBxP33U1iLQExgaFCIHWEwiUoFIm4GxDdYLR6lFw
         xbfzXzqCuIU+A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id EEDBA608FA; Sat, 24 Jul 2021 13:41:17 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] New: XHCI 7 port usb hub does not work correctly
Date:   Sat, 24 Jul 2021 13:41:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tmezzadra@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213839-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213839

            Bug ID: 213839
           Summary: XHCI 7 port usb hub does not work correctly
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: tmezzadra@gmail.com
        Regression: No

I got an off brand 7-port usb 2.0 which internally has two ICs.

first IC connected to the host's usb port exposes 3 USB ports. its 4th usb =
port
has a second identical IC connected which exposes 4 USB ports making it a t=
otal
of 7 USB 2.0 ports available.

Bus 002 Device 065: ID 0a05:7211 Unknown Manufacturer hub
Bus 002 Device 064: ID 0a05:7211 Unknown Manufacturer hub

As they appear from lsusb

the problem is that the first chip works correctly (first 3 USB ports conne=
cted
to it work). But as soon as I connect a usb device on any of the ports from=
 the
second chip. i get the following problems in dmesg:

[ 2215.717828] usb 2-1.1: new full-speed USB device number 29 using xhci_hcd
[ 2215.808680] usb 2-1.1: New USB device found, idVendor=3D0a05, idProduct=
=3D7211,
bcdDevice=3D 1.00
[ 2215.808685] usb 2-1.1: New USB device strings: Mfr=3D0, Product=3D1,
SerialNumber=3D0
[ 2215.808688] usb 2-1.1: Product: USB2.0 HUB
[ 2215.809333] hub 2-1.1:1.0: USB hub found
[ 2215.809426] hub 2-1.1:1.0: 4 ports detected
[ 2216.158062] usb 2-1.1: USB disconnect, device number 29
[ 2216.174608] usb 2-1.1-port3: attempt power cycle
[ 2216.561173] usb 2-1.1: new full-speed USB device number 34 using xhci_hcd
[ 2216.652346] usb 2-1.1: New USB device found, idVendor=3D0a05, idProduct=
=3D7211,
bcdDevice=3D 1.00
[ 2216.652359] usb 2-1.1: New USB device strings: Mfr=3D0, Product=3D1,
SerialNumber=3D0
[ 2216.652365] usb 2-1.1: Product: USB2.0 HUB
[ 2216.654327] hub 2-1.1:1.0: USB hub found
[ 2216.654480] hub 2-1.1:1.0: 4 ports detected
[ 2217.001529] usb 2-1.1: USB disconnect, device number 34
[ 2217.017975] usb 2-1.1-port3: attempt power cycle
[ 2217.404536] usb 2-1.1: new full-speed USB device number 39 using xhci_hcd
[ 2217.495411] usb 2-1.1: New USB device found, idVendor=3D0a05, idProduct=
=3D7211,
bcdDevice=3D 1.00
[ 2217.495417] usb 2-1.1: New USB device strings: Mfr=3D0, Product=3D1,
SerialNumber=3D0
[ 2217.495419] usb 2-1.1: Product: USB2.0 HUB
[ 2217.496120] hub 2-1.1:1.0: USB hub found
[ 2217.496221] hub 2-1.1:1.0: 4 ports detected
[ 2217.844888] usb 2-1.1: USB disconnect, device number 39
[ 2217.861345] usb 2-1.1-port3: attempt power cycle



and so on....


This same device at a Windows computer works correctly.

Ideas?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

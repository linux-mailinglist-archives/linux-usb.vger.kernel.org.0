Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D0D438498
	for <lists+linux-usb@lfdr.de>; Sat, 23 Oct 2021 19:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhJWR6B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Oct 2021 13:58:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230104AbhJWR6B (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 Oct 2021 13:58:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DD45F603E9
        for <linux-usb@vger.kernel.org>; Sat, 23 Oct 2021 17:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635011741;
        bh=wUifiUNOLBZKxTlfBSLMj5VPRzKP7GftnVF2lKwrh+I=;
        h=From:To:Subject:Date:From;
        b=SleM+JaBDZ42nhwK18fU9/JjLSgD41F6yW9D7T0mX+nghS6gnUh6p/0iR3dFFczf8
         88zhXeKmGnPV7MoUzKR8K3Kdfyb+XyrSLSs6dbVzctlm4expJZLw0/jzUWrtsdrkK1
         4Y68OxH6tKF2J7NJbE2wF/ePD0bHcvnqYr/Wzn/GLiY7VnneQJ8AS0Ba6q2REdW3lw
         2t8d9zQre31qYMpdFQVpuK6D1AF/ErukbRsBoyAyH0Z4fVSVBzMBiku0I15jX0EFIo
         zWCCFKotsDQi8rxjtnQp9amzhbKD4CJwFooWO9t481lWtGejlrF9A3HplAK//6GiaI
         q6yg23QIwo3Yg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C944B60F41; Sat, 23 Oct 2021 17:55:41 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214797] New: ehci-pci: unable to enumerate Sony NW-WS623 Device
Date:   Sat, 23 Oct 2021 17:55:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: Stefan.Lauterwasser@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-214797-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214797

            Bug ID: 214797
           Summary: ehci-pci: unable to enumerate Sony NW-WS623 Device
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.14-arch1-1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: enhancement
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: Stefan.Lauterwasser@gmail.com
        Regression: No

Created attachment 299303
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299303&action=3Dedit
Windows 10 Device Information

kernel: usb 1-1.5: new high-speed USB device number 40 using ehci-pci
kernel: usb 1-1.5: device descriptor read/64, error -71
kernel: usb 1-1.5: device descriptor read/64, error -71
kernel: usb 1-1.5: new high-speed USB device number 41 using ehci-pci
kernel: usb 1-1.5: device descriptor read/64, error -71
kernel: usb 1-1.5: device descriptor read/64, error -71
kernel: usb 1-1-port5: attempt power cycle
kernel: usb 1-1.5: new high-speed USB device number 42 using ehci-pci
kernel: usb 1-1.5: device not accepting address 42, error -71
kernel: usb 1-1.5: new high-speed USB device number 43 using ehci-pci
kernel: usb 1-1.5: device not accepting address 43, error -71
kernel: usb 1-1-port5: unable to enumerate USB device
kernel: usb 1-1.5: new high-speed USB device number 44 using ehci-pci
kernel: usb 1-1.5: device descriptor read/64, error -71
kernel: usb 1-1.5: device descriptor read/64, error -71
kernel: usb 1-1.5: new high-speed USB device number 45 using ehci-pci
kernel: usb 1-1.5: device descriptor read/64, error -71
kernel: usb 1-1.5: device descriptor read/64, error -71
kernel: usb 1-1-port5: attempt power cycle
kernel: usb 1-1.5: new high-speed USB device number 46 using ehci-pci
kernel: usb 1-1.5: device not accepting address 46, error -71
kernel: usb 1-1.5: new high-speed USB device number 47 using ehci-pci
kernel: usb 1-1.5: device not accepting address 47, error -71
kernel: usb 1-1-port5: unable to enumerate USB device

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

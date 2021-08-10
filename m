Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CFD3E7C20
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 17:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242367AbhHJP1G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 11:27:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:46104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240233AbhHJP1F (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Aug 2021 11:27:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 67AEB60F41
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628609203;
        bh=C1wZTtqChbXheI4CkeKWy1hKyJ42OlvX0ihyerGI/+I=;
        h=From:To:Subject:Date:From;
        b=NrpofurFj7z801LmGwJzcrKKv/P7f1MUvBBJjn/lBYgpRakZqDdjZUIT3WZw7HxhW
         kA03Jt1dzkTFiMQWqSmo8WS+sEoe8LwEeug33PB8gndFoteOulsXLPPRGWIGpL1TZc
         LItq19wnCkRB3oYA4drQfEwkD0cQ033c/yKL2Rm3VhkgM8XlVfWhxJYoX/2kYulxDw
         f6cH4ucRYtlDsqKZf1X1OcdcoT0wpy7g56w4EebyjntuqINe3LZ0b5nWMzAlJa3I/Z
         D5Bi3tTOeLlIld5q8rGjbTg09ZUggJXjPQe27hVFrQtg9RupirprJmzMaczbLYGeZT
         sfLuAjcuAIoaw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5714460E4A; Tue, 10 Aug 2021 15:26:43 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] New: The USB devices fail to be detected during boot
Date:   Tue, 10 Aug 2021 15:26:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

            Bug ID: 214021
           Summary: The USB devices fail to be detected during boot
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12 and later version
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: chris.chiu@canonical.com
        Regression: No

Created attachment 298255
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298255&action=3Dedit
output of lsusb -v

We found some USB devices (keyboard, storage) will fail to be detected on
kernel 5.13 during boot, but it's working OK after re-plug the device. After
looking into the dmesg during boot, there's an error message as down below
[   39.350435] hub 1-0:1.0: USB hub found
[   39.398835] hub 1-0:1.0: 12 ports detected
[   39.622744] usb usb1-port3: couldn't allocate usb_device

Then we try to reproduce it on older kernel (5.4 and 5.8), there's no such
problem. After bisecting, we found the commit
https://github.com/torvalds/linux/commit/90d28fb53d4a51299ff324dede015d5cb1=
1b88a2
makes the difference. It seems that hub_power_on_good_delay is not long eno=
ugh
for this hub. The bPwrOn2PwrGood in the Hub Descriptor (please refer to the
attached lsusb-v.txt) is 20ms, which seems pretty normal when I check the s=
ame
thing on other hubs. Can we totally trust this? Please suggest what we shou=
ld
do for this kind of hub. Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6CAD30953B
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jan 2021 14:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhA3NLt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Jan 2021 08:11:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:35690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229620AbhA3NLr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 30 Jan 2021 08:11:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4782F60234
        for <linux-usb@vger.kernel.org>; Sat, 30 Jan 2021 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612012267;
        bh=rl7fwFV14roCwizzTzNmtD6eUZoS7fUM2NaJ3Qawtrg=;
        h=From:To:Subject:Date:From;
        b=ikSH8TL07neEwt+89DjzO6eL1yT9MBwYveloRadOMYSzGHJe1gcEXqw42viMqNkNi
         m3plEaZvTRt698RywxcNXoX4AI6g08Qe18zKE8pOJtZfruSvkVfobDKsbvQV7ZVsqy
         bt4niQ7LM3+s4cbQec4zwkdxeq3EmDYS9zRd84moGovBooM1VPgIRiL3SQM5NpkXzc
         zfO3hYZ2DdTq1cEaQp1pEcRKCa5KeHn4Xt8t8unIiV4xZwYnqZ+bNxDelVDtpT+xj1
         b6NIuEzp2dehrT34/qdxW8rZOpQibAaVxS5hivGosKu9Ic9H0eiVMckGLVSKtwDamd
         8Rn6+r0zc/SUA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3C563652F9; Sat, 30 Jan 2021 13:11:07 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211479] New: hid-generic: offset (0) exceeds report_count (0)
Date:   Sat, 30 Jan 2021 13:11:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andreas.thalhammer@linux.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-211479-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211479

            Bug ID: 211479
           Summary: hid-generic: offset (0) exceeds report_count (0)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.11
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: andreas.thalhammer@linux.com
        Regression: No

Created attachment 295005
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D295005&action=3Dedit
relevent dmesg part...

After updating the firmware of my Wooting Two keyboard to the newest version
(in Windows, not Linux), I get this during boot-up (output copied from dmes=
g):

hid-generic 0003:03EB:FF02.0006: offset (0) exceeds report_count (0)
RIP: 0010:__alloc_pages_nodemask+0x1bc/0x240

see attatchment...

There is to say that I also have a mouse and a gamepad connected, also with=
 a
couple of input device nodes each.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

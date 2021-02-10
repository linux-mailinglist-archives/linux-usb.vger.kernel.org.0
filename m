Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95F6316207
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 10:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhBJJWc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 04:22:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:59154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229646AbhBJJT7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Feb 2021 04:19:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5F82C64DB1
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 09:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612948755;
        bh=lxpaMNiK+R3HSMB38A98suE34JqvKwCZPGQD54PyI6Q=;
        h=From:To:Subject:Date:From;
        b=II8Ht0Fr0UrcsWKnThp5dafje9NH8Rh0oF68gXu2BEfDb9741VBl00RsYNGq77+Gz
         PYVrvNo9al5UO6aSKJbMkRhfiULSuyIAvSgLoQ2AUjR4xtUNpfksEiNHQGZr0jSwMz
         hICNgqpcj4zzVlp3PqEDP9cd95935qlMQFVmjvht5dH8xY/DqBTe5nYuVASOKoQxTw
         Q6xDCg4Iiz6l6sKQplE1if0//8XGXEP+NNTDwxWXEFOu39sD4k7PUQ9YzUJFH3ewCV
         Z3tnjKhr4kJui5uwd9tDLOg/DFQ0t5yshLuHQmjEhO2seVFkCpMJNdvnh5ml8n1rr5
         XHonjBMh0dIbw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 4785661479; Wed, 10 Feb 2021 09:19:15 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211667] New: USB attached HDD enclosure failure
Date:   Wed, 10 Feb 2021 09:19:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sec@dschroeder.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-211667-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211667

            Bug ID: 211667
           Summary: USB attached HDD enclosure failure
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.14
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: sec@dschroeder.info
        Regression: No

Created attachment 295177
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D295177&action=3Dedit
dmesg

Only three out of four drives are recognized at the time the enclosure is
powered on.
As a workaround the following device is resetted:

path=3D/dev/bus/usb/004/008
    description=3DVIA Labs, Inc. USB3.1 Hub
    manufacturer=3DVIA Labs, Inc.
    device=3DUSB3.1 Hub
    search string=3DVIA Labs, Inc. USB3.1 Hub VIA Labs, Inc. USB3.1 Hub

which is a HUB integrated into the external enclosure.

External enclosure model: IB-3740-C31

Attached dmesg shows the initial power up and the following manual reset.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

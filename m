Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612723F5886
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 08:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhHXGz3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 02:55:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:46130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231300AbhHXGz3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Aug 2021 02:55:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8826E6128A
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 06:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629788085;
        bh=9a2gq2elsyxsYMA6eZPuMIg43MQQ2gB+l1uOxB/Rf8g=;
        h=From:To:Subject:Date:From;
        b=RRzv1CHxCndDRvyfYu7mu3nieexZBjRdfdrV5ss80OMBj67Vqkz3ZlSahbNr3wPJt
         DCx/dPqu0PDpEFr9X/FCLCMxtp4vIzh1LqgEzVYcp52NsQwRBXeEoQsEmcraRpf0ix
         6LJgD9+yIDzNKzZNhbrNJXsks8N3YfH9HqK5gF+5nZa3OQtLmIR2ESAroDJqOXlMZK
         ghZr4soF58tpljuCTAHDKetvK6HEV2YUrsbBscjYuxaLN5/Z0C4ItCp7HpEa8pLi6F
         khmoduXAaSYc+iR3b8vQxzI1sQEiMPgsJsZrEhy2X+VIxKV2FEZNwwqgoR0M2l9i5I
         Z7AdQXdt2Iswg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7AF0960FF1; Tue, 24 Aug 2021 06:54:45 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMTQxNTVdIE5ldzogcmVncmVzc2lvbiA1LjEwLjQ54oaS?=
 =?UTF-8?B?NS4xMC41MjogRGlyZWN0IGZpcm13YXJlIGxvYWQgZm9yIHJlbmVzYXNfdXNi?=
 =?UTF-8?B?X2Z3Lm1lbSBmYWlsZWQgd2l0aCBlcnJvciAtMg==?=
Date:   Tue, 24 Aug 2021 06:54:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla.kernel.org@e3q.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214155-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214155

            Bug ID: 214155
           Summary: regression 5.10.49=E2=86=925.10.52: Direct firmware loa=
d for
                    renesas_usb_fw.mem failed with error -2
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.52
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: bugzilla.kernel.org@e3q.eu
        Regression: No

My laptop's internal webcam stopped being detected at some point in the last
weeks. I do not use that webcam often and various things happened in that
period, such as minor kernel updates and a BIOS update, so it was not
immediately clear where the cause lay. After some investigation, I found the
following in my logs:

xhci_hcd 0000:06:00.0: Direct firmware load for renesas_usb_fw.mem failed w=
ith
error -2
xhci_hcd 0000:06:00.0: request_firmware failed: -2
xhci_hcd: probe of 0000:06:00.0 failed with error -2

Reverting to an earlier kernel version (5.10.52=E2=86=925.10.49), this mess=
age
disappears and the webcam is detected again. This makes me suspect there is
some kind of regression after 5.10.49.

A related report can be found at

https://forums.lenovo.com/t5/Other-Linux-Discussions/Possible-1-34-BIOS-bug=
-on-P14s-AMD/m-p/5089865

There, the assumption is that this is related to the BIOS update. Given my
tests, there certainly is a kernel component to the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

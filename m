Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33A8364CF4
	for <lists+linux-usb@lfdr.de>; Mon, 19 Apr 2021 23:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234559AbhDSVSf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Apr 2021 17:18:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:37982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229776AbhDSVSd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Apr 2021 17:18:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 47FC061107
        for <linux-usb@vger.kernel.org>; Mon, 19 Apr 2021 21:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618867083;
        bh=vokZMsLifdaiyQIyRo1sUA1EkIhxOnfhzlkS8SRwtbM=;
        h=From:To:Subject:Date:From;
        b=VSTL1pIZMy9Bck1SgvZ/eMkGSM2fvygubkrGbL7KMMLLjwKS7jvjJpjnW9riMWe0T
         TnmrNhgGKHhj62EBJLAjCDQdgdezTEc7t0gQTbuASNcfSw9LfCLccfkvRgVuUgjz24
         2rYPlGiEV2nLhmNHlYDCH5k39nfmJF7P8NyrLtN6dHYDjylHjWKQahS7cXMwmvbAGA
         Fl0rcXYWcFaPXGaSdjYXDnByIsyimqEW1CzNPnlKvte4zOziUsKOonX4RKxuj+ufZM
         hTMJO5EuGU3f4fMCrVCjzISH5HPJe+itj99hnhq/YNV9srwRkFmc7oSxkYHppdk6Ts
         M39BbLwxE0+gA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2BB11610D1; Mon, 19 Apr 2021 21:18:03 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212725] New: USB CDC ACM device stop working
Date:   Mon, 19 Apr 2021 21:18:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stefan@agner.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212725-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212725

            Bug ID: 212725
           Summary: USB CDC ACM device stop working
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.15
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: stefan@agner.ch
        Regression: No

When trying to use USB CDC ACM devices (open using screen) opening fails and
the kernel dmesg shows the following error:

kernel: cdc_acm 1-3.3.3:1.0: acm_port_activate - usb_submit_urb(ctrl irq)
failed

This happens with STM32 microcontroller based device as well as a Segger JT=
AG
adapter, so it seems not device related. The issue must have been introduced
recently (within the last month) as those devices used to work previously. I
can reproduce the issue also with latest LTS kernel release 5.10.31.

Builds:
- 5.10.31-1-lts
- 5.11.15-arch1-2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

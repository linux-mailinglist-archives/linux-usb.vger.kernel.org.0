Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0898F32C644
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 02:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344667AbhCDA2J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 19:28:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:39418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235303AbhCDAHI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Mar 2021 19:07:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 50EB864F3A
        for <linux-usb@vger.kernel.org>; Wed,  3 Mar 2021 23:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614815483;
        bh=IvOUEj7A2JeNn+ddawNO6Ze+8c8gLK1RNZRcf15pj8Y=;
        h=From:To:Subject:Date:From;
        b=o9umoLLFvbgROMDKHM8ILHFCuHerlRteCTRUZujEv3rwNAZEawizuhJjVPTa8xYwk
         HF5soW0R4nWIGMhlh9gmqc/eBg2Kg+FRFGO3+aXLt3Ny2PdxmVZB22YdKDckyBHCHv
         WLYCVdIz5kSFzDL/m6Jk0wGAfPjfYbYdfT/M0V5gEOQVRX2WeO6iOCBTomRs3zG9F2
         6VK6JBkubksjlivJy4A1TA+ISSDOVTttCOvEqyNuWd6tsimzYWtGhpEl6i6tKRV2y1
         Nu+a1Anmxs6FHB+lcXXUyZl93Hnj5u3EXfTEK3K4rhhg97Z///CFzeHGw0oN6JCC5W
         1xKafPZoCyPrQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3D5E86536C; Wed,  3 Mar 2021 23:51:23 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212045] New: dwc2 gadget mode read call blocks
Date:   Wed, 03 Mar 2021 23:51:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz@grobelny.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212045-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212045

            Bug ID: 212045
           Summary: dwc2 gadget mode read call blocks
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: tomasz@grobelny.net
        Regression: No

When implementing USB gadget on Odroid N2 I write descriptors for two endpo=
ints
so I get ep0, ep1 and ep2 files. I open those files and try to read from ep0
and ep2. While ep0 more or less works, for ep2 I get weird behaviour: the
select() call returns 1 indicating that there is data to read and then read=
()
call blocks. It happens even if I set the file descriptor to O_NONBLOCK. He=
re
is the kernel log: https://pastebin.pl/view/aaa2d7f0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

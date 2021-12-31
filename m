Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 069B8482531
	for <lists+linux-usb@lfdr.de>; Fri, 31 Dec 2021 17:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhLaQfo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Dec 2021 11:35:44 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:46564 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhLaQfo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Dec 2021 11:35:44 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 77806B81D9C
        for <linux-usb@vger.kernel.org>; Fri, 31 Dec 2021 16:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D6EDC36AEC
        for <linux-usb@vger.kernel.org>; Fri, 31 Dec 2021 16:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640968542;
        bh=EOfNc0k7XVqdeGjc/w/YJHg9lwvx4MYHJJQduNpzkqo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FPuXS3yMDFNugKKMExX/zIXrRcWDwiuzVYDh89YKrkMWWCDLFTUI+o+WHXKE2r1fu
         iW5x406AfB0Jxe8Kp/yiKViszjyKWjrsN4Vl4J0d/zAtXpBqQ1iM0hLDZ1BOX/bXNj
         kL+OAMeCfl1LGvdEd0+cr2FONKZuevRHb1xHzTE6V1vjhbBB3b9GJGxMUb8H3bqmkZ
         q4Euv9ri6wYTuqF7nCzeSxO0jbBikSjit/7ZMHY+hcjBoc7yRQedYh9RkidxiD+uHw
         145w27XIPRFQ+dHdYl0nqK6nVUlAbior472b3vXfuAvNBo+bAdZzplH2H7DT4lO9SW
         JCTBvvo2F3npQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1536DC05FCF; Fri, 31 Dec 2021 16:35:42 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Fri, 31 Dec 2021 16:35:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: noodles@earth.li
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213839-208809-vrIt0eUqR4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213839-208809@https.bugzilla.kernel.org/>
References: <bug-213839-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213839

--- Comment #9 from Jonathan McDowell (noodles@earth.li) ---
Attached files are hopefully helpful. Capture is started, hub is plugged in,
USB3 flash drive is then plugged into a port off the second hub chip. In the
Windows case it's detected fine (you can see the flurry of USB Mass Storage
requests), in the Linux case there's some sort of disconnect/reconnect event
but the flash drive never appears.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7763300D4
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 13:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhCGM2e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 07:28:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:43266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230039AbhCGM2I (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 7 Mar 2021 07:28:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 96AD464DA3
        for <linux-usb@vger.kernel.org>; Sun,  7 Mar 2021 12:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615120088;
        bh=TfGGg+fS82eaWk3E/uczVBc9eDFWzru8DlPjIen65Nc=;
        h=From:To:Subject:Date:From;
        b=k9ctuyykwqbSCNVHkZIuDTa5MLLp1FHrRWXDpWj4uyLsi7T9v+N+QfczLRnfY+7Rb
         QDW0Of3/sk5ojJGTMIQmS8FBC+x8Ylv6WfASRVyt36f7wj3SCPkERLTZthyoNLD1Px
         aWL1P2FuATzv+9ML5MGWDvtE5zkuGyFYRStgZUK8vG6XSUDtY7PS7ONSDAIyfEzVMP
         kgS3b4KnN5AXFMf0w8t01qpswhqg8O8GNrsTxdzCIsjJuVr79hZiVnp49qdwvBDpXI
         jEZxgBVR4ohbe8TGCYAmP+s9g8Gk8Oz4dRz1oZpM7re2mQ7vzQaHSE6jUNH9GVRa14
         LtCtx5nCaRgOw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7F49665348; Sun,  7 Mar 2021 12:28:08 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212101] New: xhci_hcd cant setup
Date:   Sun, 07 Mar 2021 12:28:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: hose@posteo.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212101-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212101

            Bug ID: 212101
           Summary: xhci_hcd cant setup
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.0-44-generic #50~20.04.1-Ubuntu
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: hose@posteo.net
        Regression: No

Hi,

I plugged a USB 3.1 card into a PCIexpress slot and couldnt get resonable
speeds with it. lsusb refers to it a USB 3.0 root hub, not usb 3.1. So look
into dmesq and found an error.=20

As dont no nothing on driver and kernel it might be a totally misplaced tic=
ket.
But maybe its not, so give it a try.

pikab

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

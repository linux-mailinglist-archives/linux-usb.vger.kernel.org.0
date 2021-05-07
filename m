Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0BF3767AC
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 17:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbhEGPIk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 11:08:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:39560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231815AbhEGPIj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 May 2021 11:08:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E315E61415
        for <linux-usb@vger.kernel.org>; Fri,  7 May 2021 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620400058;
        bh=RMrrSVMlxlosEh2CyM0hzbq/0ecyn6OrbB/Swcd4kL4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oTL6T3LqP6YGDyeiOSIAUttQ2M4QPSQx1WPsO8wyLGOR2/yIwHsv9C4WU0rKLGtaF
         6NMYVFLOlGKRNpmFcg0gGZ+7J65JIf8wOfp81PGCYuO5ovCjAjsbqgzyFnsBxi1Xmd
         P4Cg/joezw5N8ErY3tCk6cgS3GaTOCxqKtNOkuoBTAXi0wdEnOSzYUxzSNIvozQf6H
         aFJ3d3NCS98IQYSwjMreNDlp/PBuC184JNkWJa1DGvgm5ZhCjFo25D4B8NEisIYN9Y
         P55ZRmS8/nuO3kbkWEL6zhPJUIVF3VuoS/l1WsH5ghfeGZsEaTRhPWOjluCflM+68p
         wzfKUTh1gGz8Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C8B3960F23; Fri,  7 May 2021 15:07:38 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Fri, 07 May 2021 15:07:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212955-208809-ak2MUSTCsw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212955-208809@https.bugzilla.kernel.org/>
References: <bug-212955-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212955

--- Comment #9 from Alan Stern (stern@rowland.harvard.edu) ---
Interesting.  I don't see any particular differences as far as the USB core=
 is
concerned, but there are major differences in the way the device gets used.=
=20
You can even see it in the dmesg output:

[  963.375444] usb 4-1.5: 0:1: add audio endpoint 0x2
[  963.376273] usb 4-1.5: 1:1: add audio endpoint 0x81

Those lines are present in 5.9 but not in 5.12, and they occur before the
problem happens.  These messages may not be directly relevant to the proble=
m at
hand, but they do point to changes in the audio drivers.  Those changes may
expose a bug somewhere else.

Judging from these results, I will guess that your bisection tests will
pinpoint a commit that affects the snd-ua101 audio driver.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

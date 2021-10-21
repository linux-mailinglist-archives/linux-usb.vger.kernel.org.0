Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27693435A03
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 06:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhJUEb6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 00:31:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:40140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229452AbhJUEb6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Oct 2021 00:31:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C316760F5D
        for <linux-usb@vger.kernel.org>; Thu, 21 Oct 2021 04:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634790582;
        bh=ToTMgVoDbamx4adCWrUUNEuesO5ogyMFscv8p0bp7vQ=;
        h=From:To:Subject:Date:From;
        b=aeSyR/7rZj3MFnWWiaOcsurCqoZjKi0FJJ+Zj4CKNyD3z7jgRFn8cM3mOneKHb9SV
         GV8p6XLa+kN5sJhy+K/qTNs1LLcS7WOqp3WGZw30rYcEXwuCMqEYNl0mnl9re9Dbcd
         AYQQTK6w3XDboh6xE7fnkbe54W+rkVr59asuHUees9odgIj0SA0yS8FgTsD70WLjbe
         les2BAvCIsqFL/crAnGOcv7USuySL/DmsI1vHa4AFbWVCsu7dD/75n3Qk3b0kJtkQu
         42dG1QFScBYQ2LBoky1q//5LnIZ/aH3ZKxs/vJD10Xm5at4LPnWmTCF6id0eqVqLAb
         aYbAJKzXhhTiQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id AF76660CA4; Thu, 21 Oct 2021 04:29:42 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] New: ehci-hcd.c ISR
Date:   Thu, 21 Oct 2021 04:29:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: scott.c.arnold@nasa.gov
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214789-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214789

            Bug ID: 214789
           Summary: ehci-hcd.c ISR
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11+
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: scott.c.arnold@nasa.gov
        Regression: No

Change in ehci_irq from spin_lock_irqsave/irqrestore to spin_lock/unlock br=
oke
shared IRQ's

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

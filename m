Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA274420FF
	for <lists+linux-usb@lfdr.de>; Mon,  1 Nov 2021 20:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbhKATnl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Nov 2021 15:43:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:39894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229511AbhKATnl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Nov 2021 15:43:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 57C9560FC4
        for <linux-usb@vger.kernel.org>; Mon,  1 Nov 2021 19:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635795667;
        bh=aTAFiPypnW9a9Hbwv5a4yyAHApLhxEHXDJEr0cX95ws=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Cj6HZQRGr9oIctSelpWSjYByr2AQX1O0TNg754I5ldusxwm9RuoXD1bp8G0bF9Khu
         KE/eBGyGwCLml59vvatq6VmPDfTydNRrvqYj/Klk50myQuUttrBuxWVDr3OrYfd33M
         kuu2Sq2fpIccWuCvyktdd/JHcJdcmmkhPmgTrpzViNYw+Rc38x1MlxqBPrXxfpaBYx
         NtIO3FHx/vKFGOF5CKsCT0liBebS6chLm7t1HPK3RSqg69uJtjqWHzFOPpWEtjvp85
         N0fdiHCS5LG5uI9eHQC2ONV/3aEd2l6ThUXO5rYXWqOi1Zc6elfS/a8XQBa9qvjX5r
         aXcrOgDqOtvtA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 43AAA60EE7; Mon,  1 Nov 2021 19:41:07 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Mon, 01 Nov 2021 19:41:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214789-208809-xflJG2Ya1X@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214789-208809@https.bugzilla.kernel.org/>
References: <bug-214789-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214789

--- Comment #20 from Alan Stern (stern@rowland.harvard.edu) ---
There were no significant changes at all to the ehci-hcd driver between 5.6=
.1
and 5.7.1.  Which indicates that the cause of the problem lies somewhere el=
se
in the kernel.

At this point, your best approach would be to carry out a git bisect between
those two kernel versions.  Or maybe just between 5.6 and 5.7 (I assume that
5.6 is okay, just like 5.6.1, and 5.7 is bad, just like 5.7.1).  That would=
 let
you identify the exact commit where the problem started.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

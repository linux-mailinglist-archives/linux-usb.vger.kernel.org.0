Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A2A459A31
	for <lists+linux-usb@lfdr.de>; Tue, 23 Nov 2021 03:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbhKWCsF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Nov 2021 21:48:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:36376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229672AbhKWCsF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Nov 2021 21:48:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id F23AA60E73
        for <linux-usb@vger.kernel.org>; Tue, 23 Nov 2021 02:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637635498;
        bh=pf6FiAPAY6YPiiHbvfmQIgZkkdkx/lAE0wbHDFHVTlw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YzsnNKBM+i7k2HMJjF+J9eEBhHNOdRrxgKtdf02lr6+fhV8W8CcLBOKNW3nrhlHz7
         Hk9INPOrVY6W+kYfd7bpovowQFDf8dS2w2PIh3y2OB07fPEPpRdXcCpfkG/qpcFCtd
         OXQ51azYGG8wyoTKyniKhZseOGiz3M2WrNTySqt1RUuEQqvjj49Z1B7jvju1doZ1+7
         X2WOGkyeO8rlFWSm1JT5Ij6aC+jX0jxz5tgTdjbqBWIlBI9gvluVV/cex6aCQoHRxG
         mEhDaXJ8uqPIo2GV4Ndv3FeNlo6pvaum3SowYrzPa2AThFaXnNt27UUhCDZOtnVZBH
         kO4BYCzdOwVTw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D9C1C60F11; Tue, 23 Nov 2021 02:44:57 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215095] USB ehci error -110 and soft lockup on kernel 5.15.4 as
 kvm guest
Date:   Tue, 23 Nov 2021 02:44:57 +0000
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
Message-ID: <bug-215095-208809-bV7iWYwx8r@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215095-208809@https.bugzilla.kernel.org/>
References: <bug-215095-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215095

--- Comment #5 from Alan Stern (stern@rowland.harvard.edu) ---
Here's something you can do to help diagnose the soft lockup.  When the loc=
kup
occurs, go to the /sys/kernel/debug/usb/ehci/* directory (fill in the "*" w=
ith
the pathname for the EHCI controller that's locking up), make copies of the
files you find there, and attach those copies to this bug report.

Another thing you can do: Before the problem occurs, start a process doing

   cat /sys/kernel/debug/usb/usbmon/1u >mon.out

and after the lockup happens, kill the "cat" process.  Then attach the mon.=
out
file to the bug report.

There may be additional debugging options available in kvm, but I don't know
what they are.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

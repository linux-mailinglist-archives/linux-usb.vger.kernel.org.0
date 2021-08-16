Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6F73ED8C9
	for <lists+linux-usb@lfdr.de>; Mon, 16 Aug 2021 16:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhHPORL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Aug 2021 10:17:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:43806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232133AbhHPORI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Aug 2021 10:17:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D6E7061165
        for <linux-usb@vger.kernel.org>; Mon, 16 Aug 2021 14:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629123396;
        bh=pkBJZSsxE9XMne4J77Y+y37IKVHD0Zz8s2JbLvcavPQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fwqM3s2O1E1O7R4ZN8cC8QllddAyyMZ1puymkvIqfgl1HWMDTQmhwdnnQSFj4ckco
         uUGtGDULab6sIFJFE7X5jWmKk83u3HqdCUAed/fLg9O/tyjnBmaqZXvc/+oUnPHHFD
         WB37u6Q2uQKeQW1/MkupniGUl3vYUas3cGh7dxfcCxQs6A0gCka8hT/Mi9DGwO19Zv
         EOCJbxfbQ9nrY7rrA7IOa0ve34excdWwrXmtFc+YAKrcLmJ5fnRuDOiZDSnpEX/uyg
         Wj48uRR5NTrqU5BAvgziqYWO3CZIz1yVaanK6t/O7Xe0ZRLsJ/rYZEySk9PI415cqt
         QzSRhcHqiH+XQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C1EBD60FDA; Mon, 16 Aug 2021 14:16:36 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Mon, 16 Aug 2021 14:16:36 +0000
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
Message-ID: <bug-214021-208809-qDFe7IqO0B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #7 from Alan Stern (stern@rowland.harvard.edu) ---
This means the problem is somewhere below xhci_alloc_dev.  In other words, =
the
problem is in the xhci-hcd driver, and it has no connection to the commit y=
ou
found.  Except perhaps that increasing the time delay manages to avoid the =
bug
somehow.

You can try enabling dynamic debugging for xhci-hcd.  On the boot command l=
ine,
add:

   dyndbg=3D"module xhci_hcd =3Dp"

and see what shows up in the dmesg log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

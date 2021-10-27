Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6184C43D212
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 22:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243782AbhJ0UJb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 16:09:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:53164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243780AbhJ0UJb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 Oct 2021 16:09:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 490BD60234
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 20:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635365225;
        bh=B1eZ69MsOiOAuAPow04jDcULkGoMBXUEI7Fwll5ip5A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rg8X3xwhE+r6UdU2XWIlmFrAi+niw41cl6xqkZpM9Wa9n+myDM/+yBkGO4dbIFokG
         CTM2pbMAPAxzt6E2Frt+kDCbVboFb0GTd21B34ZQTYX4pHPqOQtdf2Js824GJga3yX
         rExTPp0HLz1C/O1G+uhJg+PmQ+SlCCkCDvdhITDoB2nXgVOl1HaRyLSWshJhvbp+QM
         +NkFq5BFyHR43KhuxUw3iMT1qj5GmG/fQKpna2mKLRTxkLUYmfKu5csHMnTl0mr2Wr
         QSJSN35rrDLAPB3BLFI2tufVPCrKqkaOaC0Yu7pmNhdVIEUoaWW0sD47fppcz0lGT2
         fVIOdSCguLlow==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 44EA5610FA; Wed, 27 Oct 2021 20:07:05 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Wed, 27 Oct 2021 20:07:05 +0000
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
Message-ID: <bug-214789-208809-Oby9vMj35S@https.bugzilla.kernel.org/>
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

--- Comment #15 from Alan Stern (stern@rowland.harvard.edu) ---
Can you try testing some kernel versions between 5.3 and 5.11 to see exactl=
y at
what point the problem was introduced?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

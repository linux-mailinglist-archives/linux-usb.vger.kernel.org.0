Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0176E43672E
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 18:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhJUQEw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 12:04:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:34550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229702AbhJUQEw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Oct 2021 12:04:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EFD10611BD
        for <linux-usb@vger.kernel.org>; Thu, 21 Oct 2021 16:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634832156;
        bh=8JTS5abruLse0WzsMur480IoIuVgEv/5pRiyrxESzqg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VbpU49aybudcQKMDFegsHXlyYBxYszp4QRMXuNeEmmyF/jGAZcmTYZDSr9KQ7TUV+
         K6bn89Yzt6gyz5C8xVRDnlblGEtSPpcmYoAoZ0TvaLG36ULrG1feHgUXW2465aBHoc
         VMSEaofWhZmgn2ucJ78TKMj7LpmY60wZWkjg2gyAiqqyPsJgSXx0s6VNMNLWrGCijc
         +M/VRMsU9+LYn4PIC4ex1aD36QnaPY0ERC6rvuxjgyBiiLdngx+DUhDqtVVET/LtuI
         4HwHedb7vwl19pxoqKYL0SRxqmVMc4pgASzcFIyHN9wGaZTE3GHqR8MjAuP89mgx2l
         pdlYMIzAgGJHA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id ED50260CA4; Thu, 21 Oct 2021 16:02:35 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Thu, 21 Oct 2021 16:02:35 +0000
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
Message-ID: <bug-214789-208809-XgYBj0jsaw@https.bugzilla.kernel.org/>
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

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
Can you provide more information about exactly what goes wrong?  And why sh=
ared
IRQs should make any difference?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

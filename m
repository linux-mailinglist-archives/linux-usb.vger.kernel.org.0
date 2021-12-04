Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1111468106
	for <lists+linux-usb@lfdr.de>; Sat,  4 Dec 2021 01:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359687AbhLDAJQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Dec 2021 19:09:16 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:51144 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359660AbhLDAJP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Dec 2021 19:09:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 379B3B829BE
        for <linux-usb@vger.kernel.org>; Sat,  4 Dec 2021 00:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D256DC339E2
        for <linux-usb@vger.kernel.org>; Sat,  4 Dec 2021 00:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638576348;
        bh=n1hdefGRjqK45R9CN0qhI7MqsEbbC2LirYqKEHSbPi8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NVV33PE+i8sqfxtM7Jl34BknxJSEOhpbZVdNSxEI7i1YNfGw+edmLCimEoptIdIwR
         O+J5zhcANAj0OUo1fjyo6GC0woFHl9Z8rv3rAh1Oc5Kki2e4+TsK7+iEqRiemgzdBo
         d/wrB9AX9eRpZouH/6eV0L0LCEDNL1HLVsAm2X7tj1HtDDdsJXg3IOpYrmP96pB8TL
         0EKliAu5T1ldD1DxSuLhYAj+f72BE8yQXm94JMNtJTnESHEFWmen9bmDA2Uqhaqq6w
         br7WdHOUmqnKcfC0C87Z6I5iyMIzS0zFLZfpJdROY4TGxhxVmp4vNPUJTm1fMWPRee
         F2G72A0S/GUmA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A721560EE6; Sat,  4 Dec 2021 00:05:48 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Sat, 04 Dec 2021 00:05:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: seanvk.dev@oregontracks.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214789-208809-qmtrdaTl3e@https.bugzilla.kernel.org/>
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

--- Comment #27 from Sean V Kelley (seanvk.dev@oregontracks.org) ---
It just seems like I'm with this particular vendor card and out of tree dri=
ver,
there is some sort of expectation that the IRQ will always be routed to the
ICH/PCH, which the quirk is attempting to prevent to avoid disabling valid
interrupts with the rerouting.  Hence the question on MSI.

Sean

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

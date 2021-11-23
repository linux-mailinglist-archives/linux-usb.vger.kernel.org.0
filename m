Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0DF45991C
	for <lists+linux-usb@lfdr.de>; Tue, 23 Nov 2021 01:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbhKWAXc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Nov 2021 19:23:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:47056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229617AbhKWAXb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Nov 2021 19:23:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7A78460C4B
        for <linux-usb@vger.kernel.org>; Tue, 23 Nov 2021 00:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637626824;
        bh=B5moQ4+358KWZ6kteP6bLx7Jgi6hT4qjzWJK/sEDyfg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eK+y4VdBD9eOPq8SdUEV4FnEPqnQ4IrAdn3CloOo9WmNkkm5XSLOmCxOSR5Lxct4A
         daMNbLEnCbtg8i8KfRCT1cS4pDTEDoRqy+twgcWxb+5gZyY5Jh1Y3WYNppJuMYEsmW
         MGoM1OpQvXQrclJQevzzLEt6VQJPT0iZYsPjP3epkfiKdTAJdeC3Uh5dCQ95uDtLnm
         FKDT9+Y9arvx9/3PTAjOa16vBpKJoqDRAJiEwwg5brHim08RO+MW5gtvJ35cWG44fV
         qx2auH7rG1CDaWvSWfheU1XqKyNM4BNpP7J2llDNQEf/Ig338inry953s2ChzbWKmS
         dLlf7S4OYeXUg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 64CDF60F11; Tue, 23 Nov 2021 00:20:24 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215095] USB ehci error -110 and soft lockup on kernel 5.15.4 as
 kvm guest
Date:   Tue, 23 Nov 2021 00:20:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wangyugui@e16-tech.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215095-208809-dycmfVkcTb@https.bugzilla.kernel.org/>
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

--- Comment #4 from wangyugui@e16-tech.com (wangyugui@e16-tech.com) ---
there are 2 problems.
1) USB ehci error -110(timeout)
  this is hard to happen on the bare metal.
2) soft lockup after USB ehci error -110

In fact, we do not care about 1) on KVM, because the USB device on KVM is n=
ot
really used.

maybe a problem of KVM, maybe a problem of USB. difficult to troubleshoot.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA3A43BF46
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 04:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237756AbhJ0CIF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 22:08:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:51400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237728AbhJ0CIE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Oct 2021 22:08:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 06D29610A6
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 02:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635300340;
        bh=Ut5apj9prdVUAKLJdRPvhPWEZ5AFZdCuU7Pbh73Hk7Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JLfPmM26dQ9rpa/4Y8XYuzjJqQpyLgfbDUjtATs3ltkcN23eDvEI96PgZtQqXqY1S
         yyH34K08vEiQ9MpJmKRbM4H7hcg277hAF4pssvoz3MdFfQkKckaDpQm6Rf7sRB9ImB
         2xafV4OYaDG1esEnA9p7/oXP3owcej9glh1jxGfW/yK20uAa4wYj0R8eY/8/vDgpnO
         PrHZzZ4lLLQzR4tUQnxgauyNqHa5mIiUUyhA6ODTnEWHnnfxf4zYOzFG0aK8YZCfoU
         5yC+nGyPzuvv26/ZF0Mki/f0HAeVDyiwo/cNoDw6OnAYujfGmpghNAFvB2O5JcOi1u
         9qI5BACHJ5adA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id E978A60EBD; Wed, 27 Oct 2021 02:05:39 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Wed, 27 Oct 2021 02:05:39 +0000
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
Message-ID: <bug-214789-208809-ZEvoJ64dwy@https.bugzilla.kernel.org/>
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

--- Comment #13 from Alan Stern (stern@rowland.harvard.edu) ---
What does the kernel log from a recent kernel say about UHCI?  If it is pre=
sent
in the older kernel then it should still show up in the recent kernel.

And if the problem is related to uhci-hcd, why would patching ehci-hcd make=
 it
go away?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

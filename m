Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F163993F3
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 21:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhFBTx0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 15:53:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:44166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229724AbhFBTxZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 15:53:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DEBA361182
        for <linux-usb@vger.kernel.org>; Wed,  2 Jun 2021 19:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622663501;
        bh=GH2H3bXDPNowCMiWNTZ5Sd9elPKsnWbacqs22L/+l/o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lww+rDMT/Bv8YyARk9mOi2GkWq3gFBQOOC5PZMk4IxmDHsoM4FFUUF0GNqgvPxBCr
         uAfzaC5bQgztQVvG6GuJ663KNz36MD10X8M7U8vstouoacEHWj40jRkLajdBuwPgDI
         41GnpJ54a0cHJsxPLcdgJ/aiG/JYeIHY/F1NmCBhdwlyTvFKu68Vu5SYCgzoMFMCiK
         5RKS1n9i5VhQt082doqfT5B5Mzf/rLyNtSaErD/2hxmeNoVu6gSkT5mYVP8romL/9q
         uCQvMrh87pn9n10RD4S6UTIDWZvuIM2Aza0kpRlU+W4oocSvWXXu11jsf8XSiA6FvU
         +nmpsh85fmTXg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id CD94961167; Wed,  2 Jun 2021 19:51:41 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Wed, 02 Jun 2021 19:51:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaffa225man@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212955-208809-GLxOOV5Fzk@https.bugzilla.kernel.org/>
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

--- Comment #15 from Lucas Endres (jaffa225man@gmail.com) ---
(In reply to Lucas Endres from comment #14)
> Reverting each commit previously tested (logged) and
> retesting sounds even more time consuming, but if you don't mind waiting =
and
> think it's necessary, I will continue this endeavor, and eventually get b=
ack
> to you.

Tonight, before I attempt anything that major, I'll build the commit just
before 51e6f07cb12e to see if it's working (although it probably already was
tested during one of the aforesaid bisect iterations).

Hopefully, that will be enough to prove that the glitch-causing commit was
51e6f07cb12e, or prove to me that you're right and I'll have to spend many =
more
days at this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

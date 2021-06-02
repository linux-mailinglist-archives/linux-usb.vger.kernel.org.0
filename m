Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E39D398000
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 06:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhFBEJX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 00:09:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229571AbhFBEJW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 00:09:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6D705613BE
        for <linux-usb@vger.kernel.org>; Wed,  2 Jun 2021 04:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622606860;
        bh=niH97ihOquy7liZUMgceWi8LZABh2aChqs6sN9na82E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UbORtlWfhJOxxm/I06NqTMyAwOQaYWXGfq3pqXhcEVABB2Uw8k3QQRUS+U/PKYTTq
         aWuuKBmTysUBM6LrMYdv7PW8GyJzoQZVHDSt9xFFGvpyjqcu8ioClnnnCKRP0mpKJ7
         Q+RBdC4vxT3ePKG7vIfH6gf3m+FEARwf2hF/urwasRIrZ1ZxVEyRLTld4ud2kfUBxT
         POM/jFZPxefsBhy872zr2QvER9GBdzBZTbgvXbYyby4FdxVPTO0P3FiDb1EbJl5d5d
         7ujBuqRHDgYyHedjLZhOY4RLFm2tJK2ewtbz0HdFZfLkkAg7cRWrzg3jbwMSWTCg1Y
         /bRMNiRActLmw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 59E8B61153; Wed,  2 Jun 2021 04:07:40 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Wed, 02 Jun 2021 04:07:40 +0000
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
Message-ID: <bug-212955-208809-QrSqF3an1C@https.bugzilla.kernel.org/>
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

--- Comment #11 from Lucas Endres (jaffa225man@gmail.com) ---
(In reply to Lucas Endres from comment #10)
> In the next few days I hope to have time to attempt bisection to get to t=
he
> bottom of it all.

Sorry it took me so long (please let me know if it's been noticed and fixed
already), but I finally have gotten through all the bisects to reveal this
commit (I don't think it's what anyone was expecting):

51e6f07cb12e50bfc71181bd08bad5f0a9b5e9e2 is the first bad commit
commit 51e6f07cb12e50bfc71181bd08bad5f0a9b5e9e2
Merge: 5e321ded30 6b3788e5fb
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue May 4 10:48:05 2021 -0700

    Merge tag 'm68knommu-for-v5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu

    Pull m68knommu updates from Greg Ungerer:

     - a fix for interrupt number range checking for the ColdFire SIMR
       interrupt controller.

     - changes for the binfmt_flat binary loader to allow RISC-V nommu
       support it needs to be able to accept flat binaries that have no gap
       between the text and data sections.

    * tag 'm68knommu-for-v5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu:
      m68k: coldfire: fix irq ranges
      riscv: Disable data start offset in flat binaries
      binfmt_flat: allow not offsetting data start

 arch/m68k/coldfire/intc-simr.c | 12 ++++++------
 arch/riscv/Kconfig             |  1 +
 fs/Kconfig.binfmt              |  3 +++
 fs/binfmt_flat.c               | 18 +++++++++++++-----
 4 files changed, 23 insertions(+), 11 deletions(-)


Thanks for any suggestions I may be needing to test,

  Lucas

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

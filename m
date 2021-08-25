Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0E03F7044
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 09:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238654AbhHYHWQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 03:22:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:59842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238606AbhHYHWP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 03:22:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EC5196113A
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 07:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629876084;
        bh=lIW8Q94eUgnFG5hp3EpdaC/cX4GZmNEybqO5wAn0KWw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cbYM7x7zzYd16HNvV9Bw7ZD8OMvFuUG42vjCjmK1G2l+PTVOmhOYidjJWPQuerVot
         cjLzgLzEqDrF8ThjR3Asr1tuhZS8VIu39GjUIHNM8z51o1c1tX4Qf7iOck9tG5SpFg
         sFdIsp14FFPLcagMbOlErRs6qPrgPfQPBbVoWyMd+IkwKvARb7Mt8lmd9lCPSob1l2
         0UeHVSIZR2vGSKqCAkQ1Wx5trEZJiE005IA0ILXr+h7X8LQCAU34w1ZkCB57055L4f
         7IbgWLWaitsYLIWML6g1+nVLX1OFUpL+80h7KlPwH4DGtXDkbUdDt8mpJKkTrJOQwO
         oqcVuZFEDF1qQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id E396561001; Wed, 25 Aug 2021 07:21:23 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214131] ch341 communication problem
Date:   Wed, 25 Aug 2021 07:21:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214131-208809-x4hyaFPzLj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214131-208809@https.bugzilla.kernel.org/>
References: <bug-214131-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214131

--- Comment #8 from Johan Hovold (johan@kernel.org) ---
For the record, I've applied the revert now and it should be backported
to the stable trees shortly:

=20=20=20=20=20=20=20
https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit=
/?h=3Dusb-linus&id=3Ddf7b16d1c00ecb3da3a30c999cdb39f273c99a2f

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

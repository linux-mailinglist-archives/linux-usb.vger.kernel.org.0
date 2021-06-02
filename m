Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC9E398FB7
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 18:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhFBQRh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 12:17:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:54032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229541AbhFBQRg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 12:17:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8C7316192E
        for <linux-usb@vger.kernel.org>; Wed,  2 Jun 2021 16:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622650553;
        bh=0UtQSYID/XxUjagECfN9de/1wmUvdcW8a0LgF4T/LtI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=W+8/+Y/X6hN5xgeWy602FHLBD5PlBSpGZ591EobQSWwpXlkFS9SbhNVo/scJGlOCW
         56YZB1EnvIqFh2kOzObtbOumYZS6ZRWIlj8zE2Fv5/DTFk5FJPwCD1fVFf5FxQ5OFo
         ixT6SsjctFKpi6VrlhJuUih/Dk8iosRKcPcy/x+KdaOW4fq2eWxB8PYi799HaMQsXM
         5UVmi+ZT4O5DL7Um3ZSSwEy67iJmc6RzgqRimWSsLtueEqN8xGadKlSYnSJtvXvrRk
         1IguPjnDA9WFR3ovys/SFBf0TDK0FU0C2fedICCyViNlg6lRh55O8x5NnZTDTfI363
         OTmMEPmPW60qQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7CC6061167; Wed,  2 Jun 2021 16:15:53 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Wed, 02 Jun 2021 16:15:53 +0000
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
Message-ID: <bug-212955-208809-ND37ExSOL5@https.bugzilla.kernel.org/>
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

--- Comment #13 from Alan Stern (stern@rowland.harvard.edu) ---
THat commit you found, 51e6f07cb12e, cannot be the real culprit.  Merge com=
mits
don't change any code (as a general rule).  Something must have gone wrong =
with
the bisection procedure.

The way to test the result of a bisection is: First, check out the commit t=
hat
the bisection identified, build it and boot that kernel, and verify that the
problem occurs.  Second, check out the commit's parent (or revert the commi=
t),
build and boot the resulting kernel, and verify that the problem does not
occur.

One thing you could do is get a list of commits affecting the snd-ua101 dri=
ver
and try checking out and testing various ones, to find the first commit whi=
ch
exhibits the problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

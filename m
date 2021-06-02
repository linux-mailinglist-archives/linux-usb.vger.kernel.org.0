Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD98339941D
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 22:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhFBUBz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 16:01:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:45728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229489AbhFBUBy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 16:01:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B66E4610A8
        for <linux-usb@vger.kernel.org>; Wed,  2 Jun 2021 20:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622664010;
        bh=i36VIQO1IGPx4zjYHrXX5MHsqXSUwZIk/uSQRMzeopU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Mye+OdonAPRhW9msIMTSaGLKZrkt22pkRleCY9hU2SIs/MXMqbca8jFhMaMFGKp3B
         xu5K0Xt4ALyt+iej6m1oPfp5GAooYwVnD/SnMvuqFpHBipO8PQHoZmk6HSNiMl3eaX
         pqqVAngW+buTb8ayykn1UGQIKRLkqpJ4yvJuXvdJ0M2EgPYjhh1Me2+3fVL+azlV1T
         mZigFD4oTxJhlPU9Dk25xurZwisTXiVc+GOj7BF4PrYm9bPyYARGsLqmRrxSorVpYJ
         g8xN9GJpiW4oqEmYajGlZSIQa+mJ03B2cLToxVSmw1fatcwelbNjzufPL65wDyTVFG
         v/YnoEIP1WyhQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 9D63361167; Wed,  2 Jun 2021 20:00:10 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Wed, 02 Jun 2021 20:00:10 +0000
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
Message-ID: <bug-212955-208809-G5MPulN5bl@https.bugzilla.kernel.org/>
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

--- Comment #17 from Lucas Endres (jaffa225man@gmail.com) ---
(In reply to Alan Stern from comment #16)
> You do not have to go through that time-consuming procedure (checking out
> and reverting) for every commit in the bisection process.  Those
> instructions I gave you were just for verifying that the final commit fou=
nd
> by the bisection was indeed the one causing the problem.

Okay, that will save my sanity, thanks for the clarification. :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

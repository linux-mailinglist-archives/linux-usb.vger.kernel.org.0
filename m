Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4FA3C4FE4
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 12:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343769AbhGLH2t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 03:28:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:36898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245618AbhGLH1R (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Jul 2021 03:27:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AA02161928
        for <linux-usb@vger.kernel.org>; Mon, 12 Jul 2021 07:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626074617;
        bh=HUmtDS4YXwA+YKt8lSqRGz1z27KEszWcJT0CmWNFqT4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=blDK1yXuq0L6z1X9BseUO5v2KhwFbsrsURDGnjqRiOLHn9+E4PPFd6qdkWpvGKqye
         ndVdLoVb3WFNqD422ZrvVJwsf2VsrrcUwhXnFWsPhRAoCnAWjYjfLLKWtoBrM8MlG3
         Uuhul7VlcQZmLi93x5kx2C6pNSbJEI7tqMcREFhCPLhMweJjQa0nH4QlFobcDTtFZa
         oKACDhI+29Y53YRB/xRHVFOt57FG0/q6EN2FVeD45tUslDkqQA/VCXVQPtV/lz7yFV
         RAZWrZ6j+S9G6dbtU+V31eC0F100N5WdozQWziXCmY90Ie5B4llicp1Oj9VxMDzdBm
         GSJ9IAkDenARA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A38F4611AE; Mon, 12 Jul 2021 07:23:37 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Mon, 12 Jul 2021 07:23:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maniette@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210425-208809-AI0xg1Bg9F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

Maniette (maniette@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |maniette@gmail.com

--- Comment #4 from Maniette (maniette@gmail.com) ---
I have the issue on a Panasonic CF-MX4.Running XFCE on Debian. When unplugg=
ing,
no prooblem. When plugging back the power cord, keyboard in not more
responsive, nor the mouse. The only possiblr action is to try switching off.
Then I have the shutdown pop-up, where I am allowed to click confirmation f=
or
shutdown or reboot. That is a serious issue.=20

Release        =3D Debian GNU/Linux 10 (buster)
Kernel         =3D 4.19.0-17-amd64 #1 SMP Debian 4.19.194-2 (2021-06-21) x8=
6_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

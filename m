Return-Path: <linux-usb+bounces-246-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0335C7A3196
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 19:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E74901C20935
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 17:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C101BDC5;
	Sat, 16 Sep 2023 17:14:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4778414264
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 17:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DED5FC433C9
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694884482;
	bh=q07/sGTdBFDzNNhvYTWa5ZoFKzeuegoA93c3kpcDiGY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OYkED2jet8RE1kvoNrjPUPTuzW9FBPFCNlh5YnFLWoRRQNp4vXBhvAFpdHNmO/FVA
	 1Wk7b1KiAASxbnPzwHtKwiO70R39f8qZPjOxHDkNu6lmNPzzYzj+dfTpwg/5aiqYxD
	 s9T5hMXHiPS0pkYotJ2rD9dKLx2009iJIFyZnnyDiyoOAVKMDBFZXeWeE7+EW6Fybm
	 j0arZ5J+5U69RCkldj5A3ZECHCkUI71S5mQ931Z+ggTWiazTMrNm+2VT+fJpPAptYY
	 2LKFd87K82vGaQMnVHNUhuJctKdNe0k330KbyUCEnmUHYcnUhypIJIBdfhRQBBixXB
	 wfiSh3tT03zNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C65F6C53BD4; Sat, 16 Sep 2023 17:14:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217915] System fails to resume correctly after Thunderbolt dock
 disconnected while sleeping
Date: Sat, 16 Sep 2023 17:14:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217915-208809-S1Ykd02od4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217915-208809@https.bugzilla.kernel.org/>
References: <bug-217915-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D217915

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #6 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Since you've already identified two relatively close targets of 6.3.9 to 6.=
4.1
would you be able to bisect between?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


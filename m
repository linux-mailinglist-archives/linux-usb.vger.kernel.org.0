Return-Path: <linux-usb+bounces-2490-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D1E7E0422
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 15:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E027281E46
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 14:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F6218643;
	Fri,  3 Nov 2023 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VA0y+yC6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100991862F
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 14:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98FB4C433C9
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699020056;
	bh=4TYXNdEOiKmXTikP/jSjHp2rGMeXMq+1tO1RrzYkwdU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VA0y+yC6q/ERDmQaavWB9gxNrGMTAWbUMUG+ATRVT5x55jI/a5AMb9tRiOG1gG8rw
	 e/WoGdmGR7Xiv/LbtVQVtW0oUCsQo0H+GVOJrxQFp5zCjQh9TsiUh4cVy3nr36zUSz
	 atTC+8TvZC1/W91BwrsfVdGyye6boGDWncZLk3+6rMGN0uIOoS6E6X71D8CT9HSWez
	 5b1OVICtuXP4N6Z4Sh9zhflJe4U3QLanlK6q3ImeHpoM3RAW7MxvWOMx7CcFJi3b+j
	 GlnkASc01DwvQTGpmdPqJyD+XoKTRBZAwrVgMLEpMDXNb1CFpqzJxOzvxWJMfmmxgn
	 uov4qFjGA4aBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 80CFBC4332E; Fri,  3 Nov 2023 14:00:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218093] Keyboard will not register any input after using
 certain FN-Combos
Date: Fri, 03 Nov 2023 14:00:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bagasdotme@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218093-208809-nIL9IRvYix@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218093-208809@https.bugzilla.kernel.org/>
References: <bug-218093-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218093

Bagas Sanjaya (bagasdotme@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bagasdotme@gmail.com

--- Comment #1 from Bagas Sanjaya (bagasdotme@gmail.com) ---
(In reply to Totallyreal Name from comment #0)
> MSI B550 A-Pro Motherboard
> Sharkoon SGK3 Keyboard
>=20
> I pretty much tried all Kernels. The Issue is always the same:
>=20
> When pressing a FN-Combo for the Keyboard-LEDs in my Case FN+=3D. The key=
board
> might not be able to send any more input. "Normal" Combos like using the =
FN
> key to increase or decrease  the Volume like FN+F2/F3 will not cause this
> issue.=20
> When checking with tools like evtest i noticed that sometimes no release
> command of the keyboard is received and it spams the Terminal while no mo=
re
> other input is recognized. Connecting the Keyboard to a USB3 Port (instead
> of the USB "Keyboard Port") the keyboard stays responsive though you'll
> still see the "terminal spam" caused by no release event.
>=20

Where is the output? And what device do you have this issue with?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


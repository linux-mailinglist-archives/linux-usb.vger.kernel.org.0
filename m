Return-Path: <linux-usb+bounces-27508-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 722C4B427AB
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 19:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37C505610F2
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 17:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E972A320A31;
	Wed,  3 Sep 2025 17:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9EMsSQw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C5F320A12
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 17:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756919563; cv=none; b=fS6CtUdHm9401w51+Y4XfYSnyakO+XJuXQcnEyA8e0hyyvQsdAsE1cBXgtnezGvElQH7qqVq8WK3AR+t+F7JcflEfzQmGtaqv+eDxWtAomyH4KtIGbc/LCNiay+JxIArZKpUHMKMK68/CSQ2m/PIoSlIYZgTxeePcgYGMatcrmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756919563; c=relaxed/simple;
	bh=/q9SkOqaK6ehldBVtOBIkbMGm9/PabZonQhjkg9Oi/I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jfDV9umn2HyqDn7tOwkbPBbqgdzxwQmtUz135wKwlaot2On7bEL1atnDkFcTQv8jcSUURZPVRWGO4AES0kmKgvACLib/EHWp/XgPW05LsHMUOmcOYjqUh8B+Ode6ijcrwPOfcdSFYeFGFSYX0P4PXXQqNF6LBXx/+6kOk3Bn7XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9EMsSQw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 524E9C4CEF0
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 17:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756919563;
	bh=/q9SkOqaK6ehldBVtOBIkbMGm9/PabZonQhjkg9Oi/I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=G9EMsSQwTGVRU5qgw1kXUqN1WGMrGovlepcJNztqjXrMF76AxSGB2YVwwTO/ZbBvc
	 CkLczFve/MVq+xa6CqhURV752E761dq+OP8AajxU1OXAQjPHiB9AuVYiM8RadeKbvA
	 9ljrEsi5+idA/KquRY3HwHJXM0kF2ZdNYCKfoU5omzPzjC8PrQofZVKOm9kcscPg6l
	 MWmob7bw6xU3Nu6Zxmdh7LxofxuVt/lzoavxxhIH46Xzta1qRSm55R54+dX4vEVOSk
	 ZXK3rs+oRcqoi3vBKTzfq8Dkgr6n+NNi1onyBRmd39anqTgBPcy8++JUq7Tk1AAf97
	 BGPkjf/BSrdKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40C16C41613; Wed,  3 Sep 2025 17:12:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 17:12:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-MEXAVMD9J0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #28 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Michael, Mathias: I concur that the emb-qm77 machine has some sort of
hardware/BIOS bug. It does not matter what type of device is plugged into a=
 USB
3.0 port, that device will always disconnect/reconnect during resume from
suspend and there will always be some kernel log entry related to overcurre=
nt.
My feeling is that there is no actual overcurrent and that the overcurrent
detection mechanism is faulty. To me, the overcurrent detection is a
red-herring, it would be nice to keep the device stack together even if the=
re
is a hardware bug. I think one salient point is that I personally own two
entirely different machines that both would benefit from the linux USB stack
keeping the device number the same across a suspend/resume related
disconnect/reconnect. If I have two such machines, statistically it is like=
ly
that there are quite a few such machines out there. In fact, there may alre=
ady
be another such machine in my collection, I just don't know it yet.

I will also say that it may be nicer/easier to keep the disconnect/reconnect
from happening, but my feeling just now is that that approach would likely =
be
more machine specific. What I'm trying to say is that allowing
disconnect/reconnect to happen and keeping port context to allow the device
number to remain unchanged may be a more general solution. It would be nice=
 to
formulate a solution that would work across all members of the class of
disconnect/reconnects that occur for some reason other than physical
unplug/replug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-23676-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29775AA8637
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 13:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F5CB3BC20A
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 11:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BF81A5B87;
	Sun,  4 May 2025 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqMBzAkW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB93BE46
	for <linux-usb@vger.kernel.org>; Sun,  4 May 2025 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746358816; cv=none; b=bACSbyORuqnNLzp0t0d5HvxX3JPyaqLX227bl1RGzlvfdf3PTXgjAT2LvqAWU6uJD0K7yhPi7MLuf15BiAtlKVVdkL4BZh40eWUFrkCxGPUHFYKz3kQbMnmDLJLrhbFgVBRKcXVXi/SYOmzpV+cj7Yn2/7i5GSNGgZ+85nQZ/OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746358816; c=relaxed/simple;
	bh=ChMKEnZiEfDesiG7EMoEu7AnWHVGbkuJKf8T3nRcRKk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aUeaavreujMIPqrrZBFTkxHUZPW2SSC0KGm4R31yhvCiGlXJiS16d/jGDuhYItzwODkHoNY8KPjy7G47xdLN6FJvoDpgLB7T24YapmVtvP2C5u8F2Us19pe9gEXj2w1AsdQE0X37Ocidu38qYD0cSHkiNzq8GgYdhwnbQBHJoUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqMBzAkW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6726C4CEE7
	for <linux-usb@vger.kernel.org>; Sun,  4 May 2025 11:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746358815;
	bh=ChMKEnZiEfDesiG7EMoEu7AnWHVGbkuJKf8T3nRcRKk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uqMBzAkWuTduu29c7L0BznTLmb2cE1K2KTCg9p+LuMp+Ko/AAP8tz0IYj6w8vlnIp
	 iT4iM9ndIuZnwOMjhPqf+MHlTM9AWXANDaizS3PmCCmKnpTno6AOCClylkN/aq9qWJ
	 yaOyvI5QwwesbLH5tH0djGOlaFipnSHWedVwe7SwNGItCIRVJ/b2bwszKEVXoHHCav
	 U1UbKQ7Fph9NcviEACRWnGATZIqbKui7ctaEoLaohq+Deb3EzalPdS0V+qOMi6vjnF
	 8akLyVhzB/C6pFS1IQbdV+HX+j064qM38U89TQXdU6PJ3JJRxBPSjpJ9oC7qf7fM8C
	 bHsHVE27bgIog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CB15CC41614; Sun,  4 May 2025 11:40:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sun, 04 May 2025 11:40:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-BT7GfO7By0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #31 from Claudio Wunder (cwunder@gnome.org) ---
Noted. I will do the following:

- Update the System (as I rollbacked to 6.13.9; 6.14.3/6.14.4 seem to be mo=
re
unstable (the bug occurs consistently way more often)
- Mount debugfs
- Run your script and keep it running
- Wait for a crash; Add attachments here (only now noticed I can add
attachments here)
- Then try the change webcam and whatnot to different Hub
- Wait for another crash

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


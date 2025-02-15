Return-Path: <linux-usb+bounces-20686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3911A37095
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 21:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B4103B0C53
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 20:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53811EA7DA;
	Sat, 15 Feb 2025 20:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uomoSzJa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E2B13DDAE
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 20:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739651133; cv=none; b=eJyz9j+mqSEBq31TV+xJd9SFxmKqO0s7Bt7ELYHGfTn5XQmAzLAKpStMZIPPkfOmMeKWpuFFnHvgp/90psSSyJ9bJlR41JgW+9X0uxFd5tc9Z5E3BNSr2NZbJ6/mvCY5dazxHPTxg1+VPW9EEmeeL6mk8jjQGFDhsvHqOvC1P3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739651133; c=relaxed/simple;
	bh=mQJnpFkvanRNBiYzYJCmIUlAz02ifNQ3caQthb2zNLg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nHOYG6nFe4okZVemYkdtwGZC6UB23VLJ8LuYnVia/LF9DRcjxIxyfQKJmlF6kaf5fnjPdMQeK660vfYwwt29nCrCAA038xv+KypcpzMo/2Z0sZZQiCqo43xz+tHH5UOeErGyV+5MHXMNjnabFgHT+EMplpOFZLQw1KDsNmcd0Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uomoSzJa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B934EC4CEE4
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 20:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739651132;
	bh=mQJnpFkvanRNBiYzYJCmIUlAz02ifNQ3caQthb2zNLg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uomoSzJaMIJo6AW+maCXpCB0Lp5VMDNzbPFysj3w/lFpsp2G6HHMTsXe2nvE6NpDx
	 Sy7RRQdJF1lppYO3VEK3X9qBRCYkM0qik9LjDs8uBLeNqzpSWR06B0KrXPz7GFLztk
	 sEGzIM0LQZkKVVhaxlxqO34Tpn4xlvUu5sLGKI/A9t7DR1KHWaiC9gm+cPxSmHj7PZ
	 HGkqZ/Sv5N7ZlEa8n50C4BQ+Y//Oxi9FlXFPnRGXH93fUNrTTjOue9+j88RO6CFAJ5
	 vzV+ewYf6MQUKdLsC1+RTw7XQ3Doh/W/8+DYfT5gsgnN8CphrX+TXGhbAN86mhqbya
	 mCJvjecjGE6KA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9E4EFC41606; Sat, 15 Feb 2025 20:25:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Sat, 15 Feb 2025 20:25:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219773-208809-1o0dwYlAcu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #13 from Frederic Bezies (fredbezies@gmail.com) ---
(In reply to Alan Stern from comment #12)
[...]
>=20
> When you say the SSD was powered by the motherboard, do you mean there wa=
s a
> separate connection to the motherboard (not part of the USB cable) provid=
ing
> power for the drive?  Or do you mean that the drive received its power ov=
er
> the USB cable, which was plugged into the motherboard?

No separate connection. The power was received through the USB cable.

[...]
>=20
> I admit there's a good chance that this is not the explanation for your
> problems.  But it might be.  It would explain why the drive works with ot=
her
> computers but not with yours.

It could be an answer to my problem, even if I doubt it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


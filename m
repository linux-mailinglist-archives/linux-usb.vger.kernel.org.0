Return-Path: <linux-usb+bounces-7014-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F638624A6
	for <lists+linux-usb@lfdr.de>; Sat, 24 Feb 2024 12:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C90531C219C7
	for <lists+linux-usb@lfdr.de>; Sat, 24 Feb 2024 11:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768EB28E3C;
	Sat, 24 Feb 2024 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jw2YzPkj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39082575E
	for <linux-usb@vger.kernel.org>; Sat, 24 Feb 2024 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708775105; cv=none; b=UhU4lhmgn3Tl9/3QEp5/ys35Luz+g/Owylt/i/6iZLzDCrqJIyAiwdSrAYeI05XAQsI7DNSeERkGHFhVtR2eR/LbyF7zN5sVm97Dqt96aIHC+iNijMGjwdz3EARiUQo51GeeoUkDKlDZ6TJEp3a8opdH47ejjwMb5cqtMC2IrSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708775105; c=relaxed/simple;
	bh=PC63XIho5uk+0atPk+32x/dZhLVOgiaZtKlfk0LSNKg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xyj0doYh4o/ItzJ5cgoQdmV/3d7d19pfWbHlCmEuagwL5Dqq0UkEv0zZBoF55XtX59mVSlCxHwNGgCf78KSF15MS/RJhDY/FR+YdsluIZ+H/EC1KWcwy0+1mpaVPWxtcbb8PXsfvwVPj9hUJlk1mOpg+3wX5au3pRAtp9IgcLCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jw2YzPkj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 722FCC433C7
	for <linux-usb@vger.kernel.org>; Sat, 24 Feb 2024 11:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708775104;
	bh=PC63XIho5uk+0atPk+32x/dZhLVOgiaZtKlfk0LSNKg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Jw2YzPkj4UxmZ3Mfm+wTdZKsZWAcnHDWxMxcmWAOSHBFv084FpK87vC5XDsYaUFVj
	 mJlqUBHvzKMXofGG7Agjw9GJfMmJaKcl6JqW5cfO5Q51F6lWZRm9gGV9VH+0FgWbiT
	 Tw/6C2jlAKrA5zkZIdVfukJKqwkn+JBbIG6RYc1fvDWkIrZj7Q7yICWVYF/2UEHN74
	 r4KFkXuFtKaD6bso3d5ewCcnHpNF2u0I9uBvO8LMABMXKtWm6Nyyfg4/UKCMGMUS0I
	 hLZ902fwM/jmkWcyR+JrGj83gXgPyFLw/1ovDPVnmuGqGrYIA2++vp3ERU4IWwCXw+
	 KHmLw++IJnv1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B7A0C53BC6; Sat, 24 Feb 2024 11:45:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Sat, 24 Feb 2024 11:45:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_file_loc cc
Message-ID: <bug-218525-208809-TpnNZTP8qh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                URL|                            |https://gitlab.freedesktop.
                   |                            |org/drm/amd/-/issues/2885
                 CC|                            |mika.westerberg@linux.intel
                   |                            |.com

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
CC'ing Mika Westerberg as requested by Mario Limonciello.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


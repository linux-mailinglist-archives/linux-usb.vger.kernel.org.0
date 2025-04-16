Return-Path: <linux-usb+bounces-23158-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F35A90A57
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 19:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E3CB16A018
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 17:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED38217736;
	Wed, 16 Apr 2025 17:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6tGNm2w"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2071FB3
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744825392; cv=none; b=ICagktTQwK9xTf3v2dH0MnQpkl91TQJNpmq3hPlb7y/L+AdV4Hg4hI/4KfcQBY9OTV6isnPr2HochlHa0D4yPLApoHMCrJODaJNSi7U4VJA4enhcI1U0OVBnA0oj2ORGHqYP3rF4fZjWvFf1BJOwpcQUMJXNQvS3T+H/d9EMSPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744825392; c=relaxed/simple;
	bh=csVaMlhpBtQQ2uX1pv9AGgNBxuRseqXrxxSJQqaz4N4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pkR1d2Y2LFtrZHwV7JpI0K9WvMJaywV5kn+CYt5Lc7HO2fYcP1CoaOQ/AXwvmceAjZ7pumfeEwfYuDBmpAzAoAkk5ZixO0bArORIE5KNNNFtwj/Pe89+eOTBbjo0PkAkO37Z6gxDrE96xxzb/rrrrsUtPKCRqwkPuLbhX/EMEeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6tGNm2w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7A53C4CEEC
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 17:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744825391;
	bh=csVaMlhpBtQQ2uX1pv9AGgNBxuRseqXrxxSJQqaz4N4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C6tGNm2wKf32zd5Tf9fvJg21694Hqd1bU4LJdpcYhZFHrzxK3FSezRCv2sSxQY4lo
	 0Js816nuYcJgGRldOy4NqpJ30lY70TNeFcYnfr7oixm3wDi7AK5Z+QA0gT/8hsMEi0
	 LJ1TIdRazqI9o8xspG82NUuKe3e8HaqgrdraQ58oTF21u8GEhoh9vCZXHWeDu0qXMU
	 Wyod1dmpaghYdlAOyGpQPN8e2QImK5OEixbynN1n2wkX+iVxZbzwBjWiVy4D3BODRZ
	 L7y/3IVUdL4rjRoXE88YB64yBRsHvy+Ttbi7wV+KA29ROyvKyPsOwCmmIBn3hqvdTJ
	 23U8vLO5hzbeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D5E52C4160E; Wed, 16 Apr 2025 17:43:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 16 Apr 2025 17:43:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-220016-208809-rHePRjOupy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

Steven A. Falco (stevenfalco@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stevenfalco@gmail.com

--- Comment #5 from Steven A. Falco (stevenfalco@gmail.com) ---
Created attachment 307975
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307975&action=3Dedit
Good boot with 6.13 kernel

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-20695-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB87A375AE
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 17:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1A8A3AAA91
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 16:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD5D1B808;
	Sun, 16 Feb 2025 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMp4xLZy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33104199EAD
	for <linux-usb@vger.kernel.org>; Sun, 16 Feb 2025 16:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739723050; cv=none; b=SYuCql1ZEZVIKiBXG4qokCfT8WnTzvG6VW6mbA/75vlgWuLDsFvRaYugHWZ1UhHGIGzmKrHbtUXmtf7bWwXci+kwZGoO3IBQWyxkddySiwa+AZg9AYNQl8RAkDeRH1oo4OO3G+2gFm4H3yV+18V4ZZWDaEVIjcyvIMj611VjdT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739723050; c=relaxed/simple;
	bh=XK56q9uR95FznxzKxZOzTuc9Bu8bxvjg0CeYlEJi9zM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=odtYfvJsjJpGwjiZ4Q/SFsmuf84vZDb80fLgUwg08pDeszvQ8FW0xY4h6IF7rAyzj/tD+HelTbfCXrg+oQEQD/NChe0aB2dAUlh8hscpMXbvM9uUEGzhMHV4zBdYrt8vSBRghb1x78dDgWCz5t9bRWQ4oOc86dnEO1DHGtXLZjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMp4xLZy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7118C4CEE4
	for <linux-usb@vger.kernel.org>; Sun, 16 Feb 2025 16:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739723049;
	bh=XK56q9uR95FznxzKxZOzTuc9Bu8bxvjg0CeYlEJi9zM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mMp4xLZyGshUhEbijZ1HgGQwFg+zGvk7q3TGkstdcFK4VpvgW11e8RwEqi8blfGwX
	 WAHaHTb2zFKoJj30Ws4Yii83/Hsoj8WD8xw4tF7R/vZ3GxpRekTD0dif6VhfoPlET0
	 2kLDWZI5u0p4hT2aaclnmNRsXqE3/pKkYB5UrSOuUFp/af5W2TcbWLQvT83kMSJWiC
	 m6mI4LduxWs75yTzEVzrZ/eeuHSuSO+OGR9cBDWBQvTc4KE58zlb5MOBNi1Y3kPkct
	 7NyjzKMyFY9Lt8Ze6+Hv0NwnAuU0TpQmH5ZTtfxshmAcl1Ck/UR9z3y20vmZmTknf/
	 b8qyZ9wXgcCyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 99A19C41606; Sun, 16 Feb 2025 16:24:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Sun, 16 Feb 2025 16:24:09 +0000
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
Message-ID: <bug-219773-208809-nhHWCRahTV@https.bugzilla.kernel.org/>
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

--- Comment #14 from Frederic Bezies (fredbezies@gmail.com) ---
I made an experience. A friend of mine swapped for a test my nvme with
Archlinux - on my PC - on it by one with MS-Win11. I plugged the SSD in one=
 of
the motherboard USB port and no corruption or data loss occured, plugging /
unplugging it a few times and nothing wrong happened.

So it looks like it is a bug in the USB ports management of my motherboard =
with
linux. I plugged the SSD on one of the USB port on my Pi 4 and access it wi=
th
NFS. No problems at all.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


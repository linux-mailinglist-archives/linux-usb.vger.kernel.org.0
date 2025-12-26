Return-Path: <linux-usb+bounces-31772-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F0ECDEC09
	for <lists+linux-usb@lfdr.de>; Fri, 26 Dec 2025 15:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11664300797B
	for <lists+linux-usb@lfdr.de>; Fri, 26 Dec 2025 14:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDDA1E25F9;
	Fri, 26 Dec 2025 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/nRwwiN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A293B1D86DC
	for <linux-usb@vger.kernel.org>; Fri, 26 Dec 2025 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766758185; cv=none; b=sPQXAfgKIa/wmm/agB3/SH/ktEbeYg5fQJmvMMAkE88oOPfnr2ORKcZ97QB6nDQBvGMUpMt1Y7uv5tSWluk5RktyvuQFVlprwWw+e7wS1vH6GSfG/tIKhc5RrZWP85+ie4ibrV97v4L3se7EYk5SmeDsUW7BnWvZt/iHG5tV9Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766758185; c=relaxed/simple;
	bh=/7pK9PuPq/k766vWUi9DeGf6jFTOvORgg+IwcJb7EgY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=esioB4Sx1FCG6ABuoSRenQhH/lXZqSieisAMz8EMIqvL12v0LKBmgYOAl07EMVbhpUwYXjYVOvGiPVSGZ2B2XyYLLIVQ4PGi8Bdo4SppZ10x6j+p6fpd9YJwG4iDbGzT7NjGo/mbhO+gudC+E/fPwCLVGClJ8L4QMdj7YEhKoQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/nRwwiN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76663C4CEF7
	for <linux-usb@vger.kernel.org>; Fri, 26 Dec 2025 14:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766758185;
	bh=/7pK9PuPq/k766vWUi9DeGf6jFTOvORgg+IwcJb7EgY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U/nRwwiNNQqIr3X8GCPTw8otYTItwIzgKn7oUTajA3erOAoWVuWmKO/vh3m2Lqzyl
	 zNAxW0bm4piUXmC9xjmj5scq7Iztul5zhl0nblKV/JufgAfZSsd2sPbEYIP0E16Y1x
	 EmY0zxE/sBgzDv4h5kfXofu3dtincSA41l9kEGoInr/zWkLVo93MpvdrnysoZe9Ea7
	 8Kiei62zOMPfgpm6cNBDJYlop0SG9pqpTFTHNC6vLxMDnYyuVOKSsv5BtREkuPzPb+
	 2QFvyZ/wqvH4SPjSyQgrIOrUVZTYi4q6C4IpgaBnC3d4wF5w22kvYb6W+VoqPIzEsP
	 CgHrKoLuFgrzw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6EC87C3279F; Fri, 26 Dec 2025 14:09:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Fri, 26 Dec 2025 14:09:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel.exact088@passmail.net
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220238-208809-PBlTpo80S2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220238-208809@https.bugzilla.kernel.org/>
References: <bug-220238-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

--- Comment #15 from kernel.exact088@passmail.net ---
Created attachment 309086
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309086&action=3Dedit
Diagnostic data: dmesg, lsusb, sox analysis

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


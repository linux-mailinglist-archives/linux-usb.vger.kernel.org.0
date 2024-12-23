Return-Path: <linux-usb+bounces-18742-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE9C9FB3E3
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 19:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F6D7166857
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 18:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2091C07C3;
	Mon, 23 Dec 2024 18:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEMdfd2l"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222671BBBEE
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 18:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734977690; cv=none; b=VyVzpxH+lqEeoZveB3epMGe3Ggdut2IbpefXllSRuW/wh722tpv6kWg3KmQ1ZyXCH6/pFmzg5Y/bR3h514mBTkBUOfxKxquQv0NUqIrDl8hOxRGk7DMC2kv4VOAOspRLuMHkgYt6MPmaXBZ60+ElHytmo++WtfAJ3URFWgIKl6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734977690; c=relaxed/simple;
	bh=FMvzkv1nnYX3mSdAdDxVLx/mM6QDaQ5zJ9cHuNJKArw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rYMdwISKrI4iTNym83u2qj0thDCD5IMq3i+lpd9NromMhZz8mnkY1s407fTDG6OFtIFz1yNljHAPdchtUHrXCxOSYNbeqyg84W0pezR0dU442MtiVuuToSwAnyfwoQKfL1ttGX7gJuMU4tKVQY4yzHdxNHQk3sEZqRpuqgqs0cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEMdfd2l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F143FC4CED4
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 18:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734977690;
	bh=FMvzkv1nnYX3mSdAdDxVLx/mM6QDaQ5zJ9cHuNJKArw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CEMdfd2loIj6lhqRPOtDNVX29nRxJHU1ZjgEiSUIoLmWbYDuA+n2UI2UfIpTTl6Bp
	 TqXCnK4++Cqc3VLipfdO6J5vIwYhtJmiiikjD1BgmiZLzMlHhVfydjM9mbrsXNL9aM
	 qROZMi4OZ81G278i+y4RU10M3FRWgDB5my/ftKsOx8y/TQn0sBgLIygALBSIOvX68i
	 su8ftMGII4PqhQxxWtMH96uTSh9XICdo8qMKJgcE+m8FtIxI/DS0/UAlyJRuJRP4Rq
	 qnur3MGCWUB5if6daWO/1zc1qUW7nC+xddO+1o0zeu2tZTjh6BcnJIJkIKptV+subi
	 w2rKrXngV8qMQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E5E9FC41606; Mon, 23 Dec 2024 18:14:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Mon, 23 Dec 2024 18:14:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-TpPuEG1pft@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #26 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Honestly, I don't know what's the problem. Maybe as a last ditch effort try
dynamic debug, if your kernel supports it:

echo 'func xhci_dbg_trace +p' >/proc/dynamic_debug/control
rmmod xhci-pci
modprobe xhci-pci
echo 'func xhci_dbg_trace -p' >/proc/dynamic_debug/control
dmesg |grep 'page size'
[  262.117753] xhci_hcd 0000:08:00.0: Supported page size register =3D 0x1
[  262.117755] xhci_hcd 0000:08:00.0: Supported page size of 8K
[  262.117756] xhci_hcd 0000:08:00.0: HCD page size set to 4K

BTW, don't worry about that 8K, this value is incorrectly calculated and th=
en
completely ignored.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


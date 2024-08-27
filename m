Return-Path: <linux-usb+bounces-14199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2EE961790
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 21:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1FCB1C23550
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 19:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8231D31AF;
	Tue, 27 Aug 2024 18:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDHoAC80"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365C51D31A7
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724785013; cv=none; b=SDQ1qnv743GY8DaltkB65L/Q5QDOqAas4eoqYDZve4htUTp8OlyM7iBXzZ5fFKyAZWPCJTMaTa/Ila8WLPcaVsE+DtUYcPJuduXMgmZBIQXK1EE/9o6BhExpvb99sGp6N1YnIdvTC3lqBCiBE0srq/Yr+fA/xGfFbPNV5r3jCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724785013; c=relaxed/simple;
	bh=sMWJhbseneOzYWNxng18NfM7knAJPkxcV0yKCFAeI6Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hgr5puPT80tnKFofMg/T3RUz4zbm0VbEbVPt6+1bkavBC6w9azB65FC84MBhSR+KRfEMgd5+88LnPG/DXSkQ27B1wEK26TmP9QZZEss+kYiDFpXqaKbTBvrlIO4rNbTD2B3jie25YKDHu4agCJRBozhJ9CBBwnLUgVUM/fJyL1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDHoAC80; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0CE2C567D8
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 18:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724785012;
	bh=sMWJhbseneOzYWNxng18NfM7knAJPkxcV0yKCFAeI6Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IDHoAC80WZmD2MiUNfm1y/QUxhk+v5P6IDgQCkgHMtMzlDJqf8p8zN/hj2Rk7VI0s
	 yQn0tAmSHF6XLCD216Tq93AiGzOPS9meT8GvcORxW2jCov64Le9awmINwhFu1GSUE8
	 jSTbRhobe+Huu6OO0EEK2vgsmh5fP5uE2ga5ePtsXJEfMa8AaztecN47aiRYoPHv1T
	 ISehKiD7xcwshfUlesXt2eMU/a6JI9EfjnePRs72GPoDHLsKHOwB/Ga8RhIBuhd1G0
	 5Ew+bYvqnS+GmwzT1fVGikjD8H/5zSwBxI7YxuDvCMEG0BFKtK55Mze6ooe6OggXPx
	 b1P5s8v/1CeUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A6F64C53BBF; Tue, 27 Aug 2024 18:56:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Tue, 27 Aug 2024 18:56:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maggu2810@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-tJjhmgkXDg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #13 from Markus Rathgeb (maggu2810@gmail.com) ---
One additional information:

I masked bolt.service (systemctl mask bolt.service) and restarted my system
with dock disconnected.
After the system is running (Wayland session) I looked at the kernel messag=
es
and connect the dock, disconnect the dock, connect the dock...
The thunderbolt dock itself is detected but no peripheral.

security is set to user

$ cat /sys/bus/thunderbolt/devices/domain0/security
user

I created this udev rule "/etc/udev/rules.d/99-removable.rules"
ACTION=3D=3D"add", SUBSYSTEM=3D=3D"thunderbolt", ATTR{authorized}=3D=3D"0",
ATTR{authorized}=3D"1"

Reload the rules and added the dock again.
The attached USB keyboard has been detected.

I disconnected the dock and reconnected it again.
I see the DMAR error and no USB device is detect now.

Just to replace bolt with a the simple udev rule and reduce the user space
service(s) that are involved.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-26027-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A2EB0BF29
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 10:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4755818830DD
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 08:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F63286D4B;
	Mon, 21 Jul 2025 08:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JX8YNaEp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8C21D5ACE
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 08:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753087151; cv=none; b=GlHvSBMtRhZVqVMEfDRtRACiVWZCzg6Mt70d6WZ75e5GgmERH3nS9+GeuBHB0thtlmPVKrT6yqtVNz6f1+qT42JLKbVXRcCR1rY6T1kDha2xaB4hrau7Sm5zAr8Wh7C6CfIVPvFQid+ka/GB46OAT3AUXFNqCflNh/l0OTftzpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753087151; c=relaxed/simple;
	bh=23yn0rGxevxtj/m1dPHQgLOwS9SsYj5+q4eeyIEw8qc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KVENR6zpOXcR5uyqFAlylsUPoPCFaf609E9Lc6NX4EZtd7PEcghstuMFmA07ElCVVtOYs0A0Nz1qigpfHLBCrQScKx3pzbx/PrAre3uNrCnaBGulRuP2qz6CguesGoJWnquzxHPRf3qWO2vobdsqBJa7MkbqWhq2fJuau9eb2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JX8YNaEp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49711C4CEF4
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 08:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753087151;
	bh=23yn0rGxevxtj/m1dPHQgLOwS9SsYj5+q4eeyIEw8qc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JX8YNaEppE0OxZ57kJYxgvFg8dT0luVcmiqrFlI2kU7kY952YHQW6M56SYmxPLP4t
	 Z9rIrQGnh4t6s4r700O+Uor0ktV0FKAoq1M2BzyxFNTIr6CLB64fArT+EXeJqAGTwZ
	 +PgU/wBhA+80SOpuXPxg1ngExy77OJ4qiDrBD5BaSLdxFHjGlLb6Z6LdxzjV2b1Sjb
	 KZzyY8vd505h303E7UNFBNSOTt1RTJrTME3Tpn5/gstCe0E/VjMcgLulrUkNtevo/D
	 HUkmRJdodXLED0BYzhP9NxqCEYTdCySKkeWhT+CWAHw8MrUXGtFRXi7JcAHevAZ6A3
	 lr25S+xUub5IA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 32077C41616; Mon, 21 Jul 2025 08:39:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Mon, 21 Jul 2025 08:39:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220238-208809-yE7FfDbg3X@https.bugzilla.kernel.org/>
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

--- Comment #11 from Oliver Neukum (oliver@neukum.org) ---
The bug is marked resolved. Do you still get the issue with the latest kern=
el?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


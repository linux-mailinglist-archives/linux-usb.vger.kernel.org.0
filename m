Return-Path: <linux-usb+bounces-27479-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF675B4124D
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 04:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80C6A5E6F7A
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 02:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC734221710;
	Wed,  3 Sep 2025 02:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t70X+wWy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F89512CD8B
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 02:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756866419; cv=none; b=g0jy0cvjI9PjN+noXPsXOpzI1dFMBadkx+W+7LxkHcG3pKKpvcCheV/DctIKMJul8fgzbHF2o+cxUSYjjkgLSCja49B3wXAI4zvGBFYMMG/OT20o0+6kFuJteRPjvCtd5NFoigni7itHWamONFwpn7yIWmZhk7DaGv8Ple76d3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756866419; c=relaxed/simple;
	bh=/euu9I9T4YAEJ+8A6irGiIZ6CXZrbYSrXkOVRy3CxS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D3F6WjagxXvXYGMm+DIzGdqrE//zgmoG3qCnw4yN/4QkDkXmNz/JDuipUg9DcfM8mnv1Ah3QNeDSrEfyi6Osx0deMZVrHwiVFVrmTlR5pTsTCOzVwuSzuZT+bUaDfGcNGECpp/K2LQgjWUMXcdxJkZqrFNITwMb+m+AWbOGntck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t70X+wWy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C55E5C4CEED
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 02:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756866418;
	bh=/euu9I9T4YAEJ+8A6irGiIZ6CXZrbYSrXkOVRy3CxS8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t70X+wWyuq7FUskPSlefwairZPm0xO05m1suq2Z0t9G1A+ApWzCS9sdlI7c5eQtSO
	 Lauq8nf239xY1KqK4dX+Mm7iucWbj5knW3OuL1JoMY8z6tBhbWTLVD/ST2A6cj3mHe
	 v6amGo9e8PCI4BOcNlUtxJakQTgPZQ5LYK0pjKAfUyCQRF5h+XKqJh2uaPT7G8Lewr
	 6Bsz+KZS7cX2nfRIsVHGV6DP63rpUrNhuOVW4fGow3dQgI++tuuhngwy5YCC0U5KR4
	 CWpJIh6Fkt1EnGR20SKhjY/Su4ZzfLCLOzyjsABK/FTVG6YQ2ICof0wypuCPTsQ0r7
	 3NKK5D4Bm9NNA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AF4A1C433E1; Wed,  3 Sep 2025 02:26:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 02:26:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-AsMSNgQKJc@https.bugzilla.kernel.org/>
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

--- Comment #20 from Alan Stern (stern@rowland.harvard.edu) ---
When devices "reliably disconnect/reconnect" on the emb-qm77 system, do they
work reliably afterward?  Always, sometimes, or never?

Remember, the traces you have collected so far on the Samsung machine show =
the
card reader device disconnecting/reconnecting on every suspend -- but on so=
me
of them it worked afterward and on some it did not.

I agree that it would be good to solve this problem somehow in the kernel.=
=20
However, at this point we do not know enough about what is going wrong to t=
ell
if this is even possible, let alone how to do it.  For all we know, the pro=
blem
might be fixed by something as simple as adding a 10-ms delay during the re=
sume
procedure.

Also, I don't fully understand what you mean by "extend the linux kernel's
usb_persist mechanism to encompass disconnection and reconnection of USB 3.0
devices".  That's what it does right now -- in the case where the card read=
er
worked following suspend/resume, it was because the device disconnected and
reconnected and the usb-persist mechanism was successful.  (In the cases wh=
ere
the card reader didn't work following suspend/resume, it was because the de=
vice
disconnected and reconnected and then so many other errors occurred that the
usb-persist mechanism was unable to cope and thus failed.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


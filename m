Return-Path: <linux-usb+bounces-23234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD2CA93C2B
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 19:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB3C11B61FD3
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 17:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BE021ABC5;
	Fri, 18 Apr 2025 17:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLVTYbKA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D211A1B4236
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 17:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744998357; cv=none; b=B/gBQ31252ZLxk6liK97wljvavrMV5Kx3bICVgtwch1BwP4+re2RiN+PkTXBd7WdRcDZZ8haOHrN/1WlCWA5eAdFc9yn/LFYUFr70SL3xI5LRM60Pc7zEbO1bccc+3k5rl2iJKsVzxCLJT6vwE09/L/WnZIvjnOBqI9grDHu11w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744998357; c=relaxed/simple;
	bh=wB41CXte8tSNzHK2aagAqDQIJfKteJXhx/bEh/YMCMY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qtiDKhyWOtpSru0YGEodkueS5j43e7Rar86+6X2wxBhSgPL5th5z5NqEJeY3mn7w4vTBzk0nlw+d+xofUg+fvpMV13cNh8nSKA+wsQV3BPqIBwO3TcS5Fp1C8LOFStXpFZyolya1CVHMwzX1FueW+BB/oFqj9viFcTHHXkvVlME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLVTYbKA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 529CDC4CEED
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 17:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744998357;
	bh=wB41CXte8tSNzHK2aagAqDQIJfKteJXhx/bEh/YMCMY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PLVTYbKAbXLAzoM3RgBmWO0UhGP71GNBSuOjzWuIPC+wLwcG39x62YrTdzcu0aew1
	 UDTi3fLL5g34oGu5CFDoJGCmh3zvISVd9yGXZn1yZltFcBkDTBN/Q3zu3p18keYjg/
	 YXbLiZHzVPC3MAP9CGoMF4gMDLLGxYEfkM/sTqb8DHz0N3mYnS5oeegZ/dHil8jti+
	 EwlNoJQx9fEasSQV6yeAllc4+kJ0GI2FTVJTvs1U46TH/l7TYk2eA4BYSCgTGNE5fn
	 vcoII5pSKVLxEgjIltVs/H435c6kOI1IhIoJUOtF0aj4BvmFyGLVdjt6E3+Q1Fxm9g
	 lEHXWtf9oxxww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 44B09C53BC7; Fri, 18 Apr 2025 17:45:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 18 Apr 2025 17:45:56 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220016-208809-4L6HNo5u7M@https.bugzilla.kernel.org/>
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

--- Comment #16 from Steven A. Falco (stevenfalco@gmail.com) ---
I ran the tests you requested.  I attached /proc/iomem for 6.13.10 both with
realloc=3Doff and realloc=3Don.  I repeated the tests with 6.14.2.

For both kernel versions, realloc=3Don results in a non-functional USB keyb=
oard.

For both kernels, realloc=3Doff works properly.

I had been running Fedora 41 with their 6.13 kernel.  It was compiled with
realloc=3Doff.

I then upgraded to Fedora 42 with their 6.14 kernel.  It was compiled with
realloc=3Don.

Therefore, this is not a new problem with 6.14; it is just that the kernel
option was changed in Fedora 42.

I cannot comment about 6.15 but I think Joe was the one who tried it.  Perh=
aps
he can comment on that.  However, since both 6.13 and 6.14 don't work if
realloc=3Don, it probably doesn't matter.

Please let me know if there is any other data you need.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


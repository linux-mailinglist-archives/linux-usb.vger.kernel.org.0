Return-Path: <linux-usb+bounces-6369-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A46568538E1
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 18:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A6951F235D4
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 17:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC785FF0C;
	Tue, 13 Feb 2024 17:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEvcIKcN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40165FF19
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707846393; cv=none; b=LYhkscW5j6xwDQ5K5yWI4HaXiwAoMDB9QFNdqauj7oGCafYJTZJ7R9oDOVKKcgeOOGCWvM3CxZR+HjtQshecss9oHtag649tRsfw5bQuUZu8AdGMYUKT5BtCAeUxUnaXAzkMeUXHHYwwxVjgBGlVCzZl1XhjT1xE1pYThsZceFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707846393; c=relaxed/simple;
	bh=A9UbjHJUw75dnmaY3vFYDtEBZ4qEq8wmcCUWCsy9M6o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Awu2mDKq4TVjBFzvnFnj1DCUjblc07FL1H1BF8kSckR2xaqZKET8uldI7+lHPrXEa++IfZdpYLIKchiHn1bJ4DtJk3Nus6FQ23NLLpiNKPIZLdndxc1MwyTUgDNXP09ztgPKG5fdvT0EWFKg++WMzuSLkiqQySe1k72lkz/jZrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEvcIKcN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72628C43390
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707846392;
	bh=A9UbjHJUw75dnmaY3vFYDtEBZ4qEq8wmcCUWCsy9M6o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DEvcIKcN5wZSTc+ARwibg6Dj5PXhhmkQKq/1/2kB/Q8/LUjPih7xy4HPyo7063Dbz
	 gsLdSfxkqzmbJGRrbDB3n3HG0DpIgLZAiGIMh0NsGFphYddpI02paBN/iR/ZZdxm/G
	 OgFR/EgNTtpVfJJRZqq/nGBuBdOXB/+N13ZhOgF2EH4LiSTvCjc3jGfuN/pjuoRsGY
	 RE7HSW3qHkuXgDr0+9Ex3A7hDP76q3AVYKyzqBnfUUpW9HlfWNB6ZtS+imfMs0pGUn
	 eScWW8nvCDG+yDVF3HIhILGixMzGb+6vYlim0Sn080UVWH+jh9vnBEVdMurkPPAlLE
	 fgH6X3xxuW70w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6128BC53BD0; Tue, 13 Feb 2024 17:46:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218488] Linux warning `usb: port power management may be
 unreliable` on OptiPlex Small Form Factor Plus 7010
Date: Tue, 13 Feb 2024 17:46:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218488-208809-JoR42QyoDi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218488-208809@https.bugzilla.kernel.org/>
References: <bug-218488-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218488

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---


*** This bug has been marked as a duplicate of bug 218490 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


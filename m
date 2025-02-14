Return-Path: <linux-usb+bounces-20660-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C308CA36793
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 22:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 241C01896D2D
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 21:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D1F1D89F8;
	Fri, 14 Feb 2025 21:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZR9SEW+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF21C84B7
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 21:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739568661; cv=none; b=V5RJe2T2gowVL741c2QR6jkiKlxL/5Y5AjqGyxh0VtGwCBgPkDwa9fO98OPT9ghzcNCQgX0cdd4WlC1e0/9QFXktqHqbn+l4vIC862wM+CU3xT3l52dAhiWPRjBUG1cDtmJgGzAF/rVaoAfIE1JGKvWVZSAND6ykehcoE9feQV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739568661; c=relaxed/simple;
	bh=c1bWUQP/06+gSjS6IP1Yw/QQPP/MLvXYeZEPyICWcd8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kYTFieOGBkf064YwqYXPvl4zfMleBjOEs7kDzs/o0Hf2I/yk59W4lqsF2GJwyFW9dqxFkMBRN4+29ZhElpt/wcnG+DCBzbxFgRxptUFEnR8wj8DtawB2g5v7i5oh7dwZvmKbJ7ej/7uUe+lA8IUJ4/ArRTurDQ1JIYxwQ4QFe/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZR9SEW+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE93CC4CEE7
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 21:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739568661;
	bh=c1bWUQP/06+gSjS6IP1Yw/QQPP/MLvXYeZEPyICWcd8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pZR9SEW+Tbga5ZImlqEsNx/EJYjqd0dKHS1ZTNOa3jnMTpBfJwWqULpSnfcN4t9OM
	 zxit55ADCy25m+vfBMYWvg1hOZ+C2eUImVxLJo8OOzg2foyc71tt2Mt7OY7ecuEbP3
	 Z3Zh9tkL/Mp8kRbpcSef+Abgpk07575P8sMtpfktkVg0Z728g8q80YqKtYOe3AHRAN
	 yf5PMvXIcTJcJ7EnqKMtxweZR6FSRe+qvV8adUH8j+CkCATyaiFIuBDy0xT5tXwMvK
	 y/64w0h6HRINtKuZ9OQVbqhhTHz5CO6FP64TB0e5TNfjKW0MaK4GGu6dAQliJRJpQi
	 bMUuB3k3JPSog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E0DEBC41614; Fri, 14 Feb 2025 21:31:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Fri, 14 Feb 2025 21:31:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-fLSjcaMo8T@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #12 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Mika - what would you think about putting the retimer scan into a delayed w=
ork
queue for 5 or 10 seconds later or so?

As a guess, maybe these devices don't like the sideband traffic while they'=
re
trying to get setup.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


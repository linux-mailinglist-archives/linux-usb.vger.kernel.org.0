Return-Path: <linux-usb+bounces-26478-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF37CB1A94C
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 20:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CB047AAF56
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 18:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE32E22F389;
	Mon,  4 Aug 2025 18:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1yKozri"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667AD1B4F2C
	for <linux-usb@vger.kernel.org>; Mon,  4 Aug 2025 18:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754333533; cv=none; b=UBW1U1rJro8IawWN2GavtbvLft0fD8L6Uy0dYec/HQK3hrgCFef5XQR2YTYVb0lTcHcOKobnhcEAbWiF1gdR+XFYY+ReT67ZuQviZkTmTh/eqPHnEdvLOfmocJAI/Vo+4ioUjpiylLS0lXHJ9wAnkOctSnYJBL87ETMnTqmPBmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754333533; c=relaxed/simple;
	bh=W09jaO0g2uwFnr1T7mq9Rc/x9YmM4SkcYs44idd5k88=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YeR32wBZolT9ZP8JqukIBgKtjZ0teKkfcrVkazHTBD0NULh/GLQtYi8/eY/4GCM5osLkEuTDOxppTLZ0jiJrRACzbMtFD1yySQGBa7bNnVFVLFyHVuDx7MHOA5IGvnHQtgb+j7ToZXvLSZMHWA/YmkloXBdvZqgjSxPJlXkMsUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1yKozri; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E68B2C4CEF7
	for <linux-usb@vger.kernel.org>; Mon,  4 Aug 2025 18:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754333532;
	bh=W09jaO0g2uwFnr1T7mq9Rc/x9YmM4SkcYs44idd5k88=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s1yKozri3UgmIPGytxoYJUG1NMfsAJxbJQDrF5Ty0NUVfwGWXw4pHymCdzGBxuKR2
	 ChJIFLW90t57t6W9RJ6J21uPpXKgGAoyW309rZmZdSixMzu2tcAM/T/CNHe8oHy4vm
	 uPQLbXAjyaSfNU+u+q0dK2Dqex/+gJRVDs6uCJu0Ur3WYlzpV+X7gLB6WqtOxCLknt
	 FdN0j2EIhLfxWlHBzOqrWeO+DE8b2nyDv5nLzu0uB3RBTbYxMxyzTdjAqs97nTLekW
	 3+1T13Z1aH9uAjDbOPWc74UCiCnZ2atrEqTAUcfaR85VrWDX+AoJWUstAW8eDbWhBt
	 nAtvQiVrlldag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D2786C4160E; Mon,  4 Aug 2025 18:52:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220409] usbtouchscreen support still needed for Win10 migration
Date: Mon, 04 Aug 2025 18:52:12 +0000
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
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220409-208809-CI3QPOCRFN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220409-208809@https.bugzilla.kernel.org/>
References: <bug-220409-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220409

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
If that worked, and no longer works, please bisect:

https://docs.kernel.org/admin-guide/bug-bisect.html

Also, this kernel:

6.12.10-76061203-generic

is not supported here.

Try 6.16.0.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-21424-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E656BA54A1F
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 12:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B1F5169B2E
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 11:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2145E20B1E7;
	Thu,  6 Mar 2025 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGzn9NGS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7E2207656
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741262072; cv=none; b=m+nt78rik2IKQpGQNSFPwVvd69NSPfqrixkEMqjndaZgFN6Az3BOYt4N0rpiNpn5ay2eBxXgohxpYgEt0Ga6X1ME6ztUyLiXbchWptpLGrr6fHr1Nc6VqTh5qrorFRLi46KqgOFKTvWd3J4fAw79UaeVQSuIR+eLjKrZeVon2vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741262072; c=relaxed/simple;
	bh=sueOzFTFUb1AFbmLyBioWqVOyxkbA9AXW1ql16bLSEI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p6+RTlmf6sLScJnmNmayBuKNeTOrlxvPXvxTVeKlc/S1/nGcc04074i9Celr1PBXpoXHw2d7Alr4DVjiweT//3UjBmcdAacTfCSv5wVBWURLSFUpkSUucS1yjTqBOsERSEj4ZnSmQHJz1EYhXRHvXjNZzF+g5KZP+NiJ4kv0VMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGzn9NGS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B632C4CEE2
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741262072;
	bh=sueOzFTFUb1AFbmLyBioWqVOyxkbA9AXW1ql16bLSEI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JGzn9NGSrv5Xcf9ByJul28pZXhARzZt5RAjx/xya/OP6XCBtAlXi5gpQk9T4ur10N
	 CWF33qMSeOyfmbWpx8nyBXLJuVFoxOOZVrUq1x+PgieRXH2hIXZtbQYhlAhsg+Z3nQ
	 /OcIIb331Y26uxACWkfOiRS7bM0bSQziN8kRDwXBTerpXHJJeZPgzJD1VH0U9J3tAm
	 RKCGGr7rRcxVUxR3OtlGF1QkDhGsca6+oM3dFk15RaEcawnfSYbH/yleXaeezEY4xp
	 qpj7IJCKLyHD/1jUqHUrX/I/3pIQpA+V8TEvJahWnamKhimMKrJxIftAEZomsc2OuX
	 X/FRKk/FyMb1w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0C023C433E1; Thu,  6 Mar 2025 11:54:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Thu, 06 Mar 2025 11:54:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-Aqd8bLdmRQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219824-208809@https.bugzilla.kernel.org/>
References: <bug-219824-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219824

--- Comment #16 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to bugzilla from comment #15)
> I found this issue happening this after resuming from sleep. Downgrading =
to
> Kernel 6.12.9 (6.12.9-arch1-1) removed the issue completely. The error
> message was the same.
>=20
> I am not much knowledgeable in reporting or helping with kernel issues but
> if you give me instructions of what I can do to maybe test a patch and
> report back I can help.

Please follow the instructions in
https://bugzilla.kernel.org/show_bug.cgi?id=3D219824#c11

I'm currently on vacation, I left my mouse at home, so I cannot debug this.

BTW, here's an interesting tidbit: even with debugging enabled in comment 1=
1 I
wasn't able to get my USB ports die but (!) on a second resume they die
_immediately_. So, maybe I just had to suspend/resume twice and then genera=
te
the debug data. Sadly, I just ran out of time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


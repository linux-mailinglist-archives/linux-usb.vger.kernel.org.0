Return-Path: <linux-usb+bounces-20194-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 067DAA29D62
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 00:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50EA57A1A67
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 23:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734E321C187;
	Wed,  5 Feb 2025 23:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIjAvkmC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E856414F9E7
	for <linux-usb@vger.kernel.org>; Wed,  5 Feb 2025 23:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738797450; cv=none; b=Qiexe3ydeTdAIskj3PjEsY3d+QUVGzGlQATQZyv9AlwWfJOry8KRaKNDqbdOggFpo8/RF6NQIxuGv9YeFFgOGUZjsVWYCFithNj3gDV5j+MdApa/WPsP8NXK67PsnxV8rJsqrUuWOu4pg8SlJmkumEANwDabglFtPAzTBTFzYBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738797450; c=relaxed/simple;
	bh=Gsz7wmmwpwpJ+N6cpRGkJawmYoKwyzlxB42E1iTgYHA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WQ7QCloRUUFPJlzA5wk1uQ66a9dHMJHmkc35hjVR1hCZi3FPioWVClv5Cm69cJlA14Tet63yUQEpxFN3jrgl42pQQrurJmr6KGr3qhp+vIQBL/jpLDdOtE46y4MbpDEka+OWqDDE0Zq7meZ0gB/vOXxASv/ruxutWDdkpPLwP2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIjAvkmC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58E93C4CEEB
	for <linux-usb@vger.kernel.org>; Wed,  5 Feb 2025 23:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738797449;
	bh=Gsz7wmmwpwpJ+N6cpRGkJawmYoKwyzlxB42E1iTgYHA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nIjAvkmCUn6uG73mw8DgeXk9BEJCMV0c9p4wTH5eugJCG44CVgXKCa3Bdvs+GIal8
	 B/qAyJZYyoHbb7g76UZLe1091Jl/opbo/lrjtMEtxmxmFl5WmRHbz/j2lE8/kiSRdb
	 cCylPXhgeb31nGnvf818U+PKUSOsYQ6kYi0vm0EBp/bWWtrPEk+sWNLIf21HODcCGD
	 InEJRJuCoqlZI7r/O1lUfm7BT2tubz4+JV9mwIjduj3eHE1zJJtPH70HPnjQj6Hwpf
	 p8o8ERQt3ZYvyzFuJv4MbVuNanBQbuEHHBsYqhhW0LThK+3aa2mQXPxLDDtqMndbD5
	 43QsiZOdxJzzQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21F77C41615; Wed,  5 Feb 2025 23:17:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Wed, 05 Feb 2025 23:17:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyz27@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-HjIFlWGcxE@https.bugzilla.kernel.org/>
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

--- Comment #5 from Thomas (lyz27@yahoo.com) ---
(In reply to Mika Westerberg from comment #2)
> Can you enable tracing as well and attach both dmesg and the trace output
> here?
>=20
> 1. Boot the system nothing connected.
> 2. Enable tracing as explained in
> (https://github.com/intel/tbtools?tab=3Dreadme-ov-file#tracing)
>=20
> # tbtrace enable
>=20
> 3. Plug in the dock
> 4. Verify that the problem reproduces.
> 5. Disable tracing
>=20
> # tbtrace disable
>=20
> 6. Take both trace output and dmesg and attach them:
>=20
> # tbtrace dump -vv > trace.out
> # dmesg > dmesg.out
>=20
> (We need the dmesg as well to be able to match the trace lines with the
> driver logs).

Attached trace output. It charged the whole time. The first couple were slo=
wer
than normal.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


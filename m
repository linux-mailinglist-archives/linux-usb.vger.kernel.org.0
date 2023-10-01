Return-Path: <linux-usb+bounces-878-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 341347B47CB
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 16:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id CAEA0B209A5
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 14:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01EE171DE;
	Sun,  1 Oct 2023 14:06:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F608F67
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 14:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F04BCC433C7
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696169166;
	bh=xCaXpAwGvPFzi5J2zQXZPUUfu53NTxunh7mCqk7ga8A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=p69OdyYwz0RW0aWrs8nFMz9Jm29XgomyUYEokE84KfJlZa7Ib7ztQsoY11ODItLMC
	 kSQLIWHiyhWaPFPufEB64Yq3QRkE9m0XjiYBPujlrzVjG12LUCE0wNBAiOf6nXwzmE
	 eyyolb6ejl+lNom04iNV4pDvNw0Xcv/re9WgptMe+U6iqH4MkZRtrgzcCXqeS8EsgX
	 QDC2Is1DPQvT6WjS+p86/QRdDAGXQ/KJkbXBxYGY9/XPNS7TXwIdTgY2TH6YaBG6Ry
	 /5bABySOVqVxEf2MpYF6dBbf1LTjabBcMo4BJkTpfvDm/meT7SKXAEuUmwVJ52gY4f
	 bxa2r/PLRxYlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD42EC4332E; Sun,  1 Oct 2023 14:06:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217960] Linux 6.5.5 - kernel BUG with ucsi_acpi
Date: Sun, 01 Oct 2023 14:06:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bagasdotme@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217960-208809-wDmrWvDuRX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217960-208809@https.bugzilla.kernel.org/>
References: <bug-217960-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217960

Bagas Sanjaya (bagasdotme@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bagasdotme@gmail.com

--- Comment #3 from Bagas Sanjaya (bagasdotme@gmail.com) ---
(In reply to Oleksii Shevchuk from comment #0)
> After update to linux 6.5.5 I observed several crashes during bootup when
> USB drive connected to USB-C hub. To find out what has been crashed I
> enabled EFI pstore. Unfortunately there were no crashes after that. Howev=
er,
> there are kernel BUG traces in dmesg. After several experiments I found
> strong correlation between ucsi_acpi driver and the crash.
>=20
> I blacklisted:
> blacklist typec_ucsi
> blacklist ucsi_acpi
> blacklist roles
> blacklist typec
>=20
> Two dmesgs are in attachment.=20
>=20
> The messages to search:
> ucsi_acpi USBC000:00: possible UCSI driver bug 2
> ucsi_acpi USBC000:00: error -EINVAL: PPM init failed

Do you have this issue on v6.4?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


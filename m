Return-Path: <linux-usb+bounces-895-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 187637B4A5A
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 01:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 1DCB71C2090A
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 23:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7010DCA48;
	Sun,  1 Oct 2023 23:40:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A020E0
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 23:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A714C433C7
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 23:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696203651;
	bh=FnCFCySjvfJo+nMv22AN65k/KiMTTg7/ZXAz+JNUBVQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EVkafG32dBlmTH+o9oJn5jsVF6dk+fVOv2Xv73XAtPn77YZtE4qJg2T9n8X6dY/zc
	 Rd6IUIRrt/LShvslgtiMITip9cJd8EjYQOJJe6vwgiFtqrG6o+T5udVMLLAH7gi9eZ
	 83/4sPXk2+NPFw+P7wwbhmabBEkCngp/Jg5m1yd5IpSoaVh2h3Z9H6pLsQG0nEkHG6
	 ZaJ6rT8e7VqcraUxLBQrfDzcwrEyf0Qs0l8GmxjUzXHPa6KcrqzSSTeH7AJEORkop0
	 fhgt4DEj9hsJ9uiQAkFjmBzJFDNA98GllXyalD1znQcYPjb+6zTNufC3ry7/xRPn4i
	 BBWQnLvjeWZZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5F885C53BCD; Sun,  1 Oct 2023 23:40:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217960] Linux 6.5.5 - kernel BUG with ucsi_acpi
Date: Sun, 01 Oct 2023 23:40:51 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217960-208809-N52qpZmU2P@https.bugzilla.kernel.org/>
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

--- Comment #6 from Bagas Sanjaya (bagasdotme@gmail.com) ---
On 01/10/2023 21:25, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217960
>=20
> --- Comment #4 from Oleksii Shevchuk (alxchk@gmail.com) ---
> No. Here is dmesg from 6.4.3 without blacklists
>=20

Then please bisect (see Documentation/admin-guide/bug-bisect.rst
for instructions).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


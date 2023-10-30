Return-Path: <linux-usb+bounces-2355-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA2A7DBDA6
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 17:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4214E1C20AD8
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 16:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A7D18C3D;
	Mon, 30 Oct 2023 16:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3gieig/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F4C18C2F
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 16:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B745C433C9
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698682867;
	bh=/imDd7tT0kKA0V5zbWDQdZzPBlyBRO+ErwLP9v8PfJI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n3gieig/CtkYvAlA6xUL956w94Tg7Dwakd2Yb4IFxOUGXzEMNRw246NWJxfC4+W/Z
	 /+oXbaadoK+VSjRnlfVWmMwv8imf+sCvldipaece7Ln23N9O6fjcQQ8Qzap4P+oScB
	 oJfDoTQqOlMQCw0zX4ii2s5CCWLZPDsurKQ+b8yElwRHb0YJYhWn7Oafr9gNUIiw6r
	 NY3CQj2dIbilH3l/hevQaflEKuumZfmygif6OZHRN7YYBtPL9LOaj2jzIYvcRaEIwl
	 pUalunvKZyJvOpWsWHEdBh2HFWdphDxEdtoooOEIm8bbF3jEKMEkNKge1f11d/6xOI
	 njidLGVYjFiew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 84A27C53BC6; Mon, 30 Oct 2023 16:21:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Mon, 30 Oct 2023 16:21:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-te2QMBQMfd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #12 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
(In reply to Chris Bainbridge from comment #11)
> It would be possible to detect [=E2=80=A6]

Thx for that.

> imho it would be a good idea for Linux to track the latest firmware versi=
ons
> for *all* hardware [=E2=80=A6]

Pretty sure that is something that should be done in userspace, as there it=
's a
lot easier to update the dataset with the latest firmware versions.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


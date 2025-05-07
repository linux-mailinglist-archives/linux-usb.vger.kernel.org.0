Return-Path: <linux-usb+bounces-23778-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBC9AADC62
	for <lists+linux-usb@lfdr.de>; Wed,  7 May 2025 12:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0BBC468E82
	for <lists+linux-usb@lfdr.de>; Wed,  7 May 2025 10:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5A6213E6A;
	Wed,  7 May 2025 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4iAwLPP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2432010E0
	for <linux-usb@vger.kernel.org>; Wed,  7 May 2025 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613269; cv=none; b=LJfV0QKgIFLsDh01udTLp8EQnNScw+urFCSRE0He+JZhYPYUswKj/PqoR+2vt0+sSiEdaOh9pY2i9UjyQbOvPvCHCZoYbnb4OtV4xtKXdnD/AyaeefTu/ZqA1QjYM7uF9ID56Z7GUnX9iEQbT1n4Gd2TD+txEKmEmgdzpZfXPxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613269; c=relaxed/simple;
	bh=9NTXllPj3NPbx414+eBP0l8I6UmYVwWdVuMfE4BCZVc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZkAlDyqoOnbTwY1PHDQj9KD9UOuzlz+uZUM9n/Ck8ME5pVyQBaC56s9/t+NqRcGXWr380ZVkGzKou5AEbr1IpqF3wYEO4NBgM7fBfEuq23GmhAWSKTYNb7QMLktEmcUlxPGQ6205wvyKuOeZbXPvyYm9exmDt3ThlM5sMPYda30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4iAwLPP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CFE9C4CEE7
	for <linux-usb@vger.kernel.org>; Wed,  7 May 2025 10:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746613268;
	bh=9NTXllPj3NPbx414+eBP0l8I6UmYVwWdVuMfE4BCZVc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X4iAwLPPvb6kPNVM5Cxr5SG8LDjCFCQ/LYve2LnZ5+hC06egkxS93sHm5ViYb54y7
	 HdbrWyPfs8uw9ypZ3jt+deZw3yJw7RtZx8W7Ip89p98LLmeAaaRv/zh7ogB9I/DdE8
	 waw+OrIbtsFw78cx5Hhf+j0tPBY0H1BeX/yuc0jlLp85Sfn3a9Se/30A3RSIaLFJ4a
	 D0gsasouU0B+aVzMvpielXquzxCD/z11IpwjomOL08/XsiHraMWKq04u2UwqvRjB6/
	 mOPacdn9MNXGWujxhfxy2LsUUgZS+qdVTiU2E0gwqjrNQB9hw1/c8UggVYZag7z2g+
	 vpZjMKD2XQiwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B481C3279F; Wed,  7 May 2025 10:21:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220033] xhci: Compliance Issue - avg_trb_len not set for EP0
 during Address Device Command
Date: Wed, 07 May 2025 10:21:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220033-208809-GgWZyHpuEE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220033-208809@https.bugzilla.kernel.org/>
References: <bug-220033-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220033

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #2 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
This is up for interpretation, spec is ambiguous=20

xhci 1.2 Section 6.2.3.1 "Address Device Command usage" does not mention
Average TRB Length at all.

But section 4.8.2 "Endpoint Context Initialization"
states that: "All fields of an Input Endpoint Context data structure (inclu=
ding
the Reserved fields) shall be initialized to =E2=80=980=E2=80=99 with the f=
ollowing exceptions:
4.8.2.1 Default Control Endpoint 0
 - Max Packet Size
 - CErr
 - TR Dequeue Pointer
 - Dequeue Cycle State (DCS)

According to it the Average TRB Length should be initialized to 0

I don't object to setting the Average TRB Length earlier, especially if it
solves device enumeration issues for some xHCI vendor. We do need to make
sure it doesn't brake enumeration for other vendors.

Can you submit a patch to linux-usb mailing list for this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-19779-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A6BA1D48B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 11:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1584188405A
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 10:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0EE1FCF55;
	Mon, 27 Jan 2025 10:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pesxXKMM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5219625A63A
	for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737973871; cv=none; b=g6soBAsXjzsMIJERO9wK0p/kSkx1VbTXZSWxq3NvtTrligefaTv+bUetgVBMpduPlYqaYgVcquQf5/eYPlCbQpxCgQbJdOqTD3+bsTgleSh0aguU1u9CIu+cUI3gyA6/cAmUBbqhEB/NLH5dtJjJCEfA3JR3I9CIGgCyrpUSUZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737973871; c=relaxed/simple;
	bh=9UIRrPxdKUZaI+45vC0mqXKlJNBsAzkithRF1SXJMts=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jAc6jsqM4WNNaxpzfdfUxYIKcTLTPbb3VFLwkYePkdKjb4NaEzoiGbdKkdlk4R+pFmnuniU6ieIsTX3iAZyteQ6z4hq/cvXr0jcvJGwPWetHoFi9Vu2HbX9xf4uCG73vQVviDbRtldgDPDRMejJrDiFk2nKipKmNHa1sqPmim5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pesxXKMM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3298C4CED2
	for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 10:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737973870;
	bh=9UIRrPxdKUZaI+45vC0mqXKlJNBsAzkithRF1SXJMts=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pesxXKMM81PDCCiwkdBnnUoes5tCE5FMn2EZmHyNgv0OV2fXpIR7OxLyYCjOgbi9Y
	 LXrNY5do0n0wMay+WhNsVt8bIUfgr8sIWv0UUzmdCAWS4KHpoomkQguBYLudXqnbYx
	 hnqCy9viQfTYuvjoE/KbP5PMkYuq7IifW0SJ43gaecEbldiNjjWvbQLp8fsQrMCLjj
	 oaT0QkSzsMUY58dSvUN2EKTJECy4G7pZ7DMLAtfZaFk5JVUoDfPnzbbz9C4XlO96aE
	 kohd+TsSMmRxfW1TrueS9Z4qacrafbM7d2yzbdNSy7+/kFtAO3AZLyvyFZ56vITvDI
	 XGui+LLqgMXvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B4F62C41612; Mon, 27 Jan 2025 10:31:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219726] USB devices fail to show up when upgrading to 6.12.11
Date: Mon, 27 Jan 2025 10:31:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marcel.c.vasilache@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219726-208809-MAVUKNgmwa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219726-208809@https.bugzilla.kernel.org/>
References: <bug-219726-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219726

marcel.c.vasilache@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #3 from marcel.c.vasilache@gmail.com ---
(In reply to Micha=C5=82 Pecio from comment #1)
> It looks like one of two USB 3.0 controllers disappeared.
>=20
> If it's Renesas, enabling CONFIG_USB_XHCI_PCI_RENESAS should bring it bac=
k.
>=20
> If not, please post dmesg from 6.12 boot. There should be some xHCI error
> message there.

Thank you Micha=C5=82, you nailed it!=20

Not a kernel bug but a setting error. I copied the kernel config from 6.11 =
and
the Renesas config option was disabled by default. I'm now a happy user of =
6.12
:)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


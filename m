Return-Path: <linux-usb+bounces-25001-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1BFAE3AD4
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 11:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE3743A5547
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 09:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C41242D74;
	Mon, 23 Jun 2025 09:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHSSJoWy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF53C2367A6
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671391; cv=none; b=GV2qBKb2I2M1EQGwRyi9jOLWNzQzyC6/VpweUqvfFjWceV23HNzM2Gqg9BTMf9lcEy84jKqSpQMkgNQ7IB0BOrp0Bu/EYemnWxN+FbCH4jj5wEAWtwM29kwurQmjVtUDkr7doSqjHJ12/CKGmyJ2cTyC4/YbZx0GiJqAaTSluoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671391; c=relaxed/simple;
	bh=b5y8/jHwP/Kmw++vYVzK7RSdNUXcQt39MTr3XmtPMkw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y7/wcpwHIrS3BRhhcm3AsDn6NnQKONY7bb7IOM1S/LP83TY17tlgmvTj0ObL+1gzP4CbRg2jnqh3bGUzdeLV0mTTfEh58plH1Y33FxRVan0c40g3QLO3tt0k0eUhW4/896KfT/OVtB7EYthr7XRdbD/nKD92uS8XBb8pSSaKe/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHSSJoWy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C6BCC4CEEA
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 09:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750671390;
	bh=b5y8/jHwP/Kmw++vYVzK7RSdNUXcQt39MTr3XmtPMkw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BHSSJoWyBA1iPHhS7VNIE/fnrqPI4Pnoo1O6UZUcg7TLrfW6Q2wbOZob8YUvxc4G3
	 J6Z8Se59HbKVCBu7pqDPXh0fBuHoun7svrxpikDeRKBG2c+wTESxKk23bvgO/JriGx
	 JR7/y4pKpe5cu6eHedM5cq6iHWJ98ujo54Kl/EqVOdYOkKxvITe3RpiJ4zNPXzpfSV
	 PmbgpywT6JsFH4pBj0BdhimfBt4Pz1rHJmQrTSby6imhpy0c1bZ3i9tzIwXLHNa/6/
	 ClKnY8yQjyjjUQK4IIecuNiGe0KmkE6or1ausGGp7ukUtq95PIjFd3/W6NmiWBEMcR
	 E+W36DE6vslGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B72EC4160E; Mon, 23 Jun 2025 09:36:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Mon, 23 Jun 2025 09:36:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fewspotty@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220238-208809-XQGZilAptX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220238-208809@https.bugzilla.kernel.org/>
References: <bug-220238-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

--- Comment #4 from Ryan Walker (fewspotty@protonmail.com) ---
(In reply to Oliver Neukum from comment #3)
> It is good that you have found a work around. But you were right. This is
> supposed to work.
>=20
> Could you please post dmesg of working and non-working cases?

Yeah, I'll email you it right now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


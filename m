Return-Path: <linux-usb+bounces-10693-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 387088D4AF5
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 13:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67F021C2278D
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 11:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E161171E69;
	Thu, 30 May 2024 11:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpxTtA7N"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C2C183964
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 11:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717069447; cv=none; b=YjdQHmPUovZgv2ShIkY6Yf3Gek6yCOCSH0STSahs9Ttj0FVlYLOlRpo3enZntxqK9khYbA2aoYVsTHbv2HY+DPdoZ4z9a1He0snqtVyNs8jXoSDAgp2V0Dtry/U5o80TrPmOE1N3ST1Gu+xpbz5QV4CdUEGnim+xkh3QBnfrH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717069447; c=relaxed/simple;
	bh=oE7u2deOJZwV2is/AW1/HUG88ap5ZXGSg7Sd2+z0Hvk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aTd6JoI8el+vy/R80hNzQhN1WWgCUbsmbnnPj9khFlN3HwWTSzwZL0x7eALObllwMDYWyxopcerkwIqwT3QL/bR1vsC+Y/xOUAc1aV9bx94L3g2VC1e9VHeVkdRwyZO4rOZk8ABhXXFz8aIGi5TerAUJ8OZ/O7G1vw4JOFigFdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpxTtA7N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32D0CC32786
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717069447;
	bh=oE7u2deOJZwV2is/AW1/HUG88ap5ZXGSg7Sd2+z0Hvk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BpxTtA7NoncJVTdHEMd/xlMjBHKf7F3UMPmut3k5z6X3nc+IQNlTSug7GG+uZoFA8
	 mHSJKrWT1KhjZsU0lutGbGZNoFfDc/2NGODN8d3nmsREe9ci2nOc1MUc758jZ83aQV
	 mzwQ+cBoTurbpciSsGCu6B5yhJusnkbSEYWgTVpvxxXLZI9NDC3FIjO1bCw19dlVuW
	 pD7EPYAXOwNUhPfWgm1n1f0JbHpvkvk09QRA2kk3/JiBFXwfvJCBVr1Zk2i/uetmxw
	 cjT0UhPGRYSJuWU78/zouBf2WZ4brsyQgrNVW3YJ5gimDXapdYVY2OP0ORrZlA2aKt
	 HuIUjfSowdrBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 185D5C53B50; Thu, 30 May 2024 11:44:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Thu, 30 May 2024 11:44:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierretom+12@ik.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218890-208809-BY3Ip5laLU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

--- Comment #11 from Pierre Tomon (pierretom+12@ik.me) ---
The patch doesn't work, same message.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


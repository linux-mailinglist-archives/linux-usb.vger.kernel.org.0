Return-Path: <linux-usb+bounces-23973-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4EDAB8389
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 12:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BED11B67749
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 10:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFBB295DAB;
	Thu, 15 May 2025 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUUe4y7y"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240AA284662
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747303521; cv=none; b=iiAji03daH9W4K42r/iGsVPy7SynHg8+rA/PfseCm1x4Qsj0SqO1a81lvTEmD0IVpS88vVAEmsSv8Td50Ca5+vYvMKUv9UqSJXNTRHRo0p4wa1I/Znp2yI7gOWhIAG+O7+o3yz63/c8ZqIHE12v1KbX6yB5m+FVIPCSPZza9yXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747303521; c=relaxed/simple;
	bh=xARxCCe5IoJWpmltMAhRiyKfhnYcezB2jZ7Zt7HsvD4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uZaBYVuesYc93mhxFP+aVoSdle5V3MWIcwOw1mYrdXQXkhMufICQD6/W6qX0dV+Cv1wa2fy1D121jdA3MYLAqVSrMrWKbrWM+yoaEUndu4CDrSPUf7/iQwvkiMYdySMAMg58d10L9/bj3ciuY/R8wRkY/dAKYFbifq+6oVTHpuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUUe4y7y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97C9DC4CEE7
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 10:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747303520;
	bh=xARxCCe5IoJWpmltMAhRiyKfhnYcezB2jZ7Zt7HsvD4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HUUe4y7yg8KbftKdQcoV6Lqnl3rriztjHWLXCR2Xv/sJcs77DWq4WFmIWlyiojTuY
	 utN6DkkYi+S+KanUOwHK+I2uaSqOoGvGum9FqtdZ8wKca3cRk2T5RoEQwsi0Ox2gVC
	 0UQrYU+YbFAkEZCazEcx+jnRKfDDcuV27ulfWv6kHBGFmVJ+iBtyXA5hktARU4LiKj
	 WpPELVn7AZVH48trmtuOWxQjmsqlafOP8inJ2Ah0n58B7c5CaM97H1K2XD4AFa8abC
	 slBR+FEpdgSL5hsv/x9O0zCjzhZr5NmSKoicLO8GPRyIZuWgL1eNYkcX+j5vg7cVwy
	 ynpYLjr1ghpnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8E3A3C41613; Thu, 15 May 2025 10:05:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Thu, 15 May 2025 10:05:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-tHDoh2xwhk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #52 from Claudio Wunder (cwunder@gnome.org) ---
I wasn't able to get their attention with an issue, so I opened a PR direct=
ly
on their "patchwork" repository (just to get their attention, I doubt they
should merge such patch)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


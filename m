Return-Path: <linux-usb+bounces-21174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E633A48A48
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 22:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13B0F188FA93
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 21:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E788526E966;
	Thu, 27 Feb 2025 21:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhqvMKYK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0FD1A9B2A
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740690467; cv=none; b=AimDi2d5ZeXcQrjHTUazporkSMhtEELpRQqCNvou4SsxmfinuDwpvIKibnTxs1dituPoLevqhpZw8MmLd0Tx5NgXVQ/Y3tJgoKkya7Qa/QG680WteCNEnF1A2Lio/Wth3XZ2BK2BE90mbdzY1ecZjMzkMUAg56SrFvcP8E/ngt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740690467; c=relaxed/simple;
	bh=5B2CWdoMKDzqdJ6bS4jl87k7JmlNpGTvqQBRflAnPAY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bMdiQrEY4xBZLl8xjkTaRnbsNij2/Yufh7lSzVOYIUyPTQFkLtQoEtma8YklNoMpUDxnRFgKffsqSQqcZMxZWcW/453ZVNCKuvEHyvt24OtUtxZOZ0dU5nqbfAY9+VTlJNSCDbvpeh6a2AJvDLKXhA7QXF9RZN3WASSW7kS5T0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhqvMKYK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD299C4CEE4
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 21:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740690465;
	bh=5B2CWdoMKDzqdJ6bS4jl87k7JmlNpGTvqQBRflAnPAY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qhqvMKYK6qnkni81bjrvIPlupuPjzoIUL8ZCriHrRUUuF72WZwX9gfS6WY/aa8IsT
	 W2Jp2hT+j6oIB7/R7Xs91nkzMh7fkpO7Ch7wUaZhaWeuDMZXZbSHjHyQO8iJWUhzxP
	 jFj5vuTJztchVjocteejxrwgloKf16nszhK/B7fKGa3WkZvVRZCUDMTCvjHwhWTad9
	 89hHIjMuCOd+tFaqo/J7BJ60q8WSVphjhMMncoaOOPmOcaQHHOvG5jMqo1clCc6zzy
	 ckIUVtDCkJgTshjMFtXRs7EXhkmX3k5adIpf9BPPM45HFHzfHJQHEwprnfKaSp1z5J
	 8UeL2Iv//GGJQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B7831C433E1; Thu, 27 Feb 2025 21:07:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Thu, 27 Feb 2025 21:07:45 +0000
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
Message-ID: <bug-219824-208809-SogPLnCPmN@https.bugzilla.kernel.org/>
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

--- Comment #8 from Artem S. Tashkinov (aros@gmx.com) ---
> Which exact versions were you running successfully and for how long?

Kernel 6.12.14 that I was running earlier didn't have this issue.

Used software suspend/resume multiple times successfully.

> Any chance that hibernation is indeed a (delayed) trigger and you weren't
> doing it as often in the past?

Not using hibernation, just software suspend.

I've not changed anything software-wise except installing a new kernel on t=
his
laptop.

> Did you come across similar reports from stable kernel branches in this y=
ear?

I've Googled a couple of times already for this exact error message and not=
hing
turned up.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


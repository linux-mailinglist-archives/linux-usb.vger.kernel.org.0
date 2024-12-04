Return-Path: <linux-usb+bounces-18129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F379E4A2E
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 00:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7CD81880901
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 23:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A5E186287;
	Wed,  4 Dec 2024 23:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPdYZquF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06A22391A5
	for <linux-usb@vger.kernel.org>; Wed,  4 Dec 2024 23:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733356333; cv=none; b=lkomjyQ+kl/EMP29B9lDITNgObJWAGuuQObTRaB7ct2+sUNW5w2F5nnF9xDv3bvf7woRP47QKPnfplmQH6I9AGEwuPQp4fbCMOSktQB+MK5wVU1ZJer+Z01xvul2tBF7KsFQcEs+jmv/f6TWgG5g5icyYeASzcZY+6OfTUcGXt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733356333; c=relaxed/simple;
	bh=mthVF6nu0Cec+e/VMayr4FOv8l0JT0SxD5YLMM3zTyQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dRmcAlorxJNw3q1lh6urWG6IvcpszY5wWPpFDAOZNN7+Cus0+qpIx0aXW0pNca+PZ27K/mPUn7N3OOkux2ZGgJE/CCHDH32DWRAZx4AbgIfFmOIOla5wAwedmFapitCMiYi3zbUqE0PYQGe6lnCXRrJELz6NcIL5OzJS+kK2y44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPdYZquF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F4F6C4CECD
	for <linux-usb@vger.kernel.org>; Wed,  4 Dec 2024 23:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733356332;
	bh=mthVF6nu0Cec+e/VMayr4FOv8l0JT0SxD5YLMM3zTyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SPdYZquF141tiu5GpBt8Qu0k1QEPhzZwAFpkhrlCfzYnJ8kfrOg/EKoIPQLsZSaR+
	 8N4q/IfhthQZlekzyiJX/sKk0IRaJFP1Yvfk+6Qigx+PaUUUYJyEkcBv1IUyAhRHS0
	 v9V7J+e3x/UIhJLgWquEFGdr9Al0dpUQ/bw7Tz7j6rOAwVN8Ny0LyHs4s/Czg7BRMs
	 ERy4w2E1JcUkNrD6B5VZOFSfr9U3tCTwQqd8utatFQM7WK/oGlJ1qXxg/HTY8+p+uC
	 thytD0XCKPPRzMkH18SmRxRMH2ZH8n0p4GK0N39F/CvxZx22s1X1z0v5OgTt7g8uRs
	 x1B/CpnyDdmug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 57E7DC3279F; Wed,  4 Dec 2024 23:52:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219562] [BISECTED] UCSI patch breaks lunar lake boot on
 6.13-rc1
Date: Wed, 04 Dec 2024 23:52:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219562-208809-rTUUZoebE4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219562-208809@https.bugzilla.kernel.org/>
References: <bug-219562-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219562

--- Comment #1 from Todd Brandt (todd.e.brandt@intel.com) ---
I've seen a potential fix patch on the mailing list:

https://lore.kernel.org/linux-usb/20241203200010.2821132-1-lucas.demarchi@i=
ntel.com/

I've just tested it it and it appears to work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


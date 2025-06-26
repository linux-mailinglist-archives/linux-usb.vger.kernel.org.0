Return-Path: <linux-usb+bounces-25126-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FE6AE9FEB
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 16:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1C08188A732
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 14:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285502E92BD;
	Thu, 26 Jun 2025 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tY74JWY9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A366D2E7642
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946701; cv=none; b=FVpg/eDMrmb8nQr4MhfNrtzfOQ2+ySwGnnbbbOYH+PEfGkcXygh77wISYHugeLKgmkpAmmmd51bDSKtwJkHWtJcSTxJbHHuCMVw/UclwnbipapjJNanQdUJ6+DY5R3q5yusORq7F8cFxzhpEWK653OM1y9LxKoD+aA6WBAqtS/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946701; c=relaxed/simple;
	bh=bz7x2ULxs+R0OhI8IzubgxKs0nkFY+shNckk1LhKraA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WK/3MRg62NkrsjivrBfSNo/b/w5j58nrDN50Hf/z1BWkpQSN9o8Tyh5xa4p3S8gmVzW0RevJylbsttdaUSBGnnASdtD7eE8rHDH/b1a3ibPGSKmDg5SRyiuoCSCOy1jfvRhUOG4K7pMg3eGic8WtXSzInIFdRRG2OHiZrQDivqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tY74JWY9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F569C4CEF0
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750946701;
	bh=bz7x2ULxs+R0OhI8IzubgxKs0nkFY+shNckk1LhKraA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tY74JWY9c5qqyxjESVmhaCop7FdhjsmLTRFNZBUvpyNlLwUjluBdlb2VlPllLQF15
	 G/5VxlWU347u8vf0gXBWVuI+/IJAmtTY+UeXaiBaJcJMfEPPPFgftHccabbZBf2M7l
	 t1Zqx+E2CqnSLX8jCUExfSM0LzeOT7T5qN57JTikD4Vh+MhvYsxor8DDovxyEE3dIt
	 eJbC8gG+c3US7ioQrEX7cbw+QvkqMu6qcI9ao6Oy1Sp4peDYslzCes/8v9U2i4nTnp
	 Tx4hyAArzS8LikySOd5FRhZyEnvuTiL2hfLOHV1/r7HCfelTrKBvaSKhvizQa3r4ZC
	 pYYBIm0YeDOww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 670BCC3279F; Thu, 26 Jun 2025 14:05:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Thu, 26 Jun 2025 14:05:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220272-208809-majzXYFpWQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Thu, Jun 26, 2025 at 11:39:35AM +0000, bugzilla-daemon@kernel.org wrote:
> Experimenting with AI to tune memset_64.S (see the attached file) for my
> Intel
> 14700KF-system unveiled a race condition in the USB code.

Odds are this is because your memset code is buggy :)

As this isn't an existing kernel issue, there's not much we can do about
this at the moment, sorry.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


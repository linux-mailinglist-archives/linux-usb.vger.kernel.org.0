Return-Path: <linux-usb+bounces-10623-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA49D8D16CD
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 11:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93C082833A3
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 09:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2F413AD0D;
	Tue, 28 May 2024 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtODKRWd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC574F1F2
	for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716886980; cv=none; b=aITYl4MBwet80ofzTSoeXJWWJwkkM9QuelJ4a9jVgGuBEEj8Jmkf+n9+nDZh+zwOzbXL4atwVyOLdN01SXBUMX8GikulO9UTWfjF+F/q57bAs0wDj5oq6ffPWmEp05mM21i1+yRLCfhtuFKyzPGRtaD2NsSMVrJ9fK2QMbLqCww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716886980; c=relaxed/simple;
	bh=UT50/JrGRgfVnT4Kt3MLe1OcDP5n1BmeFncUe/7wAuY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vD5qFcIpQsdH7BUrG3dB/8b9xoznQ+INFv+YKRE/QeHQrNU40VBBrbH2kh8bf5p3baF/vsSU4TIGfqnDRMEjC1GYoe3QVrLCgFMz1OjA3RdtOxVRR8A1Tt/dPrQtfOryKbIGnXxUNRWqfMT7Hye5yvCA0zlPDGw/UjEIhkq3UmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtODKRWd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11692C32781
	for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 09:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716886980;
	bh=UT50/JrGRgfVnT4Kt3MLe1OcDP5n1BmeFncUe/7wAuY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YtODKRWdNnGKOuHyTSHwZQbNx0tFz6TY8dzR9JWBIJYjiLKbcutiniI/N23yZ9jcJ
	 dCQ5z+nm1K27tXhMxb1h2/2YPS50ugRXc4BfKKqzZ8PoygajhCj4niXcMhZ/K/8XjB
	 QC/2d4G5/lPjvTMCKyFOEDnHND00UMO2Rd/TqbimEhXDhQicM2sEr5Fvip7u2S8FTK
	 +sD7oKLQ66iXj8VHAx9nnJwogXHWApU5oDFBSmKXpVqRRZbInhXLnCycUdF9OQU1K2
	 /sTP8yjW9mzuwCVQyfQwTbMxwIORmiX0UcHdacjwBkOak4PBOq8mdqO95qmKtRe59n
	 3xu6nlE/gda7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ED974C53B50; Tue, 28 May 2024 09:02:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Tue, 28 May 2024 09:02:59 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218890-208809-xBu6ztdSu7@https.bugzilla.kernel.org/>
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

--- Comment #4 from Pierre Tomon (pierretom+12@ik.me) ---
Created attachment 306362
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306362&action=3Dedit
usbmon_6.6.15.txt

Attachment added.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


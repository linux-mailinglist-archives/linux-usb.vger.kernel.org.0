Return-Path: <linux-usb+bounces-26056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65913B0C8DA
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 18:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C8D716C99E
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 16:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABD22E11C5;
	Mon, 21 Jul 2025 16:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYUoEWpH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E8D2E11B7
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753115560; cv=none; b=suOwr7XBFq9A/24mAI4ukux2B5lHbtKCmUop4eZw9dkR1QC2POQDWaWrXxkQK181zzOYHXa4CG+RoSx0s50sUHfkzi+Fo8yoxwu8Nd9Ys9Gcg+kj/mXwL/Mbe6EfZfhSkAyVvi1Y0yg7Eev5l5DxyzSV3QE7Gr0CcVfZ5r+DYj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753115560; c=relaxed/simple;
	bh=B6lcUStqefQDDHSgR4HItYC/BP5in6SxHymQjic0ck0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oyf2u0TO1TLTDyLxVg1NdZYL+yLJIi9CqYcikxMmcdJ6vqkHZ442xyY4OTSLrwBiCL4Yk7niCZbRhPm4AxpGaD8i3MIJzIcsgQSbz0vuREgU43F3b8MJVO+16tpl0/pRDOEOo11X3s/bX3DhlseZnOUJ1hOM9MFV6jqjW4eeB1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYUoEWpH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 391F2C4CEF9
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753115560;
	bh=B6lcUStqefQDDHSgR4HItYC/BP5in6SxHymQjic0ck0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TYUoEWpHs6BqKLzm+NqFyj2EirXT4dQSkx6oaSMuHBinIPgqQEJbh9Yl2lET7Lyt/
	 QcPOX/aaJWFGHtyq19sotHeMmfIBu729t5jO0R0fF6qrcLjUoLhzlMMW5bHiLGmMWM
	 Opkluf1oNGHlJge9gaFqXCU/VWHCUBuBSTv8Th562pK3kO22l0r9aKH0rfKDtIV0Py
	 N7g7iaIHZ66o1Zk8m6h+AD49A5THd3EooicyXtcv6oLn2gFpdYtTTjEiBMKbjKOLbb
	 WngZFKt2hNNonze8Ge0qo0lANskdlT3d2R3kicErrp9MPkO2tuN5BSWtq8OIYi1A1W
	 GJEptfL+EIE1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 24123C4160E; Mon, 21 Jul 2025 16:32:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Mon, 21 Jul 2025 16:32:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fewspotty@protonmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220238-208809-pcNg135fw6@https.bugzilla.kernel.org/>
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

Ryan Walker (fewspotty@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|IMPLEMENTED                 |---

--- Comment #12 from Ryan Walker (fewspotty@protonmail.com) ---
(In reply to Oliver Neukum from comment #11)
> The bug is marked resolved. Do you still get the issue with the latest
> kernel?

I'm on Linux kernel 6.15.7, and my Blue Yeti microphone still doesn't work =
if
it's not plugged into a USB hub.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-20680-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 007A8A36F46
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 17:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 129047A52D4
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 15:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449051E5B98;
	Sat, 15 Feb 2025 15:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzWS+kHb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C009E1E5B8E
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739635091; cv=none; b=tsJcOn1lIQoItG0C6WpcjyEdd5iP6cUr+EcY1ntHNhBTO8lpugFdijipDMVY5RJnXoDD+hChDeIxzKWNThWe5ny1J+K/e1B8iEfQmI+TITBiBVhaB4a9uKgWT6DD4VsOMvgBL+fo4KVJp7DjT2FBmk1DeOhn6Nf1fm6iFb/LnrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739635091; c=relaxed/simple;
	bh=y3oAy2J0Oul5q8Wz0r8LaBoi3tRrUAG8vMZ/I2kJXno=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZGUYu2oy11p8CnZjvatiWtb/GqKpLWfIgEm09Zt1EiZmrCFl5sgHximXEKWS8uYckZo5dPxE9J4K336D3XVD1MUbKAt+K8T5bH5veZbq6HZCjWnYtzKbeERnjU/eXtgbtAGcLwalPVqykDdv2sW9ust9J7lWeCo8Z07zc14GO6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzWS+kHb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 324F2C4CEDF
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 15:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739635091;
	bh=y3oAy2J0Oul5q8Wz0r8LaBoi3tRrUAG8vMZ/I2kJXno=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hzWS+kHbtFMtA7qD7rzFSjQyuNfSC0uIhg1u2jDIYxhUQ3zpzvFe2phnCDiS2gjcM
	 LsbYw2C1heoDafviaPiAOLH4xqYxeB1fvpE/ljURwOTgDkgOM91R9bvC702b8clJFm
	 uhE09rV6i+qNVOzTNWgUBrcPzBZSLWICKv1cWtkN2YIOEAyj1DVwNG/cfH51xqKpFn
	 3ilvavfkjWUBiQFRIm1stH0ZRrcJ9GqIy5ToYzFRUFGX5yOftALrMcuYZbZD+R271r
	 2cAMAJ7TFTToeUGr0vmwKC+V7/StMrghog/pll4YJ6FURzPSQjzulrwvH/ezDb3IsN
	 k4bR5PU9O7KgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1D1D5C41612; Sat, 15 Feb 2025 15:58:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Sat, 15 Feb 2025 15:58:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219773-208809-8XfJJw2Bva@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #8 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
> 2. When I try this command line, I got zsh: permission denied:
> /proc/dynamic_debug/control
You need to be root for this and sudo won't help you without extra steps:
https://stackoverflow.com/questions/82256/how-do-i-use-sudo-to-redirect-out=
put-to-a-location-i-dont-have-permission-to-wr

Once this works please run dmesg again and see if something new shows up
between those "reset USB device" messages.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


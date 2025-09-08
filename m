Return-Path: <linux-usb+bounces-27758-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C4BB49D46
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 01:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2112816BC9A
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 23:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3071221ADAE;
	Mon,  8 Sep 2025 23:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rye8zup8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A992D1E50E
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 23:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757372689; cv=none; b=Aa1hxMpcC50Uoq0rfo4nAMyrEHPkyjpHl1QhNcOesPs1Yk8/Z4sLNvikKZlTeW6v9etWewcqwI0sMUTxi/16JtNYn+H0oTJt53KY6hIuYFH0tNrqPYebn9cEPi9vmZoJezdfMCr3WDUjJ9CaXpC2zoI4/7zG+IgY9FdGg1KP994=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757372689; c=relaxed/simple;
	bh=05KH2X6GaXFYLdWV5DNn++XUMvikLw9XFJwTTK55OTc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mwmeGYj1bDtapwUJ0G4VfjHy3jZnJe2U53rL+EkKmATfDaSaqEsulcuGKN8LAj2uOaIyTS3Wv00CXpb8clx/YJ+YhSz1rfN1sXYISckadzk/fxQg0DBGPbjtn2ztpABZ44dVIp6KpFPYP6qnGRIDmUD1WrFd9B+UV02k22SICGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rye8zup8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CC8CC4CEF1
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 23:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757372689;
	bh=05KH2X6GaXFYLdWV5DNn++XUMvikLw9XFJwTTK55OTc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rye8zup8lQsl18yJJAZ4IZY0T9HDsVDrAC9Bpe8HYYgKbCnAX9Ok1iVdd4BD22FB3
	 nilrlBg1n9iCgYI1kLzvm56YI6pIEuMYc14wM2r8t1ZGTxWj+gB2Ssh37EIYgNlxlG
	 ZtDxEV5e1pQyxvSIpzAZkGlaEuT6iJHi3ih0SROKbFmyicZ96Vsa4x5fhXw5wzgTNm
	 eZRifbGYIqkLpjnVpc9Rd+fQNzYMB/30wphUvjzobYiwFEVAsTUu0wpajPjXcDM5Q0
	 v7EnnBqYPMPOU5mmYtD+eKBAckCj1gahuAv0WRdmeD8Y/ZAJd8YGMNCTwWiG53HWAq
	 O1KLeu4OUy9Sg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 20002C3279F; Mon,  8 Sep 2025 23:04:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Mon, 08 Sep 2025 23:04:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-kioBseyPrL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #49 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
I will try Mathias' latest patch once I gain more confidence about what I'm
seeing. I don't want to again report success only later to recant.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


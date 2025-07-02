Return-Path: <linux-usb+bounces-25390-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D88BAF0ADE
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 07:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C95F84E0D03
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 05:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AB620D4F9;
	Wed,  2 Jul 2025 05:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkaTpPzy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8BA205AA1
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 05:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751435299; cv=none; b=I9wIwmqHoQJczn7ZmnHDNM5Q/sIfZ/tpPx+J5V7Z562EsmK9ulf1DXMt5HQEZzKp55dbs9zY8mqDDam+6ePEjwqXESOzO73jBxHFmzM/53LZ3Vpb74je3E6didSszpmred7O/GJTozA2o44S2SqCh09zvXrOmD3gQAcYNJcPDvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751435299; c=relaxed/simple;
	bh=qIpMsn9xS5LtFFIZMqu0PAvLc1Q01ThKXuZ9iU69/aA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D26ohEtZtQb0sqRNauA4nrrElB6hPlWJJq/VzQMMlKnxbhEkouqlS3kYytBEH0LIidplcb8cvPDC7/8xZTaKU2fkp3NCS9Kory0Vpd45edYOLAdlQqSKiGmVvU00c3t/4iudSB8g4Kykpss38AtPnc2U5u80Hj/llQV1axtTMDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkaTpPzy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CD45C4CEF1
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 05:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751435298;
	bh=qIpMsn9xS5LtFFIZMqu0PAvLc1Q01ThKXuZ9iU69/aA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IkaTpPzyj8alBT2JCnGClukQ6W0GQCph3sdJqLSXcxkifD1oh6xOufC1hs92LopdS
	 ziZQ9zK9Un2Xg0oSwfTVAwopzWKJYFJ8HZmmcZCH/H2oUT5aqzSP1CExAgE/+uKFGo
	 gis5P37TtXaZsMuWsnHqSFu87rGiZQAkHYg5eExQxm2NVULYZ4KnKJ6NptZ2OprD7W
	 kvTJVBTb/v7goRFcqqyb42JbUSSYUJr3yf91n0WDE806FnL47EnQL0HB99zfU8e6kt
	 3vCmQCwG0N2+H/aGpw8T9QIj9xYVDPh0lw+Iy56I0INzQMzh9B9UBTr5mgwJ9skBVb
	 KI8YEh8FTSW0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1A730C3279F; Wed,  2 Jul 2025 05:48:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Wed, 02 Jul 2025 05:48:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.seyfarth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220272-208809-GbIENARMP3@https.bugzilla.kernel.org/>
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

--- Comment #24 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
Created attachment 308350
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308350&action=3Dedit
Trace working memset

>Have you tried using the mouse on a different computer or under a different
>operating system?

The mouse works fine under Windows 11 without any issue so far.

>Also, can you try getting a trace equivalent to the failure one here, but =
with
>the standard memset implementation rather than your improved one?

I've attached v3 traces from a Kernel with another optimized memset present
that works fine with the mouse.

I could also try to test the non-working memset with another Sharkoon mouse
model attached to the same USB slot.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


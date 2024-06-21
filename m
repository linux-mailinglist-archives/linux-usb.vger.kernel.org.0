Return-Path: <linux-usb+bounces-11525-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBD591186A
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 04:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87FA31F22A75
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 02:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5CD83CD9;
	Fri, 21 Jun 2024 02:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mdth8ysO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A67625
	for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 02:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718936654; cv=none; b=COZlXG+FQmyjEdSMxFcPOMx5st/Ghn1S/Rm63V+SYMG7+oZPolnRbZKqVKaD5u81R8qo49zMcakYfTsZ3SFLjQxaEj7rIYGvpKDQvuYpBjkHMjm2Pv6/fat2Ia2l8fZmPHhR3QMrbVvkRqtbcie7I7CeReVvyAmy4m5VbxMP6v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718936654; c=relaxed/simple;
	bh=HMAlvFP7AkEUYUS0aWhPLsP8o6LFJWCthDqhqdmFdYk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kMeMvcYeRjxUk+LcuXEzWcJx9ZQHD0ymkZajLor29UjC4Doax6MCxlM38Xe+lPNtGVG8+rPzb7xpeyF8X70saV0l6YrTI40/Dm6QxCaJqSXIIehKI87OwbHS8bDmVENGQvgq/k/jKIBjp6OxkY1vXauuUWp+5uOEio/Yo/oSr3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mdth8ysO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AE03C32786
	for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 02:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718936653;
	bh=HMAlvFP7AkEUYUS0aWhPLsP8o6LFJWCthDqhqdmFdYk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Mdth8ysOJ56gTb3dJnxHzhHfG6rHYAmkLRVzmXPWS+r8URd1TucosmAVNhV5xkJ2U
	 Fwr69B7xjsRjRVanOA2BdEkJ7ahBbgZN9Za4QmjmPxQRG3fAxIRZJWFy+Pa1z0HQa8
	 FUfheO0R3vlYM9KrMp7zPQrTFe6oguEUka7DGfiPXLYgvFPpfxvKLkta0Q3qwxEiIv
	 FVYWQZm7C1sXZWOHUeO3HlWq/MWgjp2U23de1OXMNSwvzPgihSZ7dI2nHDBfL2GCBJ
	 Y8fuYFdgFTsk9Ol1fM2s72dWnSFAu/GsOAsPHfc+HhfDBQat7OyK0ka2TIsJ2vzsj3
	 rirfARwrg8UFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B2A2C53BB7; Fri, 21 Jun 2024 02:24:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Fri, 21 Jun 2024 02:24:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-u8V53GmkQx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #32 from Jarrard (jarrard@proton.me) ---
To conclude this bug report I have moved the OBS server to windows as a temp
solution but would like to return it to Linux eventually.=20

However for that to happen I think 10Gbps would need to be manually flagged=
 on
this vendor+device ID with some patch.=20=20

I have tried the suggested PATCH set already and it allows the HUB to conne=
ct
at 10Gbps but the device itself remains at 5Gbps so further patching would =
be
need. I do not know how to do this.

If anyone is able to help with a manual kernel patch to test other then the=
 one
in the comments here then I'm happy to test.

Thankyou.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


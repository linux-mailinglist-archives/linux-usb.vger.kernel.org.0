Return-Path: <linux-usb+bounces-21406-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A93CFA5416B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 04:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C99F316942A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 03:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B151991B2;
	Thu,  6 Mar 2025 03:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PufklQD8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB76367
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 03:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741233234; cv=none; b=Eve5vxbZMU8gE8OOtPUo77sMOKwLpZgdQGXDCisQQWs0O2UB+qabufRy1wSGdXp/rgd/tjqjiRyv0HqS0THRLnSbOrr9ldcTHcBzsW0WptoKEYOrfVy64FZ23DSMzNgO2yIdl33JnBmVujElFwyJMilFnU4GESj1E/9BuHGs11c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741233234; c=relaxed/simple;
	bh=j+dSjdp4HexPTlY7PEAqklJQsTAInB97Gi+TCpw2VSo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CfXuSXaEdOsWEOaHr58+3tcl5/z5VqsFt4vA0ZtT4fUuQB6y22p/vvMR1yvrArsT1iIt/NAnih9XjTB+7D8JnUnxDVqwQ3rIG51FFyk0hxwb39hm6ls0nD6hgiX8mmRKj0ZeNFz3NkI505GLyhLoIRvQX0c/Eje2WAqtxn+6+as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PufklQD8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33BEEC4CEE5
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 03:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741233232;
	bh=j+dSjdp4HexPTlY7PEAqklJQsTAInB97Gi+TCpw2VSo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PufklQD8OfqgK3rwh3x8X4edURucARNZj1thqRM1B7dzWBcHSlFNTCwF7c/UD93DC
	 VsnhgwO40kACJN+7wIKTEel3k2iOEQD4jreenBpWDxrGfqVkJKOSGDMlmz1ffuoXkK
	 CDn3TdpuHswqZ7bYEuxEt6FG9hQdwoj1ON7h2kqUuJYfgeLEb7sLsfgm2INWPzvKdC
	 HGSEv938JU9k82hAKhKKkaETnwknHLfB4ukU2TnSCV2K0A3/ufYakZ7ss9bzp30XyC
	 nG9rEQfiKR5VIjaCadoM7cNR0GiNyhIwajXypk0EIUbGevqmrbe3G1QFiw2W+wh04i
	 WJwy56BR42gLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2287BC41616; Thu,  6 Mar 2025 03:53:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Thu, 06 Mar 2025 03:53:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-1NdxFgCSgz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #28 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Do those same failures happen in the case that the retimer scan was totally
commented out?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-22490-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D7A79A40
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 04:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 614671894E23
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 02:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C422D18DF86;
	Thu,  3 Apr 2025 02:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTziKU5A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B5B18DB17
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 02:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743648960; cv=none; b=AiB7GQQmTWSpi3fWOp7jhJ4JBipmozncgMac/jU9ckHxRzJDyLeAmsGqaJckE3kb9w7jqD2/BFm3jpBEscE8Pql01MQ0vaRAS3oDiYWxsgx/YQjvCyijvK9paDuvISRC5GWC806yUOf2F06uWQq6Gb5iIMRnxiQ20WF9rrcpLbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743648960; c=relaxed/simple;
	bh=MhxAct04vWpcqf9WPI4B+xjHNoh9Hd0ZWNG+Y4WDqoc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CqH8I9wV8qpz1rnYnuoi/KHm9+cJyiB0deE8IO7v159SG1khKGI8N2CwDC7Blri8+zOXMk7aqPkiE30Kuni1AVCYEGNLFyVcNz21lnU1D9ruicHZ3aYrZxPCW5ueH2afvadyIRCRzo4d6y5Olr+dr0gFhhYIrcnD+aJzGtpOPHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTziKU5A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9A0CC4CEDD
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 02:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743648959;
	bh=MhxAct04vWpcqf9WPI4B+xjHNoh9Hd0ZWNG+Y4WDqoc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rTziKU5Aensi52Zm9ZtTreiWZL6/NsbTTwpdCRqCrZV2aONHKudkhgBb1IG9GLLVf
	 W3Ycch3gsqPLfeKx5Xex645TgYXH0NRNIg+LpHRVIULp8xm9L6bqJ4vH3/DCWLE+S5
	 FMSkWOZYf8H/4uPUP2VoOIiBZDUuhYnvAuIwcmXB9W5Vw+pLnC5uMt3YJH8GZKKVYn
	 +GBjzmpICd+lCxaevUysB3iu2JVcT0rKunXVAR5TwrvoeCGaBhvs2DBj5+tca/RWls
	 G0+WJsqWUpK8FtHSl8PcloIPdb2K06OI0k+YRrylxYF9zardGKWajneGlA2y71AMAo
	 V8IKdX/z4M3uA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AA4F5C53BC7; Thu,  3 Apr 2025 02:55:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Thu, 03 Apr 2025 02:55:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219748-208809-t0iZG9VbDl@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #35 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
It's upstream now, closing the ticket.

https://git.kernel.org/torvalds/c/75749d2c1d8ce

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


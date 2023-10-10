Return-Path: <linux-usb+bounces-1393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9417C4566
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 01:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CC751C20E45
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 23:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FD732C97;
	Tue, 10 Oct 2023 23:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFmLlTof"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D4D32196
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 23:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBB39C433C7
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 23:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696980232;
	bh=/Fo9cxYhkUb1rvaQihU7w0VPmM1C88AOUqdyzuMSHAA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MFmLlTof6C9ezNdyFe26opuUs2AtCAUSuHRPvn8+PnwEQ7eCsJN8Pwj+HRSHUChKM
	 4c87+gLuLeZPqdlcZ5FSOSREjQJkQqID19HVLiYWMCQupLnSFvWk2dlug9HbW0dTXN
	 Hc5iuHw5/g8qAcB4s/n/2ia4bjfqxioQ7yxgSS7OujQ2Q04McPpwPrmgCU1MIE1zqz
	 4kYseTvq85WKO0C8W7WonmPmneOcCSG9JWp8j2z1KpC++A2L2tvWBha4Up9P6CEk79
	 bulurOy9ApQ36RNJWYJR06D5kugbuQbKkNxw2MohTT/cZ4OD7uG09aEChnxc3/5k9l
	 t97S9gemG1afQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D01E4C53BD4; Tue, 10 Oct 2023 23:23:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217915] System fails to resume correctly after Thunderbolt dock
 disconnected while sleeping
Date: Tue, 10 Oct 2023 23:23:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mark.blakeney@bullet-systems.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217915-208809-7dQ9q0hQqS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217915-208809@https.bugzilla.kernel.org/>
References: <bug-217915-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217915

Mark Blakeney (mark.blakeney@bullet-systems.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #12 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
This bug can be closed since the patch above is now included in linux 6.5.7
which has been released on Arch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


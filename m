Return-Path: <linux-usb+bounces-25415-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAB4AF5FD0
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 19:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50A7F188A545
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 17:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C289C30115C;
	Wed,  2 Jul 2025 17:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TujIKPls"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4900630114C
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 17:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476843; cv=none; b=JOATi8r0bAV+iBK6Wg7fedGOnIUkKp5ZnIxjhw32meT3HYnYrlG811NBKzrF+PBU9CpsLQDRm/L9mMTsoMyhSR1bEh2w++Jm2JcOtoNbJiqrpY6B1/MUc2wx/zcSyvnRNxLQQ8xbF4N2clVrjz0svHXyNuPx1A5wZ91H26L573Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476843; c=relaxed/simple;
	bh=hBRsTaZN3yhbrtxDCnm/9im/m52mRlSQjlRRRmBUWFE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n2vNKRAc6q/ZpPdv8/26NsRzcmbc62nqFMDzpWJbLkiqyqU3qKs4qgEPNYvwj0msdCMN2P1OLR7BxR4hEB8lrYTg7whoCOqz5wdF1EH6aHT2fW2m0qRAehuOF5QlKdLrhYj+lZodwjkyIlOciW9d/VNgv21rRG0uRg0fdDKfNVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TujIKPls; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6C5EC4CEEF
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 17:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751476842;
	bh=hBRsTaZN3yhbrtxDCnm/9im/m52mRlSQjlRRRmBUWFE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TujIKPlsvwbH7vYeLkjjY/CR7TVp4JXWmgKpe0X7x0Pqlq+O/jJgr2nzhpmFX48dp
	 ln0mET9cj9WtqmLoAwJwZ0j0wu+MaVvBNWYi7tM2WRjOTn2Ber8i0LtvJgukLPnCvO
	 7cfJIP4sksBTUHz1EfmhZgp1bX6ZkxsrVN40KOV9bvEEedeh25Wur2gemXMUUtMBa0
	 YQbbmeZhiQN8v2FfkfeOEM0fiurM9Sra0I5BZDqgwzW9jdvOyHdIXodcufaZdqXUz7
	 SysXHzK2pTLfHZvQKS+kkjDHpP6YYIOpwhNLeNA0gRMcMldJyoUgV+olLaq5Kut86T
	 e91Z7t+dgk/vQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DF572C3279F; Wed,  2 Jul 2025 17:20:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Wed, 02 Jul 2025 17:20:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220272-208809-cgfXkOpydN@https.bugzilla.kernel.org/>
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

--- Comment #28 from Oliver Neukum (oliver@neukum.org) ---
(In reply to Alan Stern from comment #27)
> But if that's the explanation then why does the driver work properly some=
 of
> the time?

Memory pressure on the cache. Sometimes cache lines will be invalidated.
If you want to stay with the theory that this is a cache issue.

Your diagnosis in #23 is correct. The driver is operating on a zeroed buffe=
r.
If we are also taking #25 then we'd have to assume that two different mice =
fail
in the same way, but inconsistently and only if a specific memset is used.
Not really likely.

My first suspicion was that we are looking at an issue with HCD with short
transfers, specifically that te buffer is not really used and the IO done to
the rings, but I see no way how this would correlate with a change in memse=
t.

Do we need to memset the buffers to 0x00? How about a diagnostic patch that
uses another value?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


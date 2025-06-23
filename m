Return-Path: <linux-usb+bounces-25000-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF7DAE3A2C
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 11:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 353A21697C2
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 09:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC90231853;
	Mon, 23 Jun 2025 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVlhZXK3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C575117996
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670949; cv=none; b=X8Zy62s6j1xGSIkiEyfSmdTqnrPig5uEsrhiN1SRNATOiSrus+57NSo1LIEV7J6vgQ6zMyChMg3ZWsPS5wonaccNQmulwmWxKFOYboPvgvqDZIjuJOm2jdzK8vILbBYbvE2BDY14PAnr/MivMdmGQouGQ3TyzsBqkN01qGpH1HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670949; c=relaxed/simple;
	bh=QvmhfP1xZPUSjheEp8WyPkPjK2rJTLT0y6v0F4np5WI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AbZMIg8vaKRRJEVHytGv0v/5fr4E7wkF/9gELNvOEi8seYsjTB0Ziy85GAHy1CTmTckHRohCOa9zFpXBSo3HbC6/1FDDJi0oBqR23dAQQ7u7aaroVZKumY0xNFQ9+KK4JlUpCaRpGru3oro9sxzNy6sLXW8W89MjMgvpJm8/Q3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVlhZXK3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DC46C4CEEA
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 09:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750670949;
	bh=QvmhfP1xZPUSjheEp8WyPkPjK2rJTLT0y6v0F4np5WI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gVlhZXK3pZ/paeEWiREoBQCetnpYkSGbIKYEJWDW9HzWvvCjwC2yIp/T1etOqIMnA
	 +Z8kOL797j7Iti2FgRUyhGeZOoDPwSqKiXRdYuw6omP8FMAZZl82255a5A72wW2kLH
	 hIGcN2rpMoqqnQNDPPI1SiPaw04CDpzHn0ZkyJGW54ep25b4n3ERccypW+GXNpZe7A
	 s6EexHNIAOZICF+MHuh7jIkKeRv/U14QLM+TQg7f3CvD4C8IZSmOpphBfe1e0MmBRL
	 9YFRBiAgKcv9fQuKnDA+LE1f5Zui55Byb5p1AnmV6yc0ltWktwWyBEj5uZ/bUvyCNT
	 j+6CqXw/hzflw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 42252C41612; Mon, 23 Jun 2025 09:29:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Mon, 23 Jun 2025 09:29:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220238-208809-zfyZYUz6HK@https.bugzilla.kernel.org/>
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

Oliver Neukum (oliver@neukum.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oliver@neukum.org

--- Comment #3 from Oliver Neukum (oliver@neukum.org) ---
It is good that you have found a work around. But you were right. This is
supposed to work.

Could you please post dmesg of working and non-working cases?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


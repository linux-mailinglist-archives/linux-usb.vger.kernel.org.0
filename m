Return-Path: <linux-usb+bounces-12205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 451DD930AC6
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 18:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A3B2281A1C
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 16:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07D313B58E;
	Sun, 14 Jul 2024 16:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgWSsCmF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C91013B5AC
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 16:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720974500; cv=none; b=kRJEVmX5zyzO8dx8uxtf69PHCFUzJYQy3N7frDhvsSlyLdiPCwoH0Zcvh/qf2L4Z32Q8Ia2qRksCq8hPfiZtWIURTILBEGLFI2HlVrY8PYLMMvapEwCKv/mZUEH8ehtCAfgpDW0RCSDB5dZcS7q1kJEbjuG6y+JbL43HdLEsS6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720974500; c=relaxed/simple;
	bh=M/luMAAhF0h/skcMJ+qkSXX7d8o77qHRk9zjdFw1pX8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lJp6q3/6ABrqWF8LQq64NC8cvZ/keWz05wRHU2xQ+fDbTqv4g+nstVpnqgbaft7nbPxJt0J2dRaSRr/jomTlIKWLkP5F10ba1dLUgqYrL9TFwzNQO+uK5D9qo1SYaoNec4U5lyjNH77pnOjaOzgqDjXaotON5aer69S3VTwPgZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pgWSsCmF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E37ABC4AF09
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720974499;
	bh=M/luMAAhF0h/skcMJ+qkSXX7d8o77qHRk9zjdFw1pX8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pgWSsCmFx5s92EKqUswUIv0ulOwxW1hxigYCYcscDGIr6fj4oUbZ+xPzu97EI+eB6
	 OQnQOZXg8+E/Q50sLkXU5yCA0W6yxAlOllSlUsI7Mj/QRyMPc0HoddlnYukBdA0w90
	 aV1TdXByksVLL00xqmeVO22jzp3D/JfFeHK2Sw/sEi5SlZc3A28FEx4yKibRVrtuwe
	 XU5gwqwccAXdgXfYbro2JgFEpImzap1ZBUi7nzQemr68mTtdX2RUq3ptoph8dWcHLN
	 TIEQsJbyRaBM5J032Xzchv2hMXE7MXC2uD4x4ncexnARsY4tTIpA/Fs7elotUSc9aN
	 mBsU1QJZ0mY7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CDC08C53B50; Sun, 14 Jul 2024 16:28:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219039] kernel 6.6.39 freezes with QNAP TL-D800C usb case
Date: Sun, 14 Jul 2024 16:28:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: elatllat@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219039-208809-s1evBhwkxe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219039-208809@https.bugzilla.kernel.org/>
References: <bug-219039-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219039

elatllat@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |elatllat@gmail.com

--- Comment #5 from elatllat@gmail.com ---
Related: https://lkml.org/lkml/2024/7/13/328

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-20046-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59646A2652A
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 21:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20FAA18836FD
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 20:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4505720F067;
	Mon,  3 Feb 2025 20:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWQnK/F9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB28120E01D
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 20:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738616336; cv=none; b=l8HNN3HShspEFtkHtkOhXOFx81nj2yjWGbS7wv+F5v0wI2/xcH3n4p0JtXPUaQ5ZE4vhkOQkaix1DCbURaIvML/UHVAZYqo3g054GyYUTn7k8GEJ7LxAJpZmDtBiGtNg8oEf+KV4EaXiaXKcxOXCc47NJMZcwRq23fddA/O9kB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738616336; c=relaxed/simple;
	bh=rtBXQ6v54b2xyS5BQ+pzGOcgv+kUQUFAjjPvzBzQoao=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z4kIkVgRjBU5pXkwZRO47QKGQJQ45kXGdTzrmSSVJwF4YDp0FCg+eGhSe4+GyZzhDSgZZFTi5ycb/q2oOn47TOmbQ4KW+3OP7X3JJoAtgdiJKQHypEvbY/b/OG6pPlD/STh9/dC+Xit4f4buCQwQ25zwFq2Wt21TF3I5QS2OuHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWQnK/F9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24BB2C4CEE4
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 20:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738616336;
	bh=rtBXQ6v54b2xyS5BQ+pzGOcgv+kUQUFAjjPvzBzQoao=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WWQnK/F93YGQUCZkKkC6ggwMe5kFXOFuEE+SVF680mVZEYAHQft/JZjD5JnmuPA3j
	 cAAHVMs5X1oyP0ArJbLbbUvC4jB1ysAek52wMVsX+SFM1UM+hEwNppmchQ3f4lv5F0
	 +jLBB9E//JHN+WAaABSIn7P3EAPpzzwoFjjrI4+cmo9mGSUCBJYLxnplPPimWKcri6
	 Xc/U6lYAa2Fnmi7DjxAog3QG/xI6gLby4YNfBYVSiSJiH470hQPqifeRBFG/XNo9NO
	 Wzkg73r4E+17KDsd5O9pzn4jIzntQzxrHbB7YOMhOOWLE7o7kl0HycC+R9eZ5qdmFI
	 21kmjpeVaXliQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 19B99C41614; Mon,  3 Feb 2025 20:58:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Mon, 03 Feb 2025 20:58:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyz27@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219748-208809-64X077J2ah@https.bugzilla.kernel.org/>
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

--- Comment #1 from tom (lyz27@yahoo.com) ---
Created attachment 307570
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307570&action=3Dedit
dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-20659-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E25A36677
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 20:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC5D01894AE9
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 19:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F5C1C84B7;
	Fri, 14 Feb 2025 19:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwbztW/p"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD731ADC7C
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 19:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739562601; cv=none; b=OjFimBTrvOewGa6elTRkmYeYvoEdMmZfq9faJbr8fWuk2dFIR9Rx7qdQY7+k98BplLYsOR9RWXWZxtAvihEyBv6Vhfb3okYEvEVUJ/6ugGCL86EBbqSz7C6qIKOmL0ZeqwTDnwWHiiIx+9SXVm4E2IieHymBKnYtZloR67wsUNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739562601; c=relaxed/simple;
	bh=bUgUsrhKXiC3h3Bib3b4i7MOs2a+MVwKVw0f4HxTW34=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AbPR1+IeJgaTfJhP7MmZnF1KzaZO7igAkamkq9btksZKbq6fptFyq6cjGw1EzWxbGtF2S+gR41K74lRXWnqnhHDq5nYV7YENlTdgGuKvGycx/5Bxj+FwRxWHvMXoDlZ5ywU6D/WpyfmoAnZUDgZBZnR1l1D9bfv/6OmL4b7Aesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwbztW/p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AB51C4CEE2
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 19:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739562601;
	bh=bUgUsrhKXiC3h3Bib3b4i7MOs2a+MVwKVw0f4HxTW34=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WwbztW/p4f+JYGAAeUpsIknt7UjAjuPKn8qD66gLCEq4+aRBcORGd1J9zB7kddLXg
	 G2d43eHSfzdsZI32Yq92KkUSNw18GiM28jj1Wm/MeFZqcsUa0SeqSorb8xItrpZ24n
	 sEZfhVer+prN9W3BlzCbYLJI8KP5glTI/xDOqBYt2SX1n/CRj1VtGfCR1o+rwtqMBS
	 nH/c8gsZ9cv2qb1iGJc+zSLiC6ke6DKf96EX5gPqRziVTA5T/zVFjmeSKi4CyQL6r1
	 8kn7MbjPoUO2WYUMqo7qeajFl3D4tuvjyeI+waGtEpBvkGscHF2Xc663cbzY2wkraE
	 og5zqb0y1kEfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F3261C41614; Fri, 14 Feb 2025 19:50:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Fri, 14 Feb 2025 19:50:00 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-7d1RZk0ueh@https.bugzilla.kernel.org/>
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

--- Comment #11 from Thomas (lyz27@yahoo.com) ---
The dock works with the skip retimer patch.=20
Plugging in the dock makes the device connection sound twice from there:
1. plugged in ethernet=20
2. plugged in usb
3. bumped the cable and unplugged the dock briefly -- sorry
4. plugged in an HDMI monitor

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


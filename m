Return-Path: <linux-usb+bounces-13147-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 369619494D8
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 17:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66F2E1C23106
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 15:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AE53BB24;
	Tue,  6 Aug 2024 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsfrUzx0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC2B286A6
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722959448; cv=none; b=nAXj10en5uSUEdJzPGhkLKRfRsTiq9hdUG+zTWkWmbnHoKmi4529dckcxhAi7NJ7dgdJiRJOPDYKXMlANXNFt19pafldmb+xnBfzytMBhwJf+V+UaM0GgW7ObR/9Vy275SUVcnbTqkqc6C8bX/2QhyKXuKKkHrS8mHw5GWpM090=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722959448; c=relaxed/simple;
	bh=s19i1jupQFLy3B1W45vvJhMI8DlCEFC79smP6FSj02U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BwEMIhQrGxhpHfjYJHeMv+PONnB6XGNrZ60zuKGVyoIKDEEAYSmoc7UN5Jk8TMOd7F6Qu2Rm7uivnAU0D8qiEetHrJZjCLgj4s4QcEqsJmOwdmEGwIIOcVzn4/bV+YhT9XPLSKF+f9QN1atBFQ4B+Mv49V60+7e5a6SBcU42uiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tsfrUzx0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C356DC4AF0C
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 15:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722959447;
	bh=s19i1jupQFLy3B1W45vvJhMI8DlCEFC79smP6FSj02U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tsfrUzx0UhgKTOAA7+Zjokzg/DVrAQvCRg7/AeuadyxPR4z3iB3mE8NbeqSSIbYW3
	 NGl99JVZJFy8rXiqfK6Y2DVvuMu3ZsPGaSizP+mODZazp8qcY5/7rpAqq5PZgwynTE
	 e3SJVYMA1T/xhsTYqWrtlnJx6Kj9LUX6mK5ibxGvVEckMYSnQN6Sa1ViZE5i43zlkG
	 Kft97dM2/MZSraAqZlCCXV6hHbq6cSmX6zxWposlXxRuavP0mSwNCYkfx4ZS25cGAD
	 773TWADmb2+yk+yK1fLWD9syS6+e93Cld9P0Nq2wzGEE5wbQLOyI87YxJ3kmh+GJqZ
	 3IFk38eUJGKXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ABA9FC53B73; Tue,  6 Aug 2024 15:50:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Tue, 06 Aug 2024 15:50:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-tNqYUkC8M9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #30 from CH (com+bugzilla-kernel@c-henry.fr) ---
I also recorded 2 minutes of USB traffic with music going in and out all the
channels using Mixxx but it weights ~60Mio. Where can I upload this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-6364-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 928EE8538D7
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 18:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E301283A27
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 17:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333C25FEE9;
	Tue, 13 Feb 2024 17:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzEGd3/X"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF66C8C0A
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707846365; cv=none; b=FY9e3U8jrjtgLDg4C4F2ci7ifd9S6nHhpAVNJMBCWs1gihQCrE69aBJ2Cg3OHufH0ubVlBnIL1vDSkHJ8EXPX83Q4S8fyD0O8uHgUqxEzwLCafr7dxuSJFJ4lc0oZozBgbb0k5HM34j96WcrCRHkp3yg9H+wEQnSkVnMcu060IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707846365; c=relaxed/simple;
	bh=6iDTrv98PBFN/k7yGcf1lF+liWJ0EVNVC5HIsU6x0GY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oS6RLGqOFYsR0s4pOKCZX8ow6DHrPhKniLOSjRx0CY+S5HvJfFhPRq8wbhyv9zIgfO0pKBp0SuTE4lootQNNDZ75ddajLCMEaBH8+u/2oPSe3JESUt7H4xKrraYcEsyjYYnKVW12vUDtlPhNfcWZJJuEIBImj1+xUh1kvhv6dCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzEGd3/X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32C62C433F1
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707846365;
	bh=6iDTrv98PBFN/k7yGcf1lF+liWJ0EVNVC5HIsU6x0GY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dzEGd3/XlwV+tCjYQyATSFQDqYHStVh/c9Cc6P6G0ofD4K9G4RgEBwWf8K8oDd/4Y
	 emqCWhT2vtTtHu8dM9CAHVe/fdR7lPIUdZVtE8g1bedNqjlYKRU2g3sM/IbCwL/Anh
	 jBNS39B/ojtGoKigVa3WxAX8/87n+8WMx38vi7I/iVEkJ+fYLn70YwlE+aLKm7HRkT
	 PwP++KEJvYPNPvwQLpx8CgFr/ZpObC9dfjB0gx/88bRZDoJibpFXZlhaPSgB+rjtHx
	 u4/spt/517GxKoRb/AsrVQLzUAuyjzpbVawIpkhXJnHSj8YSW7M0aEuq19ZViGqdNw
	 gV0AWz4DfX+nQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 16C95C53BD0; Tue, 13 Feb 2024 17:46:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218490] Linux warning `usb: port power management may be
 unreliable` on Dell PowerEdge T440
Date: Tue, 13 Feb 2024 17:46:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218490-208809-G31VxPZfYS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218490-208809@https.bugzilla.kernel.org/>
References: <bug-218490-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218490

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Can you please stop spamming bugzilla?

Thank you.

Also, does this message affect you in any shape or form?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


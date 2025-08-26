Return-Path: <linux-usb+bounces-27300-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 038EFB35A37
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 12:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 666DA1653E1
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 10:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFAC30BF64;
	Tue, 26 Aug 2025 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8qOUzkP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFE63090E8
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756204877; cv=none; b=jp8RI2u92vpCQIWe0HqK3Y6XJ6djukZEYXZoVUH4w5z+eu7yDK4ljZ95UkWV7DumdYxuj0VY/crVVxZ4kJ2cXigvW5XuLrljwnm48rIg5Idac5sKxNViNncKxMyQJ+zKpNKRXq25b1bedStHGA2sbb3a896pIBv8xnCOd1OyLT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756204877; c=relaxed/simple;
	bh=Hua/Ogxv7kYVa+/I49tm2lbKEtd+LcDkgtmY4/cpXF0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oWa/83WCjIG/jVG73pRxImrghkNHXoEXb831OvmM+zQKhEzMPa+rI0s94/eJEUg7U5o2RvI3DXlfUiHXdiVZv52dybrmlTd4JOMLe6rVip8WLlpVgnbmnhCAox/WIZ9eFvf0tupmtJ9TWz65a7wUoTwaJ09J1x+4Ll/0xjYadVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8qOUzkP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42A2EC4CEF4
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 10:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756204877;
	bh=Hua/Ogxv7kYVa+/I49tm2lbKEtd+LcDkgtmY4/cpXF0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=g8qOUzkPW15nQIT4OQA76eLsul9iIjpYkpodJ9m3SWu2ZkMDFTbPQvD+CL76REBSy
	 BrHa64SFCcgY3Q5aDC16ph+ieLco7ebPzVMlyNpGDAJn0XKnHk0OwK6o5jU3PlpcyQ
	 U/mCHOdbsVd3R0OPUv3zgp+0yYikP5GJ8So072oM+QcJTuxT1Vm3cH28AJ17pgYkQ0
	 y2eISXwRWr4EQ4+5/th0qhHZS9QhZEGwpC5WXUWR+AlKM9y5CBVwblCx5uublkEvNz
	 eryKZALctMpND0bj86YnDc21BHMIdTH0XiD6GrZjWyyPD2M213H9Csun2tI1wnzUdJ
	 7qimg+KopaUCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3356AC433E1; Tue, 26 Aug 2025 10:41:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 26 Aug 2025 10:41:17 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220491-208809-Zr0xHaRYoR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

Oliver Neukum (oliver@neukum.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oliver@neukum.org

--- Comment #2 from Oliver Neukum (oliver@neukum.org) ---
For the record:

The issue is not with UAS, but at the XHCI layer.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


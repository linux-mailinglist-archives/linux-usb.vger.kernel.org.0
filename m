Return-Path: <linux-usb+bounces-2976-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC47EFB33
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 23:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF3EA1C209C8
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 22:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8DB45026;
	Fri, 17 Nov 2023 22:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nifmbFRO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A3B4500E
	for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 22:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C823C433CA
	for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 22:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700259194;
	bh=KvjV0iH/nS9mv6C1HfCDTn5XXf/xgosF8UcgyXKmuBs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nifmbFROSyU635p4/9rb+sq6tEgWulREaDy5ZBll93TCljRd532opaVbmh8Vc577x
	 X/VsA8Cs9R5/6Uj6DsipN0snZTgurZbbVji3fXpJwF/xWep2Rcc7U9VVm790Yf6DOk
	 NKnia71bZGxC3lJSEquVQUjskZNHo5Kp7QZKvmSsXVYjLhn6isnHmYSdiWp1IXOmKl
	 88WuBCXm9DlB3RTzrNw0mhiH16NXLZnYocmbUQ0ZwQShpdNgToLzSpA8fO3Co8pgI2
	 9yqK4zBdzmObEzPwcJppcLcpvCcsiaAnk1wVu2Qy7NZ7mLkvCSjGLyZ8sE9koxWw34
	 dtVjcYuaW9Bpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 253E3C53BD5; Fri, 17 Nov 2023 22:13:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 17 Nov 2023 22:13:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ferry.toth@elsinga.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-bsF5DTeGrS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #14 from Ferry Toth (ferry.toth@elsinga.info) ---
I see. I was misled by ? hub_activate, and  hub_activate calling
usb_submit_urb.

In any case the traces then show the problem is likely reproducible using a=
ny
hub.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


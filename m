Return-Path: <linux-usb+bounces-26125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BAEB0FFE4
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jul 2025 07:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8905F17BEFA
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jul 2025 05:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC2C1F4C83;
	Thu, 24 Jul 2025 05:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ei2/IRbF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96522A1BB
	for <linux-usb@vger.kernel.org>; Thu, 24 Jul 2025 05:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753334536; cv=none; b=tX2JNaLF/rbJkFVLAt462q151BvGANoS2tO54c9f7L+Lr87PvobqAFsskGtEDbvapk8+tKCHt9YuKX+q1M7tjfBJJDZF+D+1umdWh5zaU/nCl1q4gf1/Cy1zs8hGNFts9mB3NAp8eOerXktKBz/L6wgkvNgjPMZyEQQvzyFhnJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753334536; c=relaxed/simple;
	bh=YZ7Mkp7UlE+8uyHT4JILy4H32xs+PjoM6WRW9CKu3BI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P615drLLvG6fqTn4ZK33SzUcsRpAZhWuznGqsDtescKD7nt3CkckfxU0eW4tuzfux604b0kJV/Dq+uEY4iRExnDI3gxB5NdBrtR8Xvx0w1/7/QwV29bRhy+WCqd66GH2b7ajj9olIXLtyijULDh+SXo4OYJQxqqioStUFvYt6bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ei2/IRbF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22B39C4CEED
	for <linux-usb@vger.kernel.org>; Thu, 24 Jul 2025 05:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753334536;
	bh=YZ7Mkp7UlE+8uyHT4JILy4H32xs+PjoM6WRW9CKu3BI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ei2/IRbFx7S2aKo/pJVve8It5MzQtHuhNG0Zq/Bs3pIv1NRCoitjyxCaTvZhYzJuc
	 02u7s4i7idkc5YyK5UmzmlmhYFl0M28TJxgGAzhwxo5D1ma6wZtwfjJIs43cHHMRxW
	 onOJiJOa35p1chO0ukr6nYUnefhNuk3ji8sGTV2Hy948981d9eShwkCaxSCtlHuqj0
	 XN7lzwZAkJ/vxIeur8uUW6sZxIJnJDjudsJYDbBW0odropeCsT5wF1fIMfCtSn99oz
	 cwsg/sVPlVbOGATGJpaMactCXvjw2VZKGEjR5u3r/lvlKiibuGAD4QdT2sqkOKBXu9
	 vqZKKRC3G5rpA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0B3B6C3279F; Thu, 24 Jul 2025 05:22:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220307] USB cannot submit urb disconnecting sound card
Date: Thu, 24 Jul 2025 05:22:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: targz@rambler.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220307-208809-PgQMMPzNYw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220307-208809@https.bugzilla.kernel.org/>
References: <bug-220307-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220307

--- Comment #3 from Evgenii (targz@rambler.ru) ---
This was probably Bomge U202 internal bug, cause when I've got this I been
using this audio interface, but currently using another one. Still I've seen
another issues in dmesg, so maybe with time would be able to catch that bug.
That happened on MSI Z790-A motherboard with its USB controller on a system
with DDR5 working in Gear 1 mode, so that might affect my experience, but I
only seen a bug once when system dropped its state and had to train memory
again to make that work on 5200 MHz overclocked state, so now I just using =
RAM
without overclocking, cause during summer RAM already at about 35 degrees
instead of about 28. And officially Intel don't support DDR5 in Gear 1 mode,
but here my proof that its able to work and probably the only way to save
LGA1851 socket cause there are broken UMC instead of IMC as on LGA1700. The=
re
are Intel memory latency testing shown on the video, so I guess you might t=
rust
at least to own tools. Telling this cause errors one thing, but conditions =
is
another and you cannot get help from Russians.

https://www.youtube.com/watch?v=3Dbn2xNHynLfI

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


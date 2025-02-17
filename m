Return-Path: <linux-usb+bounces-20732-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61187A38AE0
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 18:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D26A1892C0A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 17:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228B522DFE5;
	Mon, 17 Feb 2025 17:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9sy0tgQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0D222A7E1
	for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2025 17:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739814495; cv=none; b=UOtGEPymMdZHF7P/y/5rYFHxg049kcYu2ho/EatK1v6v5IspHHCTKNWmU/nNcQ2IQ8EoFGAvzkeY2F9Ugof6qLituOkeCfvG5vtCfcrWlgeWds3Y/rRct1JdqRrq0JCpdXJonT/gO0TduYxOC8DG1/xYRdwdWbJC2zncN6uRdvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739814495; c=relaxed/simple;
	bh=opYA2HHovaGc041E7PludIfCeVcCq8dQ9xLIMPMBiU4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kveEGyUgObeTyqRpd5rKx51ZHWt/g4LQHZS+Lp8vpHDKHbIvpfc/dlknw9zD0RL1DbGGwa1pIkiiEgL7CXSwVei6riSD5ms+ZS2VhOhGMCFTuBhOJ+qVV7EksO58fS9LdHtpwyPBybjzVxEEsdGVaZMGYumISjaAtCKo8Qgr5oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9sy0tgQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15974C4CEE4
	for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2025 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739814495;
	bh=opYA2HHovaGc041E7PludIfCeVcCq8dQ9xLIMPMBiU4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L9sy0tgQE/t3DAxbJZx+nb5kagaUYNPdYO9pPzhtu1/b3e4DCKae7IiWgWqirgIPh
	 EjUbBoyC9jBvKQRES6s8KfH7KW43p/x7O208m3494TVkpbzFy4c8lc9HO1uPamm3GD
	 ifHFBUqlOAacoDybgNHOcbLPzCuKwe7Pre2NPRVdeI+92jy7QHDvfKU3jKdq67XPQ5
	 u8qN6z+zxnPXiK8W+cjBg60KTSDv50Nj4un9PoZaWrhIQTTjTqwF4MY/J3r8rMv01/
	 bo7u8GjfuCZGIZvrGWQJfoxY1eIWdtCcR+dktTbIlGZoRn+wlfgUsMHy0stZilZWds
	 V7UyaIVtA7GGw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 07F65C41612; Mon, 17 Feb 2025 17:48:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Mon, 17 Feb 2025 17:48:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219773-208809-k67N3GtR86@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #17 from Frederic Bezies (fredbezies@gmail.com) ---
Some more infos. I made some research - searching for A520M USB problems - =
and
found these forums threads:

* https://forums.tomshardware.com/threads/about-amd-usb-issues.3698102/ (Fr=
om
April 2021). No solutions found.
* https://community.amd.com/t5/general-discussions/a520m-boards-usb/td-p/54=
5490
(From 2022). Solution? Buying an PCI-E USB card to avoid using the ports fr=
om
the motherboard

Not a big fan of avoiding USB ports from the motherboard.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-23265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5346A95555
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 19:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2AD3188E0E6
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 17:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DD41E51F2;
	Mon, 21 Apr 2025 17:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEySGk5J"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2131139CF2
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 17:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745256924; cv=none; b=lzM1+2+0zEWK3SzDYiQhFAIGshRrkQmn1ijMLYmjEk8zFfZ73iElWSWDPqVna72/CKeerVDZfzhFsDS0lDuzMUVRQR2A+TP9KbHQGPtKcjnfruPaPCfW0QAVDoWIrpnh7ntvstL2gLvQGV27yFRSAyahsJ2jsXpshq5h6bnuFlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745256924; c=relaxed/simple;
	bh=GcibgsYLA4avD+txlYSCmjLM2uOJ7hv5/owceRLzmGE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ncpZZDYuFYQ4+H+N5zHDweGevKWsjiDlqUP80V1OhQyV0XiYlVl/6VTnqMuLlvcJuBbDdBoPMqSsv/kehoGIujH0nFtD7UXBLseIzHNu4kcp2lB8qlx0XEq8fD4BIdBeAEKwE6kvU8QRRj8rFtDX7+gP98pUS9IOcppSgcajtK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEySGk5J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D06AC4CEF1
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 17:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745256924;
	bh=GcibgsYLA4avD+txlYSCmjLM2uOJ7hv5/owceRLzmGE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BEySGk5JKT7NKyi1xqveDmPR9uXiJ6FtPwW06rn5mZFywTKP0/Qcd6A0IS1rs64xT
	 pDAozgf4m3xVFPFyvcMuX54bc7ZnjrorirqXTdv3QSyDL4PINIYxxJjWR5l1MxDNW3
	 9B0ayryKFQk5rTnOeB2JweqfFkeau/P9uhA1ID4IIGRAJdKxysrny0eY0W5FDwqp2o
	 OXjgTiMr/o5/NtLOnpcZoa/Y/EhEenGPtXIO6yAZJz2biLS2PCZIhD1ge0BbeOXLdA
	 +aT7cMAsR2aOFqOnLiUUB/8Yq4F/mTT776FLISRnUp/rq10PXncWuCmoFeAuiLqL/b
	 go8c1Za6Wj3gg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2372EC41613; Mon, 21 Apr 2025 17:35:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Mon, 21 Apr 2025 17:35:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: joe@solidadmin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220016-208809-xCgaajCbII@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #23 from Joe Doss (joe@solidadmin.com) ---
(In reply to Ilpo J=C3=A4rvinen from comment #11)
> Could you also clarify what you meant with this: "This issue also seems to
> be present in 6.15.0 as well."? Kernel version 6.15 is not released yet,
> 6.15 cycle is only at -rc2 at this point.

I was just trying the kernels that were built on Fedora's build system to s=
ee
if the issues persisted with different versions. Steven is correct that this
doesn't really matter at this point.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


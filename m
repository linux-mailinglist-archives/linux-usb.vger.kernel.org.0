Return-Path: <linux-usb+bounces-24415-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B5CACA9F0
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 09:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9738D3AAAEE
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 07:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD5113C8EA;
	Mon,  2 Jun 2025 07:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYrf7Dgv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22801805A
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 07:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748849453; cv=none; b=Uy4ldOrXO6MHWSm7AvCoXphR/Nc8NK4pBbFee6kkUTluBCwtsdNvN9Z1ZOdwZJrA097ZmXYm08fT2NM9yk6ayJ5D87CSAr2EM1KU1kmjoz3RZc0lBoqx+tgEtQAkJm3pBVTifBt21JRHi2Ekh57IrHuDYb2Z6DLCFrk5Vrw5yZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748849453; c=relaxed/simple;
	bh=FH9LYNqP85VTZtHNbX7sS0id+l7LIfaHt4tyHmDrFWE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=puZgMmI3o0P8M7/+MDGZTCr6k9Jq+xKUqhWQXaW9qEMN1rmurVC9bfx5hzax9sksPUzEB7mWDuReYEZeKk5AD4bfs3Qx/FVwZ9BejWofnClP4QVIGhCkBtwaWpG6Q6BYoVm3I8aaT2c6eWE7AF5BX4FjeZcnklrUMB6zuNb0rL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYrf7Dgv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B640C4CEEB
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 07:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748849453;
	bh=FH9LYNqP85VTZtHNbX7sS0id+l7LIfaHt4tyHmDrFWE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iYrf7DgvuyaohZpN5uTm5zmkgJ+6g+lCLXgAdHyagBCzTyh1FvLqmqlOtoyr5Qo6Y
	 PZMKdK7bublA2qaSoArT+kcrjFEfHjQiB9PdaQYLHrI7+YOAUrLGpB+pa48YjGI/S+
	 N7mNrc/Lp4F8q9xbMm9ITZStCy0CHcimRvZSZjlfw924eMEKaXURhxf+0eg/hOAJop
	 DP3SOqO3XQ2UrGMfxCRtaMuo/4EVGsZU+NOK+JsKskx2fMj7jX04LAveI+DusxO1KJ
	 SK1b/HxsInQFhLaaU2CR2lBxG0yr9qJbNhY2OOoAXpWu5f2E61DoWvXgpacE9mzXDo
	 l5oKaOKnZvU1w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3BD8EC4160E; Mon,  2 Jun 2025 07:30:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Mon, 02 Jun 2025 07:30:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220181-208809-YqkqEtNPqW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
I recall seeing a thread about it on ArchLinux forum. Posted logs indicated
that the xHCI chips in those cases only exposed USB 2.0 ports and hence the=
 USB
3.x bus registered by xhci_hcd has no ports and USB core freaks out.

Such controllers are legal and supported, perhaps the driver could be patch=
ed
not to bother registering 3.x buses for them.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-11129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D90903788
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 11:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E49F0B28C81
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 08:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30835176227;
	Tue, 11 Jun 2024 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBv1wScT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4DD174EEB
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718096373; cv=none; b=Osp9QKmJKw9lVvQMbPiirM6hyUqwNi0aXORK6/J7THJaEtmOolq26Jv1NQYlyZ2rRmhbDlIhFvidtTY81Fg9s7g0Rcyi3MuwNxMTgA0n6uoiCRlCcDsd8J/ppAHXYBYUNCz5uo06pIykcXsJ9HqxCHLyXCq2XxSFGWVdfR74WrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718096373; c=relaxed/simple;
	bh=CFz5lsGeYWMja+RJWyTZIcg6li+zfxH4puqkEqz8l0Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LZS2jgItSKxcHWjBTcv4DSjua1NcydpFODeP32Us5vPvpcoB5wiBscbRo6jqpVO1AxE7QnG05OfE0L7/yJ0DV1THefWlxaHyfKbyqDEprYJZTld+vCYXjURX5vgZAO8rqTWo5NKgKHo1zspJbkAacDW87SZuaou4DWuBRU/XX30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBv1wScT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41E7CC32786
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 08:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718096373;
	bh=CFz5lsGeYWMja+RJWyTZIcg6li+zfxH4puqkEqz8l0Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HBv1wScTCOBDRU8QjlMCsfPy7vB0iPrGyS2p35/3DPr7p0wLPEHjg8kDNAdz0gyoo
	 TC0DYwFk2AyDeI0lI9CC0Ro4VgxAC+21ZTDOiyFdJZI4+0W2tcmKZWi7CaKEdrb3M8
	 hU4GgEZ9I4Xu/qj1LGgjw0Rq45jdkoVbRG6mzUbH0BQahywLpxkBKjMck+qX3/xv8w
	 Wk5Xr1YxZXdRe+t5XO5S4RhpfiUr8okYWRKUGP4onmeie7aVaS++pLGV+cuCX/2cTg
	 CUtE9pCeSamGhfdmLrbHdTOQNFDncg26fKjJYpfs3xce52zj9AUvfu0zueyJp9wxez
	 /RGNLgJLPiMAw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2E141C53B73; Tue, 11 Jun 2024 08:59:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Tue, 11 Jun 2024 08:59:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-lZHDhZ5bVS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #14 from Jarrard (jarrard@proton.me) ---

> <boot>
> mount -t debugfs none /sys/kernel/debug
> echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
> <connect device>
> <send dmesg>

These commands are not allowed under Kubuntu which is the distro I'm using =
atm
(did complete ssd wipe).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


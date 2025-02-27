Return-Path: <linux-usb+bounces-21146-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0353A47EEB
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 14:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE5823B77A9
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 13:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB1522D4F4;
	Thu, 27 Feb 2025 13:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ky7h8qNc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E1522FF44
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 13:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662484; cv=none; b=Lt4O/RV2TOwrCoZFVUx0alJtt7vMtyYpTPPEehaUbd4UL/u3ZQWq5WQiDOH4n3xUo+LE2Ipi+J9lRHLLOel+o3P2RNhQpTXhaIXzDtTPiRDf4QYivuRAReLZkjc812BPpV6Hfb1Fw2PtOswXL+fEFZthD3qzyOlfDcAG4K1BICE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662484; c=relaxed/simple;
	bh=J4OOffFY+d3p2JyVaQLj4jUxqMt+L3Hm73L14QXWH3M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AZ4tm755VnT7QKbI89tBd2fxXRqoEIq8yYz3vEnguqNBUAdsv182XFiDkV525foNX69lV9yksh7t2SCyEOauOrO3vsQ7pSi7Ad4w/eJGVIoNbV2TD+e4QYhKl1A0XcrK1VGVSivm1icNXmSt9PSmNjC3CbCYRasASp2hrgQTXf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ky7h8qNc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A8EAC4CEDD
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740662484;
	bh=J4OOffFY+d3p2JyVaQLj4jUxqMt+L3Hm73L14QXWH3M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ky7h8qNcF+F87JYztDVKBM2OEQhZeXvE0WHco19qK+JpE5Fmh+NbPha0J4IspJSyI
	 9PTQ2p5TOHrSyPI+Q/fsiGMaLMEZNSHtUrJAMa0NCtv1M+lKKbMU44+dYfCaok7XY7
	 8swX/7KdbM0i9pwyHjam6d0o2uvITrWeChAprZ9O+4ft19OUE9HdjHAYvnKR3EXCdi
	 k0i4JJ9rw006riuWSNfsyLV00ns8K/xXlMhzFGWi3OnB7kR/zFRgvT4i+JIhZLkH1h
	 nkSHLHXMOxvySyJZKC/kDgv7/M+1yEtp+OHDumaA/AKDZlmvkuLIUmqcxepayFaJ+B
	 ZvwjZPr+0kolA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1057CC433E1; Thu, 27 Feb 2025 13:21:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Thu, 27 Feb 2025 13:21:19 +0000
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
Message-ID: <bug-219773-208809-QjkulQpRiQ@https.bugzilla.kernel.org/>
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

--- Comment #20 from Frederic Bezies (fredbezies@gmail.com) ---
So I found an old 320 Gb USB HDD. Connected it to an USB port of my
motherboard.

It is nearly empty, so corruption is not really a problem for it. I copied =
a 3
Gb ISO image.

I'm adding both dmesg.log and usbmon output.

Looks like the "reset" lines only occurs with USB SSD... And as I don't have
one under my hand for now... Well, this annoying bug is annoying to reprodu=
ce
easily.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


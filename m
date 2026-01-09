Return-Path: <linux-usb+bounces-32111-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D877FD09ABA
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 13:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1EFFE30CC8CE
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 12:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017B635A956;
	Fri,  9 Jan 2026 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4ChupAI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F95826ED41
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 12:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767961141; cv=none; b=sfqyrah9o2wg2yrr+OIaX5QCurNfX4BAn8roFwOtD3Ft/5mKJrTdor5indk+NPFpUeOaXbbTkAxdghQcU/CdUbr0lk9GpITz9TBA6waYarHLQC4+spVWKGkgykQ50p2QIS5o5oSUSZrSi9scE60MnblurVMwW7kgKue2hFG+Lnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767961141; c=relaxed/simple;
	bh=lEFoKWMfH/J/df3JqoqmkTJCBaFmDKRdzpB+Mh4iGfw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m47mjB8e9zb3Mt+We2k8uTrvbetrYdzhxivC0+3hRDjJq/3qFkVoyo1mJHlRHnqWpxzqasCo6IIXZ3RaKOpIzF+tEll5mPbm1HDo2D0Pi1Q172km6Mf2N8zhDoR4kW3uiunFAjgxRlXJISZQ0LdQwHi1hFPO0I0YnngyHx/yOMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4ChupAI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48A9BC16AAE
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 12:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767961141;
	bh=lEFoKWMfH/J/df3JqoqmkTJCBaFmDKRdzpB+Mh4iGfw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=j4ChupAIpqpGMSFFIWYTLN9xEVPo6Nn5fsA3j5k8TpAAHzFdqjIEMgrLPKnhv//9O
	 XMTIuA6rTqsoqSL2+ONdpoAI5aN+W2IRC/5RoKWA5QI5fC356wQrvpmDpS/dS0Lx3v
	 aBJ+7Kw5g187SzWfG8oN8Mm9I0Jmf3dLrgiWTQ2GJOwl301VdEKmtUD6mvoQKwMs7k
	 rNVf0vOf4v0WC4RLhY29jgBohUjm/6moM95FeSl3bRLHmlPsZC0hDBg8dX4iOmC9Ov
	 8qUrzoWSxtUfY7IKnoFCY1G1xM1jHgPO0TFeTOXOZ+77SxYrxNhkj4RxbYsuTvEW2b
	 K1kjq2ngfHrcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4139BC41614; Fri,  9 Jan 2026 12:19:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Fri, 09 Jan 2026 12:19:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thomas@jetzinger.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220904-208809-lpzCYQ8hw7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220904-208809@https.bugzilla.kernel.org/>
References: <bug-220904-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

--- Comment #10 from Thomas Jetzinger (thomas@jetzinger.com) ---
Created attachment 309154
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309154&action=3Dedit
Tested with dynamic debug enabled. s2idle suspend/resume issue:

After resume, Thunderbolt xHCI (00:0d.0) reports "root hub lost power":

  usb usb1: root hub lost power or was reset
  usb usb2: root hub lost power or was reset
  usb 2-3: Waited 2000ms for CONNECT
  usb 2-3: can't resume, status -19
  usb 2-3: USB disconnect
  r8152-cfgselector 2-3.1: USB disconnect

All USB3 devices on Bus 2 disconnect and don't recover. Requires reboot.

Full dmesg with xhci_hcd and usbcore debug attached.

Kernel: 6.18.3-arch1-1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-19946-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7C7A24BE0
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2025 22:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 279E77A2AF2
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2025 21:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893521CEE8C;
	Sat,  1 Feb 2025 21:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8Y5QvsH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD0B139D1E
	for <linux-usb@vger.kernel.org>; Sat,  1 Feb 2025 21:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738444822; cv=none; b=fScgfe7x8ZQXFmAtR5ReaJvuTgBib7b+rusR9qx6aqKb+BcrMeTQp84hO17KUUOX9at/V8PQEixY8sKMib2Sm7YfXnnirKcFUO/5Wsr+zEOwjQp75Li6ZvGbKJXEBAN9lPPp2+TCeFM2cG19mcRLiKvJCa/3esAh/yxynWkdEsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738444822; c=relaxed/simple;
	bh=u+RhHeZUJ4KGAJ1jLjir5E8bKWGHess8NWMU1/SCMMs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HOO3kuGpvfk2ibp087+rQjCM2CshZr/mEOhCkiiEi0tvSVc26E2WIrv9lSVVe8GGK0J1uuo0luT4O2UgFeq1jlh8O+yk8DVQTLIEG6tyNdGqmCcoSWjpoo35c6ZeF+SfQ+O84GjRggOaDMd1DfZ5ls4MS0y1+Q7P3fdj3DWUJVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8Y5QvsH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 762ECC4CEE2
	for <linux-usb@vger.kernel.org>; Sat,  1 Feb 2025 21:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738444821;
	bh=u+RhHeZUJ4KGAJ1jLjir5E8bKWGHess8NWMU1/SCMMs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W8Y5QvsHzzuzT4hdaZc01QyO+IMcqRSxMmuWzp8oxn8YmeL81cDAu+AfaKEsgRJRo
	 bKp6gWyKS0j1VJrDpCRdxuOvQcopSnOyE5wBhyyTtxH88Ugeqs1kqCFNkIa9HJTrCd
	 UA4vcznxB933ugiyFkkYDSFhdtq4RkEdMkcIWNyxoszbYkuOqyrWHNeUsPmOGqMwlf
	 aFKmzmH51/gwcuw1TfkHFu+3gNtDAkhGAiQr2/9c2x4wY3aP1pFslzNMixPorOFmOI
	 6aF4TeCQjTLSHVc5Z4365pTm5WGbPLf0mxuIh16JfdxZ5BQRgPAydnm3fUzvdBhdhR
	 HPb7kxhF9taCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 54AEFC3279E; Sat,  1 Feb 2025 21:20:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Sat, 01 Feb 2025 21:20:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pchelkin@ispras.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219590-208809-eYHLtJOSLO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

--- Comment #9 from Fedor Pchelkin (pchelkin@ispras.ru) ---
(In reply to Fedor Pchelkin from comment #7)
> See https://lore.kernel.org/linux-usb/Z18hJM55ED2hYJ6D@lappy/t/#u

And this contains a patch proposed by Christian A. Ehrhardt. You can try th=
is,
too, of course. But in my case it unfortunately didn't help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


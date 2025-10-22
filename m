Return-Path: <linux-usb+bounces-29514-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A54BBFB712
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 12:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21B244E7549
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 10:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C70D320CDB;
	Wed, 22 Oct 2025 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5/C3Ih/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9693B30F53E
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130126; cv=none; b=BHNld5JY+yPueFyscgouY6FyvUbt30qcAvOvy77pGuy8j0ckJM15pwyIWsnQYUQ1HMJqVlwFEfx7j1LS6t6cWhzyO4JhGnvdwVCvhUZMNplsOe2jNL9QvJEfwrEkFGYqBU7Bm2Z8rCgwtkT+lcCwx0NFxCAD9a1s+q5CP6TeGcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130126; c=relaxed/simple;
	bh=cl+WBzWCbfPoCH0yMGoGvEsPjcmx05z+6qZJVZfWXgI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fOioV4o6PdD2AtzOmoPLA6RvrM8CXSS752pgG6X3c6WQKx/QHQjzTLAJHGcZLm9sQlBy/vomUhagt/T3HfoOzgeQHbtGeEmgYeP5M4DwYyef5qjvtjVc4YvM9wfLOpI0WK0lGreAU0dTtemLPQecpASSeC7Zy3pGVKqHIOwm1KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5/C3Ih/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AE3FC4CEE7
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 10:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761130126;
	bh=cl+WBzWCbfPoCH0yMGoGvEsPjcmx05z+6qZJVZfWXgI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=E5/C3Ih/rHgTQOc9EEHWLW47fheylrsAFzEqL/LoWVKOC2nxChYr+4HMYQLQJ/BIx
	 pGwYsYML6lw5hSuffuodKYPmSQNbTkKvFZCgv7LmZvrJQ418Qm+F5Mt7KDzIETclTQ
	 wjQWoGqUpQyfxvr/ttKf3Bz+BDGqsqyWZVNA4YRjoFBVT8wiynP9G75i2X8DvNFq1A
	 mNoAoWYqTGZCXMBaQExWozxKn7R9Wxy93SVsg0Zjg9nJBS4O/OcwSeImhRLasjmn1v
	 RVwKzam2F7sUzylUyCrE/+bO3wLmphJ4Aowf6TYNBYEcn++F5DgE7F5S+q50wQLoEq
	 TVZfAQ5QS0Y7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4EF38C41613; Wed, 22 Oct 2025 10:48:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220667] xhci_hcd prevents S3 suspend to RAM from working on Zen
 5 system
Date: Wed, 22 Oct 2025 10:48:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kode54@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220667-208809-9eigChvJp2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220667-208809@https.bugzilla.kernel.org/>
References: <bug-220667-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220667

--- Comment #5 from Christopher Snowhill (kode54@gmail.com) ---
Looks like this fix didn't make it into rc2.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


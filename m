Return-Path: <linux-usb+bounces-23576-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B46AA4930
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 12:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED84D98113E
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 10:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579A0154BE2;
	Wed, 30 Apr 2025 10:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZvhOEhx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E74218EB1
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009898; cv=none; b=XFzlMr1q7Uw8oQm3NbY/jzJRAmqLLV0Ai/vk6wdMXZ2jMF0NGf7GocY+iDAThCrMxv11s2uVjUehKbL8BLy2pGRJxD3NQSCkM6yX/ZZNvpdLBBPQQuWL9k/8ACdZ81KNJ9dQDUzkbMO9+AObucpXgmCQ2jc5q0S7t1rt4OHzf5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009898; c=relaxed/simple;
	bh=Y/FAJR6p3ImloiemOYTeRaghGEBi64EX3q5A3VhnEpY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WdNA4z3rnm9N5TT5AUZeh4+5TzNpj6rqEjmh+G9+g9pSLfkrj07PPW1ohdL5hB9sIije8uOh3qaD0aAcjUAg7eBpxMEHRfKMJ+hxapyQpMMyDxbhnhM/dDpYt/jKmPLwjxS9xjyQboWQ38xLwIucjIgmrF0jdkiX0BY7nslR/8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZvhOEhx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5019AC4CEF1
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 10:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746009898;
	bh=Y/FAJR6p3ImloiemOYTeRaghGEBi64EX3q5A3VhnEpY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fZvhOEhxbkzCvALegcnEd+aq4SXjslSh/DpsCng0fD4bNyZj3ogviUIuqkyPTh82Z
	 Bfk2wvHvFcpKN8w3MJeMCMTkQ13WTWSLx1xfsZL1Fs37yLqkgo8ensGk9IsPIz7+Lg
	 A9ooMm0MtOYmB/h1bExu2CgSkpv7DII0i5wAIlRbVwVVstdIHOhtXnbSvuqZTWABLi
	 7TQ9UxbYpNgmaYkmX57nj+Sdj2neSyu4q5Q61vVh5MuiugUo1abCNybo+Hh6mYzFDh
	 wmMEQdaSOk+h/mc7MUI9INPcx3i5Uhqg0MNarFoo8Pof45t8iJidpWctHb07vlg0HH
	 1Pdq4YbM6pxHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4966DC53BC5; Wed, 30 Apr 2025 10:44:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 30 Apr 2025 10:44:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilpo.jarvinen@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220016-208809-v2x5c2EDAI@https.bugzilla.kernel.org/>
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

--- Comment #30 from Ilpo J=C3=A4rvinen (ilpo.jarvinen@linux.intel.com) ---
Justin, sure, my intention is to try to fix these issues now that we've bec=
omes
aware of them. I'm just not sure if that can be done for pre-6.15 kernels as
touching the resource fitting / assignment algorithm is pretty precarious.

Steven, could you try with 6.15-rc based kernels with that min bridge window
patch + pci=3Drealloc,min_bridge_window? Please also include the reset debu=
gging
patch I just attached and dyndbg on the command line. There are number of
things in the 6.14 log I don't understand and I suspect I might have fixed =
at
least one of those in my recent changes to the resource fitting algorithm.

The failure to shrink bridge window size for 0000:22:02 from 0x500000 to
0x100000 as IOV resources should be optional, is particularly perplexing.
Instead, the non-64bit windows vanish from many bridges after bridge windows
are released, which could be due to improper reset of a resource after one =
of
the steps which the later steps fail to undo for some reason.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


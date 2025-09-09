Return-Path: <linux-usb+bounces-27805-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4398CB50212
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 18:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2B985E0717
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 16:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F46341AB8;
	Tue,  9 Sep 2025 16:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSceO2ci"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7903C32BF3D
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757433814; cv=none; b=RMKCy1arKXmnukOlFDrqirvZ/KVq5If4mS+1H+bvoWj7/VXpLE+1a8Sl60kJ9iylUeCD7ZixFdOPD2id4mQWHAOdzDyoIWlsxjMbEM3xhCCfZAt51awkj5CKCk4KKfbzmXyWY3Oo69Z007jEjIv7c0HSyGyMaEsL8IPKyvLZvQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757433814; c=relaxed/simple;
	bh=V0Z1rGKnrmAErSpd4OKmeBFGURTTG+EcNMX0ZC+05kI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OQee8PeNyXpzkEYBYBcjpSVcFeHyAAGpVLgsDIrS8MLWjT9oJcQG8lzDex8F35pLDqgjK1+BpkN1qGYwzjXXrJ5zoCXZBLGlAeYQdBnrb6tE0Pd/kFY37VZOo68LqUUb0I55Pm8KWi7qNiLor3gW/hhpmhd0k/RwCZizuRgW/r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSceO2ci; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E664EC4CEF8
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757433813;
	bh=V0Z1rGKnrmAErSpd4OKmeBFGURTTG+EcNMX0ZC+05kI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iSceO2cioT7E2DRqRvKXmAmQsQmEz+fip6PGhmfsPKNFA3N7NqaWn27CGQ+k1w2Cj
	 KBAo3Z/jDtJrAu1HpwmoM77qityT10NRqkYVTcQUw0pfShq8akMVWy3OAdLbYFFouM
	 PJY6D9YATZ4Z9fvFJtioWWgPhve/SRLcUXGQOVdl3XrV1wVvV81pASzMJLv7BCp551
	 eE6NcWND0mbcCs15Uxc2POrk072OuffXUxW1JlqaaIvWpivfchfNMyJGpvrtW8q41L
	 CijccShxSQcB44S0kBm9BKkSeyxjIBP1nFOu8ZUKqB8b/pEb2+07kU+yv1OVdX34Td
	 zUSMMVyz7KT1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DDCFEC41613; Tue,  9 Sep 2025 16:03:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 09 Sep 2025 16:03:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-WBmUKwOEWE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #51 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
In a previous life, I found that debuggers, even kernel debuggers could be
quite useful. SoftIce on Windows 95 and windbg on Windows NT were my special
friends. I was demonstrably more productive than my peers and it's more than
possible that their refusal to master kernel debugging contributed to that =
gap.

kdb is something like SoftIce and it appears that kgdb is something like
windbg. I will first master kdb and only then kgdb. As of a couple of days =
use
I still don't have that spider sense of kdb. Just now I lost the opportunit=
y to
get a stack backtrace because I did not interpret a kdb stop correctly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


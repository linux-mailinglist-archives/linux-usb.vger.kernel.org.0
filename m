Return-Path: <linux-usb+bounces-27307-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E94E2B36D3E
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 17:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E84601893973
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 15:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF05D24CEE8;
	Tue, 26 Aug 2025 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfbSzaLy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3531EDA09
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756220759; cv=none; b=szYNhs8fd6dZ50nEgDaIL17pvDVf/du6/7BgH8gboz042pZa6xwxVHRXV7cid+VExk7NH1ctR0JmE7t3EXh0pnMU0jXEoqElWyVBNIoxupCDEX1yNkAEJSa06vYxl5afgRhL6D7CTiPEEDP2EmpHvT9L4Ls7RDCr777UXa/HLp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756220759; c=relaxed/simple;
	bh=5B8ez0npUoA1k2cQSJaJnl/DLgzTCNrYjh/RwgsevOg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=flhFJivimlFB61qTK090z0tavwStjL6FWkca8bmHy+rXBCMc0rarfmsJu9z86KEoA4s8vJkbPNLDsNLq3p3hogIj/0OIQKq4R0Xk3MyeDwdojIDuhvS/7+KEEeSKdHnfiq2mzhFZycyjrQRp6vBCGh7xeBg94VpMpphAkhz9ikA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfbSzaLy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD7D0C113D0
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 15:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756220758;
	bh=5B8ez0npUoA1k2cQSJaJnl/DLgzTCNrYjh/RwgsevOg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UfbSzaLy8lTosFzUHy2mPShF4YuBZKjCWoukvaWI8wjRujqFe+9OfYe+a8iNpfsE0
	 QKTQcVFSyyHXyU7xXaEWCJzxyP9CDT3iC4TgM3jdohaLIqtoHyGA0RidwFNc2SvyLa
	 L6AwiIPS6P1DmeAh7l8zmya6f4F45j0Ak0e3BaMcWHiEdXtqEiDoqEZjKYWjYFv8X3
	 AI1WwyOzsQ41RKB5twnLx7g2u2GcqnpoVYF0Q2jaLjmgfxQVkkYlO8Js4uO+mgY01l
	 3zl/F/DHLRw407NyC8bL8UnX4glO6LSSXxZm/IdyNHE9rZOy8lAtFfKJTVQxxOOwmB
	 NwvOntmMKOc6g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B302AC4160E; Tue, 26 Aug 2025 15:05:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 26 Aug 2025 15:05:58 +0000
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
Message-ID: <bug-220491-208809-KX5pCwkRKe@https.bugzilla.kernel.org/>
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

--- Comment #3 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
The problem is related to a usb_storage device, not uas. This particular SD
card reader has a USB 3.0 interface but only provides about 18MB/s throughp=
ut
from the SD card. From what I have seen, this is quite typical of laptop
internal SD card readers.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


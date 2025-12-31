Return-Path: <linux-usb+bounces-31854-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 009A3CEB51C
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 06:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE921301A718
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 05:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3C030FF33;
	Wed, 31 Dec 2025 05:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lui+A2gj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DB930FF06
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 05:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767160776; cv=none; b=mtu6tQL5zwOD/FNAI69BYYhM49Z5X3BFBk3zzHrbBbfR87GlgjJajmVcVAMEMy7ueRTqtWspyNcYwpAE783E4DND2O8e88yvGCXwA1KPu1gb8K/u1grlFYbIKXagXIugT03gDU0XGMoyFmJU9IhQR2ulPLsVvyJ0DHCfyCwlK3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767160776; c=relaxed/simple;
	bh=hKMvmNvzpbp+SlJLYdxAhJbp/iZ5nABxjBetqkrRSYA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=piX7XEQMq5Nu5XNnjoNTCjizvmtbtMzuv+mHUeOUaV87y1PSg7evOX7BfVa3nVBlHuXcR7awtcNH8rRXu5zVXd/TLDp3+q2pS4N3gqBh87uikn01ATRdTscf/n7s5C6CcW96awKLF6JSgJEOZtiJ1oNy9qQYPfyzffpHxCW8AQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lui+A2gj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 956A9C113D0
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 05:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767160775;
	bh=hKMvmNvzpbp+SlJLYdxAhJbp/iZ5nABxjBetqkrRSYA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Lui+A2gjTovTP2YjbU/1P8XtECqzTtpVBhNsD2LgjZxsws/LlisjL6c2wdFBoCBzA
	 iecEEqncJ810bmdw674WDzBoQxSAlGkiyKplSpJ4Tx/sYQiarCkFhSDLnhCY9JNy8t
	 484WJz9T8AgbvLqnNoJkzHnmrui9kreSScM7A3Qxt2O2QLd5apHzWzwQ4EEWx4tqCi
	 lwfYn/2pF7kPGvBUTTthi1zP51p5OgrAJ9l5qsNc8wF+U/tuZQACfQJho1iFb6q6BV
	 aZ503+tf33Eqc6mli3ApP2NYuXg45usXF8GwhbP63bAKU4VA01K54lcDWyMrNuTbKQ
	 CxoMdEAnpz3oA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 86682C4160E; Wed, 31 Dec 2025 05:59:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Wed, 31 Dec 2025 05:59:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220904-208809-LG1FAeW7tu@https.bugzilla.kernel.org/>
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

--- Comment #3 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Can you attach full dmesg of the repro with "thunderbolt.dyndbg=3D+p" in the
kernel command line?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


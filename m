Return-Path: <linux-usb+bounces-32383-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F72D23626
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 10:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3600302E85F
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 09:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49570357A33;
	Thu, 15 Jan 2026 09:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jajGfa7C"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54529357A24
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468547; cv=none; b=t9m5s9fSxHhO1cKAaYKAWAEvHD+1M2y20BAfQTWs0aJycz8g5p5tP68o7yKuxk14F6AvDMJ2kvJ7u8lb0SNRB69WIXnUl4FHJDeRCRF5+DIJiosuzPAzFa6CAhu/wq7QkxPVaspO6hPkwBWcSZ0IaFSHw9VF07l39byygT07OFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468547; c=relaxed/simple;
	bh=aFNa0lN/qK5c0zuKk5K/zcrIGmA+4F+n9UmPHzZXWTk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NOyhFeX8ZR1K0Y37g6AzsS9YVaJH2iBeICaWW9D+pkpViGlglEMr6e8yyKSpx+4mge139oZhS6IP5CXOgopv4WTgA7MrQjB4lAdgF2+AiYL+mqBCRUNKmAPuaLa7O3jIwuHk4j0AVTSGjFVgFTHs+NIGi9W6W+E0/g7rK33fKjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jajGfa7C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 084C2C116D0
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 09:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468547;
	bh=aFNa0lN/qK5c0zuKk5K/zcrIGmA+4F+n9UmPHzZXWTk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jajGfa7CQsrUBDbkIy4VNniI6SQ5GKYhyNOfPwa3vvvVioN1rHuMj8WH6xdLkD/Ad
	 /eE1U9af9Uwp6o1CiPEKuZjLk8Mj8X6NQXQ3tD6FjoFrz/oy/4sg40se9wxy8H8/my
	 asZ/DYvRsU0fHUcFAc46Xm8VVMWafGpv9v52F24mjZRWv7Y6pzgFlFqCUXDM98o6vX
	 V3GHyR7La+Ly/D+ZH3Ogzl+wqdp4Ta5WrtWR1AuIkKs5MIEjBYFC4klMA2LoJYu6mW
	 5yu7wk2Mq9hxBgx4gpFZzuI1LMvCNlB/sXMtI3yGsCClGLADuuIdy78sExuO1x192A
	 V4xJyZLyEE1Ag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02565C433E1; Thu, 15 Jan 2026 09:15:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220981] Potential data race in
 drivers/usb/class/cdc-wdm.c::wdm_read
Date: Thu, 15 Jan 2026 09:15:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: franci.vi@tiscali.it
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220981-208809-u9hcNejhPv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220981-208809@https.bugzilla.kernel.org/>
References: <bug-220981-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220981

Francesco Vincenti (franci.vi@tiscali.it) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


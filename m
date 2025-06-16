Return-Path: <linux-usb+bounces-24769-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B18A1ADAB04
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 10:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0F6E188F797
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 08:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C001F4617;
	Mon, 16 Jun 2025 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2964vct"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70AF1CD15
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063521; cv=none; b=fqlNhLjrgPz2nifgHpzTEf7g6KNtJkmjcQFZ6wi6117wADmlK1r7t393YOrLSgIwmwo1Ve/2PWAh5xSqgadrYfqACqMAzyQkwM9cQW+/jXZ9Bba0B5TV/Uvd7wKtYJolvWi5aEPyEa8moXAKWqBILHf3bCiL4T4eFW2srJXQUDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063521; c=relaxed/simple;
	bh=T5zfxDOjoFtfKEcTG5kwJ6wHyL3c+g/37gapUqLxVHA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nE4osoo2d0DZHWrC2s/4ENy10iLdwogLNsoI8FQshlNiBtAak6tcS+87BTDQf6A118sVvxX2AY+aOEJIJ83c0hjCKGfX4DSBwwbQu/vV07QO+PJn39oHi5pz0KjX3iYvIQArt8/3ikfV2KSUjbx/8NAkJVYmBne/NEv127Psyxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2964vct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 462CCC4CEEA
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750063521;
	bh=T5zfxDOjoFtfKEcTG5kwJ6wHyL3c+g/37gapUqLxVHA=;
	h=From:To:Subject:Date:From;
	b=p2964vctgIeARAzIGUwQPnlhdiUHcYe6D3guFmVaFqR/uR3jZc4ZIK7eRvj2FwQNc
	 mymlKxnj6Xdc9NZDF/logcu+W7ibEE8LK4eNxaF3cEDd5abGFMor6WZtowkof+NqVL
	 rnjx0TRpoAc5H2qtNFZwf6JLBqOLqXJIT9NcbxOVHcpcJUKM4Gima2Nw+ZvlNFoXNG
	 xKsWLJx+NGRZrtV23PjwxcaZDbHfCVdrYnYosFTD2+8ckf/JZxFCwMIGIFWMFiMR7L
	 adXHX1gm1q8oYsVgWbqosdbm8PdABtccp8v4RSz7t/86q88DfLTvknw0OIN7JYag/W
	 G+frzeSrDaWbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 41115C4160E; Mon, 16 Jun 2025 08:45:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] New: Blue Yeti microphone doesn't consistently work
 after unplugging and plugging back in or reboot.
Date: Mon, 16 Jun 2025 08:45:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fewspotty@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220238-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

            Bug ID: 220238
           Summary: Blue Yeti microphone doesn't consistently work after
                    unplugging and plugging back in or reboot.
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: fewspotty@protonmail.com
        Regression: No

Arch Linux

Bus 001 Device 018: ID 046d:0ab1 Logitech, Inc. Yeti Nano

When my Blue Yeti microphone is unplugged it won't work again until I reboo=
t.
After I reboot, sometimes it works, sometimes it doesn't. Sometimes unplugg=
ing
and replugging fixes it after reboot, but if I unplug it while it's working=
 it
won't work again no matter what until I reboot. Although it will still be
listed under lsusb, it won't work or be listed in pavucontrol. I have asked
others with Blue Yeti microphones, and they have confirmed this as an issue=
 as
of right now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


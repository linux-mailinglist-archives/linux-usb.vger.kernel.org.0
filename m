Return-Path: <linux-usb+bounces-18128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3229E4A2D
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 00:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AA6318827FB
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 23:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C521F7090;
	Wed,  4 Dec 2024 23:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WoAk97Ia"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F242F23919C
	for <linux-usb@vger.kernel.org>; Wed,  4 Dec 2024 23:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733356261; cv=none; b=IILnRaqkFaa1FDz8sso4/y6ixaylMH6PMKJqekdP9GvrXJKHLnB62JO0WyRenVpFP5XaS8ySFd7jQz+3oee7mWNtWONb5sIzRsG7hvz9rMtbsOrfrNdj4HrKPZmA29OABhe0I9ZuMzwme6WwVZW/EB8ezAqDS6vAiuA+S5rWaPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733356261; c=relaxed/simple;
	bh=tabnz/9+zMxhU9FU6issQRPyRac767MNVBYAN1n2RMw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iWEWIlRp+9XD4pLlRaq1lBXrcAt8Uppa91f4UUQOotPSMRtZuaGBv7FTICooV5+NeeLEJbMngnI9Lsy5NjddEvd8qTINW8J9OQGo4FvPwTGXFtQbriir6yJ7dQnlCymlNWfJ+OuXz1uAX8qhggJVyWudoj+KBBcXmymdB1I1UGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoAk97Ia; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 615A0C4CECD
	for <linux-usb@vger.kernel.org>; Wed,  4 Dec 2024 23:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733356260;
	bh=tabnz/9+zMxhU9FU6issQRPyRac767MNVBYAN1n2RMw=;
	h=From:To:Subject:Date:From;
	b=WoAk97Iah5v274yK9EuYndYRdbqQ+uvitCCdSy4CcaIzTs9hlIz4OLQZsjyjxhFlz
	 jGZV3JId5Gp03Gzo+1jZTzQSaGVmeWaYNPPuVBD+An5+9LLhQfCh5Px4Il7hEtfW5k
	 HrLeSCKeFmJwhYkoVHJ3cAZtXLZdzcpnCxD13DchT/20oMwgO+exNBlgEGYCBqgs9S
	 ES1Z0IGaw4mvk6Rnk/uIpFXtxWZyS4nwHq/yz+XEqvsabgfnIjp499C8k2uJ9/TuKt
	 8wTBIzqvSgiGcNJSiC9QhNLssUymQNIfn79iLPTO50B89ZBGbH8y60OL9Ta6A8dV3R
	 22JL+O+RMtNzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4F527C3279F; Wed,  4 Dec 2024 23:51:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219562] New: [BISECTED[ UCSI patch breaks lunar lake boot on
 6.13-rc1
Date: Wed, 04 Dec 2024 23:51:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter blocked cf_regression cf_bisect_commit
 attachments.created
Message-ID: <bug-219562-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219562

            Bug ID: 219562
           Summary: [BISECTED[ UCSI patch breaks lunar lake boot on
                    6.13-rc1
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.13-rc1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: todd.e.brandt@intel.com
            Blocks: 178231
        Regression: Yes
           Bisected 226ff2e681d006eada59a9693aa1976d4c15a7d4
         commit-id:

Created attachment 307321
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307321&action=3Dedit
otcpl-lnl-m-9-bad-commit-console-log.txt

Our lunar lake machines are not booting as of 6.13-rc1. I've bisectedf it to
this commit:

commit 226ff2e681d006eada59a9693aa1976d4c15a7d4 (refs/bisect/bad)
Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date:   Wed Nov 6 17:06:05 2024 +0200

    usb: typec: ucsi: Convert connector specific commands to bitmaps

    That allows the fields in those command data structures to
    be easily validated. If an unsupported field is accessed, a
    warning is generated.

    This will not force UCSI version checks to be made in every
    place where these data structures are accessed, but it will
    make it easier to pinpoint issues that are caused by the
    unconditional accesses to those fields, and perhaps more
    importantly, allow those issues to be noticed immediately.

    Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
    Link:
https://lore.kernel.org/r/20241106150605.1017744-1-heikki.krogerus@linux.in=
tel.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I've attached the console output of the fail


Referenced Bugs:

https://bugzilla.kernel.org/show_bug.cgi?id=3D178231
[Bug 178231] Meta-bug: Linux suspend-to-mem and freeze performance optimiza=
tion
--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


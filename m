Return-Path: <linux-usb+bounces-12195-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4512F9309DB
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 14:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABF001F21689
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 12:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188EF6E613;
	Sun, 14 Jul 2024 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndIlpxUX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F4221A0B
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720959075; cv=none; b=XYyVoLIVdbCCvxUq2ItDuAYATxzQxXZf6aBTf+UoSry9YeQl0p9Qve9e0WGtnYofYHDDZI2mnHSdAJpnBA8RhYxxCv7ixe+xyI2SBy6gs75Olgtu+/T+ZfbeDcyOOpiQHJ3udDPI86aAh2BTGd1s+iBkMTqXOwQN7uGEZjs9pp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720959075; c=relaxed/simple;
	bh=Fh0GujvnaCcKSU79E/iJTJf5KzTY1LHxyRnlYy1bw+w=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ntRR7ZrB5aCOsFKJZ3IbhKAMJ9JiAfNhCUsNsXGaXG+0OdWod/DWEmgnS+mhMZrKaewLzAjLPWauZLKtnKTxNrBu3MJO+/n3r8LTGVJDsmUFf6jiWoeT/9u0DSe2rRD/jVqdAp9N2Gm3JeCMM5cSBNAgTKqWmrsfBh9mbsy79wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndIlpxUX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09232C116B1
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 12:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720959075;
	bh=Fh0GujvnaCcKSU79E/iJTJf5KzTY1LHxyRnlYy1bw+w=;
	h=From:To:Subject:Date:From;
	b=ndIlpxUXqAQXVcA6wuBB9PwADgHaqxak9xlfAODcc7jy9PsljNtdCdENlI4J2xL1t
	 UbLH2Y8TGc24PvIBvt/pHugMjAqtQIpDq3w3+FRYzzFGIXk4rED1w4iYrUdLwmMWCW
	 03dXdqzxwKX6cXOGk5nHNV1yyZGiewrVp3AS1XuYr+Zv1H0cRS/8MDMnHCuIDqEtuP
	 xO+RNU2tbyW7UapODwYXNAT63aaPK9ftI8agzC48KhT8TfxcXw6ELxJgJgwjCROS2F
	 wr16yyaU4N2fCVOAFcooiksiTKmDrNINRplooL41CD6WHiHvityJW/ZBN75VsZdWnN
	 B3dDyih/iUR9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ED36CC53B73; Sun, 14 Jul 2024 12:11:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219039] New: kernel 6.6.39 freezes with QNAP DL-D800C usb case
Date: Sun, 14 Jul 2024 12:11:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: matthias@bodenbinder.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_file_loc bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression cf_bisect_commit
Message-ID: <bug-219039-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219039

               URL: https://github.com/torvalds/linux/commit/66cb618bf0bb8
                    2859875b00eeffaf223557cb416
            Bug ID: 219039
           Summary: kernel 6.6.39 freezes with QNAP DL-D800C usb case
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.6.39
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: matthias@bodenbinder.de
        Regression: Yes
           Bisected 66cb618bf0bb82859875b00eeffaf223557cb416
         commit-id:

When I turn on my QNAP DL-D800C with 8 HD, the kernel 6.6.39 freezes
immediately. kernels 6.6.38 and 6.6.37 are not doing that.=20

I can reproduce with arch kernel linux-lts 6.6.39-1 and with
linux66-tkg-eevdf-generic_v3 6.6.39-273.1

I identified commit 9a24eb8010c2dc6a2eba56e3eb9fc07d14ffe00a as the root ca=
use:

commit 9a24eb8010c2dc6a2eba56e3eb9fc07d14ffe00a
Author: Niklas Neronin <niklas.neronin@linux.intel.com>
Date:   Mon Apr 29 17:02:37 2024 +0300

    usb: xhci: prevent potential failure in handle_tx_event() for Transfer
events without TRB

    [ Upstream commit 66cb618bf0bb82859875b00eeffaf223557cb416 ]

    Some transfer events don't always point to a TRB, and consequently don't
    have a endpoint ring. In these cases, function handle_tx_event() should
    not proceed, because if 'ep->skip' is set, the pointer to the endpoint
    ring is used.

    To prevent a potential failure and make the code logical, return after
    checking the completion code for a Transfer event without TRBs.

    Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
    Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
    Link:
https://lore.kernel.org/r/20240429140245.3955523-11-mathias.nyman@linux.int=
el.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
    Signed-off-by: Sasha Levin <sashal@kernel.org>


When I revert that patch, the kernel does not freeze and everything is fine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


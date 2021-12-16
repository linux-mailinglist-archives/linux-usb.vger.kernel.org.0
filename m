Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2C3476F8D
	for <lists+linux-usb@lfdr.de>; Thu, 16 Dec 2021 12:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236464AbhLPLJq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 06:09:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233712AbhLPLJp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Dec 2021 06:09:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7F6C061574
        for <linux-usb@vger.kernel.org>; Thu, 16 Dec 2021 03:09:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D26061D44
        for <linux-usb@vger.kernel.org>; Thu, 16 Dec 2021 11:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0786C36AE4
        for <linux-usb@vger.kernel.org>; Thu, 16 Dec 2021 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639652984;
        bh=y24vlIwCEBRrIDVmym2w2RvyxvmNXKVUzpoCos5Xeag=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Nhlgae0mw9s6q1FgPqPL+iX7tbnouf+3SLDQxDtiSSmU+qrl33g5EO+weWpzfKTdd
         Xjm/QCKOl3slqR7nerBrn/u0UbAezbxVwZVf/arrcLKxSaVs2UhxXoV9zhUHuG54s2
         a5CSfreA1EzTCutq9flmj91TzATJdKU+YjdDujUtMf6JOCE9Oyr1uxlvjKPwYmnbuS
         CrJx1NYNX0lIHojtCPpioxV3mfxZrwNQBVIUz+Y3uiqALxM4a8d3dD6lEEP8undnZZ
         SBIBWisEQ993MrQrJewuSlIKiIJ3zDQwNO0HdWO48rKqm9NyVIevS5/inkUgZR5LYt
         yj2o0w8ScvccA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A54EA60F47; Thu, 16 Dec 2021 11:09:44 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215117] ucsi_acpi: kernel NULL pointer dereference
Date:   Thu, 16 Dec 2021 11:09:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux-kernel-bugs@hixontech.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215117-208809-1zefJpM7Lw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215117-208809@https.bugzilla.kernel.org/>
References: <bug-215117-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215117

--- Comment #4 from Chris Hixon (linux-kernel-bugs@hixontech.com) ---
It sure seems like a regression, starting at v5.16-rc1. I haven't encounter=
ed
this bug in any v5.15 version I've used, including -rc versions (v5.15-rcX),
v5.15(mainline), or v5.15.y(stable).

It seems like the bug still exists in v5.16-rc4, though I wasn't able to
capture a kernel oops the one time I tried that. I'll soon try -rc5.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

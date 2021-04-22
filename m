Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2A1367FA1
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 13:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236001AbhDVLgh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 07:36:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:46082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235957AbhDVLgg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Apr 2021 07:36:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 26D7C60FF1
        for <linux-usb@vger.kernel.org>; Thu, 22 Apr 2021 11:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619091362;
        bh=QlxsYvuREW/voTZXCUtv6PGAYEd0KJIxOMsBgVs3w6U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Kqx1zM6MYfzmVYnhxTzNSaAsCkFq1vefiraX5GVugOc3a1U9DvamkYoaJAdlEDHKY
         MZZOw/++SXM+CzWXuSEqVwCMfneAroDhaYzu7FgVayqkM2ejruzC86Mg9eievG0/rA
         gWAwSB9LmlfkLBHmopiC9cqeTALzRLaS4vWb/AHyvc55X4br60Z9iaNzfa+4XNRA/M
         oc0Vagsgp2P/B9hkQYtRMXEpmlEJCyO/cp2/NbS8h94J8RNBKPlyuRQUESoETNkTIS
         HBlxziHIjH0m3Hf7zQcAKJNpiU93mSmnQREndGG6JscsGD8VpK9ATIRi8+YYL5Dz+/
         Gn9RQG8KaHD4A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 233796113D; Thu, 22 Apr 2021 11:36:02 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212725] USB CDC ACM device stop working
Date:   Thu, 22 Apr 2021 11:36:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stefan@agner.ch
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212725-208809-jBcYORUOFC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212725-208809@https.bugzilla.kernel.org/>
References: <bug-212725-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212725

Stefan Agner (stefan@agner.ch) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #5 from Stefan Agner (stefan@agner.ch) ---
Addressed with:
https://lore.kernel.org/linux-usb/20210421074513.4327-1-oneukum@suse.com/T/=
#u

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

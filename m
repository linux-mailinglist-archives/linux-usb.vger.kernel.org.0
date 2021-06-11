Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 816A93A3994
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 04:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbhFKCP6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 22:15:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:53524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231366AbhFKCP6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 22:15:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 03816613AE
        for <linux-usb@vger.kernel.org>; Fri, 11 Jun 2021 02:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623377641;
        bh=ug/QpKbPPXHs+j8+xpUcqSnCdePTmi/U9dHtiSXsOVM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WAa6yStMyy2hfxEoe/KCCbCmMi2XcogM0WARZUBVYJ8e9T9LaDw0Q6Y055TN4R2Xy
         hE1Ehop0f3Xx6VGEFD0Un5cplTBmgF+OiK0Azquqhs7GP9v0q1kmbNtjBuEUPD5sZT
         +k0Du630XGVfu4GSnEg+JEi4Fv4sCZHAj2/0JaXyZge5GQleu4ebkd/q/VMjzGqXVv
         4ITN0CsDRiO3Fw4TuvRqG5WRqvVpXqIXAhpjHrGcbsbXnHQkKXrvnzmiqQiytQe2yZ
         O042TgTPA9Lnhps8jD2qwUOcM9m4Rq1cLlkx6qYpBe5adKqMtgiAjBdmbnWxSzNWLF
         UEnBBdGLhcKfg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 00AEA6115A; Fri, 11 Jun 2021 02:14:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209469] [bisected] usb_modeswitch is broken on Linux 5.9, at
 least with Snapdragon X12 LTE modem
Date:   Fri, 11 Jun 2021 02:14:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: russianneuromancer@ya.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209469-208809-JNJN7HVrFE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209469-208809@https.bugzilla.kernel.org/>
References: <bug-209469-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209469

--- Comment #18 from RussianNeuroMancer (russianneuromancer@ya.ru) ---
> In a nutshell, it was about treating devices that are already connected at
> boot but not set up yet.

Please clarify, is this should be fixed on kernel side or on usb modeswitch
side? (Or maybe it was already fixed somewhere and I just doesn't know about
it.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

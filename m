Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F024385E9
	for <lists+linux-usb@lfdr.de>; Sun, 24 Oct 2021 01:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhJWXXr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Oct 2021 19:23:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:56182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230284AbhJWXXq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 Oct 2021 19:23:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 96C0460F22
        for <linux-usb@vger.kernel.org>; Sat, 23 Oct 2021 23:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635031286;
        bh=ADzeIejO19uxOV3sCwTJsxhL3rwEXWxvLochey82tCo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=r8Br4DtJ+PW2fvHEyPolS0DiFEOYW/KrjbZwmLRz+tpuMmiUp5ftMhlXga2rG2PrC
         PTUsKCrcDKOCShqHA51v4shiIrz3c9GlTttM22tUEjAx18DVJ1velBDcP+JEDQdwUo
         KnURHEiaK4sgKXxGlDspSoQFWnUc1U3OF7TvJ+nDGiUNji1UNKXb54dpP4gfknVKfi
         atmgX34Pd+gx6LIui+KiFRftUZVo9Cyozfdx2NH01Psf6B8fhVWqPzwuZUaNQjrQUm
         ic2K9nafDiVVE54InXL0Bm8JrxQ/XAq1VNMs2dMJeURnAczREcw+Zb1KH7Si5YCxNs
         4gKEv2XBovrSg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 8392560F4D; Sat, 23 Oct 2021 23:21:26 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214797] ehci-pci: unable to enumerate Sony NW-WS623 Device
Date:   Sat, 23 Oct 2021 23:21:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: Stefan.Lauterwasser@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214797-208809-9qlk83bqCU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214797-208809@https.bugzilla.kernel.org/>
References: <bug-214797-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214797

--- Comment #5 from Stefan.Lauterwasser@gmail.com ---
(In reply to Stefan.Lauterwasser from comment #3)
Both devices with micro-USB not mini-USB.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

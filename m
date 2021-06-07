Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C9439E733
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 21:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhFGTI3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 15:08:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:42896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230264AbhFGTI2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 15:08:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 348E861130
        for <linux-usb@vger.kernel.org>; Mon,  7 Jun 2021 19:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623092797;
        bh=lq+8BVFB4esSK47jgU5fdxJ9uxNuCK9sLZN0Tt01WUs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dJGtyoZx1QXMoQCfG+xqq1H8d6MzIFo5kItV8MtadpB8UNBglGzNP8cu8d8cUifUE
         Jl4C6ywryiokYmFqJzvPGQYdIBUVIs8caOwdqpN2uqwc90HskwVgAqeQKDwkPxf6bm
         YnS6S2WoO0pspE/MsA4j3GexuCi8ErgkB76GjzRhjrwa4HzBmlbaRqP9NrANJrt+ZB
         SmY9XWhPY7iD99+MiQ5TajZC3t/hGr/cWOXdnWTKrppwfSBL6L0hc1faWa3WF+l1/F
         oyBr3n78m2DVsobkwYR1NypvBanYwH7KM9jUw7p4vh9CZHfKxPlsrbITjmCbOeTRk2
         Y87ySxc/SJcfQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2BF3E6115A; Mon,  7 Jun 2021 19:06:37 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Mon, 07 Jun 2021 19:06:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaffa225man@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212955-208809-pjYbEAYKD4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212955-208809@https.bugzilla.kernel.org/>
References: <bug-212955-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212955

--- Comment #23 from Lucas Endres (jaffa225man@gmail.com) ---
(In reply to Alan Stern from comment #22)
> Using two different drivers would definitely explain the different patter=
ns
> of communication with the device in your two usbmon traces.
>=20
> But it doesn't explain why, with one of the drivers, the device seems to
> stop responding when used with EHCI (and works okay with xHCI!).  Maybe t=
his
> is caused by a bug in the device's firmware.  It that's true, changing the
> communication pattern might work around the problem.

Sorry, but here's another pertinent factor that I should have mentioned ear=
lier
if I haven't:
It could very well be a bug in the UA-101's firmware, since if I connect an
audible input and watch it on the UA-101's builtin levels meter (with it
already on), I think it does freeze.  The levels remain when the input is
unplugged, after plugging in USB while running a nonworking commit.

Thanks for the insight!

I suppose I should start comparing the code to each module, since I think
that's what you're suggesting.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

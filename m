Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6443D4C7D
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 08:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhGYGPQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 02:15:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:47248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230226AbhGYGPJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Jul 2021 02:15:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 321606023F
        for <linux-usb@vger.kernel.org>; Sun, 25 Jul 2021 06:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627196140;
        bh=hA9d3bWE+A8q7UIGgDI7EsEqT6YU0ANU3rNC9t9qyBc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DwG9CpNVu2y7143n9N6R0nfTEUhQrb07Jt0JH+10nNZSBNWJwQzWzBYHvpTQ5bBzn
         1FcOA7D1VWweoz8TFrP6rOG0mqFaJne4n7/vY2fijX+y7L9oDx5GId5C51h4qSIN7Q
         OEKq/zegAl7Hj9QcbdWNh6iru3hOJQyk/kzdtufRmVT3mFNyb58I11M7OxMfV3u8fc
         nF1ZAx3NhTPCOezY/uhu/0cYNQZacEd4dHvDtkRG2hSMac2kzVjxfuvu7duy5Q/Zma
         f33k86FGFJkx6c20MhAR8FgiVnLgIdyk8l27riG2oMGtq5tGUG+gfsF1pFkq57vXYi
         wV5lJk860DI/Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2881160E9A; Sun, 25 Jul 2021 06:55:40 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Sun, 25 Jul 2021 06:55:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t123yh@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-J4J377hoS5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

--- Comment #8 from Yunhao Tian (t123yh@outlook.com) ---
(In reply to Minas Harutyunyan from comment #7)

> Could you please apply patch "[PATCH v2] usb: phy: Fix page fault from=20
> usb_phy_uevent" from Artur Petrosyan and test again.
>=20

Hi Minas, Thanks for your reply!

It doesn't seem to make a difference with the patch applied.

I enabled the dwc2 debug logging option in menuconfig,=20
and captured the logs when I plug in, disconnect and re-plug in.=20

The link to log file is
https://drive.google.com/file/d/1ID3bDp4NA6vSXf4AqN8w2WiDhaFbnb59/view?usp=
=3Dsharing=20

At [   32.964469] the gadget config was bound to the device;
At [   38.002792] the device was plugged to a PC;
At roughly [   43.063762] the device was disconnected; at [   45.640378] the
device was re-plugged.

After a short period of time the kernel freezes, no more logs can be output.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

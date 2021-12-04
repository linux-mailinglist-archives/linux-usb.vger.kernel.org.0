Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95B3468147
	for <lists+linux-usb@lfdr.de>; Sat,  4 Dec 2021 01:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354449AbhLDAdE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Dec 2021 19:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354124AbhLDAdE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Dec 2021 19:33:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E01C061751
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 16:29:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C3A3C617DF
        for <linux-usb@vger.kernel.org>; Sat,  4 Dec 2021 00:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32DFDC341C0
        for <linux-usb@vger.kernel.org>; Sat,  4 Dec 2021 00:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638577778;
        bh=MKwMEzCKD8n1I5JzBSmevOvIR8Nq0IpmnM3PvQKV7N4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hgDU6cWgYIHEs6skY9nu98NY/teJ22gEW5ENwmj7Gm/lDeQMz3FeUar0ptq0ILPhn
         +5akTiN4fTtjgB0X/z0nE8GXmiKzD39acFbT/bUzO8FzIHx1Xkl7iFrUiJ63gy0rMW
         AQHRehGqNxEzC9jjB3ZZ4LYYuEeHK4YNB3TMGaBtOD5N4BhlpgRWuG3C95Q9NG5qnn
         xaBqi8BZG1kNGAu0s4w0Q6QF6+heSFgtyKX1nOdc6tEDqxXgBatj219D2jY+ebb7qv
         wMHa65ZbKlRO7M8abm+KLuT1A/5YADFEjfW3s1zQ8LgqSs809fI2P76fMa+wOfz4+e
         UWPKPxhynebXg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 1552B61101; Sat,  4 Dec 2021 00:29:38 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Sat, 04 Dec 2021 00:29:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: seanvk.dev@oregontracks.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214789-208809-Hjudl33SO1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214789-208809@https.bugzilla.kernel.org/>
References: <bug-214789-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214789

--- Comment #29 from Sean V Kelley (seanvk.dev@oregontracks.org) ---
(In reply to Sean V Kelley from comment #28)
> (In reply to Scott Arnold from comment #23)
> > pci=3Dnoioapicquirk fixes it.
> >=20
>=20
> As mentioned in the patch originally:
>=20
> https://patchwork.kernel.org/project/linux-pci/patch/20200214213313.66622=
-3-
> sean.v.kelley@linux.intel.com/
>=20
> +The config option X86_REROUTE_FOR_BROKEN_BOOT_IRQS exists to enable
> +(or disable) the redirection of the interrupt handler to the PCH interru=
pt
> +line. The option can be overridden by either pci=3Dioapicreroute or
> +pci=3Dnoioapicreroute.[3]
>=20
>=20
> +[3] https://lore.kernel.org/lkml/487C8EA7.6020205@suse.de/
>=20
> In the absence of the ability to convert your out-of-tree driver for this
> hardware to MSI, then can you give pci=3Dnoioapicreroute a try?

Sorry, full of typos today.  I'm wondering if you could give pci=3Dioapicre=
route
a try.

I no longer work at Intel but am happy to help try to resolve your issue as
best I can.

Best regards,

Sean
>=20
>=20
> Sean

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632E1468145
	for <lists+linux-usb@lfdr.de>; Sat,  4 Dec 2021 01:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354448AbhLDAbO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Dec 2021 19:31:14 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:52184 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354124AbhLDAbO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Dec 2021 19:31:14 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A4A0162D30
        for <linux-usb@vger.kernel.org>; Sat,  4 Dec 2021 00:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15558C341C1
        for <linux-usb@vger.kernel.org>; Sat,  4 Dec 2021 00:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638577669;
        bh=ar9UpfsvNKNNFsyBYXsgE8ggx6nrd8YLdpx2pHUCKIE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gYBshb+G1R1BnRfl3t+XQR7UtQhaz/iC5iPtet1OmF13SMeLPlz1m9eP9lQ6taxee
         h5lC/kjytlapkXFsC8AADvLFX7fq1uLTJHhZpQhVnRzdwjd0rVOk9/eXXUtixu+tjl
         uAWeJ/TFYGrgeKuMEC1/GrHyQjFaSPQuQiOlOzxec0GbrNOYrrcPLbpluK7tYwY0ip
         lyjUg/SZjNYyUOckGewDRXx9N90hddFk+FyYyywL3p4QWIG8jxb+hDnmXBdbYgN2YG
         bfbpMR/dpPXLPDxsBfSxu90KQDOb5A47GhnU4KVw6TSdybhAGvRHpCK6wHfATvOJfP
         nU+MY5MFwA9Rw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id DC4B760EE6; Sat,  4 Dec 2021 00:27:48 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Sat, 04 Dec 2021 00:27:48 +0000
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
Message-ID: <bug-214789-208809-VmWSQ7BGuj@https.bugzilla.kernel.org/>
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

--- Comment #28 from Sean V Kelley (seanvk.dev@oregontracks.org) ---
(In reply to Scott Arnold from comment #23)
> pci=3Dnoioapicquirk fixes it.
>=20

As mentioned in the patch originally:

https://patchwork.kernel.org/project/linux-pci/patch/20200214213313.66622-3=
-sean.v.kelley@linux.intel.com/

+The config option X86_REROUTE_FOR_BROKEN_BOOT_IRQS exists to enable
+(or disable) the redirection of the interrupt handler to the PCH interrupt
+line. The option can be overridden by either pci=3Dioapicreroute or
+pci=3Dnoioapicreroute.[3]


+[3] https://lore.kernel.org/lkml/487C8EA7.6020205@suse.de/

In the absence of the ability to convert your out-of-tree driver for this
hardware to MSI, then can you give pci=3Dnoioapicreroute a try?


Sean

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

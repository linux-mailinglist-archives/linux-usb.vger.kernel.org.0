Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9299C4713A9
	for <lists+linux-usb@lfdr.de>; Sat, 11 Dec 2021 12:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhLKLd7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Dec 2021 06:33:59 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:37638 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhLKLd7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Dec 2021 06:33:59 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id DE142CE2A7B
        for <linux-usb@vger.kernel.org>; Sat, 11 Dec 2021 11:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0ECC8C004DD
        for <linux-usb@vger.kernel.org>; Sat, 11 Dec 2021 11:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639222436;
        bh=DBMYpO0DcsWf7ockU/ANHnULlEky4uyzHGHMXQTOD+Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ld3ovftdtqB+JUgvFjHr0ZA3DB1Sg/Q70nDIm8M+E3pxrhiMgZ+oNIuh0XOr/di1b
         g2APJ+c6vx9NplTDIzqSLXEbV6DwDii8fVggXfFJF8xG4rA/fWoG31QLuEd/OCOrhz
         7Lzi8vRi5uR71fxpdPzbMJ8IFiyCuXe5969672yBuscX5ZNqh8E6L7kC2Od/Pmrx85
         baqd6aP515JybZ2XAOqS8yNwYL02hRE7qLFlfauVj5s5JyLNvyjR3bherfg/IsjfQ0
         wNptYWMAkBlGameHFhVA9dkMFnsXmSaus/OtCxcZG/y8FsIFxWwDkX1T/6BkK1y+x1
         C/grlG3C8uqaA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D4D3160F53; Sat, 11 Dec 2021 11:33:55 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214875] USB 3.1 device cannot be detected
Date:   Sat, 11 Dec 2021 11:33:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mr.yming81@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214875-208809-xGbuRBkg5Y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214875-208809@https.bugzilla.kernel.org/>
References: <bug-214875-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214875

Walt Jr. Brake (mr.yming81@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #4 from Walt Jr. Brake (mr.yming81@gmail.com) ---
It was fixed by the patch [xhci: Fix USB 3.1 enumeration issues by increasi=
ng
roothub power-on-good
delay](https://lore.kernel.org/all/20211105160036.549516-1-mathias.nyman@li=
nux.intel.com/)

Thanks for your works.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

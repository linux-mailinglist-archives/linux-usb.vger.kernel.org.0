Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5420E4385F1
	for <lists+linux-usb@lfdr.de>; Sun, 24 Oct 2021 01:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhJWXuW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Oct 2021 19:50:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:35918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231331AbhJWXuW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 Oct 2021 19:50:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5653060560
        for <linux-usb@vger.kernel.org>; Sat, 23 Oct 2021 23:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635032882;
        bh=1r2kztgOhUiAkaRZiKj9q/35PKo+Ig2C9VdBXQsjbcw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=T9ezVnlM27SgrYNqLD48OYQ/loOATQoFHkNP7XWMS33RxGl4Y1XcrVtR8UClnAMbh
         uDqyqaU+sUd4aulm6yP5uu0HPuRP29fNgDHYRyUVrAfMXUq19Fs8vKnWwou4/ntctZ
         Wse1A5YhJrWgquI7iQoP1+opSIVWvNMBcwIiu1pq4bA+g9ugdJmKaDh57rT+ntuIBw
         wu1N20cHzRt4VRkHXqTwavBbXh4RIiI1CrvBpbkwsXbeJznFC/sNOXb8AS4HNhKwZO
         FEpu9gC66y0P3z/8SOhMz2dtZR/qoRXh9zwOyaJOOVSZeo5HLIgeBSfrnO758QsOJ9
         BIfGR9zhoSueQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 4172460F4D; Sat, 23 Oct 2021 23:48:02 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214797] ehci-pci: unable to enumerate Sony NW-WS623 Device
Date:   Sat, 23 Oct 2021 23:48:02 +0000
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
Message-ID: <bug-214797-208809-G6DrcGDG4e@https.bugzilla.kernel.org/>
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

--- Comment #7 from Stefan.Lauterwasser@gmail.com ---
That makes no sense - it must be the cable now.
Device now works on each port with other cable.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

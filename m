Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CD8364D1C
	for <lists+linux-usb@lfdr.de>; Mon, 19 Apr 2021 23:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240508AbhDSVfZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Apr 2021 17:35:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:40752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229714AbhDSVfY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Apr 2021 17:35:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 10FD1613AC
        for <linux-usb@vger.kernel.org>; Mon, 19 Apr 2021 21:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618868094;
        bh=2pXIkfRB33g5FCnbRx5W0xQY/dwQd7PJrTXTt4LuHjQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mGGCff/nrS48Otz7lw60h3eIf85f99PpenpqC2zgGHob+LnI2pdR8nFrXqsEYG8MS
         bvNytMXHcdqYiVpLuXu6FAxOj/jkq5WO1+bmO8c6Pv3ydX3H0LrUlzdcBzcZC2x7iy
         obCyCqnHIGAusQcxf8Zm2oEDP/WUN8XU9FLpjdtHYb7C8fxP+kAH67Sc+Fni/WWF3R
         xg8113h+vRhBnbxhAXZwAg7GdAL7KWH6fHa8PAONyjEYdpMH0WPnUfvPx3qH2iFTv7
         oCD/EZ0hiei78F/+xX36QDG2g4ybTwNvjb31GqtBV17/YT4tBChKNJ9nVsjjoqylRm
         kE+reJZdoEjmw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id E8B20610D1; Mon, 19 Apr 2021 21:34:53 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212725] USB CDC ACM device stop working
Date:   Mon, 19 Apr 2021 21:34:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stefan@agner.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212725-208809-kNfsjdzZZ6@https.bugzilla.kernel.org/>
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
                 CC|                            |oliver@neukum.org

--- Comment #2 from Stefan Agner (stefan@agner.ch) ---
Some possible candidates:
https://lore.kernel.org/linux-usb/20210311130126.15972-1-oneukum@suse.com/
https://lore.kernel.org/linux-usb/20210311133714.31881-1-oneukum@suse.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

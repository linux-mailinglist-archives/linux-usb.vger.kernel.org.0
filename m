Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 288653457EF
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 07:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhCWGpJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 02:45:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:59448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230008AbhCWGor (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 02:44:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 73EE06198C
        for <linux-usb@vger.kernel.org>; Tue, 23 Mar 2021 06:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616481887;
        bh=thf9h52Bd0YsXsbcrtYjLGEdh0j2arNgUL4LzLS6JHI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UThZNIVyiL8Eg2ZgPYqduwEM5WAf9hkA6MgQZIKnQyRrfIeuKC8U0A0mEl7EHZdnU
         NSuZ5il7y2WzvvETcMy/K+JC9OSCqivohpRvXDkGgJNm1YsH51CYsxlDLhQWUsujih
         np6a6GOJsPN5LWktEcd7digFkquqAgL9a6o6RMrn4uSiFIIRB4iGnRaKTzdm5ZqSep
         TYqbOcViYkNT25Z1ux33fCDY75aLgsoVMx2h3usLFUQvijshMuKDPRzudrvHTZM/8P
         E92wjZj+4df6DZ/ideLg8/GYUZwt62i2fxgCxGZFblMYXVKoMutmj7oSZriY0C6OW3
         aWc3xbE/i7c5Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 60F3962AB4; Tue, 23 Mar 2021 06:44:47 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212101] xhci_hcd cant setup
Date:   Tue, 23 Mar 2021 06:44:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: hose@posteo.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212101-208809-NfTv4YRrb1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212101-208809@https.bugzilla.kernel.org/>
References: <bug-212101-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212101

pik a-b (hose@posteo.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #2 from pik a-b (hose@posteo.net) ---
It seems now to me now that I mixed up to issues with tow different pieces =
of
hardware into one ticket. In general I am not sure how to gather the releva=
nt
information needed for further analysis. Therefore, I recall this ticket.

pikab

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3109387F18
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 19:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344502AbhERR7J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 13:59:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:52550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351409AbhERR7G (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 13:59:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 727AD611B0
        for <linux-usb@vger.kernel.org>; Tue, 18 May 2021 17:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621360668;
        bh=/cWQlgvj2bNrrl+jeRFOd/xdSF+0AJqPaOqgQbrH1xk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SHBI0tJuHM+ceyob5Chgw+uxteGjzIvSVQ//PTRk89+qyVUREAwuVu7QwK2CU3KPS
         oXCeHZvdIn6lFlNZ++uKfFDPkuTKDJJn/25Et0iFc3b9eiwQAht5NUyRSwubXMeXX2
         xQsRaDQorokHKYso5WZ2A8HcOhZB5xMV8n5iBcBNDKXZw7fJcylhAYljtYcPl2IZr6
         FxVgy5AoC8iOGGqdqIc0BcF+ZMp7uvFVma0OmH0kpIPaXG0Y3toYkSpLVQonvn0mO4
         4V1K258gML6VlUt2UvjdX3DirMweHfPv5DwlSKJdDi7jn81E5HSdOEBm1j6MKm4+7L
         r+OzMhlxhbWZA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 63F036124A; Tue, 18 May 2021 17:57:48 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Tue, 18 May 2021 17:57:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213081-208809-FQbIHk1k4Q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213081-208809@https.bugzilla.kernel.org/>
References: <bug-213081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213081

--- Comment #12 from Alan Stern (stern@rowland.harvard.edu) ---
In the failed reversion attempt above, what commit was checked out when you
made the attempt?

The right way to do this is to check out the commit and then do the reversi=
on.=20
In other words, the commit you want to revert should be the top one at the =
time
you do the reversion.  This is more or less equivalent to checking out the
commit's parent.

So for example, you should do:

   git checkout 674f8438c121
   git revert 674f8438c121

That way there won't be any conflicts, and the fact that the commit is in t=
he
middle of a larger series won't matter.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E0C381F6A
	for <lists+linux-usb@lfdr.de>; Sun, 16 May 2021 17:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234534AbhEPPCe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 May 2021 11:02:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:58378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234318AbhEPPCd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 16 May 2021 11:02:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9435F61164
        for <linux-usb@vger.kernel.org>; Sun, 16 May 2021 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621177278;
        bh=EuMHMZUbKlZHK3EIGEZSOfAn3nKTBpFcNevIg0SlE6s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bkCm+T2nrZefEK/quNouUaoovb/1IDMv476XVMgBUcAPC6J8KqcyQcYyViT5o829v
         nCOg77Xflch6BjH7V7Siwcd+NXgjF4IY0pvCYv20Zuc/wgkt6dY+A7uEi3RPVhPU8/
         ABhY/KblPm0Quo6qAAQYIkhFchTRJAqjKi213EmHBLLgZzVF1y6iJDXKVultYrxY3A
         f+sFrBnIWJe7xrU0JlCb+2g13i7zD0YWHbeUz430aV7mEITyvSpdWEkVQ5g1GapiUI
         sjwPLW45sM6f5aHOk54oU1NnjXpndQuBlb3zup/oNFWV3k2mK3pgwww1RWzVxbHhhM
         3MAx5Uqjpwylw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 8384C611F2; Sun, 16 May 2021 15:01:18 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Sun, 16 May 2021 15:01:18 +0000
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
Message-ID: <bug-213081-208809-UJxGeum4lM@https.bugzilla.kernel.org/>
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

--- Comment #8 from Alan Stern (stern@rowland.harvard.edu) ---
The output from "git help bisect" includes this text:

  Cutting down bisection by giving more parameters to bisect start
       You can further cut down the number of trials, if you know what part=
 of
       the tree is involved in the problem you are tracking down, by
       specifying path parameters when issuing the bisect start command:

           $ git bisect start -- arch/i386 include/asm-i386

You should read the entire output; it includes a pretty good (though rather
terse) description of the whole bisection process.

(Beware: Although it's likely that the bug was introduced by a commit affec=
ting
the xhci-hcd driver; it isn't certain.  If you can't find the guilty party =
by a
restricted search, you may have to try again with a full bisection.)

If you want more information about git bisection, there are plenty of web p=
ages
available that explain it in more detail.  Ask Google.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

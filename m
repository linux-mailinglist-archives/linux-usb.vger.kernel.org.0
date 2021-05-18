Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3352A387E15
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 18:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346164AbhERRBN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 13:01:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:56562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232496AbhERRBM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 13:01:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9968161184
        for <linux-usb@vger.kernel.org>; Tue, 18 May 2021 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621357194;
        bh=DCLM/BDayV0G135P06gJu48FURAy07B/1lzR9u1cLRc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UhK5BpscYbnSIN/oONVkDKKuZGRedWDSVEtpVi/xkq1HwUWfbeezYhnnNFqqFDKNT
         9l0D5TIiShf3zI7pEPid8Ao5r0tPvNA/R6sJazrRlhaV0dHBIVcSjR0X6AjR5SRUSL
         sBpWzPLZQBiOdAdZedXjvKiZ0e40MlmlASIJkmG38AEKgUe63wgYDO6oQUEDqdYQBT
         d7NIxy2jPhxOLaNLyQSLTZupKs1VhppEsT+7pWs/nfQ2mjSeHPkYGNzsHItrK8m9rQ
         nadZiyNgh4Q1fUgoXPrqKMyf+tPbyxSympLsgCZuFD3XiC7G6cLY2ssOEaqMi3+Yuc
         lvU++9anHUIEw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 910AA6124A; Tue, 18 May 2021 16:59:54 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Tue, 18 May 2021 16:59:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: peter.ganzhorn@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213081-208809-NzMmPKFKQ2@https.bugzilla.kernel.org/>
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

--- Comment #11 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
It's obvious one should test with and without the commit in question, but a=
s I
already said it seems the particular commit is part of a bigger series and =
I am
unable to revert it via git (git revert
674f8438c12125d6b4fe51d44b9316bb02b286b5) or manually:

/usr/src/linux-5.12# cat ../674f8438c12125d6b4fe51d44b9316bb02b286b5.patch |
patch -p1 -R --dry-run
checking file drivers/usb/host/xhci-ring.c
Hunk #1 succeeded at 819 (offset 22 lines).
Hunk #2 FAILED at 834.
Hunk #3 FAILED at 855.
Hunk #4 FAILED at 894.
Hunk #5 FAILED at 934.
Hunk #6 succeeded at 1276 (offset 101 lines).
Hunk #7 succeeded at 1353 (offset 101 lines).
Hunk #8 succeeded at 1383 (offset 101 lines).
Hunk #9 FAILED at 2043.
5 out of 9 hunks FAILED
checking file drivers/usb/host/xhci.c
Hunk #1 succeeded at 1452 (offset 12 lines).
Hunk #2 succeeded at 1822 (offset 12 lines).
Hunk #3 succeeded at 3131 (offset 12 lines).
checking file drivers/usb/host/xhci.h

Could you please give me some advice how I can revert this commit without
breaking anything else?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

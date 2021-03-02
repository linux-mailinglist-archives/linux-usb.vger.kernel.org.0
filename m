Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4A332B508
	for <lists+linux-usb@lfdr.de>; Wed,  3 Mar 2021 07:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237918AbhCCF4L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 00:56:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:33138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1448615AbhCBPHa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Mar 2021 10:07:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E126F64F35
        for <linux-usb@vger.kernel.org>; Tue,  2 Mar 2021 14:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614697122;
        bh=SL8sLQIvC8XQqqE8oQkd41rsqDOUFYIT4m422LGgHlU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Cg4BiMzyXBwc2UfXyR11atSP8xAgmwgCC6X04qV/eDTIVZvgZPV8HzYo5EIgOQLSd
         EcFGE4CkiDyMQxePchnP64o6aRC6kmxSTdH9fHOixrgMFjjxUajpO2YcuN+1NqbMkb
         BcrOgc7aQYEA8q8nUyCx/Ruj9myNu7fvCNVT9Vh2lWXgfOCG7FIyGV7jKtS005Brvo
         dXmnnQHMm3Q72/gbtr6P5MpwXFhopod4DX8uqXECoaXPixx8Weif05IygbVqTTz0Th
         +fFYHtxRQW27+91onWQbF35yL9PI6Qzj33Q72biOrt33ifrJp0pFLL0nMc18FGewdd
         cVVApiHhhgcYw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D00C865356; Tue,  2 Mar 2021 14:58:42 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207045] uvcvideo: properly handle UVC payloads that occur in
 the middle of bulk URBs
Date:   Tue, 02 Mar 2021 14:58:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luciomf@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207045-208809-NXhgBrxEdU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207045-208809@https.bugzilla.kernel.org/>
References: <bug-207045-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D207045

--- Comment #9 from Lucio MF (luciomf@gmail.com) ---
Hi Julian,

I keep using this patch almost everyday and it mostly works fine. Although I
find out that there are still some "stress" situations where it freezes the
whole system. One can almost "force" the freeze in three situations:
- Using camera filters in Google Meets for longs periods.
- Closing a call and starting one right away
- Opening two programs that requires the camera

Let me know if you're interested in me running some specific test to help s=
olve
this situation.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

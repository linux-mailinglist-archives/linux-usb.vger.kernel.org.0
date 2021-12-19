Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE7247A0B4
	for <lists+linux-usb@lfdr.de>; Sun, 19 Dec 2021 14:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235798AbhLSNj1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Dec 2021 08:39:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234475AbhLSNj0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Dec 2021 08:39:26 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3ADBC061574
        for <linux-usb@vger.kernel.org>; Sun, 19 Dec 2021 05:39:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4222A60C95
        for <linux-usb@vger.kernel.org>; Sun, 19 Dec 2021 13:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A22F8C36AE5
        for <linux-usb@vger.kernel.org>; Sun, 19 Dec 2021 13:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639921165;
        bh=MBlLPFu9qX6M48ZohkglEvp8sbA2ve5M3lsfx9TRuZs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KgsRIErLKTC5ZlXYL9VeNaq5EEjBP9GWpfY/5t1b+jpa/LVgy360RCeOBHbh7Yncm
         BxheXik0nEF99fcumpgzFVI18Mn2zzINvNz9H7SkIHcWpgYo043gPo286nkWz5zFoJ
         rEb7o6L7pNF36qIPVVxa2JifnLHpZCHgXc+77VdujKM5DgJRXK8IikbTnA3aLZ3SXX
         XicPksjYXSJeAiUG/9wfOUyg+Cm6h6UypPDk4FJ4tHRzftErqMhJ/lEoQwL02rdagt
         +8eDdL5lNTZEr1ekn7kygMNODXOSgcpf9TahXF0juQ45oq/tn36e4kqzwyKbucPCIr
         SbVCaFwGl2Kxg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 80897610CD; Sun, 19 Dec 2021 13:39:25 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215175] thunderbolt: consistent system freezes with Dell
 U4021QW, general protection fault, probably for non-canonical address
 0xdead000000000108, Workqueue: events tb_cfg_request_work [thunderbolt]
Date:   Sun, 19 Dec 2021 13:39:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: leho@kraav.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215175-208809-UcsvP9s6Oo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215175-208809@https.bugzilla.kernel.org/>
References: <bug-215175-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215175

--- Comment #3 from Leho Kraav (leho@kraav.com) ---
Surprisingly, I haven't been able to make the system hang recently. Also
updated to 5.15.7 and 5.15.10. Continuing to keep an eye out for a while
longer.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04929466DF5
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 00:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359631AbhLBXp3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Dec 2021 18:45:29 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:33806 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232981AbhLBXp3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Dec 2021 18:45:29 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CEB3B628E6
        for <linux-usb@vger.kernel.org>; Thu,  2 Dec 2021 23:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38028C53FD0
        for <linux-usb@vger.kernel.org>; Thu,  2 Dec 2021 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638488525;
        bh=M8XSh79ZDWtVr/DU1hRYxWG9MZ97wZC+s1vKmn0n4q8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HI8DSQXM1DUDAoiYsotUdT+c0+52VK8i2M5C78W1KgIU5qdx/55/tr9yV6m6rFNf0
         kn/U3Qcvmyi6ZN2IMvJKqG5wBfO9DURinJSC9ZzBVrrRrLLq9rI9WFiIEQgsLS+G5w
         anCHRtHBG3BKcVDFAp5hYlWauoWLLs2l2N6LpY/av2mkW71bpgOqmjXluOCzvcmpjq
         jtq0i3O++ABal5Kir0L8jczROv7xCIdl1z1FSpBdr3kgZG0AziucNmAOc+QZm2I8vk
         i0R3jlLcQdBic6TOd56YhdKIvTNuaFSlETTOZYRP9NfuaVVRoNWwGttytvyJTSHM8o
         a+C0o1QyJ1Fig==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 230CC60F26; Thu,  2 Dec 2021 23:42:05 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Thu, 02 Dec 2021 23:42:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: remyvarma@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209555-208809-R0Csqhv1tx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

remyvarma@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |remyvarma@gmail.com

--- Comment #24 from remyvarma@gmail.com ---
Hi - was this ever resolved? I think I am facing the same issue. When I unp=
lug
the cable, I see:
[  126.362313] dwc2 ff580000.usb: dwc2_hsotg_ep_stop_xfr: timeout
GINTSTS.GOUTNAKEFF
[  126.370999] dwc2 ff580000.usb: dwc2_hsotg_ep_stop_xfr: timeout
DOEPCTL.EPDisable
[  126.379585] dwc2 ff580000.usb: dwc2_hsotg_ep_stop_xfr: timeout
GINTSTS.GOUTNAKEFF
[  126.388225] dwc2 ff580000.usb: dwc2_hsotg_ep_stop_xfr: timeout
DOEPCTL.EPDisable

And the machine hangs. Using with g_serial, dr_mode is "peripheral". On 5.1=
5. I
have disabled lpm also.
Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

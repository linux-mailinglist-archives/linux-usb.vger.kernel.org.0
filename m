Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15AD94407A1
	for <lists+linux-usb@lfdr.de>; Sat, 30 Oct 2021 07:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhJ3Fvq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Oct 2021 01:51:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:48638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229606AbhJ3Fvq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 30 Oct 2021 01:51:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9C77161054
        for <linux-usb@vger.kernel.org>; Sat, 30 Oct 2021 05:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635572956;
        bh=dCFC/OtNRG4NTMCXYC72ihixo+oxnA+OvAjLXwT5Jf8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R/XM2O2gWKo/LiowqGEXUGiCwfLcdKhFZHsyBCJnYhM3H3jZcuaSKfSyQ7teT3uOn
         SIOJsS132g7uelMVZgtKh7HewfHBP3gCAlRXhannLe5D/FmACAIE6pqoOKvw+F2LNU
         v8ANfHsVTqh8h42tzpC6SV/6ejlApYl5pMwAb34/my1XXGhju0FgrDk3QfO74mMjOk
         u+Cp54FUi5Od1d23aPVz+qWe6GCW3hahv+Uo02Vg9yxWrjPbFPMZCc3TKzW0YPfg/a
         XVfrviK63DEz+wPIyW0zxZcVWxIkjySX0jiogVtyMvmLcqaeXrL3mrOZLrbPZ4QrSI
         EdsWS5T4v3BzQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 84A0060F47; Sat, 30 Oct 2021 05:49:16 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214875] USB 3.1 device cannot be detected
Date:   Sat, 30 Oct 2021 05:49:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mr.yming81@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214875-208809-xCkhRpLge6@https.bugzilla.kernel.org/>
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

--- Comment #1 from Walt Jr. Brake (mr.yming81@gmail.com) ---
Yesterday I try to fix it myself, and after I revert the patch [usb: core:
reduce power-on-good delay time of root
hub](https://lore.kernel.org/all/1618017645-12259-1-git-send-email-chunfeng=
.yun%40mediatek.com/),
compile the kernel and test, it works.

Here is the patch:

diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 22ea1f4f2d66..73f4482d833a 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -148,10 +148,8 @@ static inline unsigned hub_power_on_good_delay(struct
usb_hub *hub)
 {
        unsigned delay =3D hub->descriptor->bPwrOn2PwrGood * 2;

-       if (!hub->hdev->parent) /* root hub */
-               return delay;
-       else /* Wait at least 100 msec for power to become stable */
-               return max(delay, 100U);
+       /* Wait at least 100 msec for power to become stable */
+       return max(delay, 100U);
 }

 static inline int hub_port_debounce_be_connected(struct usb_hub *hub,

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

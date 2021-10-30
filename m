Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEB34407A3
	for <lists+linux-usb@lfdr.de>; Sat, 30 Oct 2021 07:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhJ3F76 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Oct 2021 01:59:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:50194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229606AbhJ3F75 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 30 Oct 2021 01:59:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2EB97610CC
        for <linux-usb@vger.kernel.org>; Sat, 30 Oct 2021 05:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635573448;
        bh=mcWV1hwfnaMx/HrgwUv57xLDh2eKe7PmblpzioB8VKQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aDp1e1Ydwq3FyMzZ8QhffJAy/KdAOeY5hhYlJf1pQL9FO6R5BI3MsA6ON0duUNuc+
         nHwNQ5iqMy7x8UliUQzDUuyrCEmI7ooHypHfot2AYX9Ses3JCHjddj3p1YYsjbmIAN
         YsNYXLbteOcuy0D/E4JxSgT085QS18gGri1+mtuJCb4TopbDsgii8cJz0K3JnULDVi
         6DKp/WPmcK7M9vPurQw6aQf1T6x/P6FKv4vbsnD8MIoShnoY5DZdW7X2Ce/iCGLDne
         tIYbvlk0j6LyYgB130vDySJ+vz7si/d6kyIophiBM6d/IYJbWRXHQ/78y2FrOQFVPQ
         tvQIbekhA5o/w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 1D34860F47; Sat, 30 Oct 2021 05:57:28 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214875] USB 3.1 device cannot be detected
Date:   Sat, 30 Oct 2021 05:57:27 +0000
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
Message-ID: <bug-214875-208809-Nx2R0xutvF@https.bugzilla.kernel.org/>
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

--- Comment #2 from Walt Jr. Brake (mr.yming81@gmail.com) ---
correct the patch display format

```
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
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

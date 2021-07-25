Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1DB3D4E1B
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 16:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbhGYNpN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 09:45:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:53882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231128AbhGYNpN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Jul 2021 09:45:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9C5F160F23
        for <linux-usb@vger.kernel.org>; Sun, 25 Jul 2021 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627223143;
        bh=v3WCU0sOuZLqQ1El2HbgJHVZptK95cxC3WUE/SD39xQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Kk++ZjWRVsChUtmptpA6ZThi7Rj6WTemiH5eadmmib3OnuSDHe/L7dVo5ws7QB+gN
         fVcA9ebRpSEraCDiD+SfOuILZKNnTVs+u2n3UVojgmP24sO4YK2objMy7vfClvDKSE
         TOgTWwWxvlIVWBljUQhgjUsV5KNk8VD2dTCFafy8mvvV68L40qYY+0uK2UQlzi5aI3
         TODfC9i808JkUnlQbNFYZOOt3fD6jrlE8JGUrw1hyVlgSGxhCs1j0BEi7M8eoPdF6V
         kc8h4k29jsfNepwhCbadeKCTeVgwwpDZQYuqftl+oShXMb509PdgHhRhkb+qW0np5z
         BvefU/zCLKsgg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 997E560E96; Sun, 25 Jul 2021 14:25:43 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Sun, 25 Jul 2021 14:25:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Minas.Harutyunyan@synopsys.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-Sqgt75Got2@https.bugzilla.kernel.org/>
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

--- Comment #18 from Minas Harutyunyan (Minas.Harutyunyan@synopsys.com) ---
Hi Yunhao,

Thank you for provided info.

Driver by default set to DDMA mode. In DDMA mode very important when reques=
ts
producer (function driver) produce more requests that consumer (HW) can
process, otherwise BNA (buffer not available) interrupt will be asserted.
In your case function driver queued only 2 requests for EP2OUT. Driver crea=
te
descriptor list with 2 descriptors. On completion of 2nd descriptor core
returning to first one, which already completed and not renewed yet. Becaus=
e of
this BNA asserted. For OUT EP's on BNA interrupt RxFIFO should be flushed, =
but
due to AHB not idle - core permanently try to get new descriptor, but no new
descriptor created yet. This create infinite loop.
So, I suggest you, to allow your function driver produce more requests befo=
re
first ISOC OUT packets will received in RxFIFO to have enough big pool of
descriptors.
If you can't control initial requests count from function driver then you c=
an
try set core to BDMA mode:
g_dma_desc                    : 1 --> 0

In BDMA mode BNA will not asserted.

Thanks,
Minas

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

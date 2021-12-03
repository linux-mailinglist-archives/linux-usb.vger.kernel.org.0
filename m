Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9623B466EFB
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 02:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhLCBMK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Dec 2021 20:12:10 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:33132 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhLCBMK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Dec 2021 20:12:10 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0FC7DB825A1
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 01:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C050FC53FD1
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 01:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638493724;
        bh=c8XPoxJQFmNvoWoDvGlmN4XJVrOtmqKQ2UWeEbJnvwI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=s4d3Y7RoBWqhlnmHQ0o00LNLiiihT0PlrVjhAMhTUL9W/OmUgy+SemJtjJ6wuaifc
         A27t3prMtZvQuBl1DLo5oFnr6liBnp7tPnrJ+5CD8pfBfTuKxxW9vJvzqKSKnH2tjM
         GUgr4VgbNi78Dp5GP4sHA7hjU6jdIcojeMKC+Pe+bQ5YRy7/ll+FzR4iJN79s+Ns/t
         wJvCPC5eDPk32tor9dd6rEiiEc0Z8relaE/4qPQPqbqW98RMRo7CyQYLbx4zTzENnT
         xFvFBzTaFOz5upfNUc42rXRBald+f44KSY0RQRgrd91ZBCjuSEsTk8ydH6sRWww4rd
         X9WZ6JRX7/g+A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 9E3B360FC4; Fri,  3 Dec 2021 01:08:44 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Fri, 03 Dec 2021 01:08:44 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-jLlsfGUHNE@https.bugzilla.kernel.org/>
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

--- Comment #29 from remyvarma@gmail.com ---
Thank you. Yes it would be great to find the root cause of this. I am happy=
 to
help debug. Two things I noticed. Is it normal to have two messages like th=
is:
[   54.976434] dwc2 ff400000.usb: new device is high-speed
[   55.090994] dwc2 ff400000.usb: new device is high-speed
(I also see the same thing on mine)

And also, I think possibly related to this:
https://lore.kernel.org/lkml/20200214160149.11681-67-sashal@kernel.org/
I saw DPTXFIFO 9: Size 256, Start 0x00000123 in my debug logs at some point,
even with that patch applied. I will reenable debug logging to try to find =
it

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

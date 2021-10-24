Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41F84388CB
	for <lists+linux-usb@lfdr.de>; Sun, 24 Oct 2021 14:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbhJXMMV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Oct 2021 08:12:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230300AbhJXMMU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 Oct 2021 08:12:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3D80660FD7
        for <linux-usb@vger.kernel.org>; Sun, 24 Oct 2021 12:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635077400;
        bh=XY9Jk9MVgIL6WMwHJntqUBZG2IvCMZlshqCnHS4lE+0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WW+3qNleXluQ844Pu6CJLHB2XOG01pnl0kyJvWwfu+UjdMgpsDPRui3hbnL/l5iy4
         5G+QHCzGnKx+hPIREWwIeuc4mN7p4DeyMaYIXtYLAK1yuG+Le6fQGiBkCzvNeeX2+w
         CqB0hql5W4ogrU1GBSA15quwvOH/eLKKFi30g6oY2MTXImZt31f7WUNv1JrfFqKLCn
         kAnTh8KF3ZVv+FJP6dMl8Ui8/ZFZXEpaX5A9ptkuROHpS9sexkhd+5TThRYYh/lpIQ
         +W4o4yjsWoPxOLk2uBTAnEBAKOa+4kryWUYtQKxYT6rXCC/j8Sy95se2rWn/M3roIY
         K70wZdLyP2wlg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 39C5260EFF; Sun, 24 Oct 2021 12:10:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Sun, 24 Oct 2021 12:09:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: meven29@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210425-208809-ikw1fHywIP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

M=C3=A9ven Car (meven29@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |meven29@gmail.com

--- Comment #5 from M=C3=A9ven Car (meven29@gmail.com) ---
It seems to me `ucsi_resume()` should take into account that connectors can=
 be
plugged-in/out while the system is suspended.

Upon wake-up it should someway scan its connectors and notify userspace the=
n.

Instead resume only hook the notification after the fact and does not check
current state.=20

> int ucsi_resume(struct ucsi *ucsi)
> {
>       u64 command;
>
>       /* Restore UCSI notification enable mask after system resume */
>       command =3D UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
>
>       return ucsi_send_command(ucsi, command, NULL, 0);
> }

Consequently after suspending, unplugging AC and resuming

> cat /sys/class/power_supply/ucsi-source-psy-USBC000\:001/online
> 1
Regardless of the connector state (re-plugging is not signaled either).
We don't get any `udevadm monitor` notification from the usci subsystem.

AFAICT We should have a call to
"power_supply_changed(usci->connector[i]->psy);" somewhere for the usci
connector concerned resulting from `ucsi_resume` after the connector state =
has
been updated with `ucsi_handle_connector_change()` for instance. But I don't
know about the work_struct API.=20
Either this or a bug in `ucsi_handle_connector_change()` not taking into
account the unplugged-during-suspend usecase.=20

I would welcome any code hint to come up with a proper patch or a patch tha=
t I
would be happy to test.

My hardware is a DELL XPS 9370.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

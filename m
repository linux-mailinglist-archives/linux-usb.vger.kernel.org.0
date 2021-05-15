Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2DE381A4B
	for <lists+linux-usb@lfdr.de>; Sat, 15 May 2021 19:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbhEORwa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 13:52:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:41848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231480AbhEORw3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 15 May 2021 13:52:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 42D20613AF
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 17:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621101076;
        bh=LvKLfdkFYHm/p7paKkpUQ6hicxmi9r1GByK+javvArY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=a5Kvp2CC0yj2MuG2gD+YEf3TNddc8RydJ9mOijzv8ub1M9pV+sMrnLcZ5XRoV6hBj
         7oUJU4W0X7EUwBmvRmk6PVm952iGJzQxspBocezW9RKbV3kshQQZRMi71V/xT9TMEX
         dTGRpLf9XdAADp+PE9gM86g96fDj7+MDt0Nx8lpN/BgwjBhhGnf6Jk1UhSPcwIYkWP
         zTXxKadQOykMTjKbgB6s4lyTlrn44sR23fhYOzhwexgC+Fuf533ldVOUL927tdwAc+
         MfU7VAtBL9UVyN6OzyK0Nz/DcRkNnNZLU6+t7LC3YdK5sD2WBP4oL3qTW7o+b5dC1B
         gtNsmBQlWEsSA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 36B94610A4; Sat, 15 May 2021 17:51:16 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Sat, 15 May 2021 17:51:15 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213081-208809-Jr3nptjZB0@https.bugzilla.kernel.org/>
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

--- Comment #5 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Created attachment 296787
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296787&action=3Dedit
usbmon trace 5.11 bus 5

Here you are.
I also recorded a trace of bus 5 since it seems a Genesys hub shows up ther=
e as
well as soon as I connect my display (but I have only one physical USB cabl=
e).

What I did with both kernels was:
1. Boot the system with the SD card removed from the reader and the USB cab=
le
of my display unplugged
2. Start the trace via
cat /sys/kernel/debug/usb/usbmon/6u > usbmon-5.11-bus6.log &
cat /sys/kernel/debug/usb/usbmon/5u > usbmon-5.11-bus5.log
3. Plugged in my displays USB cable
4. After waiting a moment, inserted the SD card into the card reader slot
5. Executed cfdisk /dev/sdb
6. Waited a few seconds and stopped the cat processes

Please let me know if I can assist you with additional information.
Thanks a lot for responding so quickly to my bug report and taking care of
this, I appreciate it!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

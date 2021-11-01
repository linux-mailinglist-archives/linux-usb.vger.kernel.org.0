Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53D2044207E
	for <lists+linux-usb@lfdr.de>; Mon,  1 Nov 2021 20:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbhKATJu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Nov 2021 15:09:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:57518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232521AbhKATJs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Nov 2021 15:09:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 33A1060EB4
        for <linux-usb@vger.kernel.org>; Mon,  1 Nov 2021 19:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635793634;
        bh=E6rQj6GnJ/pZiYL2J6F1zfQnLb0xnmlaPNvjA4tnT4w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pG7sR88IbrHXfs8ae7MQYF9dWfZcVmFMHwfQFg7W8peGTOTC6L0FAxAnIQ/59DBCJ
         MF0yT3+2uXqo7XjwL2cSyLyMTW06SqKTJ0tz5+sUA4NPt4mzIE43Uu+jDl99ZrOyBG
         LIUM2XTV+8qcYbQPba33yVjobtg46Kq1T8oB01WoRxxhebnb+nr8NKtma+vQJ+OfqY
         dOo9faVTOLleaklxzx+T1MECjgqqrs0ApPHOQq+EBhbymKfAktuu1Z2rtEWcoWidPU
         y6x/Ducyj3C8VTwcMc2n1Q6KZU/54cReGaCDcldtK30S6rwFEibjjA1dXMT56rnVsB
         qrxtrGmjRsVmQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2A73160FC0; Mon,  1 Nov 2021 19:07:14 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Mon, 01 Nov 2021 19:07:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: scott.c.arnold@nasa.gov
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214789-208809-m67Bw7YXKZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214789-208809@https.bugzilla.kernel.org/>
References: <bug-214789-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214789

--- Comment #19 from Scott Arnold (scott.c.arnold@nasa.gov) ---
Hello,
5.6.1 kernel OK.
5.7.1+ kernel not OK
Thanks
Scott

-----Original Message-----
From: bugzilla-daemon@bugzilla.kernel.org <bugzilla-daemon@bugzilla.kernel.=
org>=20
Sent: Wednesday, October 27, 2021 3:07 PM
To: Arnold, Scott C. (JSC-CD13)[SGT, INC] <scott.c.arnold@nasa.gov>
Subject: [EXTERNAL] [Bug 214789] ehci-hcd.c ISR

https://gcc02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.kernel.org%2Fshow_bug.cgi%3Fid%3D214789&amp;data=3D04%7C01%7Cscott.c.arno=
ld%40nasa.gov%7Cf3685d8b91f04999847c08d999855b9b%7C7005d45845be48ae8140d43d=
a96dd17b%7C0%7C0%7C637709620310380793%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DxM=
Q2XRrPyP6IpmTn%2B3bE72joD0w%2FPIYMpZdqvbsAfdY%3D&amp;reserved=3D0

--- Comment #15 from Alan Stern (stern@rowland.harvard.edu) --- Can you try
testing some kernel versions between 5.3 and 5.11 to see exactly at what po=
int
the problem was introduced?

--
You may reply to this email to add a comment.

You are receiving this mail because:
You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

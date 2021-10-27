Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBFC43D303
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 22:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240618AbhJ0Ulj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 16:41:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:40098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235613AbhJ0Uli (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 Oct 2021 16:41:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D38F360F39
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 20:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635367152;
        bh=JkafoNR5uR5HUnYttQOrREiUXQD4ujLr0W8iio34VKs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WtK13IsGlxHH+nd4M9QH6B9kTY8/TBYQELdA5CTkLTcqH4NVZLHsTRW7ToekUKTQG
         xM4m4mnNxIbU9vUhik2+ZaliwfNPHztlWKwRdQOhxrtJ6oIJP1XE+liVEMdMoNo17A
         HCg3Cpp2U5BJUqiCZsOc14PZufT7fGwSuanpCMtTLvQl5d/m9/YaWIh1sC3XIdYRmV
         HtfU2ZqYjbT/3OXi3UasiFBrJdVJ4l3Yr4dtNwnPKjvxdRc/uBCFIhGvBIf0mv+5hp
         Q9lyaojo5BXvQsaXbaPFNV+Jb+yfIwwRwqHhJLbwaa+g48cDfp9vDQT+9hmV0F0NwK
         0JdBeBH70KTiw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C3669610FA; Wed, 27 Oct 2021 20:39:12 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Wed, 27 Oct 2021 20:39:12 +0000
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
Message-ID: <bug-214789-208809-ph5y6lXBsb@https.bugzilla.kernel.org/>
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

--- Comment #16 from Scott Arnold (scott.c.arnold@nasa.gov) ---
Hello,
Not easily, the machine is back in general development use.=20
I'll see what I can do.
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

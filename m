Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015C1377488
	for <lists+linux-usb@lfdr.de>; Sun,  9 May 2021 01:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhEHXOu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 May 2021 19:14:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229549AbhEHXOt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 8 May 2021 19:14:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 005386108B
        for <linux-usb@vger.kernel.org>; Sat,  8 May 2021 23:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620515625;
        bh=urYcgB5DELVOo7CZesrQp+Jraj5fniyH14iPULYmzy4=;
        h=From:To:Subject:Date:From;
        b=YTG9oOGTBp4pv6CWPBhuD+aNdJMgIgZkyhz5Q3pprsySJN7JTARLG8TjoF/U1or0j
         OsfDQM7ymwCGS69QSzLXivyEgyJd1qtEhPtbUh+ZIrI5kwymSnbW+MhOKiPhcPCXzQ
         wulTiS/49PpFx8W7dyBPiqkNrxv/dqYHD461rI+iJpqS4bmEYK4DyawEJHTFx61MFV
         WfCT5BM5aRcsMTg6yQ9BgsEJEOnKpoMURDPo4pEKE+ul+3LxcAl4bem2L43Cw+ywOt
         DrLjmZQK66csFm+vPmN/wgHsSFGz9JCNWIfu3Hf3JSf8j/g5M85Ofca5+JRcUrTcKo
         FRLUnXRVFpO+w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id E1D7661186; Sat,  8 May 2021 23:13:44 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212999] New: xpad map Xbox 360 controller incorrect
Date:   Sat, 08 May 2021 23:13:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: anton17082003@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212999-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212999

            Bug ID: 212999
           Summary: xpad map Xbox 360 controller incorrect
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: anton17082003@gmail.com
        Regression: No

I have DEXP G-4 XI controller with XInput of Xbox 360 pad
This pad has idVendor 0x045e and idProduct 0x028e
But I don't receive any input events on /dev/input/js0 or /dev/input/event11
until I found this python script
https://gist.github.com/dnmodder/de2df973323b7c6acf45f40dc66e8db3 that fixe=
s it
and it really helped me with it. But I think it must be fixed in xpad driver
without any third party scripts

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

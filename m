Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55B63CC59D
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jul 2021 21:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234634AbhGQTYk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Jul 2021 15:24:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:36288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235309AbhGQTYf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 17 Jul 2021 15:24:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 85A7860200
        for <linux-usb@vger.kernel.org>; Sat, 17 Jul 2021 19:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626549697;
        bh=uzXSe3s1ioASoi/4OCJOIhW5qLRA+rjS+jEtx1UU5vA=;
        h=From:To:Subject:Date:From;
        b=Vy25mCic1eYniWxMwjOzKrbIdqAr6Nucl7L+8n3hDGaLyzrUkciYSl79z5an8o7y7
         N2Etu4ncAKhg1XNUhtD4M9Z/6pc8Wtqso6ru/VLdEY7bwWhj65PxT/558GFMoRdPCV
         TtKmMj3B1hxu0Y84Kz3m/XEWxCOHN6i+ZPGzGTzG7kG84m9Fad3fipUXA7FLa1ck5/
         JbMgZ6Vza7uB07taM1VDOCRMVp6Kb6JeXP3YzIGOZfuGexpkrWc9D2m/QXoJkGU+Cp
         oAw3y9aFpUVg76iON5/mnmfy0nklhXYlJZtnv5unxOqyjxPHBKow1K+k0gYSDvNW71
         W+UvVzC2LVKsQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 6E271612B3; Sat, 17 Jul 2021 19:21:37 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213771] New: ch341 USB-Serial converter receives but does not
 send
Date:   Sat, 17 Jul 2021 19:21:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luzemario@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213771-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213771

            Bug ID: 213771
           Summary: ch341 USB-Serial converter receives but does not send
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12-rc3
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: luzemario@gmail.com
        Regression: No

Please see Ubuntu bug
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1919051.

Tested with Alpine Linux alpine 5.10.16-0-lts kernel too.

Possibly still exists in the latest (5.14) kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

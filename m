Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C4F3F3E3D
	for <lists+linux-usb@lfdr.de>; Sun, 22 Aug 2021 09:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhHVHMe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 22 Aug 2021 03:12:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:35128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229934AbhHVHMa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 22 Aug 2021 03:12:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 111C461206
        for <linux-usb@vger.kernel.org>; Sun, 22 Aug 2021 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629616310;
        bh=uJUnAtS9ndiuN/XguGKR0z2MRgzJaTJfANKenfHb+pY=;
        h=From:To:Subject:Date:From;
        b=poT1Tjdpp6MGCdsqsGB2Kbg1H9uMfqAZFP4VaHvokJgJT36lDr+yn/X7F8yx8zYVl
         a8EuokrIJyCzC24QjiC6di9fGf5iyJ4MsNB5wRUw4WQDI2ueTSXjJx7bxcUBUVsMQB
         HviB4NDbNLtjD2+h4Z0dGWS+/1N+IhV6ezrU4vY0LQYxZ0xC/IAqJpCoDhR+EhfpZY
         uCIvZhHO9Ls5pafeHGybjn4aVIULPZkpUupBmgkmnSiBvqaSzOF05/Wp0e1yH9AUD9
         /3FTYnMAMTYw3kudhCw+Ml9xgp/JzcHFWeBw1tPqRed64x6iD4Fj/J/CQ+gC2scMvq
         fOGIwf5YMpw6Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id EE69960F55; Sun, 22 Aug 2021 07:11:49 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214131] New: ch341 communication problem
Date:   Sun, 22 Aug 2021 07:11:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pb.g@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-214131-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214131

            Bug ID: 214131
           Summary: ch341 communication problem
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14-rc5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pb.g@gmx.de
        Regression: No

Created attachment 298411
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298411&action=3Dedit
captured communication

Several users reported their USB-Serial Adapter based on ch341 driver does =
not
communicate correctly anymore with kernels somewhere above 5.10.56-1.=20=20

The problem is that flashing an ESP8266 board is not possible anymore with
Arduino IDE resulting in a=20

"/dev/ttyUSB0 failed to connect: Failed to connect to ESP8266: Timed out
waiting for packet header"

error.

I can confirm this issue up to kernel 5.14-rc5.=20
Downgrading my kernel to 5.10.52 also solves the problem.

I attached two communication samples from github user jypma.

The issue is was discussed here:
https://github.com/espressif/esptool/issues/653

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

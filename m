Return-Path: <linux-usb+bounces-18745-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B88F9FB51D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 21:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97E5D1617C0
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 20:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6113B1BE871;
	Mon, 23 Dec 2024 20:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Or5a+coK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D929E1ADFFB
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 20:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734985191; cv=none; b=IskdiKSqn8G6p0uOPr+4KZxKVaMTq5RYjmoQf7/VpAZL4zJ0S2nIA7pMW9B8QK3Kb4CoDWMbuH2lv1gA3U0x0u+kKlChEQ1Rm2vLQD8kEicIJNiSfyt8dXc09u2JXmGOE/VIK1kbk5i/AYQLgDYA3UAKFeOMbUFHodY3wIdu51s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734985191; c=relaxed/simple;
	bh=qRAV2AUskVvgfdPH+d3dscTXZnC7+GbkfQKOS36iQ8g=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=E8gPHNcMOrQOlvmTkiZuqSTiHpmnOs11Cf/edsUwbey+jBEZ/uUSbiBAvszW89j/mABpW1epVwLOpBHbmlRPLKsA9XTIVNqmYFqHGfvio63Epyo6b8LUdRdWoVHMPB8gnChwLoqu00SUcw5EY/cAvCOnktaLr1/gqJTO3n4RZr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Or5a+coK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 794E3C4CED3
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 20:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734985191;
	bh=qRAV2AUskVvgfdPH+d3dscTXZnC7+GbkfQKOS36iQ8g=;
	h=From:To:Subject:Date:From;
	b=Or5a+coK9skdDN/awJnAC9qAg53MBkLdbhr1WC88H8gNy7/b0SiLPis6IV/X9YN0r
	 2P1XDYR5iu7uGFZZ/rgQSxiGiHAWxLLOvJxMRWlzTaKPs2Xf5Ov+yN2JzrVSDeHHT2
	 CCCST8/25ML86C0egJIuXCvUhs8RJUkMUYgl7r8xyKP/z90zpIhqQ0qqpSkWxmYG99
	 +r6w4OogF8uWdrJ0gLCNbd3tmyMT0VDtstoFEqLH80s1riGkKpUN8A1dz2upIfaVjx
	 UmJdSQQ7wk9ri04AaP+pCh6C6Bx6WI5SFCKwcsETjuGFNZ8p0jhz64FMg+KSorDrqM
	 xP4gVg6s0JfUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 69671C3279E; Mon, 23 Dec 2024 20:19:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219626] New: Infinite udev uevent stream from USB-C port
Date: Mon, 23 Dec 2024 20:19:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hegel666@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 cf_regression cf_bisect_commit attachments.created
Message-ID: <bug-219626-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D219626

            Bug ID: 219626
           Summary: Infinite udev uevent stream from USB-C port
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: hegel666@gmail.com
                CC: gsara1989@gmail.com
        Regression: Yes
           Bisected fa48d7e81624efdf398b990a9049e9cd75a5aead
         commit-id:

Created attachment 307397
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307397&action=3Dedit
udevadm monitor output

After updating to 6.12.5 from 6.12.4 systemd-udevd worker burns CPU process=
ing
an infinite stream of USB-C events. In order to reproduce I have to plug off
the USB cable and plug it in again. I tried 6.12.6 kernel with the same bug=
gy
result. The problem disappears after going back to 6.12.4.

My machine is an ASUS Zenbook UM5302TA laptop.

Reverting this commit fixes the issue:

commit c0ca6fd5f6ebde8fc0df8bb5c32629d1284f60d0
Author: Saranya Gopal <saranya.gopal@intel.com>
Date:   Fri Aug 30 14:13:42 2024 +0530

    usb: typec: ucsi: Do not call ACPI _DSM method for UCSI read operations

    [ Upstream commit fa48d7e81624efdf398b990a9049e9cd75a5aead ]

    ACPI _DSM methods are needed only for UCSI write operations and for rea=
ding
    CCI during RESET_PPM operation. So, remove _DSM calls from other places.
    While there, remove the Zenbook quirk also since the default behavior
    now aligns with the Zenbook quirk. With this change, GET_CONNECTOR_STAT=
US
    returns at least 6 seconds faster than before in Arrowlake-S platforms.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


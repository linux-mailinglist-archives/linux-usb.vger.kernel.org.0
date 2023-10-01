Return-Path: <linux-usb+bounces-875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF97B477A
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 14:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 4CDA91C20977
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 12:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5515E544;
	Sun,  1 Oct 2023 12:43:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D8620FD
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 12:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEC08C433C8
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696164215;
	bh=V26M6HdgBYuSE+jdDgOvsb6ZdQwhUVGKM/odsY6Bw4M=;
	h=From:To:Subject:Date:From;
	b=QtVY+kq7O5mUF/snsox3xgUU+ITNLLi2f8/yWNmB9DxXoQ4P1SEvxnTSyx6i66Wjo
	 NaFtaAWZ4P1jVGuB5ENQZKlJE9bTGNLBNJyiSwjz1LFWwSugMM9L/6v6qrRbgVRwf+
	 V4I+ok9xw/FLsZidvBeI9yA7HBQlNkQbclxWNdI+NgM37CLTlD7p83RVreSX46U6fa
	 K9Y/fNRMY8fmfuS+UDK3Q/SCEFB9tunWPBc0yg1zuJ+vaowdHl93EslPmJAVnoGGSk
	 4XNVtmU8GFXkMGr0pr4ydnHWj1O4qv3UoANbCic0jr3NoafezEfqlgR/9bPOaYF5Kf
	 Q9cRlTW4zwoBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 983DAC4332E; Sun,  1 Oct 2023 12:43:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217960] New: Linux 6.5.5 - kernel BUG with ucsi_acpi
Date: Sun, 01 Oct 2023 12:43:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alxchk@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217960-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217960

            Bug ID: 217960
           Summary: Linux 6.5.5 - kernel BUG with ucsi_acpi
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: alxchk@gmail.com
        Regression: No

After update to linux 6.5.5 I observed several crashes during bootup when U=
SB
drive connected to USB-C hub. To find out what has been crashed I enabled E=
FI
pstore. Unfortunately there were no crashes after that. However, there are
kernel BUG traces in dmesg. After several experiments I found strong
correlation between ucsi_acpi driver and the crash.

I blacklisted:
blacklist typec_ucsi
blacklist ucsi_acpi
blacklist roles
blacklist typec

Two dmesgs are in attachment.=20

The messages to search:
ucsi_acpi USBC000:00: possible UCSI driver bug 2
ucsi_acpi USBC000:00: error -EINVAL: PPM init failed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


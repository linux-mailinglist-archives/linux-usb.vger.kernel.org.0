Return-Path: <linux-usb+bounces-7424-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7286F07A
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 14:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B2791C209FB
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 13:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F8C107B4;
	Sat,  2 Mar 2024 13:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZ331CZl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E647613AC3
	for <linux-usb@vger.kernel.org>; Sat,  2 Mar 2024 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709384635; cv=none; b=q0vBVMI8UP+vxXVTvyaa7qb6DN2Exn1Kz0Yl+ka5SJpbPfrKHmlmuTcpbO3S4n2TlUBC0jRz+gSmOJSTVJtuw5uRO0MKyIE9Q80tvudhLg5i6jIWMrIiAx2RAmuaNWi6O/aqjpQCXUD59ZwEGMInMKGl14NCeEX210oNgEZ2wg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709384635; c=relaxed/simple;
	bh=1WisOG1um8Pdz1BGIunTpzN6Xww7822gNe8dTiF0W1Y=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ROTEQNUWgyFu3LSk1PgpPdXhTpEaefSavBFr3xtZaV0LDBSHbMVWJ/65GFHRtt2zsSD4PU9/DIgl7NvZkNlblLp0N6T3bQ6iyoAC3a8qPzjU5cf44WVoRk0oNmybNqWon2w1yNur3JzNAsubYfvDtbmkL5ya8u/salY2uFNHhDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZ331CZl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64EE7C433F1
	for <linux-usb@vger.kernel.org>; Sat,  2 Mar 2024 13:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709384634;
	bh=1WisOG1um8Pdz1BGIunTpzN6Xww7822gNe8dTiF0W1Y=;
	h=From:To:Subject:Date:From;
	b=DZ331CZlUalYaffz346IfIwWCiI1PiyLtiFUGWPsdjGWx/268bLS5Fa34wmenrjHW
	 5lNwmHXngUfK9F3+UEfhbv9unD193Y0fz2vvWMooVFu7/Pb0PYGmEA0jIrI5osnpAh
	 TOrSRQAKnmubPhQ8RnHUmib4WMWA73B0z/pWeZiTXtTex7IDE+DhTfIJivY8o7/mMO
	 dBPj3CFx28QCfx2tWJ9OxQV47G7AJDfZMBmrbR9VGfudux08RZYFD29jpvQ4RW+cwx
	 hZBNqcWn04CdAIbAdvs1Bh576rRz85pCZdfsO1zwH2dXa66zArosZPXdqtEASyxxf2
	 O0MOsACRmOGug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 43B38C4332E; Sat,  2 Mar 2024 13:03:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218551] New: Roccat vulkan 120 volume keys not working anymore
Date: Sat, 02 Mar 2024 13:03:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sascha.grindau@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218551-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218551

            Bug ID: 218551
           Summary: Roccat vulkan 120 volume keys not working anymore
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: sascha.grindau@googlemail.com
        Regression: No

running:
sudo showkey --scancodes=20
shows input for mute, play, pause, next, prev but not vol+ and vol-.

lsusb|grep ROCC
Bus 005 Device 005: ID 1e7d:3098 ROCCAT ROCCAT Vulcan AIMO
Bus 005 Device 007: ID 1e7d:3098 ROCCAT ROCCAT Vulcan 120 AIMO

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


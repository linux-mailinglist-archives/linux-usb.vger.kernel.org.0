Return-Path: <linux-usb+bounces-6411-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D4285506C
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 18:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 191CCB26FB4
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 17:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8497C5FDD4;
	Wed, 14 Feb 2024 17:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDk15GuA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1019460867
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 17:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707932028; cv=none; b=AYel7h4L+E6guyWasdfbutgtjDEeM1WYQk1rqigv6ITtPRrYBD6MvraQ/B+jOJtkOaXkLAGED+WQZhByqYkyqWB6OBGV7k3ec9GR82TfCVq4JbhQ4vL8QLuo2rLJUuNXyL6Laima0fXBhx5Or5YJhMqo0ilgmp9kJRz1K8tEfj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707932028; c=relaxed/simple;
	bh=wMyr96RpJ3nimWniheFTDvbpRULjOoF5wIfvkGz2/rM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=l49gl+/1Jsc2q7VD2E9/KHUvn0JeDGtr8UmSDksVlyaKIrOARUTgXToca9/pliYXuu8ldXdy4SY5KQjA/hb4ZUwcvwF6aMbMOIvbxGr5dJkGfkBJLB4j9oxeVuz2hDU8nejLWpwwN/1DzWFXzWP7tOB/AlmS3HImdhR5ugZPVyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDk15GuA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EF1EC433F1
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 17:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707932027;
	bh=wMyr96RpJ3nimWniheFTDvbpRULjOoF5wIfvkGz2/rM=;
	h=From:To:Subject:Date:From;
	b=QDk15GuAURFKlA6BsDd0/rmieSyad/RkJ1vmmRYNZP2DwUR1xTVKyrNxa1uOh7Qi1
	 /BrO7huQqBtwGXBCwqhn+gNURuWQ5M9hu2YLhRakU86Jv1dfxFAPNlsV/XyClV3vii
	 eJB6fbxNUuUl+nXVH44DpGNFdLQLqoYIP97r8X5bE8jE2dZ7rosx3+Fo2UIsofc6Dd
	 CtBhqkS3oZajdhWk94A0KU89B/TD1WJHe/MNf1Jqb4zLcAQLQr83k43OeGc8/vua3T
	 9AJMJv1NVe1ULikAiZNB+v69mfiV8lzZSW3SrTDh3aKAfMcJlGH9nJmf7a8C69MCH0
	 EnEeixQJO7zhw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 660A3C4332E; Wed, 14 Feb 2024 17:33:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218495] New: NKRO does not work on Mistel MD770 (Holtek
 Semiconductor, Inc. USB-HID Keyboard)
Date: Wed, 14 Feb 2024 17:33:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ishitatsuyuki@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218495-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218495

            Bug ID: 218495
           Summary: NKRO does not work on Mistel MD770 (Holtek
                    Semiconductor, Inc. USB-HID Keyboard)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: ishitatsuyuki@gmail.com
        Regression: No

Created attachment 305872
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305872&action=3Dedit
BPF program to fix the quirk

My Mistel MD770 (04d9:0339 Holtek Semiconductor, Inc. USB-HID Keyboard) see=
ms
to have a descriptor quirk that prevents NKRO from working. A device
descriptor, a hid capture of NKRO sequence and proposed BPF program for fix=
 is
attached.

It's the exact same error as the Topre quirk [1], but the descriptor and of=
fset
is different.

NKRO works on Windows without extra vendor drivers. I'm not sure if Microso=
ft
just has a better quirk database, or they have some clever heuristics to de=
tect
this. Before copy pasting the Topre code and calling it a patch, I would li=
ke
to ask about what's the best way to fix this.

[1]: https://gitlab.freedesktop.org/libinput/libinput/-/issues/804

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


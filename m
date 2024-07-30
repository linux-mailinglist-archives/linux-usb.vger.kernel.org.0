Return-Path: <linux-usb+bounces-12647-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ED9941F48
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 20:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DAA0B26C44
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 18:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E5018A6C0;
	Tue, 30 Jul 2024 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdKW9qud"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C192533999
	for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 18:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722363118; cv=none; b=SQbktx52WnuMxQq0w0MV37Pysb1KG8XNLl0c87D+BQ51QXoUonh+690vtxHiYjEYG1IfOxAxqN0qDQ4pCVTBDyY77xx5myZuvIGqbM/Cg081wVa9WaAuS0dGYM1K4kWVM/3H2i7CKBQVT2Kxs/WMDqc1Hf6u5ujn3suZFSAUh/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722363118; c=relaxed/simple;
	bh=a2oQ5ntiMz/J7rka9M/gikuhnMGH53bzyfn2D4YO8Oc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=c64ZolfPjHD0ITtqLyArxsUGQie4ikZqlpfwh6A+qyw78hsGILQK3wQz8E5cvIN+rg1LJ6HxYn7L/4OMTW/KKrhlOzmIbFQTfQq+Lr6sYwxPVeb8/SzzrhqF/hbdcMG36U1phnfwuK+BZleMditcTVI0L5fBCQhkhSQA2Cg0LsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdKW9qud; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5416FC32782
	for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 18:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722363118;
	bh=a2oQ5ntiMz/J7rka9M/gikuhnMGH53bzyfn2D4YO8Oc=;
	h=From:To:Subject:Date:From;
	b=VdKW9qud2efmUVgsEJQUNTkvgdQfPPbbj4zFyebfI8R7dlA7x6s2mxQFGJqRRIU3V
	 xkNSVjndaIVtqTk92J0FQK2kX0E5aDNxV9BO10lDbgIwpIFwwMh0pIlm7mWODwxErH
	 Nsms9V77+GHrZrWZcVr4PIEoOeC3mKzfVwYThWOUMTi9zFuTprgzdWUkuU4LWU3eCb
	 /LPGIqWPHY5vXfbHsGuLS5lwKyza3ZfFX79rAVqeYwCdD+EYsgec3NM4Bj4MVX85Vb
	 Z5KSKtqG020a5KRLeBIk1oX+34/prSD8dYjhMF9LXYEnivnx+qXKUNLjcV9TsjRbHt
	 /KjaWeZkc4MuA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 43046C53B73; Tue, 30 Jul 2024 18:11:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] New: Xone:23C mixer not recognized as a 2in/2out device
Date: Tue, 30 Jul 2024 18:11:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

            Bug ID: 219111
           Summary: Xone:23C mixer not recognized as a 2in/2out device
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: com+bugzilla-kernel@c-henry.fr
        Regression: No

Created attachment 306638
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306638&action=3Dedit
dmesg

The problem is very similar to
https://bugzilla.kernel.org/show_bug.cgi?id=3D217089: the Xone:23C is suppo=
sed to
be a 2 stereo input/2 stereo outputs but only 1 in and 1 out show under Lin=
ux
(Windows with related drivers installs show the correct amount of in/out).

Trying to set bConfigurationValue, either by editing
/sys/bus/usb/devices/1-9/bConfigurationValue by hand or using a udev rule w=
on't
work:

# echo 2 >
/sys/devices/pci0000:00/0000:00:01.3/0000:01:00.0/usb1/1-2/bConfigurationVa=
lue
bash: echo: write error: Invalid argument

Please find enclosed with this ticket, the relevant journalctl, dmsg, lsusb=
 and
`cat /sys/kernel/debug/usb/usbmon/1u` of the moment I plug the device.

Reproduced on a Fedora 40 with kernel 6.9.11.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-25119-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18469AE9CAB
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 13:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D383A1C2112B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 11:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A83275112;
	Thu, 26 Jun 2025 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CW70J5sP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF25A273D65
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750937975; cv=none; b=tarBENsjxOtOcJxPn6BO8w6OTetj2JWGtb+q8BSy+gnC1buxGbYR3ANtLQC23A48CsUeJjlNxKt0kauPbA6ef+cIAqVHx8E2mY7sEx2I/IC/rx5V9A0j3d0CqBIW4hbTg+Cqyu/SSiPLtqpGRW9pE5GaXvPcbT50LTJVKlFczug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750937975; c=relaxed/simple;
	bh=gzus1+83/JfEqB+F2doC5nrGmagbsEh0ktRQ88QKu4I=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MIqa/kEkAV6wQT6FXWtsh5DGgf3p5Bcict/Gh6GSgTLVeD9VjnA5UCsucDxc2SUqPCsJXW0ghhpukDzatkJwgfEovBE8JlvhLrkxWD+6eCR1UanNNbUt6wFLEfuEDhB6RKpY0rrB2ZTtO8c2qs14b4cQQypZke9KCxnVYrk1Yrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CW70J5sP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 566FAC4CEEB
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 11:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750937975;
	bh=gzus1+83/JfEqB+F2doC5nrGmagbsEh0ktRQ88QKu4I=;
	h=From:To:Subject:Date:From;
	b=CW70J5sPQWcSJWpP7Lu9fP4G9+M2zLOLObCLhvgOE0DfQgaX2gOmn9Tx9L56cENhM
	 aKvKeq1onDYKxAWH+3PQBQFc4F3oXO0lac3K+fhZhYYzeICgalVrZj0CvlO2k0HrkX
	 KFsi8ha0QHVGQKV+rUJHb4KoqZki6qp8LzK92NTC21NAtDs+400iv18uUzzM9+ofQ2
	 Pb6D07fBsb4VXeAsgkUPkUVuIeuDzjYPvppIGARO7LSdFo08/ie+GbULDoIlg7OWHx
	 MOFQ5HLmc6LHvla7hmk2ysx0lzpw+Sj80Tdtwxf4MG38MVpikYwnK8rEioOfp9Y6JO
	 P2zyO/S/KfQVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 44197C433E1; Thu, 26 Jun 2025 11:39:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] New: Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Thu, 26 Jun 2025 11:39:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.seyfarth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

            Bug ID: 220272
           Summary: Latent race condition in USB code unveiled with
                    optimized memset_64.S
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: m.seyfarth@gmail.com
        Regression: No

Created attachment 308313
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308313&action=3Dedit
Optimized memset_64.S for Intel Raptor Lake

Experimenting with AI to tune memset_64.S (see the attached file) for my In=
tel
14700KF-system unveiled a race condition in the USB code.

Once this significantly faster memset implementation is compiled-in, I've
noticed that my USB mouse (Sharkoon Light2 100) is not recognized/detected =
any
longer after each re-boot. The USB mouse is placed in one of the top USB sl=
ot
next to my USB keyboard (which surprisingly still works fine) on my NZXT N5
Z690 motherboard. Which one doesn't matter.

I did not get any suspect dmesg entries, the mouse is simply not recognized=
 at
all.

I first thought of a hardware issue or defective USB slot, but re-slotting =
the
mouse in a different USB slot did not fix the problem eventually. The mouse
initially works fine there until the next reboot.

It also starts to work fine in the same USB slot where it wasn't recognized
after a reboot once I unplug it and plug it in the same USB slot again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-5920-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2A084B0A6
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 10:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49AAF1F24297
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 09:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B42A12D755;
	Tue,  6 Feb 2024 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GK7HOMgu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E986D12D776
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707210056; cv=none; b=Up6HlOYIox+iA0IJMybycYtDwvOo/CQbK34KL+PLOa3GCcJzurmcOjfcmQBGXr95Y1Mb3IlurQmzh81vBvPDuqoW6HiIXHV48U2S1mwUsnj4k2p4CIR9GH7sM01JGeBthbhNQ8V4GnO9hWlvE0QWhKQDIZl1m+OHRdI1NP0yXHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707210056; c=relaxed/simple;
	bh=ELTXnkXBxJWYQCoZM5i9V3EelQzt3T8cmksYVM5nrHI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Gg5y4E8WZos/4RJ9Nmeiu32JtEXgzBiaJWSJg20inw656r4DvLhYSFPFlWFQaaXm79GDgS9N0v55JuaH4ahUkNI30pPbHCIzdMCW+BBbyj9ozn2nxX8rbfEeHvvqc7alBF99+0hdJrWYB5zXk+GxIH0JbVRIOcIE+62rvEokWbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GK7HOMgu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63E00C43390
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707210055;
	bh=ELTXnkXBxJWYQCoZM5i9V3EelQzt3T8cmksYVM5nrHI=;
	h=From:To:Subject:Date:From;
	b=GK7HOMgucKoYxmCSxL5gWNA1whiXr1q3bMAF3jc5CpnxI+BCa6l3191wN/wBuWlqJ
	 q8BXG1fwmgqDxbu0ROxgBB4GgBQVufzWuQ5r9C5OyO/dofR+Y6qlxjcHJIHJKBXmrh
	 ZV0/FnLYoi3eTxpVsPoA3U4i9knoKFrsOVV5RwrF021opCeCKlplZEQlWctnJeqeH9
	 CCXKuTlZMRcLpY/JGZQnX/e2v/UUTJyA7RrMD2oAfzhFqRnj7R/gqeB+Upozsblxds
	 cBvJmckOf6djMhoGWOkwoKdJS2L70jhkQjXSByOaekxZc5bLukenUqcN9ek3bVOPVY
	 Gs+Mr1Gbq4Xmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4618CC53BD0; Tue,  6 Feb 2024 09:00:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218465] New: Linux warning `usb: port power management may be
 unreliable` on Dell XPS 13 9360
Date: Tue, 06 Feb 2024 09:00:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218465-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218465

            Bug ID: 218465
           Summary: Linux warning `usb: port power management may be
                    unreliable` on Dell XPS 13 9360
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pmenzel+bugzilla.kernel.org@molgen.mpg.de
        Regression: No

This issue is to attach files to debug the Linux warning reported to linux-=
usb
[1].

[1]:
https://lore.kernel.org/linux-usb/e595bcb8-bfc0-aa12-a5c1-a62c5fe9e950@linu=
x.intel.com/T/#t

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


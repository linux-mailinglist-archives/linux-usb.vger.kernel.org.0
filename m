Return-Path: <linux-usb+bounces-2328-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB89E7DAFDE
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 00:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C077B20E05
	for <lists+linux-usb@lfdr.de>; Sun, 29 Oct 2023 23:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FF71549A;
	Sun, 29 Oct 2023 23:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sA+WEIWs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAE114F9C
	for <linux-usb@vger.kernel.org>; Sun, 29 Oct 2023 23:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BE28C43215
	for <linux-usb@vger.kernel.org>; Sun, 29 Oct 2023 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620425;
	bh=a7fqtUD98pJ1NfZAX3nS81Ah0EEG7zwhhEV8mRfTWX4=;
	h=From:To:Subject:Date:From;
	b=sA+WEIWs/392m7HMHEQK2vJeceMjMnHmvZDSVlAofa6LEzWeUENGj6tJsfbuKPCwg
	 WTSbwcw6xM6hCrNHpuR8I37TcXAT2Yf1aIZA4z3ynQ3niu2BRM9dwaoWFu5an/MTE4
	 vrOulx/Y6MOlEbZx3oSYYSSfxJ/Jyty7mG4PPSuD8vjShE4/t9eegUhIyqEp4DAcwS
	 gTq8eZ0Qk9hno8edhqy2uAkFYg9RihSi6waXMH2Duhy9XvEMumOoxB95hnmdou5IAE
	 b5QcJ9xNST1yq979h+K9tJ+RvvKjfva21S5CZZTWARM5TQ0LfJYMam3BkyzsVubdGV
	 Da4CyZfhSQzPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4CFF1C4332E; Sun, 29 Oct 2023 23:00:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218086] New: ACER HD User Facing camera is not working
Date: Sun, 29 Oct 2023 23:00:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: messengerofdeath@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218086-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218086

            Bug ID: 218086
           Summary: ACER HD User Facing camera is not working
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: messengerofdeath@gmail.com
        Regression: No

Created attachment 305340
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305340&action=3Dedit
Add new camera to uvc_driver.c

Camera found on Acer Nitro series is not working in upstream kernel.
Camera have following identification:
0408:4035 Quanta Computer, Inc. ACER HD User Facing


It looks like it's not added into uvc_driver.c. I've made addition for it (=
see=20
attachment) and it make camera work. Can we have this code somehow added to
mainline kernel?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


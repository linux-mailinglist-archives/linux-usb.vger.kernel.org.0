Return-Path: <linux-usb+bounces-178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7009B7A2AE2
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 01:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2D7C281FF0
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 23:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38EF1BDCB;
	Fri, 15 Sep 2023 23:11:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B36B18E27
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 23:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D20DC433C8
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 23:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694819514;
	bh=YL2y2dftOJnjqi8VwKnE8etoojM5r2MMLiAao3u1xFg=;
	h=From:To:Subject:Date:From;
	b=qK19TSxbOYpHPICKVolSDE702+322S4AjS6MjLjUafAnVjuumrhBj3friN97TUUOK
	 yM7rVoo1/V4fhOGYrRRLFUGsC90KLJaS+Gcu69yM+rgc3pY2ObWvTAVsCf0gQbyVMb
	 SPF6sNxBnaBk/dnRqacnPFmB0MbCV1/p4uoGdYBc3dUvUD1AUhMyzoRHakivlTx3yt
	 nJwPd3+oekZhOM7Q13cXItInZXaRh1BSe106IavUD4YsayyX2KUQET4tH/gwyfrvTN
	 P/WgbZUSJ7qAgQ+KJsbM5fXPTnJGQymdw4vvo8/IShQ6rEsblIj69+FXWevcgFK2BP
	 eErw5CioV1/9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EBC63C4332E; Fri, 15 Sep 2023 23:11:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217915] New: System fails to resume correctly after Thunderbolt
 dock disconnected while sleeping
Date: Fri, 15 Sep 2023 23:11:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mark.blakeney@bullet-systems.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217915-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217915

            Bug ID: 217915
           Summary: System fails to resume correctly after Thunderbolt
                    dock disconnected while sleeping
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: mark.blakeney@bullet-systems.net
        Regression: No

After my comments on bug #216728, Mika Westerberg suggested I raise this new
bug.

I have a Dell XPS13 laptop and Dell WD19TB Thunderbolt dock and normally wo=
rk
on two dock connected screens + keyboard + mouse with the laptop screen clo=
sed.
If my laptop suspends in this state, and I then unplug the dock (e.g. to ta=
ke
the laptop away in the morning) then the screen stays blank when I try to
resume. This started when Arch Linux updated the kernel from 6.3.9 (good) to
6.4.1 (bad) and I have tested it bad with every point release of 6.4 since =
up
to 6.4.12 and is also bad on current 6.5.3. I have generally been using the=
 LTS
kernel (currently 6.1.53) to avoid this bug.

If you wait about 60 to 70 secs then the screen does switch on. On 6.4 kern=
els
I had to wait about 2.5 mins, i.e. this delay has reduced on 6.5 kernels.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


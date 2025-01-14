Return-Path: <linux-usb+bounces-19334-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E6A107CE
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 14:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F05477A3221
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 13:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4258923242A;
	Tue, 14 Jan 2025 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="il1TxYV2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B443D1ADC7C
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736861404; cv=none; b=muags0myVuKVj0Kt78CPXgQBZ0FdSI1NHpvbKk38Zj1sibtBxbUfJ0wm3vZ17wjYp+ZORVq7hyKZ+mR8+JRGi+F9z7q3v+MX9Yo6j2gkpeQ/460FadHQMCFnubqC7C5IM+BfiLykTWFeL8ZA6GqRJZpcv+griJMmLDet6VxfDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736861404; c=relaxed/simple;
	bh=l7YvIYktkFczhmbQwYUPJl68S6lqCmuelxvzAekPfV4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OnqMblJ+T/ok8FT+GSzROCcRlpS6Q24gRWFwp6UqfpeC3Zs0JPjfkTh1gQUrIq5mVahYeCEkNjglh8GvaJqf9MVyWcFMIWrPW9xR6UeeMSz2+wY70+D8ekwJ3qVJDZe/UoIJ/+JVQ4BoiezOceSlpW+A9QlwgNKNmpNdr+yG5Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=il1TxYV2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 468D7C4CEDD
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736861404;
	bh=l7YvIYktkFczhmbQwYUPJl68S6lqCmuelxvzAekPfV4=;
	h=From:To:Subject:Date:From;
	b=il1TxYV21RFudqaCtGzg8CxcmRxg5+OofCCPn5XY1NlG5WO6GtvDpAeS09fYDCyDz
	 JtQpeCbbSxov+Df4XsOwZCDhXiO6k0GwCSdE5ETUEBCfPMaPINj+/YPPiUsnhwAPRP
	 LEVFKfX7pOy2M/9tBLjJzl8v7QP0Zg9cuLXqPu5ex5KrU9ZRNLPR+mTazkaxLbe4Pg
	 XcusN0qxuMcQ+4UU3sS29y6APBBKBQ+iRIECIAMlPYZUFJZ47x6OQ05uRV3fOX8QOJ
	 MiEzSbjdctaKV2s/TjZEcwHfDrkEw4HnV5kJuB3NiUl6DLAvwQQXaPzpcliOs3GBTu
	 nRN4mvIjm60+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2E4AAC3279E; Tue, 14 Jan 2025 13:30:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219694] New: Perixx Ergo Keyboard 535 (04f2:2159) Menu and
 Window Start key press not processed
Date: Tue, 14 Jan 2025 13:30:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: davrot@uni-bremen.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219694-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219694

            Bug ID: 219694
           Summary: Perixx Ergo Keyboard 535 (04f2:2159) Menu and Window
                    Start key press not processed
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: davrot@uni-bremen.de
        Regression: No

Created attachment 307486
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307486&action=3Dedit
All the debug information I could collect

I have several Perixx Ergo Keyboard 535 here. And the Windows Start and the
Menu key are not recognized as well as the FN keys (and it's relatives). :-=
( I
understand that the FN are out of reach but the Windows Start and the Menu =
key
would be nice to have.

Only usbhid-dump sees the key-press events. libinput, evtest, and xev are b=
lind
to the key presses. /dev/hidraw is rather strange.=20

usbhid-dump -d 04f2:2159 -es

[FN-Key]
001:015:000:STREAM             1736855499.770574
 00 00 00 00 00 00 00 00

001:015:001:STREAM             1736855499.774568
 01 00 00 00 00 00 00 00

[START - LEFT]=20
001:015:000:STREAM             1736855867.659466
 08 00 00 00 00 00 00 00

001:015:000:STREAM             1736855867.752453
 00 00 00 00 00 00 00 00

001:015:000:STREAM             1736855867.924446
 00 00 00 00 00 00 00 00

001:015:001:STREAM             1736855867.928255
 01 00 00 00 00 00 00 00

[ALT - LEFT (works for reference)]
001:015:000:STREAM             1736855906.096268
 04 00 00 00 00 00 00 00

001:015:000:STREAM             1736855906.151095
 00 00 00 00 00 00 00 00

001:015:000:STREAM             1736855906.323098
 00 00 00 00 00 00 00 00

001:015:001:STREAM             1736855906.327036
 01 00 00 00 00 00 00 00

[ALT - RIGHT (works for reference)]
001:015:000:STREAM             1736855939.365016
 40 00 00 00 00 00 00 00

001:015:000:STREAM             1736855939.442837
 00 00 00 00 00 00 00 00

001:015:000:STREAM             1736855939.614006
 00 00 00 00 00 00 00 00

001:015:001:STREAM             1736855939.617903
 01 00 00 00 00 00 00 00

[START - RIGHT]
001:015:000:STREAM             1736856090.786100
 80 00 00 00 00 00 00 00

001:015:000:STREAM             1736856090.891265
 00 00 00 00 00 00 00 00

001:015:000:STREAM             1736856091.063015
 00 00 00 00 00 00 00 00

001:015:001:STREAM             1736856091.067064
 01 00 00 00 00 00 00 00

[MENU - RIGHT]
001:015:000:STREAM             1736858836.365940
 00 00 65 00 00 00 00 00

001:015:000:STREAM             1736858836.426900
 00 00 00 00 00 00 00 00

001:015:000:STREAM             1736858836.599084
 00 00 00 00 00 00 00 00

001:015:001:STREAM             1736858836.602959
 01 00 00 00 00 00 00 00


[WIN : Top right of the keyboard]
001:015:000:STREAM             1736858871.055606
 00 00 00 00 00 00 00 00

001:015:001:STREAM             1736858871.060545
 01 00 00 00 00 00 00 00

[Mac / FN lock : Top right of the keyboard]

001:015:000:STREAM             1736858891.553101
 00 00 00 00 00 00 00 00

001:015:001:STREAM             1736858891.557042
 01 00 00 00 00 00 00 00

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


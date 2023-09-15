Return-Path: <linux-usb+bounces-186-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D29E57A2B0A
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 01:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C46C28217C
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 23:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD9A1BDD9;
	Fri, 15 Sep 2023 23:40:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF961A714
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 23:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50738C433CA
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 23:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694821237;
	bh=7iF6d/gKfg4c+/0Sq6PoHKMlh9/S8Jw6Z+oD+AOL72o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hdNl2/iKHr0OxkVPRkkB9toJ1fnqTgRuwHLaPVY7OBVSOnqNyyuwdqE+bZNczjLC0
	 /V/OdQu4KGmWRGAIkDb4geHRUjnJ5naoooTikShgF5l/WFEiJa/aW3B9OZIgw0Fwmj
	 YEr9D81imQQ1BiUIIC32abNtVM1ShvlEez9PDwnDHZ9AaFVYiIy2xC4Y7g8MA8twXU
	 uwCFqBwXbnPoOQr8vTGcDHhxKYFmWU4ICq5927o1NuYkVYx42FWDrQfybr0Oc3XCXx
	 mx8qINLtxfixY5bJpFAww16Q4KbX9vEH/34nuUug0s/fbf7g4ejVCrYx3s81GA/sig
	 fqPwZA28OCU/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 38E70C53BD3; Fri, 15 Sep 2023 23:40:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217915] System fails to resume correctly after Thunderbolt dock
 disconnected while sleeping
Date: Fri, 15 Sep 2023 23:40:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: cc cf_kernel_version cf_regression
Message-ID: <bug-217915-208809-xk0BKypSuK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217915-208809@https.bugzilla.kernel.org/>
References: <bug-217915-208809@https.bugzilla.kernel.org/>
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

Mark Blakeney (mark.blakeney@bullet-systems.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dev@mattleach.net,
                   |                            |mika.westerberg@linux.intel
                   |                            |.com
     Kernel Version|                            |6.4, 6.5
         Regression|No                          |Yes

--- Comment #3 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
Note the sequence I did to capture that dmesg output was:

1. Added thunderbolt.dyndbg=3D+p to boot and rebooted.
2. Have laptop lid closed and working with 2 screens + keyboard + mouse on
dock.
3. Suspended my laptop.
4. Unplugged dock.
5. Opened lid on laptop and witnessed the 60s blank screen delay.
6. Captured the dmesg output and attached here.

Unlike the dmesg capture I did for bug #216728, this time I did not reconne=
ct
the dock because I wish to point out clearly that this must be a bug in Lin=
ux
given that at the time the bug occurs (i.e. the screen does not recover aft=
er
resume) the dock is physically disconnected.

I should also reiterate on this bug that user Matt L on the original bug ha=
s a
Dell XPS laptop and thunderbolt dock and reports this exact same issue as m=
e so
have CC him here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


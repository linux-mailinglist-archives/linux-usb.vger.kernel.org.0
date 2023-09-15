Return-Path: <linux-usb+bounces-182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46BC7A2AF4
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 01:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DDC62821DD
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 23:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197AB1BDD2;
	Fri, 15 Sep 2023 23:23:54 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE2A18E27
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 23:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65BF7C433C9
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 23:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694820233;
	bh=15QY2dEbySfp0vqLVpIHGmyVmu5wnUBiag/TfQq29Wg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cupucduRIPN2CpkkBvkgy896Omy9jHra5C/39eUmNbfU9WjzfKKUY3/jOFuXsSCKr
	 XYbwAOTH+3opQaARD8uP2kXjDR8ONTgGgddI6OBLcNvJjJKFsQdT/cobtPdYHAYtc8
	 CakgZL5K7DejajrOUYBc++FNrpYmsu4lWTaBq5MUSUMI9VPGF/jf4AHDYD4VeVcPdY
	 w20tSTdlY19d7Cg7+6uXt/G9KFs5SXfXokDxSbrexqizojZsGWIXmdiow0VhU46RNR
	 9HK6cswRtEqTFpatV8cakGteKYj7ejzRckazT9pya8cHljfVYOrsnX1xC7Umm6v6YJ
	 wUZ56DbPqlGbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 472BBC4332E; Fri, 15 Sep 2023 23:23:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217915] System fails to resume correctly after Thunderbolt dock
 disconnected while sleeping
Date: Fri, 15 Sep 2023 23:23:53 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217915-208809-hnYpv0mQ4L@https.bugzilla.kernel.org/>
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

--- Comment #1 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
Mika, in bug #216728, you were concerned that I am using
"mem_sleep_default=3Ddeep" option but please note the very first thing I re=
moved
(and have repeated a few times including today) to confirm that the problem
still occurs. I.e. that option is irrelevant to this issue. Note, I have us=
ed
that option for the 3 years I have had the laptop because if I don't then my
laptop battery will die overnight when simply suspending. I will remove it,
enable thunderbolt.dyndbg=3D+p, and then will capture a new dmesg output
(compared to what I did for bug #216728) to attach here.

Note that I use fwupd often to ensure my BIOS and dock etc are always runni=
ng
the latest firmware. Dell updates both quite frequently and I am always run=
ning
the latest. It was mentioned in that email thread at
https://www.spinics.net/lists/linux-pci/msg142902.html that changing the BI=
OS
thunderbird setting to "No security" helps alleviate this issue but I don't
have any security options like that in my BIOS.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


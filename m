Return-Path: <linux-usb+bounces-95-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 674CB7A1132
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 00:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B481282104
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 22:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7586FD2F3;
	Thu, 14 Sep 2023 22:39:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0997C2F7
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 22:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DB97C116A2
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 22:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694731189;
	bh=Z/XuMSwZnQO5DirJ+V/ssi9vqSYUPUoJb/jeJ7bn/f4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Tc4HJIbbZfEwIMGz/gux6fX99W10FMb1wIceXRxM+O2vl6QkxTmvJPqd/OC4RzEQW
	 3mvgDko/1DMVsJd1dr2GvLuQ9/UusOIk+QYDCDVWFBRF+8oQGtnfPI9fhBMLDK0BvZ
	 oBmuC72xoMbJqAbWvKj3uwqWB+H8EQJ5MIpJ/uhBnrvq/BkFNu9aZtPjIbkONiD3ul
	 ENZ41YF/vxNnmaWhKurMjzzb5GhuRNn7lsotcoK+X68jzIaNb5ng93Zi0ap5eNzarN
	 Kdkty2mOP3s7/Mags2meiAFGp9sCU6VQeGejT64d3CsbOJcFxYQVeDm+mjHYDcsku9
	 4t7guR16N94sg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1CA77C53BD0; Thu, 14 Sep 2023 22:39:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date: Thu, 14 Sep 2023 22:39:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mark.blakeney@bullet-systems.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-jueK2NlkgJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #41 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
1) I added that kernel option and rebooted. 2) With the lid closed, I suspe=
nded
my laptop. 3) Pulled out the dock cable. 4) Opened the lid and waited the 60
secs before the lid display recovered. 5) Plugged the dock cable back in and
this time both external displays, keyboard, and mouse recovered (although G=
NOME
swapped the windows I had open on the 2 external displays?). Then captured
dmesg which I have attached.

I have not changed anything significant in the BIOS (not that I can recall).
Note that I use fwupd often to ensure my BIOS and dock etc are always runni=
ng
the latest firmware. Dell updates both quite frequently and I am always run=
ning
the latest. It was mentioned in that email thread that changing the BIOS
thunderbird setting to "No security" helps alleviate this issue but I don't
have any security options like that in my BIOS.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


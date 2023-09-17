Return-Path: <linux-usb+bounces-263-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16447A3400
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 08:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8CAE1C20869
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 06:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3386F15CD;
	Sun, 17 Sep 2023 06:57:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E34C636
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 06:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87F0EC433C8
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 06:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694933845;
	bh=NJbXT+uKVzROFfjrWErMg9DA1m2XCrk+MzI1GgAySsY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Fwq1eupzLFlz20gH0zoD8eOJmoW1T8fTL6IsKaw1OuxiyuRQ6lmN5ulPxMH+bJ1Ez
	 92XLGsT20G/OezesNyzGT3EdhlRLRpmmz7+5fyGCfSGBh7tlKJsIcNFWmaRHhGigWB
	 SQYmVQHvebE077FwoO8zXTZTFm/4w0kPPMjBbVQWWSa7Wk+Z6Z+UVS8++RoXLa+2D7
	 Zta5/OZk/sb2QjpbwbLPi2GOcSH8lbp6fnoRCISGSTiGk0EkNmIfYfP4yyCaKkAQ6T
	 +/b+rqfjslMAUBdjtT2rOlKaWt8mE6LMk+zPzdo3Zx/zjtOLvQnQKIxnt8Sj212GX4
	 387D2hyNSKOwQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6F3A0C53BC6; Sun, 17 Sep 2023 06:57:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217915] System fails to resume correctly after Thunderbolt dock
 disconnected while sleeping
Date: Sun, 17 Sep 2023 06:57:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217915-208809-bEAUTCQ4wd@https.bugzilla.kernel.org/>
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

--- Comment #8 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Created attachment 305120
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305120&action=3Dedit
Mark devices as disconnected if resume fails

I can reproduce this myself now. The reason why it takes so long is indeed =
that
we try to resume the devices that are behind the port whose link did not co=
me
up after suspend and since they are gone we end up waiting them for the ~60s
each.

Can you try the attached patch? On my system this makes the issue go away.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


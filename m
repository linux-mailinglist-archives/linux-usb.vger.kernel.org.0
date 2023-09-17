Return-Path: <linux-usb+bounces-271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DAD7A3558
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 13:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AF0B1C20A8B
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 11:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA0333FC;
	Sun, 17 Sep 2023 11:26:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5E623B0
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 11:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CAEAC433C9
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694950008;
	bh=opPxqN5bbIs+pkrzh3SqQXFqApqEcEEzjdqJxd9bY9M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QBgrMYIZ10h3rRDoU6+BAiM4DorQAg1SYHvPXSr8RR8fG7IHuMnaGMu4ZEVRi8wDY
	 7a84QUx0CxBsZs5LjzLM7b5BnhG+Plzf7NZIHteW5PXREt3vDJcU9c+mt7w6WIx7Pf
	 UUW0caiq1Hq4M5k79v1UijF/be8YXRCZYgFcxyY3nyhE0h/yBYJK7Fm4ppidkXtQJe
	 DLwAlruyaZWMw37Lu/gzHAI1L4Ag/BOhUOY3WYjyL7X9zPzU3y0w72jK041zSq9CMd
	 uCqTzCvwPYJLIuzDv7BmB3fgusY/za+bLzLVnHhU6qJbgTiuHtlLb0wvWRIMkzvQqD
	 CPVrOtK1f0bnA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 08A61C53BD3; Sun, 17 Sep 2023 11:26:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217915] System fails to resume correctly after Thunderbolt dock
 disconnected while sleeping
Date: Sun, 17 Sep 2023 11:26:47 +0000
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
Message-ID: <bug-217915-208809-iJ6GpNcFRK@https.bugzilla.kernel.org/>
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

--- Comment #9 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
Mika, yes I applied that patch to Arch kernel 6.5.3 and it does fix the iss=
ue.

So it seems this has nothing to do with Thunderbolt and would occur when any
USB dock is disconnected while the laptop is suspended? I am surprised there
were not heaps of users complaining about this issue since 6.4 and 6.5? Any=
how,
thanks very much for your time here and rapid fix.

At what next kernel version are we likely to see this fix included?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-27514-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74EBB42BC1
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 23:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AB307C73EC
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 21:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881802DC34A;
	Wed,  3 Sep 2025 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLR/UK5h"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB4D2EB5A1
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 21:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756934569; cv=none; b=dWJNoavYD1ucAPSBms7ugR8odENWIt+Q8roaxqm3y5TKFU/1kd1fipf7+YaXxl/WXWClA3hg1BpiXqR29T+xKDqo2WuaDmZ8msskLJXdvE08DFGrFyvlttVpx2B14vuKTQ2AEuCQesuYadjp0y4UrxSt/fSzzURcFPx5GO5Lomk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756934569; c=relaxed/simple;
	bh=W56oIrpoUpebeGkVd3rSuy8wxCaj4Jf9EENzmF/IHdY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ttq0YN8tXJsNvJLL4KGJvwmt9CMvNzNtHlQi/YyMrbNttdC7znxXC2QUnCKcFymjaeESZit3SNMC9P6BzNHqGd4qvWIKUmtt+HB6fTCuV2WD6v16xT3HZkT8tm7TcC/gJum2qet4NBOfTrTWcoLcUwqw0v3ahy8C0xXHW5eBu2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLR/UK5h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82896C4CEE7
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 21:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756934568;
	bh=W56oIrpoUpebeGkVd3rSuy8wxCaj4Jf9EENzmF/IHdY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NLR/UK5hhOruLZ9xZfd+wXHfRnl5UTCoJ7okDc39fJSU2HLjAnJmFcgKviLvpyGZc
	 xKw1wqYe9aIIZN+nn+1XRzXwIyB0vvP933ilJPXw2LQGffVhJfoXUQ2oRbTK6Bfi3n
	 9uICa17VC69xiNGA7tAOlOcQ1G0aUZ7/aQR/ps4TPcDbuu0Fm+q5JszPdo8PGZTHCQ
	 1ApNUcuLHye+JX36KSusetAzPWQCe/8mW7JH3CjUDCY0o1PjQGaC2tMUyTAcgL6SYu
	 +jEdIaLaX0uoF7pfdP5gOq2z6rxXm5dAos4+c3Oih9Gctzy2fLt/Xigl71dUbkG9Nc
	 ro/rDcx2PUx6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 75C7CC41613; Wed,  3 Sep 2025 21:22:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 21:22:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-OqBdhI6cTp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #33 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 308614
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308614&action=3Dedit
Add a configurable delay before reset-resumes

As far as I can tell, the card reader disconnects from the Samsung system
_every_ time you go through a suspend/resume cycle.  For example, in the us=
bmon
trace you attached to comment #9, where the reader worked after the resume,
there was a disconnect and reconnect.  You may not be aware of them because
they are hidden by the usb-persist mechanism.

And by the way, these disconnects are not "software simulated".  They are r=
eal,
honest-to-goodness disconnections.  Yes, the disconnection is only electric=
al,
not physical (the wires remain attached), but as far as the computer hardwa=
re
is concerned there is no difference.

In any case, you can try the attached patch.  It adds a delay before every
reset-resume, and you can set the length of the delay (in milliseconds) by
writing to the /sys/module/usbcore/parameters/reset_resume_delay file.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


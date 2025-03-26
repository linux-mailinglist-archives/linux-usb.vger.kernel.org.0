Return-Path: <linux-usb+bounces-22162-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E91BBA71314
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 09:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E32A163997
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 08:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9E91A2860;
	Wed, 26 Mar 2025 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUPcxHwf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1AE440C
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742979162; cv=none; b=DrGbFxgZgDviwyrlOj4J3iluWM7PrzWJvKf6jVB/V6vallwGg5zL5bz1aCX+La8apqHITayW84YPO4H91lR6lhCNUXwiWGtA1MUXkHf3I5G71/+5EiYvIZWhE4FmIJLwutnxy4G8Rk6W9Uc6JiW0dCpXv8MSKYa12lOKcX0qaBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742979162; c=relaxed/simple;
	bh=+D1SyzbQt9GPJns5S+w3NNOcEwAT4cn4vnhDRDBgwC8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hCkUJOSgoM6n/foRjGBBzY8ci71rY2Uf5Q+njU7fmuYR0bxQsg/HtO8qZsRhhWpL+EIM/1IE8ZEjL/HiZQ7Couw4tcGo6r/+GVnhUvYrv7lpfJd5rJ3SOXlVtRptxktthC3kmPvevLS4KUaRWNskFk9aSbDIdfY5J0D3aq3lk18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUPcxHwf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E253C4CEEA
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742979160;
	bh=+D1SyzbQt9GPJns5S+w3NNOcEwAT4cn4vnhDRDBgwC8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pUPcxHwfrAx3sK3uf0sV3uifejczTezO8595lZF7Gvho3Yo9Q5l2LfgT0WbQzlVlq
	 DcYtE3vX1D0sIC4DpGBytYEUG1q612/dTurpQjspGcfvtsj1JMENKPFyxE/Kx82JcY
	 kRdWjqWNysg5CCmnlGdu5Dqhv6ukRO9qImDge8qgCzW64YvpcSw0inqXHUnt7nMFd1
	 9bB2cFdynOCqTSUXyHraYW5fo9hYt4G7E3UgGN5us+4/ATZLQVC2wUwTEcT6R1Zs4O
	 0ZQ0ezQ2nBMvnztwCEp6Lkbsx8mnzG65eMreCwZQkCKke5/zow6gHnMVsafpILVPMM
	 hQ9kkO1BXf1Bg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6D1BDC41613; Wed, 26 Mar 2025 08:52:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219924] xhci_hcd TRB DMA error and device lockup with AKLOT 2i2
 USB audio interface
Date: Wed, 26 Mar 2025 08:52:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219924-208809-TG7VxeqgYX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219924-208809@https.bugzilla.kernel.org/>
References: <bug-219924-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219924

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
> [Mar25 21:35] usb 3-5: USB disconnect, device number 7
> [  +0.000005] usb 3-5.1: USB disconnect, device number 8
> [  +0.001183] xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not
> part of current TD ep_index 1 comp_code 1
> [  +0.000006] xhci_hcd 0000:00:14.0: Looking for event-dma 00000000ffa879=
30
> trb-start 00000000ffa87940 trb-end 00000000ffa87940 seg-start
> 00000000ffa87000 seg-end 00000000ffa87ff0
> [  +0.000153] xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not
> part of current TD ep_index 1 comp_code 1
> [  +0.000001] xhci_hcd 0000:00:14.0: Looking for event-dma 00000000ffa879=
40
> trb-start 00000000ffa87950 trb-end 00000000ffa87950 seg-start
> 00000000ffa87000 seg-end 00000000ffa87ff0
> [  +0.000119] xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not
> part of current TD ep_index 1 comp_code 1
> [  +0.000002] xhci_hcd 0000:00:14.0: Looking for event-dma 00000000ffa879=
50
> trb-start 00000000ffa87960 trb-end 00000000ffa87960 seg-start
> 00000000ffa87000 seg-end 00000000ffa87ff0

This looks like we get transfer events normally each microframe but for some
reason TDs are consistently dropped from the driver's internal list one step
too early. Very bizarre.

Are you able to test a newer kernel like 6.14 or 6.13.x, or at least the 6.=
12
LTS series? The 6.8 series is frankly no longer supported here, and TBH we
can't be sure if it's not a bug unique to Ubuntu 6.8 kernel due to a botched
backport of some changes from newer releases.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


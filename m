Return-Path: <linux-usb+bounces-12728-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F5D94317B
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 15:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 742D9B21E80
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 13:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A901B29CA;
	Wed, 31 Jul 2024 13:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0ylnnhL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A81EB3E
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722434231; cv=none; b=Vi/X5RUsN/RBzs1rjNDb3zSR5guOmi9sgIfBJisMx6rzmV+bEn6oI7x+bYoRT/22fOzyjcp3vIw5/wMoVaMHn993htxqZSY6sP1PiJVo/SFBSRK4kZ8VzKl0zE50v8VxL8nSNxeVxyZFHda/P+8IIzdMcaYz00AbtpV0wmNEEjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722434231; c=relaxed/simple;
	bh=AZBSP8OsK5RnbKCXhwLk8E9lfgvJax1UwohA4MlBX2U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ph2AU6G7MoJoPT0Ek/8yfkISxFlUMPBWZk1+WFNXgojW7ZJ+rYnNHyVt4rbDlrmE2hv9p7fVJqGyEkvrMl8pe/kZgBQX5WrFc9dl6Q6kISx2J62UAoIT80gMHRKNZv8s68rIkhbYXvDFVbYDFbG9mz54fDaVkyb4apokGKk1aJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0ylnnhL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFA79C32786
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 13:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722434231;
	bh=AZBSP8OsK5RnbKCXhwLk8E9lfgvJax1UwohA4MlBX2U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=F0ylnnhLIMI9edRuONeF0v+cdwlMHhloq/+AoI4vUoKfBZHNmGT6VS7KbSvX291Ak
	 4Vf0VuON8FJyzU1JA+5QpXIhoYfDPSWfb92mHTVYeTEwR+vl5dXsehKcVeqcgfaPZX
	 MgMlK3R1fIP0f/6EXNZbbS35MHGTr6Vy0JPIj1UUWDoeZ7kG38KcvFkdkuBTBNwuLz
	 bm3ttzjtO5DPpW9qpucS4iWalIKj1cBYhsW2wCywdKUs8KKFsIjF8Z54/wEHd9Qm0U
	 +dzKLhEnby2iGzRBdYNsASh23TAv/df/gGoa7sMuEIn5y2iuZmocw//gCnaS4kXBFW
	 Y0Yznl8vX0TwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A0000C53B50; Wed, 31 Jul 2024 13:57:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219113] mysterious disk I/O-errors which freeze the system
Date: Wed, 31 Jul 2024 13:57:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219113-208809-Cf4aklHyGT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219113-208809@https.bugzilla.kernel.org/>
References: <bug-219113-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219113

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #1 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Looks like it's related to xhci streams usage.

from dmesg:
[4884.745577] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 10 for s=
lot
2 ep 7 , HC probably busted

"event condition 10" would be invalid stream type error.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-21517-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C44A57603
	for <lists+linux-usb@lfdr.de>; Sat,  8 Mar 2025 00:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 425407A7FB0
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 23:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033E0259CA5;
	Fri,  7 Mar 2025 23:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1jKJGak"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E615258CD9
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 23:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741390124; cv=none; b=QHr1SYPlklJMDG7tJFL1/mDGBfhSYNzzkeCNB9JZqfpUuDw4Y/NlAT7wR2Kqp2sANo7dDe+7dSlhMhWrVJY7NcpMnGLrrAI1CaWcor+owUNBhjrTVrF0YwoRUmr1j27C/tWeXVE7qDmWewBrrJv0TZ52K24b0h6cE9bFLPHUAXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741390124; c=relaxed/simple;
	bh=E7vk7Mu68poBFZsxpJ9njnycJxc01Mi/8GAq1nrdFFw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CVUS6bPaYkuSxEIbA3qfQEoWa9fhZGjNHuvGmHwoUsZNdJoePjCgPZEfVMg38eLpCOpUrzVXYZWgbbYR/FEGZHeTCDElHuSE6FNPcKx8xGlxKWXIVY1zqaol5wspdH4zTRdMzCBmHBBZW/lHIW29Y+hxlpC+Vnv2TgxWcqLhfHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1jKJGak; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE602C4CEEA
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 23:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741390124;
	bh=E7vk7Mu68poBFZsxpJ9njnycJxc01Mi/8GAq1nrdFFw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Y1jKJGaktjZ28ozp2iIhh3gjDcWjUwq80d6MigPbDnZErQodS1FujVxoyGffpc1Ge
	 fCFJo44uFGWm8ArbJZdCFib+HY0Snn+F+FMSaoys64ldnU38XAehEeRAZh8xnyfVQn
	 6yra5dlw8aubEAkp7xfgNv/f3gdxR3uDu6QAGsBRQi9AJCkmc9lcILtirwzn+C93KG
	 h3bJpHbo5GQXrqePC87SFUHjLzSdCmD/39Kt8GdhyQaVRDFk9JErom4DiFJws0+lBX
	 OIJFyMM9jT34nbEGdRYCaEK3jdcDsuGuuZf3XKaKYUXfQ4wanglWmp+W+A/TIunalZ
	 bt3wH2T6YY0+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DD7C3C41612; Fri,  7 Mar 2025 23:28:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Fri, 07 Mar 2025 23:28:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_bisect_commit bug_status resolution
Message-ID: <bug-219824-208809-B9U9rDRHXd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219824-208809@https.bugzilla.kernel.org/>
References: <bug-219824-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219824

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Bisected commit-id|                            |36b972d4b7cef5d098de63fee8d
                   |                            |00720c051f335
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #19 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Micha=C5=82 Pecio from comment #14)
> I think I found it.
>=20
> Does it help if you revert 36b972d4b7cef?

People claim it fixes the issue.

Please actually submit the revert to stable as 6.13.6 has been released wit=
hout
it and neither 6.14-rc has seemingly seen it.

And seeing "Reported by:" would be nice. Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


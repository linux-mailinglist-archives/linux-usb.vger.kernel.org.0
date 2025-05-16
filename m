Return-Path: <linux-usb+bounces-24036-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B549AB9BA7
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 14:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB80F503653
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 12:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8264238142;
	Fri, 16 May 2025 12:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkanX7bu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA6A1361
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 12:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747397423; cv=none; b=T27Te4SvHZUEm8U0y1jorUauE2eDOaUf49fDeLIqh+l8qmXTUNF9l6+QTtnjnoNc9sFuTDD/nwuEBf1PC35jqQdmTx7gmrcxR65FYMsyAbFjmANhvriJpuzHW+ObaCJQyhrD4KuTdVDRLPh2SFB63/v++RlhOxGxpC87kjeayq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747397423; c=relaxed/simple;
	bh=j+KUWfEqXi9hNo91IatdOjlBK7KpbYQQkoIDEpO3Xtc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mGA3Nu5L8gncNNZj+yumvBoNouLSw7Z0aCyUtZd8oZteFVIgCbbVIWL3p67g3LtcVtUnYkX6WOZiwS0oRLb3vQrUySnjSSUzEGpto9WmB4RHnOTPaYPyGOJ4iH+bsSeNPhlqyX1K+jmFBPau6buxkQnXuTWz/CLdovQvTInlCtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkanX7bu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0627C4CEE4
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 12:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747397422;
	bh=j+KUWfEqXi9hNo91IatdOjlBK7KpbYQQkoIDEpO3Xtc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NkanX7bul2oEyCnAdVgNAAjh82c42r/YlxUyWNgnFTSj7a3DiVpDUlW0h+FXvKG5N
	 7ZBnkslJOY7+D+WduBrFx6+uhd6MEjy5dMRF1IIjWc+HPHS0u4xbIDxa9MyxyF9fRx
	 H1A6Fo7Tgsifwa7DYhH680bBzI0ZI/vyDC+zuG2QgoG+iMCBcjXP6SPifMnFR4yVLq
	 WfqOc7sQ/tMyoZ7eIPa91t2hmCbmHrOdsnf2nBXIQZ5PxDlrpW/GLmC8DpTdvmM/F4
	 GuWpVoKes1YoHVOL9cidUja4syq4k2azF1vgRfOSH6STjWxuuRe5iR9th/1xl/7qMI
	 rKvVyaw7oLycA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A0B35C41613; Fri, 16 May 2025 12:10:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220044] rndis_host: Zyxel 5G portable router seen as a WWAN
 device and not an Ethernet one in 6.13
Date: Fri, 16 May 2025 12:10:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mytbk920423@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220044-208809-TS4jwIFtvi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220044-208809@https.bugzilla.kernel.org/>
References: <bug-220044-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220044

--- Comment #1 from Iru Cai (mytbk920423@gmail.com) ---
I'm using Linux 6.14.6 and it seems to be fixed. In earlier kernel I found =
this
bug when I use my phone to share the internet and saw the interface is rena=
med
from wwan0, and now the interface is usb0.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


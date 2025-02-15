Return-Path: <linux-usb+bounces-20678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 161D6A36EFE
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 16:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58E993ACF73
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 15:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEA91D5ACF;
	Sat, 15 Feb 2025 15:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkcownPW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AEB151991
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739632165; cv=none; b=J6sl2mA0Iz8Q+bz16VSpmmVambPdNTvKQgZj98fH25ctHpLZ4rlGLALCZPqDw8xbQouZ+VGzAaMzyZQjlsuo6+Xx0q+PykWTxm/sWCD/vROHrru1Am25T1u8OsIyURsJ301TFAx2ADFnRhEL6P8z3UnVzstexuE4uIOVr2R4N7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739632165; c=relaxed/simple;
	bh=kZ6iQqFxz9GDexbPtiznidLFtYO2aew5Hj8cz2M5hfU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LhUiHq5OPo2lTXc+MfKVm6pkexsfYKdwwgHvJvfW9VGxuvHu8UpAEjNq+BY7AgcpF/mPLlbimZTvys5IWqaqs5IKBzDGAWF5W3e2UoIotppddv04bUP1byhTBIM7GhqlBTq/Vj6TjHaO9NXuLBFLW1Sc3kN9oikI1w05aIqwBAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkcownPW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D20CC4CEE6
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 15:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739632165;
	bh=kZ6iQqFxz9GDexbPtiznidLFtYO2aew5Hj8cz2M5hfU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MkcownPWN2NSXZJ2SKJN1mofgUP+WqJ62uFWzhL0uuImnzYVL8bWZQPAGAiN8iJLj
	 qNfAsmH9o6359FQ/7pnHSn9QBNlTaFjP6da6h3TIuj46ClYrfT8veEuZNcPrK7fetu
	 qQQ6hfYTQEXUIVYROGlDC11tNHeO/pBMVN0i6eV361e0a5bdrYH4ztEduiyUuDysl/
	 Sw6qA67bJXr1vPold1RBZ5Bkuka3KB30XOYLvG3v0Hi5zGc/peTuiWc3DdcrRjQLoi
	 g2Oes0lxXix5kp9n85vgJc6xdG7yRm/QZWt5c1a5b/rypliDoNeDgst2Uus+oS1+OH
	 BPeWrbdKehtBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 09F1BC41606; Sat, 15 Feb 2025 15:09:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Sat, 15 Feb 2025 15:09:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219773-208809-iKCDW6Y6Gb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #6 from Frederic Bezies (fredbezies@gmail.com) ---
Hello.

1. OK. Did not noticed it.

2. When I try this command line, I got zsh: permission denied:
/proc/dynamic_debug/control

3. I tried on other computers and not corruption problem occurs.

4. Yes.

I tried less /proc/dynamic_debug/control and got an enormous output. Adding=
 it
if it helps knowing what's going on.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


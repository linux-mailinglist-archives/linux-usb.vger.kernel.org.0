Return-Path: <linux-usb+bounces-7382-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A471286DE8D
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 10:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EDC01F21E12
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 09:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C525F6A8B6;
	Fri,  1 Mar 2024 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrHuh2g8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE8B67E7A
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709286398; cv=none; b=WuDDITrqk4QkHEnVuRpUIepgempdbkxam8wnUYkkUFT3Xlh5CoBqi0AaOjnDApTfTBLfgN4WKaiuUlLgUzBgCk8pwLWLSJ9Co/S5FTbUVtOWa6nJdaJbcKEVg4gSj/9GvluN0/rfAI4ZIJ3vxfs3qCLtSOXqZzXmhpkNyIsf6Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709286398; c=relaxed/simple;
	bh=53/ssbPpg3kF0Y70+X1lZvXka3CsnK7/zoF59rRrEg4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CF2+n6+zZ2r/dfbMVfUOXtziyRIpnhTR9/L9othe/lLnnG3E6A1PJFKEUWxi1YkJT/u0EG46F0CSYRioxM316ZHyPBCvJBQh+I+m4P7ZZFfAm+zYl/J6r89dlrD9xarkcNT+/ZI//FuVdehgwgdab4oILTdCOXZqDmfhlUXiMfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrHuh2g8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDC1AC433F1
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709286397;
	bh=53/ssbPpg3kF0Y70+X1lZvXka3CsnK7/zoF59rRrEg4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IrHuh2g8bEb4Dy8rW4aqSXBw26JDro3jWe19CsfypYKqiAiW3OFXioOoTXBeqtdDt
	 sk6IYeCvHci2WFK4ZGJ7/0ZrYYytEA3EkoxVV1PLmo8S7pnSaKRD8Kn7Ouj0nCPmF6
	 2m77n4m9VYoWoahcdF+QpStmVhmbDqWPc24J3pfOikLApBdmgpgbtmgWQl+1h/1AUR
	 8UL/13BbWZTEw0I/+icv2xnbRlmjvrtjq6CVS+vZUNNz6DmMwaAMoobe2rGG6eb+ga
	 FUHEEeoRzWckrqQLIAHOpiUt1aD/wml/pAY/rau0626EjTk44JS3rMO2rLsemKOgA/
	 tFA1Kif1t/c/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C7539C53BC6; Fri,  1 Mar 2024 09:46:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Fri, 01 Mar 2024 09:46:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaukov.peter@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218525-208809-QyRJZ1TeXP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

--- Comment #14 from Kaukov (kaukov.peter@pm.me) ---
I tested further, again with Baldur's Gate 3 as that's the only game I have
installed currently.

The game runs on the eGPU as confirmed by MangoHud, DXVK_HUD, and in-game
settings.

The GPU runs at 8GT/s also confirmed. Nvidia have some power settings which=
 I
can't change where the GPU switches to a lower speed when it's not used
intensively, i.e. I'm on the desktop and only my wallpaper is drawn, as was=
 the
case when I took the logs. When running a game, benchmark, YouTube video - =
it
runs at 8GT/s.

On thing I noticed while testing now is the power draw. For Unigine the GPU
drew ~280W and was running fine. For Baldur's Gate 3 it drew ~120W on the
menus, but only 70-80W when in-game, where it should be drawing at least 15=
0W
and more. On Windows BG3 draws 120-160W on the menus and 160-200W when in-g=
ame.
Same settings used for both systems.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


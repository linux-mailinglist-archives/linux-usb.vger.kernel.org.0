Return-Path: <linux-usb+bounces-11784-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDC791C444
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 19:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECCBA1C22D8B
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 17:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6561CCCA5;
	Fri, 28 Jun 2024 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1xA6/An"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95571CB33B
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 17:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719594032; cv=none; b=MKQ/4LpTQnjhxes4a9B7aMBeadYXmv4QywGDg0T8EfUxaSUbGncjxNKZT0nhA0deIb4DcZJBr3aUk+v8Zlnb2SncdpwVmAfmrrw2oedINmxyXVD6vP3oUKWXITxS2inFQ0BG/YLIL1vOIeWsGjHE9m1rioSYXLTVmY4/fUi75sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719594032; c=relaxed/simple;
	bh=a56pJhD2dztLLUmbQCMie96AmkAv1+nG2BWkcEyi1v4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MjtH7RIHNKkk3PX+MCxQNoIJRz3ogsOL3K+/32Q+Stbr1BjgkbjcGULVSAd0MCPf63162a/EYUBJmLkEF5625sj5er5CWIM4doSapuZCLyblKlK8LHsUAsURLtIb7dRrZuYKERiUvpWA+UcPssMhmCeObDJRj6kSmPRXglkkf2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1xA6/An; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AC25C2BD10
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 17:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719594032;
	bh=a56pJhD2dztLLUmbQCMie96AmkAv1+nG2BWkcEyi1v4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=G1xA6/AnXJYlal+su331Z0ZEjZEpbwUhBYNllbe0OBFdzZNws49Y45fD0POCJdviT
	 +6ZgoAGFtR0SIrE3ROeMemPpNAORY1t06/dxb5jxS6u8wFjy1yz32wKF0JbzCWnID3
	 SifrWKN+zPbpHYXfx0hFJswk6kPj6HSb5Pswb27Er5hGLg2aC2R7aZWD33/sYa1tgP
	 AWCljhqIVYV7wyedQ5zxLD9rkcfpYuU3PyTivHDb+VlstR+p071MosPK2cxZum2X6A
	 nQj5sTFiHwsFEBf7DZW/w6uuKSeapeDCIUtuWoYTGhaxu5xG/e+dNv5ibV8TrOSxCT
	 XeMlQ/yhhSKpA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4EB16C433E5; Fri, 28 Jun 2024 17:00:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218987] USB devices are not detected after Save/Restore error
 on Intel xHC
Date: Fri, 28 Jun 2024 17:00:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: repk@triplefau.lt
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218987-208809-sy3Qy5vxVc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218987-208809@https.bugzilla.kernel.org/>
References: <bug-218987-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218987

--- Comment #11 from Remi Pommarel (repk@triplefau.lt) ---
(In reply to Mathias Nyman from comment #10)
> About SRE,=20
>=20

...

> Not sure if it makes a difference but could be worth testing if skipping =
the
> soft reset impacts SRE.
>=20
> Can be done by setting quirk:
> xhci->quirks |=3D XHCI_NO_SOFT_RETRY

Thanks.

Unfortunately this does not help.

What is funny is that it is related to if the HDMI is plugged or not. So I
think it is related to DP alt mode of type C. I don't know if xHC needs to =
even
know about alternate mode, it does not look like so to me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


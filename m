Return-Path: <linux-usb+bounces-11547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70802913128
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 02:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 426B11C219CB
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 00:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309AC10F9;
	Sat, 22 Jun 2024 00:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtQzbI83"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA8E7F9
	for <linux-usb@vger.kernel.org>; Sat, 22 Jun 2024 00:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719016119; cv=none; b=ptVuKcpoLPkln/pg6DwzYrIqAgRZjAoamUUOH7EjD48mfJxwCOf9hVIbCjZsIfXW9tLWCb3VroSvyv0PmJug/JlptZ+Gyxe+X3xFB4FFDcxfoN9CcD5ajtrduijkTOfmj1+I72jQ3ckXmpmScjY3Ar+BLvp30EE2lR8iTPtlaCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719016119; c=relaxed/simple;
	bh=K3siqN8Q8r+Ti4PvBcI8et4Sz/lcTnRBGus4KT1IUD0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YdrwXV1ANUFxxW6ww1yXOdEHOTPTFinZoc3Tc7IZmuOPV0QpNYfmoPiQ8FPgxPhRPZ41FC9XOTpCw3ffmtPhHjKU5VAQQ2pj+tD1HPEz6omV1+BRQQ7XepEr5onSG53PbTyQioHbclPB7zY/d0u5UuZWHOeazH7ZOrSwTClQt+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtQzbI83; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1ACF7C2BBFC
	for <linux-usb@vger.kernel.org>; Sat, 22 Jun 2024 00:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719016119;
	bh=K3siqN8Q8r+Ti4PvBcI8et4Sz/lcTnRBGus4KT1IUD0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LtQzbI831AmcnT+dBhCdzfU6qbVWsZgT4idq17irHQSrxqDzAH+BhRo0Wecr8oFap
	 auqgktFxp6eHPakl9Cw8ZCITW2pGFJZSD4Fx8awpWksH3XKNjdE/mJ062D1aYhOq4y
	 ZmoNrw9wfk+b2QWBXmmq7x0yRowf0MZMhKPnF/L3l6uYb9JXpzGhcE7uTcEwFGSzGM
	 zxC2iApmqNqh8gcyQyl/TbiyziqhGL07srHMAsd7yPifuAqW7aESjz903EsEMy/xXi
	 V9LvwfzsT7upTk0NDzvCFMjN/0nJySVP5IWywO0ie/864TwbYh/5a2t2HNN4ubiqsr
	 NF8ZewKV+L+4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0ACB4C53BB8; Sat, 22 Jun 2024 00:28:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Sat, 22 Jun 2024 00:28:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Thinh.Nguyen@synopsys.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-c9s7ZyVglz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #33 from Thinh.Nguyen@synopsys.com ---
On Fri, Jun 21, 2024, bugzilla-daemon@kernel.org wrote:
>
> https://urldefense.com/v3/__https://bugzilla.kernel.org/show_bug.cgi?id=
=3D218943__;!!A4F2R9G_pg!fODPpvu8QMI1SH2NW38mJgNxScddtxlr7-FRbFln8qt4ISm6Ib=
7P6OXrtb1YRRyf5zD7koRGYGLNbyWW0Ts_xUuGkHNHpFhB$=20
>=20
> --- Comment #32 from Jarrard (jarrard@proton.me) ---
> To conclude this bug report I have moved the OBS server to windows as a t=
emp
> solution but would like to return it to Linux eventually.=20
>=20
> However for that to happen I think 10Gbps would need to be manually flagg=
ed
> on
> this vendor+device ID with some patch.=20=20
>=20
> I have tried the suggested PATCH set already and it allows the HUB to con=
nect
> at 10Gbps but the device itself remains at 5Gbps so further patching woul=
d be
> need. I do not know how to do this.

So it's not AsMedia host? Regardless, if the patch allows the host to
see SuperSpeed Plus hub, then it confirms the host controller reported
the wrong port speed ID in its root port.

The patch gets the speed from device notification instead. The device
notification sublink speed should be propagated for devices under the
hub. The fact that you still see 5Gbps means there are other problems
either due to the host controller or the hub.

>=20
> If anyone is able to help with a manual kernel patch to test other then t=
he
> one
> in the comments here then I'm happy to test.
>=20
> Thankyou.
>=20

It'd be better for the vendor to provide the support and patches to
resolve this since they have the knowledge and the tools to debug their
hardware.

I can only provide clues for whoever needs to proceed further.

BR,
Thinh

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


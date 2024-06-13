Return-Path: <linux-usb+bounces-11242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D784905FD3
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 02:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44F201C21062
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 00:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579CB8C11;
	Thu, 13 Jun 2024 00:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsqTbaop"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C8F8BF7
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 00:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718239842; cv=none; b=CTr8AQ9fShfp7DXI+F4y4luvm5ZQRTkmtQYbUrRK/z97XbaKxwJTVx8SrQI/jBE0NEUSJbRMWavW9ibiCcRaOVitpCj7h217iH+W+MPEs9CTxi4MkCVm8+fHbAmHsgaxAxXXgPI87geSLq/97dRvGafuo4UezEba93BJQ5Q5J/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718239842; c=relaxed/simple;
	bh=f9xt7InB+uUmUHX5sSdLe0yePj3C0xgI9o63tC9WOpc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dw6IX1eZ5lChJb3wFufKRPhpElhWd8QRaYVRDmm4uBIWP3iyFZBp2QfMIFc8Q9Zy6OybKfY2dkXDFEhSq3Y8oNGzo8+hojQ6e9TkTTdHaObpUXvcjysLi8Xs+oEjenvGdhNRtthmqZJjvODbSCko0RaYZ1suqMVGiqQA/gwJc1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsqTbaop; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DD63C4AF1C
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 00:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718239842;
	bh=f9xt7InB+uUmUHX5sSdLe0yePj3C0xgI9o63tC9WOpc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EsqTbaop7pPS4qzY6WkB4q0/35leLZmM03l32JUbgP/D5R1V2JnX5y4FGltXRiWfn
	 sgIM7Gkq+8hBfCAQQzH0c33Q+0JQaZ/r/R5PkFvBy/fCUI+oHIvfGdcNz6fu4CXSOv
	 HUXO6CXDuLcCn/hb7/2mfV2abmzHnBYOz+STj8fdolv/iT+KejoeeNz21IHDQqix8P
	 6XPKjMBOCpHmchrZpg1m9N8dcDx9++p98XIdAB2Saf7nQpkjTAoI+CBomQYH3oZvpz
	 96UPLHQqiRsJz6B0V57K65w8hiJQVEE46MfnN413gnOR2M2zolLsByGizS6z0rMNbi
	 rDeAkDS64m/vw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 39FA6C53B73; Thu, 13 Jun 2024 00:50:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Thu, 13 Jun 2024 00:50:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-jInMCWytWO@https.bugzilla.kernel.org/>
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

--- Comment #21 from Jarrard (jarrard@proton.me) ---
(In reply to Thinh.Nguyen from comment #20)
> On Wed, Jun 12, 2024, bugzilla-daemon@kernel.org wrote:
> >
> >
> https://urldefense.com/v3/__https://bugzilla.kernel.org/show_bug.cgi?id=
=3D218943__;!!A4F2R9G_pg!cCuzUsUD-2ePSsdCBgCODNgftuH0LhiYyBq6--AbqKmW5wPBuG=
EQCnSgOWhEOf4rPi-n6bd02HAx-VvD0vN56GomiUx1GIRM$=20
> >=20
> > --- Comment #19 from Jarrard (jarrard@proton.me) ---
> > Plugged in a USB3 10Gbps HUB (red ports).  Under windows usbview shows =
it
> as
> > USB3.2 SuperSpeedPlus 10Gbps and the USB devices connected agree.=20
> >=20
> > UNDER LINUX it is a 5Gbps hub and no SuperSpeedPlus.  I can't believe t=
his
> > sort
> > of massive USB port bug has existed this long under Linux, does nobody =
test
> > AM4/AM5 usb port speed compatibility?=20
> >=20
> > Anyway, still no clue on how to fix this, way above my pay grade.
> >=20
>=20
> Are you using AsMedia host? Then I suspect it's a similar issue that was
> reported before, and the issue is likely in the host controller
> reporting the wrong port ID and not the driver issue.
>=20
> It's a different AsMedia host version, but you can checkout this [*]
> thread for more info. I suspect the test patch I provided there should
> resolve your issue. It's been a while, you may need to tweak that change
> to apply for your latest kernel.
>=20
> [*]
> https://lore.kernel.org/all/6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.
> com/
>=20
> BR,
> Thinh

Thanks I'll check that out sometime. I don't normally compile my own kernel=
s so
will need to set it up for doing so under this Kubuntu install.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


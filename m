Return-Path: <linux-usb+bounces-11240-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F21E1905FCD
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 02:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 570DC28397B
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 00:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7BA8BEE;
	Thu, 13 Jun 2024 00:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNjeY72t"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272BCBE4E
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 00:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718239402; cv=none; b=NFZZII+rvC+fnu5s9tIP7EWJNve/6qowsTsaidcq53oUNQ3q4WshCGOhceic3VB9R+AV7wQ9g4aRlObh3KpzEB649wBBLpsoAmwyO1yFx6MHM+08wJI7Cqypf9Jmu8ctasdYI0ueAFHE59W0A6GMIe8PNBHgVGGZymnQOvS02I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718239402; c=relaxed/simple;
	bh=zjs27uDibSO1WF279mts7J83Yg46HY6H7X867ZSJtxA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eGndfkR9MGUEnNmBJrFEuRbHV09WvZ2QchrAePaothIph1kjrIGIwjikz/nWNAtITL9UEm6c6kqjHF+UK08edCMRXCoPv3clQJQ+aAJ7OOxYtONIywIss1C2tXho/qCgjSL0M4Gtdi0IP7cyWwENJ2D9WQ2iMH8gXab8bG/ttyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNjeY72t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A38A3C3277B
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 00:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718239401;
	bh=zjs27uDibSO1WF279mts7J83Yg46HY6H7X867ZSJtxA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hNjeY72tMe+oUgJhqVMtW28ylAb7R/HOjconW0jlb3YD3i7ACytEJWrbfmpBVXkK5
	 jUsoM7sSGNhaebqBXTLZAhHE8lR+OB3kN009eA5IXYq4tiDwE5cknIFN99/O4gPcta
	 NBSPlwPjRpzHF2OZdVtnCGB38O5i8x4FLQbiWw0fyFoxsZLB8S0aMjyMZ9eDPr+I/Y
	 vONZuoubuWzSwMpI34GvxQvhDq868xWw/pWKImlSbii02FMq6fRFHSuDl0pqe1No3x
	 CGlMmVCboGuPudPLXgQxZZQq994P8g2xESjS5erYYKMi2Zu1vg9/GWdeLC/j2qHgly
	 DX2tsAtyYXy9A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 94688C53B7F; Thu, 13 Jun 2024 00:43:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Thu, 13 Jun 2024 00:43:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: Thinh.Nguyen@synopsys.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-ohLZTlf5LV@https.bugzilla.kernel.org/>
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

--- Comment #20 from Thinh.Nguyen@synopsys.com ---
On Wed, Jun 12, 2024, bugzilla-daemon@kernel.org wrote:
>
> https://urldefense.com/v3/__https://bugzilla.kernel.org/show_bug.cgi?id=
=3D218943__;!!A4F2R9G_pg!cCuzUsUD-2ePSsdCBgCODNgftuH0LhiYyBq6--AbqKmW5wPBuG=
EQCnSgOWhEOf4rPi-n6bd02HAx-VvD0vN56GomiUx1GIRM$=20
>=20
> --- Comment #19 from Jarrard (jarrard@proton.me) ---
> Plugged in a USB3 10Gbps HUB (red ports).  Under windows usbview shows it=
 as
> USB3.2 SuperSpeedPlus 10Gbps and the USB devices connected agree.=20
>=20
> UNDER LINUX it is a 5Gbps hub and no SuperSpeedPlus.  I can't believe this
> sort
> of massive USB port bug has existed this long under Linux, does nobody te=
st
> AM4/AM5 usb port speed compatibility?=20
>=20
> Anyway, still no clue on how to fix this, way above my pay grade.
>=20

Are you using AsMedia host? Then I suspect it's a similar issue that was
reported before, and the issue is likely in the host controller
reporting the wrong port ID and not the driver issue.

It's a different AsMedia host version, but you can checkout this [*]
thread for more info. I suspect the test patch I provided there should
resolve your issue. It's been a while, you may need to tweak that change
to apply for your latest kernel.

[*]
https://lore.kernel.org/all/6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.c=
om/

BR,
Thinh

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


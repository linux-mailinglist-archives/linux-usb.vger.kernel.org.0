Return-Path: <linux-usb+bounces-25133-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D2BAEA363
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 18:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 502FE169634
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 16:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACD61EFF9A;
	Thu, 26 Jun 2025 16:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p3of0Bg8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A7D1F91C5
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954850; cv=none; b=U9M8gykO8fYlDZXthcc/AhQA+AaC6EuCh6IoJ2j7Tzb37xu4HNuimbizECFJLxEvA/e5cQE0/xv+DNUaWOnmrgsIi6azu5o0QO40OfYJUWVuEmM/FAOVz67YxrF002kXuDeipNIRfp31lbBId6f64GRIoKiTPa7NwZlR9cqzag4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954850; c=relaxed/simple;
	bh=JStSjlQQDp7gtmCjJev5xjoqgrBVYuEFp9xXfUPV2dI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kPP2vLKHyxa2qiKUg8T6IelppEZbqh1z8cxhF0xFReV5P1fC8fctV8Vt24bfp52R1DRQe3dptfhrOjZa7MONyOBjpQLkImHVhxAVJlmJR/koX/7Npnh12yPr0P1gbr9KO2kClciMRyCuRDCeqIWvO1HTNyspVj/OylF7Zi7il0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p3of0Bg8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77E7FC4CEEB
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 16:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750954850;
	bh=JStSjlQQDp7gtmCjJev5xjoqgrBVYuEFp9xXfUPV2dI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=p3of0Bg8g9KQxPTyZJy8JunTZvtx9bl+CftXUQpJh7BTliGCSLOhw+oG+ZG5o+api
	 3TcKYKzKds74A1+tkSer+tpTHTtI+s2kxN0asvQTu+IV5a9EwC/L6oIeBQAaga2cHo
	 Gofzs+5kbSpgpKL2whN2Cec1IIrEjKQlPiOmcgpD39wNKgE15lD0xCNM/ydZ97ButP
	 BQlXrglnb5FF29CL2o3cHAeAr+nfw5riH//Z4/UTVarA/l4X/Pv9uoMfNjw/g8+oIC
	 e4KG8joSTna2fe/01+GsdtQu2n2y5orMPSqTG2TTsp/qGurV99I5S1HGI11cOBR+im
	 Auoq3E2LNZf+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 63A38C3279F; Thu, 26 Jun 2025 16:20:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Thu, 26 Jun 2025 16:20:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.seyfarth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220272-208809-TFaMWgy14B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #4 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
(In reply to Greg Kroah-Hartman from comment #1)
> On Thu, Jun 26, 2025 at 11:39:35AM +0000, bugzilla-daemon@kernel.org wrot=
e:
> > Experimenting with AI to tune memset_64.S (see the attached file) for my
> > Intel
> > 14700KF-system unveiled a race condition in the USB code.
>=20
> Odds are this is because your memset code is buggy :)
>=20
> As this isn't an existing kernel issue, there's not much we can do about
> this at the moment, sorry.

@Greg and Alan
Understood, I thought so, too. But maybe there is some truth to the AI
analysis. I cannot tell anything myself as I do not bring any programming
expertise to the table and am fully dependant on AI (which is far from perf=
ect
at this point in time, I know). However, AI analysis by O3 and Gemini 2.5 P=
ro
both claim that my custom memset is fine and pointed me towards multiple
problems in the xhci_setup_device function of xhci.c.

All attempts to fix the problem failed so far. Hence this could be a red
herring, I cannot tell.

If people are willing to spend some time on this, I have attached the
customized memset_64.S as full file and as a patch. If people do not consid=
er
this actionable, that is totally fine with me, too.

Kernel: 6.15.3
Distro: CachyOS

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


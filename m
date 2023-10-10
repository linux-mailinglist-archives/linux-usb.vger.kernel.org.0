Return-Path: <linux-usb+bounces-1374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 434D67BFF05
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 16:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74A761C20E30
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 14:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E4124C9F;
	Tue, 10 Oct 2023 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRYaXHR+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A16524C9A
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 14:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7659BC433C8
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696947661;
	bh=PcEU0St07Ehc/sWZxnmC/S9okz0lIHiLK3HjU3bKnYY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rRYaXHR+XXCcYakgtaxRNWel30CouohGUMbssRd6Egd27372ecJpfiBrv+TMh3RIa
	 sRV9KbLu5xvXk4R5rN/85hPUIspUyfJ7FCuXY64bcPAJV9NoiJguQwy17bkpPVbUv5
	 PlMj52iHKODR3DQ3bqS+nO5jcoVVHaeHguucqEeRIvIfLNdapZsg/QqZMfb1Avr+j1
	 K1JzsYSqzaHNeaHiz/xlJidDzZMTLSQUKc4CRhEm2gvrI79i6955ud4f8edaZPu9XZ
	 +sv1dBw2XN5LxB49amOS80JvJdegKhQMfFp5Ef5LFqCzCrDrFVOD/f6ROgcHpx8+dH
	 dsS9HQ3fqEc2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1D74CC4332E; Tue, 10 Oct 2023 14:21:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217715] USB from Thunderbolt 2 dock disconnects (xHCI host not
 responding)
Date: Tue, 10 Oct 2023 14:21:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youp1one1@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217715-208809-1rE76yGiYN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217715-208809@https.bugzilla.kernel.org/>
References: <bug-217715-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217715

--- Comment #6 from youp1one1@gmail.com ---
Still happening on Kernel 6.5.4:

[71475.437698] xhci_hcd 0000:3d:00.0: xHCI host controller not responding,
assume dead
[71475.437733] xhci_hcd 0000:3d:00.0: HC died; cleaning up
[71475.437775] usb 3-4: USB disconnect, device number 2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


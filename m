Return-Path: <linux-usb+bounces-7580-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A673D872CA2
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 03:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36C66B246FA
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 02:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2EBAD51E;
	Wed,  6 Mar 2024 02:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8LDIagz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3100C79E4
	for <linux-usb@vger.kernel.org>; Wed,  6 Mar 2024 02:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709691538; cv=none; b=rM/+Pape2Fq1ncSwODcbM3S3PXRPzjM/aY3+vLi7YY8kyb8xX3RnkL+AU6mNHi7Le3rb8hgJcGQbxWZuf7xdWL3lR+npPyz8cvzgrxZnnnKlCatk4mLGtoQoB+eBOYWJyX/m+zDqr5kt4l2GXerUF+FwNKHE64EjExcuZ3dpLvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709691538; c=relaxed/simple;
	bh=0h2WugR1ScO0aQZgQYqd9w+ipWGPVlIJf+qR5f25Pkg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LXmXB7fsUxFuf6AdeBx33Yui02DP4UpgLF58Uw9ETRFLUVSwvy5DvAFV+ySHUMrFLFNG8AEtBDOqKlVk4WHm5Ts9eIPcztYzXohwaj1z1lcHBU2t0Ux/tsUhuv7+Hs/oMtcbhN+iKsTRDsel3HT56Ktr/LPfWV2kj+qtylevTnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8LDIagz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C576FC43399
	for <linux-usb@vger.kernel.org>; Wed,  6 Mar 2024 02:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709691537;
	bh=0h2WugR1ScO0aQZgQYqd9w+ipWGPVlIJf+qR5f25Pkg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L8LDIagz/Xx5G2dTsekT1CSsVlkbJ9uLVPfqtssBcdsPmZdJeSu7aYDou7+LO21xu
	 ac9F8j99BA9PXwzVoj4xLkpGbbtFMXFqm5fK31nzxJPOMIK5D0mB5QGOXOJ1r7Sc2a
	 ODr8ptmXIdy6TvA+zSDjyVrAe3rOBOlv4k/UZrh0sfv1+1tCsyhro+R0Eahd4oyQKI
	 MVO0woqxbWHMHMqWzI4ExQy6IOGF9fB5eYlMJuuvkX2cGQw6kt9GaZ5UM1LKBgN79m
	 NKlcZU3PPumdIkZxs0zl28wy3pPQwS0Ts1U8NOjaIuUu4Hk25GW0geRwRSYsQ08+Kb
	 xOPUhYNXwAomA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AE12DC53BD0; Wed,  6 Mar 2024 02:18:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Wed, 06 Mar 2024 02:18:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: benjamin.sabatini@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218525-208809-hytt4F5Lfg@https.bugzilla.kernel.org/>
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

Benjamin (benjamin.sabatini@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |benjamin.sabatini@gmail.com

--- Comment #15 from Benjamin (benjamin.sabatini@gmail.com) ---
(In reply to Mika Westerberg from comment #13)
> Okay with this you have ASPM disabled:
>=20
>               LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
>                       ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
>               LnkSta: Speed 2.5GT/s (downgraded), Width x4 (downgraded)
>                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>=20
> However, the link speed is now at gen 1 but I guess that gets adjusted th=
en
> as you mentioned. I suggest to check that when you play some affected game
> that it actually runs at the 8GT/s x 4.
>=20
> One more thing comes to mind but you probably checked it already. The game
> may not be using the eGPU and instead it is running on the internal one.
> With the Unigine benchmark it clearly used the eGPU.

Hello. I'm just confirming the issue over TB4 on a Lenovo Z13 laptop and RX
7600 XT in an eGPU setup using the same kernel parameters as workarounds
(amd_iommu=3Doff instead). It never pulls more than ~50 watts and maybe ~20=
00MHz
on the GPU and ~400 MHz on the VRAM.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


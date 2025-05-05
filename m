Return-Path: <linux-usb+bounces-23706-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9BAAA9000
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 11:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4423C1678BD
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 09:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A049D1F8BD6;
	Mon,  5 May 2025 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltx681dg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246E43594A
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438516; cv=none; b=mF/97EOsSAOyL2NCXTOMxXDiu9NYIMUzUR9Nrb46NqgQyXOknAAP+FGAyLdkGkqaldldFwlIvcrIDN6kH6dVDsXFlf7FDWd2mWheMNFq8f5zEx+xDRA+jZgz9fMGeQAeCQido4gV6IlY/K1FlOdchCMwoU/LrEfe/nKw5xzz2os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438516; c=relaxed/simple;
	bh=NBpQIUfugAwKJykizneaIzmS/eFx0xpPPw6CqVdbo/M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tVkuP3O+Khy312TBBOzdGmlcXczenUdi0QEHXNS1dajw/Bcwyr5XchjwVqvNpKE6t5hagvgrHiqAWrjFbPtYDbo0HltvbSB6S7gFsNJTtidOq5NnJ36h1woUt5DWkTiavmF4V3r77AY+YicsrJfKKR1pIE3z5ffn1gKBPwAgODY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltx681dg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89F25C4CEE9
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 09:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746438515;
	bh=NBpQIUfugAwKJykizneaIzmS/eFx0xpPPw6CqVdbo/M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ltx681dgNjs6O7/32wUlMRYBWdzIwnqy6MEOxG2s7yinjPmFYrHfX7O46BJNU10Ew
	 qxDPbTCpaBV6a/TMg7tKVLUaQ7sIxXNaUj2DMgR7aZdtyN1wpOaQMj58VU3mB64mwd
	 7sq3yf5YGjuJvzaA1j/K9fTOcHT4Bhubd5h7VHsyNAMQknkyUkWeKgkdzolwHHNBhn
	 BrvrmrY+4RPyzMVlcUd1MC10uLXbWfXwyXLCTqSpAW+pv/ZQBR3zI/GU7xAIzm2fzR
	 0/RxSIj3j1007UzaixSAHqnRri3m8idMditpoCRZm1mB5SD2rEXYSM8TiCjKSKXok+
	 ct4jjyRyWbVTA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 77985C433E1; Mon,  5 May 2025 09:48:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Mon, 05 May 2025 09:48:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-1lSbherwGc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #41 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
I don't use grub2, but it looks like you found the right place.

You can confirm by checking the /proc/cmdline file or running
dmesg | grep xhci.*quirks

If the quirk is applied, this line
xhci_hcd 0000:6b:00.0: hcc params 0x0200ef81 hci version 0x110 quirks
0x0000000200000010

will become:
xhci_hcd 0000:6b:00.0: hcc params 0x0200ef81 hci version 0x110 quirks
0x0000000204000010

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


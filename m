Return-Path: <linux-usb+bounces-23845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4770AB2848
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 14:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91AA17A1FCF
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 12:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94055256C8F;
	Sun, 11 May 2025 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUo0Y3Db"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCFE199BC
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 12:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746968331; cv=none; b=LecYWA/UDHUnxbYHV75CxcR8g6XJciajOBqk0mpG52Co2wV5VCfDpXJFWSL4sCNuFfzVKeCV+1mzgi+fJUsA14HEZW1kOtykrzWD3/ghPMdaOoaEFEL0byjRn8Kecp5TXQ2aBmcP4Afv+5MzTfocQLMz2vGIvoXn/mJQ0bTRxg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746968331; c=relaxed/simple;
	bh=1iLMVLo3acWe5s9z2HvyDMPbHtoDtn2l7rLAbiHBcp0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c1pWtF5ceUJebDFcExXdUfF0rvZpHV0AZzSksjovG9Pz9fKO4VrWzD4fvUVng1Pyk1l2Nk4u8jAgaMfIfl4XUOhfeGS1+nNtw4r+bQ2ssxokxqJ3wJUK6s7eXvsReMbAAtFsfiX1GsrQdX3+fdmNUt2S372QEWlSszWC4y+gagQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUo0Y3Db; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AA2EC4CEE4
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746968330;
	bh=1iLMVLo3acWe5s9z2HvyDMPbHtoDtn2l7rLAbiHBcp0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HUo0Y3DbTXV5Mk92oaaCs2SBojoh0kkurgR7gSNDHCBfY1UYlyaUEie1uhuitEbkh
	 vlr9SeJMAzYf+Xq3L6RJGjrRFq/TtQZal9ZUV+BwTGppRBPzkhjDl4ZiSQ2DDPMbZ1
	 azdjo8dPQLSSkVy7ZIxnNEaa5mlRugMkjl0dvZerYz+dTYAgOb3W1FKEvHQikkbmzH
	 zQH28mf7AKEsHVljVINLwgptjoHyqtu6GYaIwDnUXKigUxW9dU2GAdbKFI1RCn++jG
	 RTBbih6L6K0O1KYInnqljhSowVY9PqL8E3V67UMXRhix3FQ9GvM2VIDu222TjmWuR4
	 7vNAim/50CO2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7F332C41612; Sun, 11 May 2025 12:58:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sun, 11 May 2025 12:58:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-FXlWLx6XDK@https.bugzilla.kernel.org/>
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

--- Comment #50 from Claudio Wunder (cwunder@gnome.org) ---
(I'd appreciate some guidance here or if you could point me to docs; For
reference, this is the flavor of the Kernel my distro uses is:
https://github.com/bazzite-org/kernel-bazzite)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


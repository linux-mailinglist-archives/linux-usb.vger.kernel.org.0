Return-Path: <linux-usb+bounces-23654-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F968AA7AF1
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 22:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDC727B1F1A
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 20:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC171F585B;
	Fri,  2 May 2025 20:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dd/lHdP/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBAE14BFA2
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 20:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218173; cv=none; b=F3/dB/RN1e+9T6Pw6Y1d7k9GKype+hPrc1j6Els71mTWzJC0nrUuHwTxOEb/iPIa7U615ZYD2lWKEL2sZ0qeoiZMObxn6zlFqRQAIWvzMOTTs6mjIizpvLK8s2SYNA6K2KHy06gpg1ZN9DPNCE8W3OQG1Ad6qFVKj3LoVPVPALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218173; c=relaxed/simple;
	bh=jrbEdfMGB3ihNPM8w3aTVdzv/TNFCZwp+srrIZGI7ok=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gk0UNyDwYWHoP0IQo7HXwlzcypbSIHPBvkp7tqyte3hwz1azNG1jhJd8/Q0xa1KDsZo4jIUGAkQtF0U04ktGtycyKm5feVmjzR7N11KL4twSQYN9J7LDCO5x6QulxDGvEgh73C6Fx/FTZ4wpPZroJ1bGJS2qoTWV/TtPdJbqnuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dd/lHdP/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 502F1C4CEE4
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 20:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746218173;
	bh=jrbEdfMGB3ihNPM8w3aTVdzv/TNFCZwp+srrIZGI7ok=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Dd/lHdP/+UaenGra+YNYzBZjrXKSoNdFiEjDhbF6N2zQgoP+/5G53lmnwWDeJ6xku
	 yzrZbiLDlkB3sQcF5gnoGs3khHoPEHG4N8Uwe17TOEc2hGwQNoPkkRuN63uclPnL9C
	 Mj4YMbP2EeyR5Cfxt3Se5MVBfWRGO3ODkYBH2oRmzewnPRTfvnr3eg+B9mfGPx1cUO
	 LKr8WympixfQq30pLu2lFq6QFrfBnpNn9qyGQcNowl973nIm7uGhz7irfiXwUxSvTT
	 u1wpB6ge2NuH2g7aD6MeA7/bFmMzFXF55bJX36z7em8oThuUfufPQZ6xri9MXfr1dZ
	 aL8OJK87J0lGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 455F7C41612; Fri,  2 May 2025 20:36:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Fri, 02 May 2025 20:36:13 +0000
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
Message-ID: <bug-220027-208809-bn2b8a3VGP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220027-208809@https.bugzilla.kernel.org/>
References: <bug-220027-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

--- Comment #9 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
That's good. Does it work, as in all the video modes are there and run at
advertised frame rates? There are some missing bits in support for 10Gbit
isochronous video devices, but maybe this one is bulk.

Out of curiosity, what happens if you run this as root?
lsusb -d 0fd9:009c -v

It will request BOS from this device again, and for real.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


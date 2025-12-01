Return-Path: <linux-usb+bounces-31058-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1623AC965F3
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 10:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B5AF4E0FD7
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 09:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A74A3002D7;
	Mon,  1 Dec 2025 09:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeqMyMJY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175CF2FA0F3
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 09:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764581135; cv=none; b=sPDs9BWDEqebpmACR3WooomecuZ/5mkdQB0r2MigqzvlFfW+j0KA5DHBfgoOvfbWHRsmHzIpP15oTQ+EqluczMaviyYzz1aM2oqODNNaUpT11GoW0DeMEBTvdZndTo+kQMwulVCSp2EpjRRqiJO978I3vOxGO9OKT78ysen3JVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764581135; c=relaxed/simple;
	bh=13PBuYQWKQlN/vYiRGHc64vpH5BCEdmJY0u+eL522qs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GgPfhOurd0PsAE00gI8WkgnnSpNlrLcdbLS2l/6OrWchALIYgbI0LSYcDXBB3BiAnoIIbw61+RVuLh7gBC9nJMnr8P7z5dBJUpJKw57BNPAIt+m8JubQqGCEZ2M9sK4btvpSJuH8O0l0/Hvvx2IGIs+Xs8azc/XUhaPYeffnoRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeqMyMJY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87EDDC113D0
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764581134;
	bh=13PBuYQWKQlN/vYiRGHc64vpH5BCEdmJY0u+eL522qs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WeqMyMJYQ3+gLlaMxEGgGL+qs1kB7BfXfOfOc9A5rN4GFMT7gCZvCtdzW66RqSxjg
	 m0CoTOxyloBq44IhFT6dBHUBS2e9MNnWkI5Wl2fSnQcYUc55DKq4/zYhCFEw9v+wat
	 n6eGd8Ad40AqUMHOB+5jQYiuHFtI834OU+PvGnUVQZPCPua+fbY7gIaVGGtkFT/hO2
	 1SkJ45mfXei3rGZ93419eO1XvHh21rsyM31zikImdlnq2UN9wYuvpIW+dycOoERwIU
	 glLYGHiCaZZPcERgyLBE5tvFKcl4hOQ2eL+fDG1h0mwwgNwiFrPa8AsADjvjgsz9Ff
	 OObt9i+IeYcmA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7A69FC4160E; Mon,  1 Dec 2025 09:25:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220686] REGRESSION: USB devices not recognised when plugged to
 Thunderbolt 4 USB-C ports
Date: Mon, 01 Dec 2025 09:25:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220686-208809-d6R0IsmL5x@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220686-208809@https.bugzilla.kernel.org/>
References: <bug-220686-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220686

--- Comment #7 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
This commit seems irrelevant, it claims to fix a bug introduced in 6.18-rc1.

Can you post "lspci |grep USB" and "lsusb" from good and bad kernel, without
making any changes to connected USB and thunderbolt devices?

And if you don't know how to build kernels from source, can you at least get
other Fedora kernel packages (like 6.15 series) and see when was the bug
introduced?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


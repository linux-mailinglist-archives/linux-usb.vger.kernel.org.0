Return-Path: <linux-usb+bounces-23560-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B6AA1C61
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 22:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B6DF1BC4167
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 20:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DA124290E;
	Tue, 29 Apr 2025 20:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGthvn2Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D84018FC80
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 20:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959558; cv=none; b=bfc3EZOrY1GBbBwiEKu2d6B3xTJ/UVieKRwpbrvfMXxObFR6Gp6lPq2X1PuqzO9e3wzCRlEMEO4udUuuWsSdboLYnO3mQONoqxkLm66LM0izZQ5EIUVPjMKj3Sa2dtvdZig68Yu/RrfCIlKKACYhGB3yH83sINKyUgTZ31WzWr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959558; c=relaxed/simple;
	bh=2IwaHN7smXzAjIHzmcN0+wusqbsYE7JnnjpKSJ0fhmc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ONNKUolAMDybnkoYGgFLRzd2PJoJ8+h+H9jOwS+W1p9ghtqTZPFk1tjY80JB/4fgCtvDhOTvKc3Xn6C/qrplZBZt/VP3QjY5HU4aWmjlvX7ufQm5ssMvQfsdMBf5Hxr81dWlEfEjpI2jhyTvW83EGrtug6avXULsEFfsmORmFLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGthvn2Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16055C4CEE3
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 20:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745959558;
	bh=2IwaHN7smXzAjIHzmcN0+wusqbsYE7JnnjpKSJ0fhmc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fGthvn2YJl5/0Mo2ssJj+NrVeCkHhwm5Z9+CSHaYNi1xFmqhmIyGxY9fcmRjux8sd
	 MGYpM6tx5/rjGiNZBKRSPCkdoSqRdvo2koiybRA+pAuYo2u9mZ6jb0tt57DyrJ0rTx
	 bVs5F6mJ/nwbEEskvRR3re+oNGftE3UHMmI9Q5zCaEvJ8KAT8r4PPt+SJ27JrzisXI
	 B/uWeSU1J+ESFBZVcXDOT/QT84nzZZmhcMssCMiCDHAZl2usRmpPcqVevZ6Weroler
	 ztMHGJkqWn07t/hpgwSJ9KHbKYLHEV2k1b88E5dfbEiH7/9eOMOY7r18bmbtL3E/RV
	 /+jAoCcp2Bi5g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0A8EFC41612; Tue, 29 Apr 2025 20:45:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Tue, 29 Apr 2025 20:45:57 +0000
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
Message-ID: <bug-220069-208809-wsduJXzdDc@https.bugzilla.kernel.org/>
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

--- Comment #3 from Claudio Wunder (cwunder@gnome.org) ---
*Apologies, I forgot to filter only the USB controllers on my last snippet =
from
lspci

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


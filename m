Return-Path: <linux-usb+bounces-20849-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 176F4A3D4D5
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 10:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED38617B162
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 09:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E421EB1A3;
	Thu, 20 Feb 2025 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpgLjb2j"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8211BD9E6
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 09:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740043962; cv=none; b=IhuoAVHTpGp5PNyDi2tprWyWixDOwrU77Jc9SwhivAifj+xtSY97qcnIdmhvHsencV1oNAvmdPvnRIgavVwQmstS+qvT6OplOq+UAgLWsQaNFeOgVNyXI5aoh7lpdS7wCkdgYrTkhndJOKGv8cb1o5JpvG7N1D80nd3AVR0ZQvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740043962; c=relaxed/simple;
	bh=RtM2D6pG7xBfMGC9vAA3CiF0wWFQNy3bToFy/udSU0Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XnprM1gIEljhdbItjUDmciwxNWlWA08QnhmfDOsQf5ZJ9hJoCVYokggkCtbjiSziNJbIaC6+iE0fMe3r35wWVQkhtHNIvYke9PrUr7gzfBaPJJIgMDKDc4X2fyy1Ehnw34Es508jBrAVUK1V+9gxDT9FPc3IOiyKZ/ag3JLgy4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpgLjb2j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1611C4CEE3
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 09:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740043959;
	bh=RtM2D6pG7xBfMGC9vAA3CiF0wWFQNy3bToFy/udSU0Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QpgLjb2jBdvESnqW9jiv9eKJSJU6WTLBbfmubA5dOQ6LqiT6Ob+MeZLDVoHi3Mo2i
	 YpOOhQNBa11Nd/0giYciC3cz+vzjswIaZvYFaJpGbRta8huueBl/hkOY3DaEFECE2l
	 tLTercblSjpXwjy9zqKmes5VARCTZfRKpuQSFzNk8v78RKDH3Nx7maCj7uPYundZBS
	 VDWL0MIA8OYLJiYu0lHIdu4oOpiNmR5w0XLmFu5jK2cucP53mQxQzdzVTNatLFL+Qz
	 qiVZifh/P8zAa8dEVzV/S0t25ZnlexmtuNlfZkKmb7/xZS64aW58PglewFNKQu4Klv
	 UiqJqvk8E8/dg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D25AFC41606; Thu, 20 Feb 2025 09:32:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Thu, 20 Feb 2025 09:32:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219773-208809-ecVWiRlB4i@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #18 from Frederic Bezies (fredbezies@gmail.com) ---
Some additional infos. I thought it was an Archlinux bug. So I tried both
Manjaro and Fedora live USB.

And nothing changed.Ut is really a bad management of this motherboard USB
ports.

Hardware is not guilty here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


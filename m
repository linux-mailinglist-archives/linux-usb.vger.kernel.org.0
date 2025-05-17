Return-Path: <linux-usb+bounces-24058-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D85ABAAF3
	for <lists+linux-usb@lfdr.de>; Sat, 17 May 2025 18:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E99D17A5A8E
	for <lists+linux-usb@lfdr.de>; Sat, 17 May 2025 16:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A5A206F27;
	Sat, 17 May 2025 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WoEKmoPM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F59D19005E
	for <linux-usb@vger.kernel.org>; Sat, 17 May 2025 16:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747497870; cv=none; b=u6iZYhp+b2bvE+/iH9zS8MW5tzJJXHRMl+wUY8v9XKeMkca4uwJdLOJrH79Yrm62yz+icUk4+HPcOWYSfz5sAyDJFfED+K/a9xHq/CXtueSrXWtkbrC3MmzndCG5VbGHdLqsMIps7pWjgLWHR3XNo7/3QEIQIUndsFr/476P/KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747497870; c=relaxed/simple;
	bh=LRfLwoZZH0OcZKmxJhpwbao47N+GE+5SuJI+W7/oU3k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=au4ddDAWpGOFv5RFmV+zZE7NMRoLrzVynUsZo5TB0AqfDdkksDdm3XkQHBJ8Z6s21BDuRPv/OXHS1ijEZJgkMkn7arRYoD0VBjKnJhuDzSsZsAvGyMzVQOn/izH5a1aqJJgmBe0aag0zJO3ZO1WBMDKHE9XyoOAmcmdR7qWuKws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoEKmoPM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A19B8C4CEEB
	for <linux-usb@vger.kernel.org>; Sat, 17 May 2025 16:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747497869;
	bh=LRfLwoZZH0OcZKmxJhpwbao47N+GE+5SuJI+W7/oU3k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WoEKmoPM1p1s5wuZcAGKtkSISOibnMyZHp09RuiFRH87JtlPU+Xoj0a+jcAKfmgkm
	 nKrg/ULgbvHkVrN8cfxIwsdHwZTsS7K19AeasJtuTXIiDtbiqUmNKBXsq4eCClVPNl
	 GR5rB0d1GBQ6k4LpSjzcDM49SGvGZTlG7NKFWF9ZAR/LZhLzHmZXbiMHi/bEvX0Jb8
	 fOmsdeIkc1MBCzjrR0IcDY4Wx4oGVG97w0x0iTSZ73tuXlZ6FIBCSyFawybn3oJjZP
	 v/j+c1qr44o8Z/Fydx2lNRbG5bThS+1Y+mYQUB9Y51tLh+lzH2lQnTY3o+hIlUOc8+
	 vK3dzslCOTScw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8E933C41616; Sat, 17 May 2025 16:04:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sat, 17 May 2025 16:04:29 +0000
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
Message-ID: <bug-220069-208809-UiqdtqSXyS@https.bugzilla.kernel.org/>
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

--- Comment #53 from Claudio Wunder (cwunder@gnome.org) ---
Bazzite's maintainer gave me a path forward, that will require me to first
dualboot (with another distro) so I'm able to build the Kernel.

Meanwhile, I'll try the Kernel args that Michal provided first, to verify if
they also work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


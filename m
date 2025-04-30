Return-Path: <linux-usb+bounces-23591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37884AA584D
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 00:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72AE11C225A9
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 22:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456E1235070;
	Wed, 30 Apr 2025 22:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUypCcU9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C322D22A4D2
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 22:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053536; cv=none; b=Vm5NNU1jiFMSTJIEYkmos37Ups+jbrB2XcKPUcmfD0e1AAdoalTFZSCyIrFaMyrOLW1Nt3cgL3ckAoIzLgQ6vG00QI5W/ThjwxrU3zALMYgtHMP47i333KE7H2sm1chKGYWZXTGAn4C7BYN8B9OjuIWYtnZKtHkAAOnXHJlPSrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053536; c=relaxed/simple;
	bh=BDOWw8xpQ7DLo/SQ6//GnT4jHFzOA9CN/d+70mtLQvQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S0gNwER+HT+S+S+l03GtBg//+kbClTMM+qSEo8OlD42QsiLEVdPWuJn0gDFSP1p6DqcQkvVX0YJ4WqlsV6YDbo9lEZPXZI5/B6ccUM3U9WPRPCvRwM5rL3GXhK9/7y2xQS1RCo5PRnu+aUX03bdIjkla8yXG3WSmFt/MXdO5Ta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUypCcU9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4C21C4CEE7
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 22:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746053536;
	bh=BDOWw8xpQ7DLo/SQ6//GnT4jHFzOA9CN/d+70mtLQvQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bUypCcU9xUcs0pJgdvDES/3LNZ6+7cJ5nmFVZeLIXiHV9fiGjIL2lR/GE/ydGm6+l
	 zOlUib4L//Ely0AgiPNLxi8Cjuo0I4EfvJEygGyDN0m07Gq4h572kNzpIZTZ0MlHbl
	 Nd9FSvoIntYs5D0c9PFZVRe9ZZ9eiIXvPmH+5dBeFGuci3EBTf7znjcNbkMOhS14YQ
	 twUteUYeh/i3bOU7wWsWx+3cmyC8m/TGurphHEEbELp/x+FNNNhTULHqR98TRlxyvT
	 PJJSsqTKY7aOFrbKmN8a9CievfRlqvjlpihhgScIoHzenPeJanSckr8yeNuVThYAuN
	 FM6+LysRGtA7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9EA55C41612; Wed, 30 Apr 2025 22:52:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Wed, 30 Apr 2025 22:52:16 +0000
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
Message-ID: <bug-220069-208809-NefclsG0Zt@https.bugzilla.kernel.org/>
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

--- Comment #11 from Claudio Wunder (cwunder@gnome.org) ---
> This means it's the "600 series chipset",

OOC, X670E is my chipset, I assume it is indeed part of the buggy club. I c=
ould
change my motherboard, something like X870E (Assuming the 800 series by ASM=
edia
does not have the same issue); Just to rule out the "this is probably the
chipset" culprit.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <linux-usb+bounces-29441-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8FABEF4D1
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 06:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1678188DB98
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 04:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D86286D60;
	Mon, 20 Oct 2025 04:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXpZAQPv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C59F29A1
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 04:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760934824; cv=none; b=adzRw3gjpHxw8Wst+3QfQbV7LlFN8YjhMU61pycnZAEIGD2IrXEvj25wmjUz0f1nFdnOeLtV2nMJZxgHd+cvF+tXAwfa0vfAdOxfVLSPhRapSVCfr/OmTpHX/QQl0nJVeScz2F1Q7PZM7HR9xoU4m5vGC+dAtEYBGlcuHGEGE4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760934824; c=relaxed/simple;
	bh=XtM/t29CBqv6yrm9YZ5I6Dujr/Af3drPdCc/wudNjDQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u226E7H642WGf6Sv0+Uo+9PjKOmZUT+GDE4pUoz8/STErR52Px9E8JwBn7M7hDHL8hywgApUUlkl+0Q39nA5e0sO/w7oNA88K2PuG2WVZRZMWZXRXaOECc1tGiorIN9Xw+j1Mf+hqjIVF3ea1jdIu9R3wXAKKHOSmnVmaUGy3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXpZAQPv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6FB8C4CEFE
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 04:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760934823;
	bh=XtM/t29CBqv6yrm9YZ5I6Dujr/Af3drPdCc/wudNjDQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AXpZAQPvPk2ZhOvPf/ShdUd4Fq6+GnYLhDaLkVIXs53GzokMzxrjsPcAdD0TydWmq
	 dtXFN7OjdR1EOhUBTk9uQlcqeh5E/zyPPZhJmAEZ8P3VdFwjS5qEj6Yb7UUqo68J62
	 C/SOE/BuFPAygG3lOuUQvVvNAxh9CUzIfL0CRRKIP68tfFM2lLFtufA5IqVZGPnC6j
	 eeRldJ0Q96XyAEiQ6teco5taaCAg9V9IWXHbqgQYLKjBn5MORsVY/NNI44V/mpMlZL
	 9TRVhq+frImpLD5qarHf75BucilbBRgY3/mU1HU+0XNQbZdMmgQ4jdqwkOmbHIsYS2
	 e9kt2IcWQn1cA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C67F0C53BC5; Mon, 20 Oct 2025 04:33:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220686] REGRESSION: USB devices not recognised when plugged to
 Thunderbolt 4 USB-C ports
Date: Mon, 20 Oct 2025 04:33:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: anonq@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220686-208809-Ihi2YxwvIA@https.bugzilla.kernel.org/>
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

--- Comment #2 from anonq@tutanota.com ---
Thanks for clarifying; since I switching from obsolete kernels, I will pin =
the
6.14.0-63 one for now in my Fedora

The correct versions (fedora kernels):

6.14.0-63.fc42.x86_64 -> WORKS
6.16.12-200.fc42.x86_64 -> BROKEN

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


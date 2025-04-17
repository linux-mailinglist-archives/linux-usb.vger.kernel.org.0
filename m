Return-Path: <linux-usb+bounces-23199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E66F2A91DB2
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 15:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49727462DD8
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 13:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99AE245036;
	Thu, 17 Apr 2025 13:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sawOebQg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2418224501E
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744896132; cv=none; b=rkRsf6uVAxViSw6hKxfSZ8hycGgJg6wuCs/AYtq41QJaTo5W0d0ax6mjdL2v0L3sguHMd/ohlxenKV/T+8lnBeVoWiS6HLPGWMtfOgluPGsqqQxLdI7m6AQH9ZL+MGvRB2q+B9LtB4I6EZjHNhU64q7fpwFDnIxv9mfba66YFv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744896132; c=relaxed/simple;
	bh=lxFGgjFL/8mqXUouijUnnEbwGZISByLKA9Wa5+jQTng=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u59W0oGQw8fIDjTysz2aQNaDWn7+5Lh/4LrMOd60mI6Jan2t59xSiyvF9P/AKlinO/alhSvXVLl9eT+neo7x4GSeFu3fRASNADspfiBuIdaFRqrlG6FeSxiKImttxI+F/VAnDodc/YgCp347RTKtwVYYKJjI56RgVTXVbjmO7v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sawOebQg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91F67C4CEED
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 13:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744896131;
	bh=lxFGgjFL/8mqXUouijUnnEbwGZISByLKA9Wa5+jQTng=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sawOebQgyQKVmeza8U/NJU7v+8P+79+ggAcyBfqBeU4vm9hDZUb6CEw2du2X+crDq
	 J/xaQjT9gOFtPXUQI8hgHdocPJ1Mh0G1wQrXAsUhEyRCvb09GcTcu8Zj68aGdzBi4q
	 5MeLkAhH/6ome+n7uhrXiqQ72UrGk8EKMalaLUPse1qZduML768OJGRKaEAqLFk4yI
	 DJEJrkenYADJrDde4vTpKXi0kvrVmmK+Vspl21Wj29RNusqgbLNEAFXMUuzljPPSou
	 Pqggp5vyFxVVZFnMZjSqj3cPAhjnfTnOVGrRqg4oWvPxvrV1zHhW6TOHSOmEY2lJU1
	 XfqXw6J5kDmfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 84761C53BC5; Thu, 17 Apr 2025 13:22:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Thu, 17 Apr 2025 13:22:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220016-208809-h1JfVXM09L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #10 from Steven A. Falco (stevenfalco@gmail.com) ---
The question now is whether this is a kernel bug or a motherboard bug.

If it is a mobo bug then I guess a quirk would be appropriate.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


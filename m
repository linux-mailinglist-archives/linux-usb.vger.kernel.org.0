Return-Path: <linux-usb+bounces-23537-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ACCA9FCC0
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 00:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C63F53B31DD
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 22:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18712101B7;
	Mon, 28 Apr 2025 22:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5PuxFST"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205A620C02E
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 22:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745877993; cv=none; b=o1LmK4Vmc18ziYHin16ZbVIGq8ZWePlFGi0LgBiUHK6K3DB4em3Ay9gM3uoIQdpTEnPNlNKdk/zPlAU4Xvnehk9E70s7V7nk1xtMvEuThQYxeA1Txah0Kueye5BSr5yJ/QWyzuj5i/2y8PeYiB+1tN0tRy5/U4qLciu7c9vMBeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745877993; c=relaxed/simple;
	bh=t5oqMs8qz9rJJsTZ2StQ+6zhDbsIWuuS+Pah/rTViXY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LtcyywzMWxXmIksTfpyvzqb6nAhiUQIESL2Vg69cY4PIWMObI0HmFbIIwwL/IY64At31HrtWIoS6cdle2QScWsOkmw71g2juc/3t4FkgffAX5p9bITih1D9HBvYhL2sWZxRnRgZpNvvGltdMJn65YC5/XLSTYpjzCzIUKsAVqDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5PuxFST; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BECCC4CEE4
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 22:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745877992;
	bh=t5oqMs8qz9rJJsTZ2StQ+6zhDbsIWuuS+Pah/rTViXY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h5PuxFSTBnwkSioLIXvXaj/WW8TZ34yJ4uWtFg14ytwxeLkztYyqHTHujmHszDbIR
	 YRDDF+r2gw8R8lzUkAwyd+a+pXhacgiDY2DHo8itQB7BeMQzULnx/Uu/PGNVHWX2MI
	 GLYZ+ybVO85aAvbbxnvGaneHrJrRbfMASGeRNL37LVQ7/WMy35TyLNvypUkqk6tOrb
	 scW0o79DMDhw9wTXl3VZrsyPaIeqmWVD7t13fsg1ZNjYkot7Nb7Iwr5wJ4+f1MNRdT
	 thzQ4SRiFXLcVTmdoVkK9Yz83ol4pQAe7P/+8wuWl9FOY9rGY4MQNRodSTmFAQKVp/
	 0h8qS0NQvZugg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6DFE1C433E1; Mon, 28 Apr 2025 22:06:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 213771] ch341 USB-Serial converter receives but does not send
Date: Mon, 28 Apr 2025 22:06:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luzemario@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213771-208809-eUnOYe4sxt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213771-208809@https.bugzilla.kernel.org/>
References: <bug-213771-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213771

--- Comment #10 from Luzemario (luzemario@gmail.com) ---
Tested with

Linux desk 6.1.0-17-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.69-1 (2023-12-3=
0)
x86_64 GNU/Linux

Devuan 5 Daedalus (latest patches)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


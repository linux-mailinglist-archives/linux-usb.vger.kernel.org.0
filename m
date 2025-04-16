Return-Path: <linux-usb+bounces-23160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6212DA90A78
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 19:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CA181898887
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 17:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA4D217671;
	Wed, 16 Apr 2025 17:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STLqSABD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738781DDC3E
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 17:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744825890; cv=none; b=f/Q2UEdNHNC5zdo4BGExQJYn5A+2MXw6xTXY5Cz4UVj9qUshuEnHjkXVn1cLn2GCdunWeA21D9ZsHb3vgE9RfbsBeB+cLPQu4I7B61PbKmCCNIi0KSAWwZfY+fHCWg28FoMFyTpzYVJMa3llrSgPgC9VDC1dMGCMP7ZssPk9tgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744825890; c=relaxed/simple;
	bh=ALGjs8ftg1VmiNiDH5bsTdgIVNJbzumNB84P2mKawgQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pB+PzGgBctd13a13/WRIDHPoLq4bd7BTmKMSyDPhr3MpvJIjIZ1Jy5i9rvQgygDf7ICvw4I9zYBmjHs7dx4NoU4chYTOyw4E6BmTVeqUy7HVnqP2dKr1FiidZR8gtBQRPL92hdQjjMtQBn3355hWoWFSndOUHMESZFVpmAhKOdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STLqSABD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB55AC4CEEC
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 17:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744825890;
	bh=ALGjs8ftg1VmiNiDH5bsTdgIVNJbzumNB84P2mKawgQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=STLqSABDKhpyCV3i60aMP6JbRa8L+wCkzCiUuKVkXBWsGSyym7nDQHu6ckSJN9B8b
	 1KCFkQBJFuDnLswihIibYQ0Sn1jlI9FwlhmJOrsQuxov0aLurLk8g4zkmAxVxWj9Ln
	 f5HNj/GXDVfM6oDzljd1tgdX9GKgJQWUevAwMVfz9WJiL8mxy0uvfzy0ZnFD+oxV3T
	 iD1pdHfO8RfGifGb9wdJW3z0r+Uo42Dn3RQJqj6zUGhtxz3hgaHwj24/IJVJbHpQ4q
	 KacG7CTyXhibvRwHsq2chefxaiWFPKAOiz3JFdSRgz2uzkIHwm9lgkTcLzapPrRqsW
	 Jj3UIIRdnvTUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DC030C53BC5; Wed, 16 Apr 2025 17:51:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 16 Apr 2025 17:51:29 +0000
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
Message-ID: <bug-220016-208809-jCJ4FzPg0L@https.bugzilla.kernel.org/>
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

--- Comment #7 from Steven A. Falco (stevenfalco@gmail.com) ---
I appear to be having the same problem, and I've attached journal logs from=
 a
good boot and a bad boot.  In my case I have a mouse and keyboard directly
plugged into the motherboard.

The keyboard was not working once I upgraded to kernel 6.14 but the mouse w=
as
working.  I stepped back to kernel 6.13, and both mouse and keyboard were
working.

I tried switching which connectors the mouse and keyboard were plugged into,
and at that point the mouse wasn't working but the keyboard was working.

So with kernel 6.14 several of the motherboard jacks were not functional.

I looked at the pci information, and the usb devices are:

usb1/2  0000:23:00.0 ASMedia Technology Inc. ASM3242 USB 3.2 Host Controller
usb3/4  0000:28:00.1 Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 Host
Controller
usb5/6  0000:28:00.3 Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 Host
Controller
usb7/8  0000:2d:00.3 Advanced Micro Devices, Inc. [AMD] Starship USB 3.0 Ho=
st
Controller
usb9/10 0000:05:00.3 Advanced Micro Devices, Inc. [AMD] Starship USB 3.0 Ho=
st
Controller

Apparently, with 6.14 one of the Matisse controllers was recognized, but the
other was not.  And neither of the Starship controllers were recognized.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


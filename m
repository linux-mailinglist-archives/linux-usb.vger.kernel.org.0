Return-Path: <linux-usb+bounces-23589-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AD7AA5780
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 23:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCEC57A15EF
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 21:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00A821ABB6;
	Wed, 30 Apr 2025 21:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLCZpB2u"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380F83F9D2
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 21:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048962; cv=none; b=A0SUbmo15zGo36VY1oHRVKtf4SQBv+h3ckzr25V9Rvph+lk707DFEA8tVuWxRyuUdMBPnXzMaqG+1YI/Z43PwL9O3ZWYADyN1FhZX4bjrkSsVcQKax0jEcf3C4sUQOBeoJUQ1qCXMBy6m5TE72gG17sBgb966ZagDwFLKryv1LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048962; c=relaxed/simple;
	bh=AZntVhZ+vDEY7Bd4rli+GfQbwO5SJy1RspG0nOcJgT8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WvvQ56V1p220cu3q9q4ETXnIbUHo4N7Ch59/9asmpJLqdEXKewhuy67LAVCn+3fVobPhePSQTFQZ8O9sj+y/gkAwJl2I0UiwfO/f2x6XBn2ZOYpxLQiFuQKwFt6j1GOhdFcSbiKqRiZhUj58tQvDvkPkNQf/9y1TImBXZkQHi9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLCZpB2u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA5D1C4CEEC
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 21:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746048961;
	bh=AZntVhZ+vDEY7Bd4rli+GfQbwO5SJy1RspG0nOcJgT8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cLCZpB2u38tkqRdUt8VQh4QESWtqsJKwM2sk1uSyC9aO1c4ZVw4TH3GaihsnvAQGb
	 2WLYa7dCh2R91SmoChjhgQWKz06KMXrt0P2UD+IEgLTn7y3bXAC34l7a0J0itUjaJP
	 Ejrbqqn7CmLMH0Zmyf5zLB4F7FG1vVBsHUv4W26gEdH9X5A6Cj3cK7axtvdR1yexUy
	 U1YOYlt5mBZ4DTzmeJRi/SpjbhiZCfdP3+nJ4e3Lr73VGoAxf6N7F0PMo5Gg+OLUM3
	 r9tLgFQ3BAd0JIzBMTZnG2I6U7rcsmpQmx81PpjB/p7Nmi0R9WUtlZ2/rqwyDZtOP3
	 8f29oWq+DwMsA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B5A7C433E1; Wed, 30 Apr 2025 21:36:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Wed, 30 Apr 2025 21:36:01 +0000
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
Message-ID: <bug-220069-208809-ICOzdq3AQD@https.bugzilla.kernel.org/>
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

--- Comment #9 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Claudio Wunder from comment #6)
> Here's the full dmesg log via `journalctl -o short-precise -k -b -3`:
> https://gist.github.com/ovflowd/0b0aa5c748683eca33909dc3ed7c66f7 (I shared
> on GitHub Gist due to the large size, if you rather have me hosting it on=
 a
> FOSS alternative, let me know, I can upload it to gitlab.gnome.org)
Thanks. That's not a really huge file, you can upload such files here as
attachments to this bug.

> pci 0000:6b:00.0: [1022:43f7] type 00 class 0x0c0330 PCIe Legacy Endpoint
This means it's the "600 series chipset", which is reportedly a Promontory
family chipset, made for AMD by ASMedia. And IME ASMedia controllers are pr=
etty
buggy.

> xhci_hcd 0000:6b:00.0: Event TRB for slot 18 ep 0 with no TDs queued
> usb 8-3: Device not responding to setup address.
> xhci_hcd 0000:6b:00.0: ERROR unknown event type 4
That's sort of stuff which may show up when they get completely FUBAR'd and
about to stop working at all. So I don't really share the optimism that it'=
s a
simple SW bug which causes the abort to fail, it's probably a deeper screwu=
p.
The debugfs dump will tell...

I think you said you have more of those logs, is the above always appearing=
 a
few seconds before "hc died"? It seems related to the 8-3 device, a VIA USB=
 3.0
hub.

IME such problems tend to be happening under particular workloads, so still=
 no
idea how a minor kernel update could cause it to appear. Were there no hard=
ware
changes, like USB devices added or moved to other ports? How long are you u=
sing
this machine with all of those devices, which kernel versions were working =
OK
for so long that they certainly cannot possibly have this problem?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


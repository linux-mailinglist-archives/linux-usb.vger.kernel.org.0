Return-Path: <linux-usb+bounces-31926-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 10722CF4641
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 16:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E3EC53007495
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 15:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007AC221F13;
	Mon,  5 Jan 2026 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvUz8swf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1471E9B3A
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626894; cv=none; b=fbxhWynS/+BPBiJj8L7UwVhUvARVmkYgG9NRCTG90QOefa8skO7rrL/86DzS5C/d8Sg7SRw9EuDKU8eL5HaKi8QIFKoRHEFr6pvaYEel88PE1guwChHcDdhpbjZkWpKXoIwwofEGitRNV/xy5toZe2HNwpIt1eAQ8thb74agdP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626894; c=relaxed/simple;
	bh=Z+Zp2s/nFyWZS+dPJv3sqGP51zfVg8+SbOe71aC6YQs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mNqV60mgCN0tqWiypHfO+Z9NGvMXoT/ZgkgcKqtu0ar/WIwLE9x9KTrj6NCQobTk6e84Wi8iJn9/T+szQGrGZJ+eiiwiX3qoNzvcbeaOsfdUjQdTQSPSsTGte8dEO37fgsvQBK7IKEHHNoIjlWQk75GW6HF1ksW/wMoxXv8Elrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvUz8swf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC4CCC19421
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 15:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767626892;
	bh=Z+Zp2s/nFyWZS+dPJv3sqGP51zfVg8+SbOe71aC6YQs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LvUz8swfhsQ2dTkIyRn0ukHdLQQMF5TeNwTBarorfAFo93D0Fr0vgTug9EHWum9Ls
	 /Ute62c61fl1nIRN9xOteQV6HyRDESeuXcm0MKeWM2Z5rgEa334XSrCgffIutk4IZN
	 5YAqjSgrdw+KVIGjuRDaC/luJnTiFZkeIPQhZwuCB4eT6yqYqhT7wSaSwDmPMWzfiA
	 Ni54b4U6fsOioHtvM5xu6zieZ4OhTeb6TquYP2OWbc+am4ZG1CFW5uoM5ao1xWTbim
	 7j/HrWC5pmF7wF3Xd18WssF4NbluVldoS1i2394UPqqoc0J1dlk5eC0iyeJPNBnCae
	 qlUf6u1vwnQCg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C0276C3279F; Mon,  5 Jan 2026 15:28:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Mon, 05 Jan 2026 15:28:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220904-208809-LCmwcamVdj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220904-208809@https.bugzilla.kernel.org/>
References: <bug-220904-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

--- Comment #9 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
The log entries about 'root hub lost power or was reset' means
xHC controller failed to resume properly, and will be reset and re-initiali=
zed.

There are no other log entries after this from that xHC, so it's possible
there is something failing during re-initialization.

could you enable xhci and usb core dynamic debug and send a new dmesg of a
failing case:

echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

